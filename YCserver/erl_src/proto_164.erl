-file("src/proto/proto_164.erl", 1).

-module(proto_164).

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

-file("src/proto/proto_164.erl", 14).

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

-file("src/proto/proto_164.erl", 15).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/proto/proto_164.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16400, {}) ->
    {ok, <<2:32/little, 16400:16/little>>};
pack(srv, 16400,
     {V0_status, V0_time, V0_pk_type, V0_season_id}) ->
    D_a_t_a = <<V0_status:8/little, V0_time:32/little,
                V0_pk_type:32/little, V0_season_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16400:16/little,
       D_a_t_a/binary>>};
pack(cli, 16401, {}) ->
    {ok, <<2:32/little, 16401:16/little>>};
pack(srv, 16401, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16401:16/little,
       D_a_t_a/binary>>};
pack(cli, 16402, {}) ->
    {ok, <<2:32/little, 16402:16/little>>};
pack(srv, 16402, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16402:16/little,
       D_a_t_a/binary>>};
pack(cli, 16403, {}) ->
    {ok, <<2:32/little, 16403:16/little>>};
pack(srv, 16403, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16403:16/little,
       D_a_t_a/binary>>};
pack(cli, 16404, {}) ->
    {ok, <<2:32/little, 16404:16/little>>};
pack(srv, 16404,
     {V0_teammate, V0_pk_type, V0_order, V0_matched_time}) ->
    D_a_t_a = <<(length(V0_teammate)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
                                   V1_formation_id:8/little,
                                   V1_formation_lev:8/little,
                                   V1_is_leader:8/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   (length(V1_guards)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_status:8/little,
                                                      V2_war_id:8/little,
                                                      V2_quality:8/little>>
                                                    || {V2_base_id,
                                                        V2_status,
                                                        V2_war_id,
                                                        V2_quality}
                                                           <- V1_guards]))/binary,
                                   V1_show_badge_id:32/little>>
                                 || #tournament_role{id =
                                                         {V1_rid,
                                                          V1_platform,
                                                          V1_zone_id},
                                                     name = V1_name,
                                                     sex = V1_sex,
                                                     classes = V1_classes,
                                                     lev = V1_lev,
                                                     rank_lev = V1_rank_lev,
                                                     rank_point = V1_rank_point,
                                                     formation_id =
                                                         V1_formation_id,
                                                     formation_lev =
                                                         V1_formation_lev,
                                                     is_leader = V1_is_leader,
                                                     looks = V1_looks,
                                                     guards = V1_guards,
                                                     show_badge_id =
                                                         V1_show_badge_id}
                                        <- V0_teammate]))/binary,
                V0_pk_type:32/little, (length(V0_order)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_order]))/binary,
                V0_matched_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16404:16/little,
       D_a_t_a/binary>>};
pack(cli, 16405, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16405:16/little,
       D_a_t_a/binary>>};
pack(srv, 16405,
     {#tournament_profile{id =
                              {V0_rid, V0_platform, V0_zone_id},
                          name = V0_name, rank_lev = V0_rank_lev,
                          rank_point = V0_rank_point,
                          season_rank_lev = V0_season_rank_lev,
                          season_rank_point = V0_season_rank_point,
                          win_count = V0_win_count,
                          win_sustained = V0_win_sustained,
                          combat_count = V0_combat_count,
                          best_rank_lev = V0_best_rank_lev,
                          best_rank_point = V0_best_rank_point,
                          best_win_count = V0_best_win_count,
                          best_win_sustained = V0_best_win_sustained,
                          liked = V0_liked, best_partner = V0_best_partner,
                          historical_high = V0_historical_high,
                          show_badge_id = V0_show_badge_id,
                          promotion_win = V0_promotion_win}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_rank_lev:8/little, V0_rank_point:16/little,
                V0_season_rank_lev:8/little,
                V0_season_rank_point:16/little, V0_win_count:16/little,
                V0_win_sustained:16/little, V0_combat_count:16/little,
                V0_best_rank_lev:8/little, V0_best_rank_point:16/little,
                V0_best_win_count:16/little,
                V0_best_win_sustained:16/little, V0_liked:32/little,
                (length(V0_best_partner)):16/little,
                (list_to_binary([<<V1_partner_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_partner_platform))/binary,
                                   V1_partner_zone_id:32/little,
                                   (protocol:pack(string,
                                                  V1_partner_name))/binary,
                                   V1_co_rank_lev:16/little>>
                                 || {{V1_partner_rid,
                                      V1_partner_platform,
                                      V1_partner_zone_id},
                                     V1_partner_name,
                                     V1_co_rank_lev}
                                        <- V0_best_partner]))/binary,
                V0_historical_high:8/little, V0_show_badge_id:16/little,
                V0_promotion_win:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16405:16/little,
       D_a_t_a/binary>>};
pack(cli, 16406, {}) ->
    {ok, <<2:32/little, 16406:16/little>>};
pack(srv, 16406,
     {{V0_r_id, V0_r_platform, V0_r_zone_id},
      V0_result,
      V0_pk_type,
      V0_honor_point,
      V0_b_store_point,
      V0_win_point,
      V0_b_rank_point,
      V0_a_rank_point,
      V0_b_rank_lev,
      V0_a_rank_lev,
      V0_assets,
      V0_combat_reward,
      V0_mates,
      V0_rival,
      V0_hornor_show,
      V0_promotion_win}) ->
    D_a_t_a = <<V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:32/little, V0_result:8/little,
                V0_pk_type:32/little, V0_honor_point:8/little,
                V0_b_store_point:16/little,
                V0_win_point:16/signed-little,
                V0_b_rank_point:16/little, V0_a_rank_point:16/little,
                V0_b_rank_lev:8/little, V0_a_rank_lev:8/little,
                (length(V0_assets)):16/little,
                (list_to_binary([<<V1_assets_id:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets_id, V1_val}
                                        <- V0_assets]))/binary,
                (length(V0_combat_reward)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_item_id, V1_num}
                                        <- V0_combat_reward]))/binary,
                (length(V0_mates)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
                                   V1_total_hurt:32/little,
                                   V1_total_dmg:32/little,
                                   V1_total_heal:32/little,
                                   V1_kill_num:16/little, V1_dead_num:16/little,
                                   V1_control_num:16/little,
                                   V1_mvp_score:16/little>>
                                 || #tournament_fighter{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        lev = V1_lev,
                                                        rank_lev = V1_rank_lev,
                                                        rank_point =
                                                            V1_rank_point,
                                                        total_hurt =
                                                            V1_total_hurt,
                                                        total_dmg =
                                                            V1_total_dmg,
                                                        total_heal =
                                                            V1_total_heal,
                                                        kill_num = V1_kill_num,
                                                        dead_num = V1_dead_num,
                                                        control_num =
                                                            V1_control_num,
                                                        mvp_score =
                                                            V1_mvp_score}
                                        <- V0_mates]))/binary,
                (length(V0_rival)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
                                   V1_total_hurt:32/little,
                                   V1_total_dmg:32/little,
                                   V1_total_heal:32/little,
                                   V1_kill_num:16/little, V1_dead_num:16/little,
                                   V1_control_num:16/little,
                                   V1_mvp_score:16/little>>
                                 || #tournament_fighter{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        lev = V1_lev,
                                                        rank_lev = V1_rank_lev,
                                                        rank_point =
                                                            V1_rank_point,
                                                        total_hurt =
                                                            V1_total_hurt,
                                                        total_dmg =
                                                            V1_total_dmg,
                                                        total_heal =
                                                            V1_total_heal,
                                                        kill_num = V1_kill_num,
                                                        dead_num = V1_dead_num,
                                                        control_num =
                                                            V1_control_num,
                                                        mvp_score =
                                                            V1_mvp_score}
                                        <- V0_rival]))/binary,
                V0_hornor_show:8/little, V0_promotion_win:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16406:16/little,
       D_a_t_a/binary>>};
pack(cli, 16407, {}) ->
    {ok, <<2:32/little, 16407:16/little>>};
pack(srv, 16407,
     {V0_is_matching,
      V0_pk_type,
      #tournament_profile{last_matched = V0_last_matched,
                          day_win = V0_day_win, day_matched = V0_day_matched,
                          day_win_sustained = V0_day_win_sustained},
      V0_max_join,
      V0_teammate,
      V0_order}) ->
    D_a_t_a = <<V0_is_matching:8/little,
                V0_pk_type:32/little, V0_last_matched:32/little,
                V0_day_win:8/little, V0_day_matched:8/little,
                V0_day_win_sustained:8/little, V0_max_join:8/little,
                (length(V0_teammate)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
                                   V1_formation_id:8/little,
                                   V1_formation_lev:8/little,
                                   V1_is_leader:8/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   (length(V1_guards)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_status:8/little,
                                                      V2_war_id:8/little,
                                                      V2_quality:8/little>>
                                                    || {V2_base_id,
                                                        V2_status,
                                                        V2_war_id,
                                                        V2_quality}
                                                           <- V1_guards]))/binary,
                                   V1_show_badge_id:32/little>>
                                 || #tournament_role{id =
                                                         {V1_rid,
                                                          V1_platform,
                                                          V1_zone_id},
                                                     name = V1_name,
                                                     sex = V1_sex,
                                                     classes = V1_classes,
                                                     lev = V1_lev,
                                                     rank_lev = V1_rank_lev,
                                                     rank_point = V1_rank_point,
                                                     formation_id =
                                                         V1_formation_id,
                                                     formation_lev =
                                                         V1_formation_lev,
                                                     is_leader = V1_is_leader,
                                                     looks = V1_looks,
                                                     guards = V1_guards,
                                                     show_badge_id =
                                                         V1_show_badge_id}
                                        <- V0_teammate]))/binary,
                (length(V0_order)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_order]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16407:16/little,
       D_a_t_a/binary>>};
pack(cli, 16408, {}) ->
    {ok, <<2:32/little, 16408:16/little>>};
pack(srv, 16408, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16408:16/little,
       D_a_t_a/binary>>};
pack(cli, 16409, {}) ->
    {ok, <<2:32/little, 16409:16/little>>};
pack(srv, 16409, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16409:16/little,
       D_a_t_a/binary>>};
pack(cli, 16410, {V0_decision}) ->
    D_a_t_a = <<V0_decision:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16410:16/little,
       D_a_t_a/binary>>};
pack(srv, 16410, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16410:16/little,
       D_a_t_a/binary>>};
pack(cli, 16411, {}) ->
    {ok, <<2:32/little, 16411:16/little>>};
pack(srv, 16411,
     {#tournament_usurper{id =
                              {V0_rid, V0_platform, V0_zone_id},
                          name = V0_name, sex = V0_sex, classes = V0_classes,
                          lev = V0_lev}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16411:16/little,
       D_a_t_a/binary>>};
pack(cli, 16412, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16412:16/little,
       D_a_t_a/binary>>};
pack(srv, 16412, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16412:16/little,
       D_a_t_a/binary>>};
pack(cli, 16413, {}) ->
    {ok, <<2:32/little, 16413:16/little>>};
pack(srv, 16413, {V0_teammate, V0_order}) ->
    D_a_t_a = <<(length(V0_teammate)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
                                   V1_formation_id:8/little,
                                   V1_formation_lev:8/little,
                                   V1_is_leader:8/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   (length(V1_guards)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_status:8/little,
                                                      V2_war_id:8/little,
                                                      V2_quality:8/little>>
                                                    || {V2_base_id,
                                                        V2_status,
                                                        V2_war_id,
                                                        V2_quality}
                                                           <- V1_guards]))/binary>>
                                 || #tournament_role{id =
                                                         {V1_rid,
                                                          V1_platform,
                                                          V1_zone_id},
                                                     name = V1_name,
                                                     sex = V1_sex,
                                                     classes = V1_classes,
                                                     lev = V1_lev,
                                                     rank_lev = V1_rank_lev,
                                                     rank_point = V1_rank_point,
                                                     formation_id =
                                                         V1_formation_id,
                                                     formation_lev =
                                                         V1_formation_lev,
                                                     is_leader = V1_is_leader,
                                                     looks = V1_looks,
                                                     guards = V1_guards}
                                        <- V0_teammate]))/binary,
                (length(V0_order)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_order]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16413:16/little,
       D_a_t_a/binary>>};
pack(cli, 16414,
     {V0_role_id1,
      V0_platform1,
      V0_zone_id1,
      V0_role_id2,
      V0_platform2,
      V0_zone_id2}) ->
    D_a_t_a = <<V0_role_id1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:16/little, V0_role_id2:32/little,
                (protocol:pack(string, V0_platform2))/binary,
                V0_zone_id2:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16414:16/little,
       D_a_t_a/binary>>};
pack(srv, 16414, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16414:16/little,
       D_a_t_a/binary>>};
pack(cli, 16415, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16415:16/little,
       D_a_t_a/binary>>};
pack(srv, 16415, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16415:16/little,
       D_a_t_a/binary>>};
pack(cli, 16416, {V0_type, V0_group}) ->
    D_a_t_a = <<V0_type:8/little, V0_group:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16416:16/little,
       D_a_t_a/binary>>};
pack(srv, 16416, {V0_type, V0_group, V0_rank}) ->
    D_a_t_a = <<V0_type:8/little, V0_group:8/little,
                (length(V0_rank)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little>>
                                 || #tournament_profile{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        lev = V1_lev,
                                                        rank_lev = V1_rank_lev,
                                                        rank_point =
                                                            V1_rank_point}
                                        <- V0_rank]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16416:16/little,
       D_a_t_a/binary>>};
pack(cli, 16417, {}) ->
    {ok, <<2:32/little, 16417:16/little>>};
pack(srv, 16417, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16417:16/little,
       D_a_t_a/binary>>};
pack(cli, 16418, {V0_type, V0_range}) ->
    D_a_t_a = <<V0_type:8/little, V0_range:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16418:16/little,
       D_a_t_a/binary>>};
pack(srv, 16418, {V0_type, V0_range, V0_rank}) ->
    D_a_t_a = <<V0_type:8/little, V0_range:8/little,
                (length(V0_rank)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_val1:32/little,
                                   V1_val2:32/little>>
                                 || #tournament_celebrity{id =
                                                              {V1_rid,
                                                               V1_platform,
                                                               V1_zone_id},
                                                          name = V1_name,
                                                          sex = V1_sex,
                                                          classes = V1_classes,
                                                          lev = V1_lev,
                                                          val1 = V1_val1,
                                                          val2 = V1_val2}
                                        <- V0_rank]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16418:16/little,
       D_a_t_a/binary>>};
pack(cli, 16419, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16419:16/little,
       D_a_t_a/binary>>};
pack(srv, 16419,
     {V0_flag, V0_msg, V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16419:16/little,
       D_a_t_a/binary>>};
pack(cli, 16420, {}) ->
    {ok, <<2:32/little, 16420:16/little>>};
pack(srv, 16420, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16420:16/little,
       D_a_t_a/binary>>};
pack(cli, 16421, {}) ->
    {ok, <<2:32/little, 16421:16/little>>};
pack(srv, 16421,
     {V0_season_id,
      V0_new_lev,
      #tournament_season_role{reward_lev = V0_reward_lev,
                              rewarded = V0_rewarded},
      V0_final_reward}) ->
    D_a_t_a = <<V0_season_id:32/little, V0_new_lev:8/little,
                V0_reward_lev:8/little, V0_rewarded:32/little,
                (length(V0_final_reward)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_item_id, V1_num}
                                        <- V0_final_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16421:16/little,
       D_a_t_a/binary>>};
pack(cli, 16422, {}) ->
    {ok, <<2:32/little, 16422:16/little>>};
pack(srv, 16422, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16422:16/little,
       D_a_t_a/binary>>};
pack(cli, 16423, {V0_content, V0_mentions}) ->
    D_a_t_a = <<(protocol:pack(string, V0_content))/binary,
                (length(V0_mentions)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_mentions]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16423:16/little,
       D_a_t_a/binary>>};
pack(srv, 16423, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16423:16/little,
       D_a_t_a/binary>>};
pack(cli, 16424, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16424:16/little,
       D_a_t_a/binary>>};
pack(srv, 16424,
     {#tournament_result{id =
                             {V0_r_id, V0_r_platform, V0_r_zone_id},
                         is_win = V0_is_win, mates = V0_mates,
                         rival = V0_rival}}) ->
    D_a_t_a = <<V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:32/little, V0_is_win:8/little,
                (length(V0_mates)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
                                   V1_total_hurt:32/little,
                                   V1_total_dmg:32/little,
                                   V1_total_heal:32/little,
                                   V1_kill_num:16/little, V1_dead_num:16/little,
                                   V1_control_num:16/little,
                                   V1_mvp_score:16/little>>
                                 || #tournament_fighter{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        lev = V1_lev,
                                                        rank_lev = V1_rank_lev,
                                                        rank_point =
                                                            V1_rank_point,
                                                        total_hurt =
                                                            V1_total_hurt,
                                                        total_dmg =
                                                            V1_total_dmg,
                                                        total_heal =
                                                            V1_total_heal,
                                                        kill_num = V1_kill_num,
                                                        dead_num = V1_dead_num,
                                                        control_num =
                                                            V1_control_num,
                                                        mvp_score =
                                                            V1_mvp_score}
                                        <- V0_mates]))/binary,
                (length(V0_rival)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
                                   V1_total_hurt:32/little,
                                   V1_total_dmg:32/little,
                                   V1_total_heal:32/little,
                                   V1_kill_num:16/little, V1_dead_num:16/little,
                                   V1_control_num:16/little,
                                   V1_mvp_score:16/little>>
                                 || #tournament_fighter{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        lev = V1_lev,
                                                        rank_lev = V1_rank_lev,
                                                        rank_point =
                                                            V1_rank_point,
                                                        total_hurt =
                                                            V1_total_hurt,
                                                        total_dmg =
                                                            V1_total_dmg,
                                                        total_heal =
                                                            V1_total_heal,
                                                        kill_num = V1_kill_num,
                                                        dead_num = V1_dead_num,
                                                        control_num =
                                                            V1_control_num,
                                                        mvp_score =
                                                            V1_mvp_score}
                                        <- V0_rival]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16424:16/little,
       D_a_t_a/binary>>};
pack(cli, 16425,
     {V0_rid, V0_platform, V0_zone_id, V0_rec_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_rec_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16425:16/little,
       D_a_t_a/binary>>};
pack(srv, 16425,
     {V0_flag, V0_msg, V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16425:16/little,
       D_a_t_a/binary>>};
pack(cli, 16426, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16426:16/little,
       D_a_t_a/binary>>};
pack(srv, 16426, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16426:16/little,
       D_a_t_a/binary>>};
pack(cli, 16427, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16427:16/little,
       D_a_t_a/binary>>};
pack(srv, 16427,
     {#tournament_profile{id =
                              {V0_rid, V0_platform, V0_zone_id},
                          name = V0_name, rank_lev = V0_rank_lev,
                          classes = V0_classes, rank_point = V0_rank_point,
                          season_rank_lev = V0_season_rank_lev,
                          season_rank_point = V0_season_rank_point,
                          win_count = V0_win_count,
                          win_sustained = V0_win_sustained,
                          combat_count = V0_combat_count,
                          best_rank_lev = V0_best_rank_lev,
                          best_rank_point = V0_best_rank_point,
                          best_win_count = V0_best_win_count,
                          best_win_sustained = V0_best_win_sustained,
                          liked = V0_liked, best_partner = V0_best_partner,
                          awesome_kill = V0_awesome_kill,
                          awesome_dmg = V0_awesome_dmg,
                          awesome_kill_num = V0_awesome_kill_num, mvp = V0_mvp,
                          awesome_heal = V0_awesome_heal,
                          awesome_control = V0_awesome_control,
                          loss_mvp = V0_loss_mvp,
                          season_awesome_kill = V0_season_awesome_kill,
                          season_awesome_dmg = V0_season_awesome_dmg,
                          season_awesome_kill_num = V0_season_awesome_kill_num,
                          season_mvp = V0_season_mvp,
                          season_awesome_heal = V0_season_awesome_heal,
                          season_awesome_control = V0_season_awesome_control,
                          season_loss_mvp = V0_season_loss_mvp}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_rank_lev:8/little, V0_classes:8/little,
                V0_rank_point:16/little, V0_season_rank_lev:8/little,
                V0_season_rank_point:16/little, V0_win_count:16/little,
                V0_win_sustained:16/little, V0_combat_count:16/little,
                V0_best_rank_lev:8/little, V0_best_rank_point:16/little,
                V0_best_win_count:16/little,
                V0_best_win_sustained:16/little, V0_liked:32/little,
                (length(V0_best_partner)):16/little,
                (list_to_binary([<<V1_partner_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_partner_platform))/binary,
                                   V1_partner_zone_id:32/little,
                                   (protocol:pack(string,
                                                  V1_partner_name))/binary,
                                   V1_co_rank_lev:16/little>>
                                 || {{V1_partner_rid,
                                      V1_partner_platform,
                                      V1_partner_zone_id},
                                     V1_partner_name,
                                     V1_co_rank_lev}
                                        <- V0_best_partner]))/binary,
                V0_awesome_kill:16/little, V0_awesome_dmg:16/little,
                V0_awesome_kill_num:16/little, V0_mvp:16/little,
                V0_awesome_heal:16/little, V0_awesome_control:16/little,
                V0_loss_mvp:16/little, V0_season_awesome_kill:16/little,
                V0_season_awesome_dmg:16/little,
                V0_season_awesome_kill_num:16/little,
                V0_season_mvp:16/little,
                V0_season_awesome_heal:16/little,
                V0_season_awesome_control:16/little,
                V0_season_loss_mvp:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16427:16/little,
       D_a_t_a/binary>>};
pack(cli, 16428, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16428:16/little,
       D_a_t_a/binary>>};
pack(srv, 16428,
     {#tournament_result_role{id =
                                  {V0_rid, V0_platform, V0_zone_id},
                              last_recent = V0_last_recent}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (length(V0_last_recent)):16/little,
                (list_to_binary([<<V1_time:32/little,
                                   V1_rank_lev:8/little, V1_is_win:8/little,
                                   V1_best_result:8/little, V1_r_id:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:32/little>>
                                 || {V1_time,
                                     V1_rank_lev,
                                     V1_is_win,
                                     V1_best_result,
                                     {V1_r_id, V1_r_platform, V1_r_zone_id}}
                                        <- V0_last_recent]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16428:16/little,
       D_a_t_a/binary>>};
pack(cli, 16429, {V0_id, V0_order}) ->
    D_a_t_a = <<V0_id:32/little, V0_order:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16429:16/little,
       D_a_t_a/binary>>};
pack(srv, 16429, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16429:16/little,
       D_a_t_a/binary>>};
pack(cli, 16430, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16430:16/little,
       D_a_t_a/binary>>};
pack(srv, 16430, {V0_max_lev}) ->
    D_a_t_a = <<V0_max_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16430:16/little,
       D_a_t_a/binary>>};
pack(cli, 16431, {}) ->
    {ok, <<2:32/little, 16431:16/little>>};
pack(srv, 16431, {V0_num, V0_starlev}) ->
    D_a_t_a = <<V0_num:32/little, V0_starlev:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16431:16/little,
       D_a_t_a/binary>>};
pack(cli, 16432, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16432:16/little,
       D_a_t_a/binary>>};
pack(srv, 16432, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16432:16/little,
       D_a_t_a/binary>>};
pack(cli, 16433, {}) ->
    {ok, <<2:32/little, 16433:16/little>>};
pack(srv, 16433, {V0_reward, V0_badge_id}) ->
    D_a_t_a = <<(length(V0_reward)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_bound:8/little, V1_num:32/little>>
                                 || {V1_item_id, V1_bound, V1_num}
                                        <- V0_reward]))/binary,
                V0_badge_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16433:16/little,
       D_a_t_a/binary>>};
pack(cli, 16434, {V0_badge_id}) ->
    D_a_t_a = <<V0_badge_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16434:16/little,
       D_a_t_a/binary>>};
pack(srv, 16434, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16434:16/little,
       D_a_t_a/binary>>};
pack(cli, 16435, {}) ->
    {ok, <<2:32/little, 16435:16/little>>};
pack(srv, 16435,
     {V0_badge_id, V0_badgelist, V0_setlist}) ->
    D_a_t_a = <<V0_badge_id:32/little,
                (length(V0_badgelist)):16/little,
                (list_to_binary([<<V1_badge_id:32/little>>
                                 || V1_badge_id <- V0_badgelist]))/binary,
                (length(V0_setlist)):16/little,
                (list_to_binary([<<V1_set_id:32/little>>
                                 || V1_set_id <- V0_setlist]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16435:16/little,
       D_a_t_a/binary>>};
pack(cli, 16436, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16436:16/little,
       D_a_t_a/binary>>};
pack(srv, 16436,
     {V0_classes, V0_badgelist, V0_setlist}) ->
    D_a_t_a = <<V0_classes:8/little,
                (length(V0_badgelist)):16/little,
                (list_to_binary([<<V1_badge_id:32/little>>
                                 || V1_badge_id <- V0_badgelist]))/binary,
                (length(V0_setlist)):16/little,
                (list_to_binary([<<V1_set_id:32/little>>
                                 || V1_set_id <- V0_setlist]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16436:16/little,
       D_a_t_a/binary>>};
pack(cli, 16437, {}) ->
    {ok, <<2:32/little, 16437:16/little>>};
pack(srv, 16437, {V0_badge_id}) ->
    D_a_t_a = <<V0_badge_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16437:16/little,
       D_a_t_a/binary>>};
pack(cli, 16438,
     {V0_rid, V0_platform, V0_zone_id, V0_order}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_order:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16438:16/little,
       D_a_t_a/binary>>};
pack(srv, 16438, {V0_badge_id, V0_classes, V0_order}) ->
    D_a_t_a = <<V0_badge_id:32/little, V0_classes:8/little,
                V0_order:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16438:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16400, _B0) -> {ok, {}};
unpack(cli, 16400, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {V1_pk_type, _B3} = protocol:uint32(_B2),
    {V1_season_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_status, V1_time, V1_pk_type, V1_season_id}};
unpack(srv, 16401, _B0) -> {ok, {}};
unpack(cli, 16401, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 16402, _B0) -> {ok, {}};
unpack(cli, 16402, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 16403, _B0) -> {ok, {}};
unpack(cli, 16403, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 16404, _B0) -> {ok, {}};
unpack(cli, 16404, _B0) ->
    {V1_teammate, _B30} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_rid, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_platform, _B3} =
                                                     protocol:string(_B2),
                                                 {V2_zone_id, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_name, _B5} =
                                                     protocol:string(_B4),
                                                 {V2_sex, _B6} =
                                                     protocol:uint8(_B5),
                                                 {V2_classes, _B7} =
                                                     protocol:uint8(_B6),
                                                 {V2_lev, _B8} =
                                                     protocol:uint8(_B7),
                                                 {V2_rank_lev, _B9} =
                                                     protocol:uint8(_B8),
                                                 {V2_rank_point, _B10} =
                                                     protocol:uint16(_B9),
                                                 {V2_formation_id, _B11} =
                                                     protocol:uint8(_B10),
                                                 {V2_formation_lev, _B12} =
                                                     protocol:uint8(_B11),
                                                 {V2_is_leader, _B13} =
                                                     protocol:uint8(_B12),
                                                 {V2_looks, _B20} =
                                                     protocol:array(_B13,
                                                                    fun
                                                                        (_B14) ->
                                                                            {V3_looks_type,
                                                                             _B15} =
                                                                                protocol:uint32(_B14),
                                                                            {V3_looks_mode,
                                                                             _B16} =
                                                                                protocol:uint32(_B15),
                                                                            {V3_looks_val,
                                                                             _B17} =
                                                                                protocol:uint32(_B16),
                                                                            {V3_looks_str,
                                                                             _B18} =
                                                                                protocol:string(_B17),
                                                                            {{V3_looks_type,
                                                                              V3_looks_mode,
                                                                              V3_looks_val,
                                                                              V3_looks_str},
                                                                             _B18}
                                                                    end),
                                                 {V2_guards, _B27} =
                                                     protocol:array(_B20,
                                                                    fun
                                                                        (_B21) ->
                                                                            {V3_base_id,
                                                                             _B22} =
                                                                                protocol:uint32(_B21),
                                                                            {V3_status,
                                                                             _B23} =
                                                                                protocol:uint8(_B22),
                                                                            {V3_war_id,
                                                                             _B24} =
                                                                                protocol:uint8(_B23),
                                                                            {V3_quality,
                                                                             _B25} =
                                                                                protocol:uint8(_B24),
                                                                            {{V3_base_id,
                                                                              V3_status,
                                                                              V3_war_id,
                                                                              V3_quality},
                                                                             _B25}
                                                                    end),
                                                 {V2_show_badge_id, _B28} =
                                                     protocol:uint32(_B27),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_name,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_lev,
                                                   V2_rank_lev,
                                                   V2_rank_point,
                                                   V2_formation_id,
                                                   V2_formation_lev,
                                                   V2_is_leader,
                                                   V2_looks,
                                                   V2_guards,
                                                   V2_show_badge_id},
                                                  _B28}
                                         end),
    {V1_pk_type, _B31} = protocol:uint32(_B30),
    {V1_order, _B37} = protocol:array(_B31,
                                      fun (_B32) ->
                                              {V2_rid, _B33} =
                                                  protocol:uint32(_B32),
                                              {V2_platform, _B34} =
                                                  protocol:string(_B33),
                                              {V2_zone_id, _B35} =
                                                  protocol:uint32(_B34),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id},
                                               _B35}
                                      end),
    {V1_matched_time, _B38} = protocol:uint32(_B37),
    {ok,
     {V1_teammate, V1_pk_type, V1_order, V1_matched_time}};
unpack(srv, 16405, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16405, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_rank_lev, _B5} = protocol:uint8(_B4),
    {V1_rank_point, _B6} = protocol:uint16(_B5),
    {V1_season_rank_lev, _B7} = protocol:uint8(_B6),
    {V1_season_rank_point, _B8} = protocol:uint16(_B7),
    {V1_win_count, _B9} = protocol:uint16(_B8),
    {V1_win_sustained, _B10} = protocol:uint16(_B9),
    {V1_combat_count, _B11} = protocol:uint16(_B10),
    {V1_best_rank_lev, _B12} = protocol:uint8(_B11),
    {V1_best_rank_point, _B13} = protocol:uint16(_B12),
    {V1_best_win_count, _B14} = protocol:uint16(_B13),
    {V1_best_win_sustained, _B15} = protocol:uint16(_B14),
    {V1_liked, _B16} = protocol:uint32(_B15),
    {V1_best_partner, _B24} = protocol:array(_B16,
                                             fun (_B17) ->
                                                     {V2_partner_rid, _B18} =
                                                         protocol:uint32(_B17),
                                                     {V2_partner_platform,
                                                      _B19} =
                                                         protocol:string(_B18),
                                                     {V2_partner_zone_id,
                                                      _B20} =
                                                         protocol:uint32(_B19),
                                                     {V2_partner_name, _B21} =
                                                         protocol:string(_B20),
                                                     {V2_co_rank_lev, _B22} =
                                                         protocol:uint16(_B21),
                                                     {{V2_partner_rid,
                                                       V2_partner_platform,
                                                       V2_partner_zone_id,
                                                       V2_partner_name,
                                                       V2_co_rank_lev},
                                                      _B22}
                                             end),
    {V1_historical_high, _B25} = protocol:uint8(_B24),
    {V1_show_badge_id, _B26} = protocol:uint16(_B25),
    {V1_promotion_win, _B27} = protocol:uint8(_B26),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_rank_lev,
      V1_rank_point,
      V1_season_rank_lev,
      V1_season_rank_point,
      V1_win_count,
      V1_win_sustained,
      V1_combat_count,
      V1_best_rank_lev,
      V1_best_rank_point,
      V1_best_win_count,
      V1_best_win_sustained,
      V1_liked,
      V1_best_partner,
      V1_historical_high,
      V1_show_badge_id,
      V1_promotion_win}};
unpack(srv, 16406, _B0) -> {ok, {}};
unpack(cli, 16406, _B0) ->
    {V1_r_id, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint32(_B2),
    {V1_result, _B4} = protocol:uint8(_B3),
    {V1_pk_type, _B5} = protocol:uint32(_B4),
    {V1_honor_point, _B6} = protocol:uint8(_B5),
    {V1_b_store_point, _B7} = protocol:uint16(_B6),
    {V1_win_point, _B8} = protocol:int16(_B7),
    {V1_b_rank_point, _B9} = protocol:uint16(_B8),
    {V1_a_rank_point, _B10} = protocol:uint16(_B9),
    {V1_b_rank_lev, _B11} = protocol:uint8(_B10),
    {V1_a_rank_lev, _B12} = protocol:uint8(_B11),
    {V1_assets, _B17} = protocol:array(_B12,
                                       fun (_B13) ->
                                               {V2_assets_id, _B14} =
                                                   protocol:uint32(_B13),
                                               {V2_val, _B15} =
                                                   protocol:uint32(_B14),
                                               {{V2_assets_id, V2_val}, _B15}
                                       end),
    {V1_combat_reward, _B22} = protocol:array(_B17,
                                              fun (_B18) ->
                                                      {V2_item_id, _B19} =
                                                          protocol:uint32(_B18),
                                                      {V2_num, _B20} =
                                                          protocol:uint32(_B19),
                                                      {{V2_item_id, V2_num},
                                                       _B20}
                                              end),
    {V1_mates, _B41} = protocol:array(_B22,
                                      fun (_B23) ->
                                              {V2_rid, _B24} =
                                                  protocol:uint32(_B23),
                                              {V2_platform, _B25} =
                                                  protocol:string(_B24),
                                              {V2_zone_id, _B26} =
                                                  protocol:uint32(_B25),
                                              {V2_name, _B27} =
                                                  protocol:string(_B26),
                                              {V2_sex, _B28} =
                                                  protocol:uint8(_B27),
                                              {V2_classes, _B29} =
                                                  protocol:uint8(_B28),
                                              {V2_lev, _B30} =
                                                  protocol:uint8(_B29),
                                              {V2_rank_lev, _B31} =
                                                  protocol:uint8(_B30),
                                              {V2_rank_point, _B32} =
                                                  protocol:uint16(_B31),
                                              {V2_total_hurt, _B33} =
                                                  protocol:uint32(_B32),
                                              {V2_total_dmg, _B34} =
                                                  protocol:uint32(_B33),
                                              {V2_total_heal, _B35} =
                                                  protocol:uint32(_B34),
                                              {V2_kill_num, _B36} =
                                                  protocol:uint16(_B35),
                                              {V2_dead_num, _B37} =
                                                  protocol:uint16(_B36),
                                              {V2_control_num, _B38} =
                                                  protocol:uint16(_B37),
                                              {V2_mvp_score, _B39} =
                                                  protocol:uint16(_B38),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_rank_lev,
                                                V2_rank_point,
                                                V2_total_hurt,
                                                V2_total_dmg,
                                                V2_total_heal,
                                                V2_kill_num,
                                                V2_dead_num,
                                                V2_control_num,
                                                V2_mvp_score},
                                               _B39}
                                      end),
    {V1_rival, _B60} = protocol:array(_B41,
                                      fun (_B42) ->
                                              {V2_rid, _B43} =
                                                  protocol:uint32(_B42),
                                              {V2_platform, _B44} =
                                                  protocol:string(_B43),
                                              {V2_zone_id, _B45} =
                                                  protocol:uint32(_B44),
                                              {V2_name, _B46} =
                                                  protocol:string(_B45),
                                              {V2_sex, _B47} =
                                                  protocol:uint8(_B46),
                                              {V2_classes, _B48} =
                                                  protocol:uint8(_B47),
                                              {V2_lev, _B49} =
                                                  protocol:uint8(_B48),
                                              {V2_rank_lev, _B50} =
                                                  protocol:uint8(_B49),
                                              {V2_rank_point, _B51} =
                                                  protocol:uint16(_B50),
                                              {V2_total_hurt, _B52} =
                                                  protocol:uint32(_B51),
                                              {V2_total_dmg, _B53} =
                                                  protocol:uint32(_B52),
                                              {V2_total_heal, _B54} =
                                                  protocol:uint32(_B53),
                                              {V2_kill_num, _B55} =
                                                  protocol:uint16(_B54),
                                              {V2_dead_num, _B56} =
                                                  protocol:uint16(_B55),
                                              {V2_control_num, _B57} =
                                                  protocol:uint16(_B56),
                                              {V2_mvp_score, _B58} =
                                                  protocol:uint16(_B57),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_rank_lev,
                                                V2_rank_point,
                                                V2_total_hurt,
                                                V2_total_dmg,
                                                V2_total_heal,
                                                V2_kill_num,
                                                V2_dead_num,
                                                V2_control_num,
                                                V2_mvp_score},
                                               _B58}
                                      end),
    {V1_hornor_show, _B61} = protocol:uint8(_B60),
    {V1_promotion_win, _B62} = protocol:uint8(_B61),
    {ok,
     {V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_result,
      V1_pk_type,
      V1_honor_point,
      V1_b_store_point,
      V1_win_point,
      V1_b_rank_point,
      V1_a_rank_point,
      V1_b_rank_lev,
      V1_a_rank_lev,
      V1_assets,
      V1_combat_reward,
      V1_mates,
      V1_rival,
      V1_hornor_show,
      V1_promotion_win}};
unpack(srv, 16407, _B0) -> {ok, {}};
unpack(cli, 16407, _B0) ->
    {V1_is_matching, _B1} = protocol:uint8(_B0),
    {V1_pk_type, _B2} = protocol:uint32(_B1),
    {V1_last_matched, _B3} = protocol:uint32(_B2),
    {V1_day_win, _B4} = protocol:uint8(_B3),
    {V1_day_matched, _B5} = protocol:uint8(_B4),
    {V1_day_win_sustained, _B6} = protocol:uint8(_B5),
    {V1_max_join, _B7} = protocol:uint8(_B6),
    {V1_teammate, _B37} = protocol:array(_B7,
                                         fun (_B8) ->
                                                 {V2_rid, _B9} =
                                                     protocol:uint32(_B8),
                                                 {V2_platform, _B10} =
                                                     protocol:string(_B9),
                                                 {V2_zone_id, _B11} =
                                                     protocol:uint32(_B10),
                                                 {V2_name, _B12} =
                                                     protocol:string(_B11),
                                                 {V2_sex, _B13} =
                                                     protocol:uint8(_B12),
                                                 {V2_classes, _B14} =
                                                     protocol:uint8(_B13),
                                                 {V2_lev, _B15} =
                                                     protocol:uint8(_B14),
                                                 {V2_rank_lev, _B16} =
                                                     protocol:uint8(_B15),
                                                 {V2_rank_point, _B17} =
                                                     protocol:uint16(_B16),
                                                 {V2_formation_id, _B18} =
                                                     protocol:uint8(_B17),
                                                 {V2_formation_lev, _B19} =
                                                     protocol:uint8(_B18),
                                                 {V2_is_leader, _B20} =
                                                     protocol:uint8(_B19),
                                                 {V2_looks, _B27} =
                                                     protocol:array(_B20,
                                                                    fun
                                                                        (_B21) ->
                                                                            {V3_looks_type,
                                                                             _B22} =
                                                                                protocol:uint32(_B21),
                                                                            {V3_looks_mode,
                                                                             _B23} =
                                                                                protocol:uint32(_B22),
                                                                            {V3_looks_val,
                                                                             _B24} =
                                                                                protocol:uint32(_B23),
                                                                            {V3_looks_str,
                                                                             _B25} =
                                                                                protocol:string(_B24),
                                                                            {{V3_looks_type,
                                                                              V3_looks_mode,
                                                                              V3_looks_val,
                                                                              V3_looks_str},
                                                                             _B25}
                                                                    end),
                                                 {V2_guards, _B34} =
                                                     protocol:array(_B27,
                                                                    fun
                                                                        (_B28) ->
                                                                            {V3_base_id,
                                                                             _B29} =
                                                                                protocol:uint32(_B28),
                                                                            {V3_status,
                                                                             _B30} =
                                                                                protocol:uint8(_B29),
                                                                            {V3_war_id,
                                                                             _B31} =
                                                                                protocol:uint8(_B30),
                                                                            {V3_quality,
                                                                             _B32} =
                                                                                protocol:uint8(_B31),
                                                                            {{V3_base_id,
                                                                              V3_status,
                                                                              V3_war_id,
                                                                              V3_quality},
                                                                             _B32}
                                                                    end),
                                                 {V2_show_badge_id, _B35} =
                                                     protocol:uint32(_B34),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_name,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_lev,
                                                   V2_rank_lev,
                                                   V2_rank_point,
                                                   V2_formation_id,
                                                   V2_formation_lev,
                                                   V2_is_leader,
                                                   V2_looks,
                                                   V2_guards,
                                                   V2_show_badge_id},
                                                  _B35}
                                         end),
    {V1_order, _B43} = protocol:array(_B37,
                                      fun (_B38) ->
                                              {V2_rid, _B39} =
                                                  protocol:uint32(_B38),
                                              {V2_platform, _B40} =
                                                  protocol:string(_B39),
                                              {V2_zone_id, _B41} =
                                                  protocol:uint32(_B40),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id},
                                               _B41}
                                      end),
    {ok,
     {V1_is_matching,
      V1_pk_type,
      V1_last_matched,
      V1_day_win,
      V1_day_matched,
      V1_day_win_sustained,
      V1_max_join,
      V1_teammate,
      V1_order}};
unpack(srv, 16408, _B0) -> {ok, {}};
unpack(cli, 16408, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 16409, _B0) -> {ok, {}};
unpack(cli, 16409, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 16410, _B0) ->
    {V1_decision, _B1} = protocol:uint8(_B0),
    {ok, {V1_decision}};
unpack(cli, 16410, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 16411, _B0) -> {ok, {}};
unpack(cli, 16411, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev}};
unpack(srv, 16412, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16412, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 16413, _B0) -> {ok, {}};
unpack(cli, 16413, _B0) ->
    {V1_teammate, _B29} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_rid, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_platform, _B3} =
                                                     protocol:string(_B2),
                                                 {V2_zone_id, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_name, _B5} =
                                                     protocol:string(_B4),
                                                 {V2_sex, _B6} =
                                                     protocol:uint8(_B5),
                                                 {V2_classes, _B7} =
                                                     protocol:uint8(_B6),
                                                 {V2_lev, _B8} =
                                                     protocol:uint8(_B7),
                                                 {V2_rank_lev, _B9} =
                                                     protocol:uint8(_B8),
                                                 {V2_rank_point, _B10} =
                                                     protocol:uint16(_B9),
                                                 {V2_formation_id, _B11} =
                                                     protocol:uint8(_B10),
                                                 {V2_formation_lev, _B12} =
                                                     protocol:uint8(_B11),
                                                 {V2_is_leader, _B13} =
                                                     protocol:uint8(_B12),
                                                 {V2_looks, _B20} =
                                                     protocol:array(_B13,
                                                                    fun
                                                                        (_B14) ->
                                                                            {V3_looks_type,
                                                                             _B15} =
                                                                                protocol:uint32(_B14),
                                                                            {V3_looks_mode,
                                                                             _B16} =
                                                                                protocol:uint32(_B15),
                                                                            {V3_looks_val,
                                                                             _B17} =
                                                                                protocol:uint32(_B16),
                                                                            {V3_looks_str,
                                                                             _B18} =
                                                                                protocol:string(_B17),
                                                                            {{V3_looks_type,
                                                                              V3_looks_mode,
                                                                              V3_looks_val,
                                                                              V3_looks_str},
                                                                             _B18}
                                                                    end),
                                                 {V2_guards, _B27} =
                                                     protocol:array(_B20,
                                                                    fun
                                                                        (_B21) ->
                                                                            {V3_base_id,
                                                                             _B22} =
                                                                                protocol:uint32(_B21),
                                                                            {V3_status,
                                                                             _B23} =
                                                                                protocol:uint8(_B22),
                                                                            {V3_war_id,
                                                                             _B24} =
                                                                                protocol:uint8(_B23),
                                                                            {V3_quality,
                                                                             _B25} =
                                                                                protocol:uint8(_B24),
                                                                            {{V3_base_id,
                                                                              V3_status,
                                                                              V3_war_id,
                                                                              V3_quality},
                                                                             _B25}
                                                                    end),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_name,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_lev,
                                                   V2_rank_lev,
                                                   V2_rank_point,
                                                   V2_formation_id,
                                                   V2_formation_lev,
                                                   V2_is_leader,
                                                   V2_looks,
                                                   V2_guards},
                                                  _B27}
                                         end),
    {V1_order, _B35} = protocol:array(_B29,
                                      fun (_B30) ->
                                              {V2_rid, _B31} =
                                                  protocol:uint32(_B30),
                                              {V2_platform, _B32} =
                                                  protocol:string(_B31),
                                              {V2_zone_id, _B33} =
                                                  protocol:uint32(_B32),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id},
                                               _B33}
                                      end),
    {ok, {V1_teammate, V1_order}};
unpack(srv, 16414, _B0) ->
    {V1_role_id1, _B1} = protocol:uint32(_B0),
    {V1_platform1, _B2} = protocol:string(_B1),
    {V1_zone_id1, _B3} = protocol:uint16(_B2),
    {V1_role_id2, _B4} = protocol:uint32(_B3),
    {V1_platform2, _B5} = protocol:string(_B4),
    {V1_zone_id2, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_role_id1,
      V1_platform1,
      V1_zone_id1,
      V1_role_id2,
      V1_platform2,
      V1_zone_id2}};
unpack(cli, 16414, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16415, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 16415, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16416, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_group, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_group}};
unpack(cli, 16416, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_group, _B2} = protocol:uint8(_B1),
    {V1_rank, _B14} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_rid, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_platform, _B5} =
                                                 protocol:string(_B4),
                                             {V2_zone_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_sex, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_classes, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_lev, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_rank_lev, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_rank_point, _B12} =
                                                 protocol:uint16(_B11),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_rank_lev,
                                               V2_rank_point},
                                              _B12}
                                     end),
    {ok, {V1_type, V1_group, V1_rank}};
unpack(srv, 16417, _B0) -> {ok, {}};
unpack(cli, 16417, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16418, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_range, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_range}};
unpack(cli, 16418, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_range, _B2} = protocol:uint8(_B1),
    {V1_rank, _B14} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_rid, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_platform, _B5} =
                                                 protocol:string(_B4),
                                             {V2_zone_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_sex, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_classes, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_lev, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_val1, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_val2, _B12} =
                                                 protocol:uint32(_B11),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_val1,
                                               V2_val2},
                                              _B12}
                                     end),
    {ok, {V1_type, V1_range, V1_rank}};
unpack(srv, 16419, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16419, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_flag, V1_msg, V1_rid, V1_platform, V1_zone_id}};
unpack(srv, 16420, _B0) -> {ok, {}};
unpack(cli, 16420, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16421, _B0) -> {ok, {}};
unpack(cli, 16421, _B0) ->
    {V1_season_id, _B1} = protocol:uint32(_B0),
    {V1_new_lev, _B2} = protocol:uint8(_B1),
    {V1_reward_lev, _B3} = protocol:uint8(_B2),
    {V1_rewarded, _B4} = protocol:uint32(_B3),
    {V1_final_reward, _B9} = protocol:array(_B4,
                                            fun (_B5) ->
                                                    {V2_item_id, _B6} =
                                                        protocol:uint32(_B5),
                                                    {V2_num, _B7} =
                                                        protocol:uint32(_B6),
                                                    {{V2_item_id, V2_num}, _B7}
                                            end),
    {ok,
     {V1_season_id,
      V1_new_lev,
      V1_reward_lev,
      V1_rewarded,
      V1_final_reward}};
unpack(srv, 16422, _B0) -> {ok, {}};
unpack(cli, 16422, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16423, _B0) ->
    {V1_content, _B1} = protocol:string(_B0),
    {V1_mentions, _B7} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_rid, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_platform, _B4} =
                                                    protocol:string(_B3),
                                                {V2_zone_id, _B5} =
                                                    protocol:uint16(_B4),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id},
                                                 _B5}
                                        end),
    {ok, {V1_content, V1_mentions}};
unpack(cli, 16423, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16424, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 16424, _B0) ->
    {V1_r_id, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint32(_B2),
    {V1_is_win, _B4} = protocol:uint8(_B3),
    {V1_mates, _B23} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_rid, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_platform, _B7} =
                                                  protocol:string(_B6),
                                              {V2_zone_id, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_name, _B9} =
                                                  protocol:string(_B8),
                                              {V2_sex, _B10} =
                                                  protocol:uint8(_B9),
                                              {V2_classes, _B11} =
                                                  protocol:uint8(_B10),
                                              {V2_lev, _B12} =
                                                  protocol:uint8(_B11),
                                              {V2_rank_lev, _B13} =
                                                  protocol:uint8(_B12),
                                              {V2_rank_point, _B14} =
                                                  protocol:uint16(_B13),
                                              {V2_total_hurt, _B15} =
                                                  protocol:uint32(_B14),
                                              {V2_total_dmg, _B16} =
                                                  protocol:uint32(_B15),
                                              {V2_total_heal, _B17} =
                                                  protocol:uint32(_B16),
                                              {V2_kill_num, _B18} =
                                                  protocol:uint16(_B17),
                                              {V2_dead_num, _B19} =
                                                  protocol:uint16(_B18),
                                              {V2_control_num, _B20} =
                                                  protocol:uint16(_B19),
                                              {V2_mvp_score, _B21} =
                                                  protocol:uint16(_B20),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_rank_lev,
                                                V2_rank_point,
                                                V2_total_hurt,
                                                V2_total_dmg,
                                                V2_total_heal,
                                                V2_kill_num,
                                                V2_dead_num,
                                                V2_control_num,
                                                V2_mvp_score},
                                               _B21}
                                      end),
    {V1_rival, _B42} = protocol:array(_B23,
                                      fun (_B24) ->
                                              {V2_rid, _B25} =
                                                  protocol:uint32(_B24),
                                              {V2_platform, _B26} =
                                                  protocol:string(_B25),
                                              {V2_zone_id, _B27} =
                                                  protocol:uint32(_B26),
                                              {V2_name, _B28} =
                                                  protocol:string(_B27),
                                              {V2_sex, _B29} =
                                                  protocol:uint8(_B28),
                                              {V2_classes, _B30} =
                                                  protocol:uint8(_B29),
                                              {V2_lev, _B31} =
                                                  protocol:uint8(_B30),
                                              {V2_rank_lev, _B32} =
                                                  protocol:uint8(_B31),
                                              {V2_rank_point, _B33} =
                                                  protocol:uint16(_B32),
                                              {V2_total_hurt, _B34} =
                                                  protocol:uint32(_B33),
                                              {V2_total_dmg, _B35} =
                                                  protocol:uint32(_B34),
                                              {V2_total_heal, _B36} =
                                                  protocol:uint32(_B35),
                                              {V2_kill_num, _B37} =
                                                  protocol:uint16(_B36),
                                              {V2_dead_num, _B38} =
                                                  protocol:uint16(_B37),
                                              {V2_control_num, _B39} =
                                                  protocol:uint16(_B38),
                                              {V2_mvp_score, _B40} =
                                                  protocol:uint16(_B39),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_rank_lev,
                                                V2_rank_point,
                                                V2_total_hurt,
                                                V2_total_dmg,
                                                V2_total_heal,
                                                V2_kill_num,
                                                V2_dead_num,
                                                V2_control_num,
                                                V2_mvp_score},
                                               _B40}
                                      end),
    {ok,
     {V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_is_win,
      V1_mates,
      V1_rival}};
unpack(srv, 16425, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_rec_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_rec_id}};
unpack(cli, 16425, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_flag, V1_msg, V1_rid, V1_platform, V1_zone_id}};
unpack(srv, 16426, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 16426, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16427, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16427, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_rank_lev, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_rank_point, _B7} = protocol:uint16(_B6),
    {V1_season_rank_lev, _B8} = protocol:uint8(_B7),
    {V1_season_rank_point, _B9} = protocol:uint16(_B8),
    {V1_win_count, _B10} = protocol:uint16(_B9),
    {V1_win_sustained, _B11} = protocol:uint16(_B10),
    {V1_combat_count, _B12} = protocol:uint16(_B11),
    {V1_best_rank_lev, _B13} = protocol:uint8(_B12),
    {V1_best_rank_point, _B14} = protocol:uint16(_B13),
    {V1_best_win_count, _B15} = protocol:uint16(_B14),
    {V1_best_win_sustained, _B16} = protocol:uint16(_B15),
    {V1_liked, _B17} = protocol:uint32(_B16),
    {V1_best_partner, _B25} = protocol:array(_B17,
                                             fun (_B18) ->
                                                     {V2_partner_rid, _B19} =
                                                         protocol:uint32(_B18),
                                                     {V2_partner_platform,
                                                      _B20} =
                                                         protocol:string(_B19),
                                                     {V2_partner_zone_id,
                                                      _B21} =
                                                         protocol:uint32(_B20),
                                                     {V2_partner_name, _B22} =
                                                         protocol:string(_B21),
                                                     {V2_co_rank_lev, _B23} =
                                                         protocol:uint16(_B22),
                                                     {{V2_partner_rid,
                                                       V2_partner_platform,
                                                       V2_partner_zone_id,
                                                       V2_partner_name,
                                                       V2_co_rank_lev},
                                                      _B23}
                                             end),
    {V1_awesome_kill, _B26} = protocol:uint16(_B25),
    {V1_awesome_dmg, _B27} = protocol:uint16(_B26),
    {V1_awesome_kill_num, _B28} = protocol:uint16(_B27),
    {V1_mvp, _B29} = protocol:uint16(_B28),
    {V1_awesome_heal, _B30} = protocol:uint16(_B29),
    {V1_awesome_control, _B31} = protocol:uint16(_B30),
    {V1_loss_mvp, _B32} = protocol:uint16(_B31),
    {V1_season_awesome_kill, _B33} = protocol:uint16(_B32),
    {V1_season_awesome_dmg, _B34} = protocol:uint16(_B33),
    {V1_season_awesome_kill_num, _B35} =
        protocol:uint16(_B34),
    {V1_season_mvp, _B36} = protocol:uint16(_B35),
    {V1_season_awesome_heal, _B37} = protocol:uint16(_B36),
    {V1_season_awesome_control, _B38} =
        protocol:uint16(_B37),
    {V1_season_loss_mvp, _B39} = protocol:uint16(_B38),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_rank_lev,
      V1_classes,
      V1_rank_point,
      V1_season_rank_lev,
      V1_season_rank_point,
      V1_win_count,
      V1_win_sustained,
      V1_combat_count,
      V1_best_rank_lev,
      V1_best_rank_point,
      V1_best_win_count,
      V1_best_win_sustained,
      V1_liked,
      V1_best_partner,
      V1_awesome_kill,
      V1_awesome_dmg,
      V1_awesome_kill_num,
      V1_mvp,
      V1_awesome_heal,
      V1_awesome_control,
      V1_loss_mvp,
      V1_season_awesome_kill,
      V1_season_awesome_dmg,
      V1_season_awesome_kill_num,
      V1_season_mvp,
      V1_season_awesome_heal,
      V1_season_awesome_control,
      V1_season_loss_mvp}};
unpack(srv, 16428, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16428, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_last_recent, _B13} = protocol:array(_B3,
                                            fun (_B4) ->
                                                    {V2_time, _B5} =
                                                        protocol:uint32(_B4),
                                                    {V2_rank_lev, _B6} =
                                                        protocol:uint8(_B5),
                                                    {V2_is_win, _B7} =
                                                        protocol:uint8(_B6),
                                                    {V2_best_result, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_r_id, _B9} =
                                                        protocol:uint32(_B8),
                                                    {V2_r_platform, _B10} =
                                                        protocol:string(_B9),
                                                    {V2_r_zone_id, _B11} =
                                                        protocol:uint32(_B10),
                                                    {{V2_time,
                                                      V2_rank_lev,
                                                      V2_is_win,
                                                      V2_best_result,
                                                      V2_r_id,
                                                      V2_r_platform,
                                                      V2_r_zone_id},
                                                     _B11}
                                            end),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_last_recent}};
unpack(srv, 16429, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_order, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_order}};
unpack(cli, 16429, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16430, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 16430, _B0) ->
    {V1_max_lev, _B1} = protocol:uint8(_B0),
    {ok, {V1_max_lev}};
unpack(srv, 16431, _B0) -> {ok, {}};
unpack(cli, 16431, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {V1_starlev, _B2} = protocol:uint32(_B1),
    {ok, {V1_num, V1_starlev}};
unpack(srv, 16432, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 16432, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16433, _B0) -> {ok, {}};
unpack(cli, 16433, _B0) ->
    {V1_reward, _B6} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_item_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_bound, _B3} =
                                                  protocol:uint8(_B2),
                                              {V2_num, _B4} =
                                                  protocol:uint32(_B3),
                                              {{V2_item_id, V2_bound, V2_num},
                                               _B4}
                                      end),
    {V1_badge_id, _B7} = protocol:uint32(_B6),
    {ok, {V1_reward, V1_badge_id}};
unpack(srv, 16434, _B0) ->
    {V1_badge_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_badge_id}};
unpack(cli, 16434, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16435, _B0) -> {ok, {}};
unpack(cli, 16435, _B0) ->
    {V1_badge_id, _B1} = protocol:uint32(_B0),
    {V1_badgelist, _B5} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_badge_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {{V2_badge_id}, _B3}
                                         end),
    {V1_setlist, _B9} = protocol:array(_B5,
                                       fun (_B6) ->
                                               {V2_set_id, _B7} =
                                                   protocol:uint32(_B6),
                                               {{V2_set_id}, _B7}
                                       end),
    {ok, {V1_badge_id, V1_badgelist, V1_setlist}};
unpack(srv, 16436, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16436, _B0) ->
    {V1_classes, _B1} = protocol:uint8(_B0),
    {V1_badgelist, _B5} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_badge_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {{V2_badge_id}, _B3}
                                         end),
    {V1_setlist, _B9} = protocol:array(_B5,
                                       fun (_B6) ->
                                               {V2_set_id, _B7} =
                                                   protocol:uint32(_B6),
                                               {{V2_set_id}, _B7}
                                       end),
    {ok, {V1_classes, V1_badgelist, V1_setlist}};
unpack(srv, 16437, _B0) -> {ok, {}};
unpack(cli, 16437, _B0) ->
    {V1_badge_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_badge_id}};
unpack(srv, 16438, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_order, _B4} = protocol:uint32(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_order}};
unpack(cli, 16438, _B0) ->
    {V1_badge_id, _B1} = protocol:uint32(_B0),
    {V1_classes, _B2} = protocol:uint8(_B1),
    {V1_order, _B3} = protocol:uint32(_B2),
    {ok, {V1_badge_id, V1_classes, V1_order}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

