-file("src/proto/proto_176.erl", 1).

-module(proto_176).

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

-file("src/proto/proto_176.erl", 14).

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

-file("src/proto/proto_176.erl", 15).

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

-file("src/proto/proto_176.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17600, {}) ->
    {ok, <<2:32/little, 17600:16/little>>};
pack(srv, 17600, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17600:16/little,
       D_a_t_a/binary>>};
pack(cli, 17601, {}) ->
    {ok, <<2:32/little, 17601:16/little>>};
pack(srv, 17601, {V0_guild_league_alliance}) ->
    D_a_t_a =
        <<(length(V0_guild_league_alliance)):16/little,
          (list_to_binary([<<(length(V1_gids)):16/little,
                             (list_to_binary([<<V2_guild_id:32/little,
                                                (protocol:pack(string,
                                                               V2_platform))/binary,
                                                V2_zone_id:16/little>>
                                              || {V2_guild_id,
                                                  V2_platform,
                                                  V2_zone_id}
                                                     <- V1_gids]))/binary,
                             (length(V1_names)):16/little,
                             (list_to_binary([<<(protocol:pack(string,
                                                               V2_name))/binary>>
                                              || V2_name <- V1_names]))/binary,
                             (length(V1_totems)):16/little,
                             (list_to_binary([<<V2_totem:8/little>>
                                              || V2_totem
                                                     <- V1_totems]))/binary,
                             V1_side:8/little, V1_time:32/little,
                             V1_phase:8/little, V1_season:32/little,
                             V1_is_win:8/little, V1_match_id:32/little,
                             V1_member_num:32/little, V1_remain_num:32/little,
                             V1_movability:32/little, V1_score:32/little,
                             V1_guarded_unit:32/little,
                             V1_attacked_unit:32/little, V1_win:32/little,
                             V1_remain_unit:8/little, V1_grade:8/little>>
                           || #guild_league_alliance{gids = V1_gids,
                                                     names = V1_names,
                                                     totems = V1_totems,
                                                     side = V1_side,
                                                     time = V1_time,
                                                     phase = V1_phase,
                                                     season = V1_season,
                                                     is_win = V1_is_win,
                                                     match_id = V1_match_id,
                                                     member_num = V1_member_num,
                                                     remain_num = V1_remain_num,
                                                     movability = V1_movability,
                                                     score = V1_score,
                                                     guarded_unit =
                                                         V1_guarded_unit,
                                                     attacked_unit =
                                                         V1_attacked_unit,
                                                     win = V1_win,
                                                     remain_unit =
                                                         V1_remain_unit,
                                                     grade = V1_grade}
                                  <- V0_guild_league_alliance]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17601:16/little,
       D_a_t_a/binary>>};
pack(cli, 17602, {}) ->
    {ok, <<2:32/little, 17602:16/little>>};
pack(srv, 17602, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17602:16/little,
       D_a_t_a/binary>>};
pack(cli, 17603, {}) ->
    {ok, <<2:32/little, 17603:16/little>>};
pack(srv, 17603, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17603:16/little,
       D_a_t_a/binary>>};
pack(cli, 17604, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17604:16/little,
       D_a_t_a/binary>>};
pack(srv, 17604, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17604:16/little,
       D_a_t_a/binary>>};
pack(cli, 17605, {}) ->
    {ok, <<2:32/little, 17605:16/little>>};
pack(srv, 17605,
     {#guild_league_role{movability = V0_movability,
                         win = V0_win, is_trump = V0_is_trump}}) ->
    D_a_t_a = <<V0_movability:32/little, V0_win:32/little,
                V0_is_trump:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17605:16/little,
       D_a_t_a/binary>>};
pack(cli, 17606, {V0_grade, V0_season}) ->
    D_a_t_a = <<V0_grade:8/little, V0_season:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17606:16/little,
       D_a_t_a/binary>>};
pack(srv, 17606, {V0_guild_league_guild}) ->
    D_a_t_a = <<(length(V0_guild_league_guild)):16/little,
                (list_to_binary([<<V1_guild_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_totem:8/little,
                                   V1_side:8/little, V1_time:32/little,
                                   V1_phase:8/little, V1_season:32/little,
                                   V1_match_id:32/little, V1_is_win:8/little>>
                                 || #guild_league_guild{id =
                                                            {V1_guild_id,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        lev = V1_lev,
                                                        totem = V1_totem,
                                                        side = V1_side,
                                                        time = V1_time,
                                                        phase = V1_phase,
                                                        season = V1_season,
                                                        match_id = V1_match_id,
                                                        is_win = V1_is_win}
                                        <- V0_guild_league_guild]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17606:16/little,
       D_a_t_a/binary>>};
pack(cli, 17607, {}) ->
    {ok, <<2:32/little, 17607:16/little>>};
pack(srv, 17607, {V0_guild_league_role}) ->
    D_a_t_a = <<(length(V0_guild_league_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_is_trump:8/little,
                                   V1_win:32/little, V1_score:32/little,
                                   V1_movability:32/little>>
                                 || #guild_league_role{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       name = V1_name,
                                                       lev = V1_lev,
                                                       sex = V1_sex,
                                                       classes = V1_classes,
                                                       is_trump = V1_is_trump,
                                                       win = V1_win,
                                                       score = V1_score,
                                                       movability =
                                                           V1_movability}
                                        <- V0_guild_league_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17607:16/little,
       D_a_t_a/binary>>};
pack(cli, 17608, {}) ->
    {ok, <<2:32/little, 17608:16/little>>};
pack(srv, 17608, {V0_guild_league_role}) ->
    D_a_t_a = <<(length(V0_guild_league_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_is_trump:8/little,
                                   V1_win:32/little, V1_score:32/little,
                                   V1_movability:32/little>>
                                 || #guild_league_role{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       name = V1_name,
                                                       lev = V1_lev,
                                                       sex = V1_sex,
                                                       classes = V1_classes,
                                                       is_trump = V1_is_trump,
                                                       win = V1_win,
                                                       score = V1_score,
                                                       movability =
                                                           V1_movability}
                                        <- V0_guild_league_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17608:16/little,
       D_a_t_a/binary>>};
pack(cli, 17609, {}) ->
    {ok, <<2:32/little, 17609:16/little>>};
pack(srv, 17609, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17609:16/little,
       D_a_t_a/binary>>};
pack(cli, 17610, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17610:16/little,
       D_a_t_a/binary>>};
pack(srv, 17610, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17610:16/little,
       D_a_t_a/binary>>};
pack(cli, 17611, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17611:16/little,
       D_a_t_a/binary>>};
pack(srv, 17611, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17611:16/little,
       D_a_t_a/binary>>};
pack(cli, 17612, {}) ->
    {ok, <<2:32/little, 17612:16/little>>};
pack(srv, 17612, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17612:16/little,
       D_a_t_a/binary>>};
pack(cli, 17613, {}) ->
    {ok, <<2:32/little, 17613:16/little>>};
pack(srv, 17613, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17613:16/little,
       D_a_t_a/binary>>};
pack(cli, 17614, {}) ->
    {ok, <<2:32/little, 17614:16/little>>};
pack(srv, 17614, {V0_guild_league_unit}) ->
    D_a_t_a = <<(length(V0_guild_league_unit)):16/little,
                (list_to_binary([<<V1_match_id:32/little,
                                   V1_unit_id:32/little, V1_battle_id:32/little,
                                   V1_last_operated:32/little,
                                   V1_duration:32/little, V1_side:8/little>>
                                 || #guild_league_unit{id =
                                                           {V1_match_id,
                                                            V1_unit_id},
                                                       battle_id = V1_battle_id,
                                                       last_operated =
                                                           V1_last_operated,
                                                       duration = V1_duration,
                                                       side = V1_side}
                                        <- V0_guild_league_unit]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17614:16/little,
       D_a_t_a/binary>>};
pack(cli, 17615, {}) ->
    {ok, <<2:32/little, 17615:16/little>>};
pack(srv, 17615, {V0_guild_league_trump}) ->
    D_a_t_a = <<(length(V0_guild_league_trump)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_pos:8/little>>
                                 || #guild_league_trump{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        lev = V1_lev,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        pos = V1_pos}
                                        <- V0_guild_league_trump]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17615:16/little,
       D_a_t_a/binary>>};
pack(cli, 17616,
     {V0_id, V0_platform, V0_zone_id, V0_position}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_position:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17616:16/little,
       D_a_t_a/binary>>};
pack(srv, 17616, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17616:16/little,
       D_a_t_a/binary>>};
pack(cli, 17617, {}) ->
    {ok, <<2:32/little, 17617:16/little>>};
pack(srv, 17617, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17617:16/little,
       D_a_t_a/binary>>};
pack(cli, 17618, {}) ->
    {ok, <<2:32/little, 17618:16/little>>};
pack(srv, 17618,
     {{V0_rid, V0_platform, V0_zone_id}, V0_status}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_status:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17618:16/little,
       D_a_t_a/binary>>};
pack(cli, 17619, {}) ->
    {ok, <<2:32/little, 17619:16/little>>};
pack(srv, 17619,
     {V0_season_id,
      V0_cur_phase,
      V0_trump_enable,
      #guild_league_summary{name = V0_name,
                            leader_id =
                                {V0_ld_id, V0_ld_platform, V0_ld_zone_id},
                            leader_name = V0_leader_name, lev = V0_lev,
                            totem = V0_totem, season_win = V0_season_win,
                            season_score = V0_season_score,
                            total_win = V0_total_win, grade = V0_grade,
                            rank = V0_rank, group = V0_group},
      V0_guild_league_guild}) ->
    D_a_t_a = <<V0_season_id:32/little,
                V0_cur_phase:8/little, V0_trump_enable:8/little,
                (protocol:pack(string, V0_name))/binary,
                V0_ld_id:32/little,
                (protocol:pack(string, V0_ld_platform))/binary,
                V0_ld_zone_id:16/little,
                (protocol:pack(string, V0_leader_name))/binary,
                V0_lev:8/little, V0_totem:8/little,
                V0_season_win:32/little,
                V0_season_score:32/signed-little,
                V0_total_win:32/little, V0_grade:8/little,
                V0_rank:32/little, V0_group:8/little,
                (length(V0_guild_league_guild)):16/little,
                (list_to_binary([<<V1_guild_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_totem:8/little,
                                   V1_side:8/little, V1_time:32/little,
                                   V1_phase:8/little, V1_season:32/little,
                                   V1_match_id:32/little, V1_is_win:8/little>>
                                 || #guild_league_guild{id =
                                                            {V1_guild_id,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        lev = V1_lev,
                                                        totem = V1_totem,
                                                        side = V1_side,
                                                        time = V1_time,
                                                        phase = V1_phase,
                                                        season = V1_season,
                                                        match_id = V1_match_id,
                                                        is_win = V1_is_win}
                                        <- V0_guild_league_guild]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17619:16/little,
       D_a_t_a/binary>>};
pack(cli, 17620, {V0_grade}) ->
    D_a_t_a = <<V0_grade:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17620:16/little,
       D_a_t_a/binary>>};
pack(srv, 17620, {V0_grade, V0_guild_league_summary}) ->
    D_a_t_a = <<V0_grade:8/little,
                (length(V0_guild_league_summary)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_name))/binary,
                                   V1_ld_id:32/little,
                                   (protocol:pack(string,
                                                  V1_ld_platform))/binary,
                                   V1_ld_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_leader_name))/binary,
                                   V1_lev:8/little, V1_totem:8/little,
                                   V1_season_win:32/little,
                                   V1_season_lost:32/little,
                                   V1_season_draw:32/little,
                                   V1_season_score:32/signed-little,
                                   V1_total_win:32/little, V1_grade:8/little,
                                   V1_group:8/little, V1_rank:32/little>>
                                 || #guild_league_summary{name = V1_name,
                                                          leader_id =
                                                              {V1_ld_id,
                                                               V1_ld_platform,
                                                               V1_ld_zone_id},
                                                          leader_name =
                                                              V1_leader_name,
                                                          lev = V1_lev,
                                                          totem = V1_totem,
                                                          season_win =
                                                              V1_season_win,
                                                          season_lost =
                                                              V1_season_lost,
                                                          season_draw =
                                                              V1_season_draw,
                                                          season_score =
                                                              V1_season_score,
                                                          total_win =
                                                              V1_total_win,
                                                          grade = V1_grade,
                                                          group = V1_group,
                                                          rank = V1_rank}
                                        <- V0_guild_league_summary]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17620:16/little,
       D_a_t_a/binary>>};
pack(cli, 17621, {V0_match_id}) ->
    D_a_t_a = <<V0_match_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17621:16/little,
       D_a_t_a/binary>>};
pack(srv, 17621, {V0_guild_league_alliance}) ->
    D_a_t_a =
        <<(length(V0_guild_league_alliance)):16/little,
          (list_to_binary([<<(length(V1_gids)):16/little,
                             (list_to_binary([<<V2_guild_id:32/little,
                                                (protocol:pack(string,
                                                               V2_platform))/binary,
                                                V2_zone_id:16/little>>
                                              || {V2_guild_id,
                                                  V2_platform,
                                                  V2_zone_id}
                                                     <- V1_gids]))/binary,
                             (length(V1_names)):16/little,
                             (list_to_binary([<<(protocol:pack(string,
                                                               V2_name))/binary>>
                                              || V2_name <- V1_names]))/binary,
                             (length(V1_totems)):16/little,
                             (list_to_binary([<<V2_totem:8/little>>
                                              || V2_totem
                                                     <- V1_totems]))/binary,
                             V1_side:8/little, V1_time:32/little,
                             V1_phase:8/little, V1_season:32/little,
                             V1_is_win:8/little, V1_match_id:32/little,
                             V1_member_num:32/little, V1_remain_num:32/little,
                             V1_movability:32/little, V1_score:32/little,
                             V1_guarded_unit:32/little,
                             V1_attacked_unit:32/little, V1_win:32/little,
                             V1_remain_unit:8/little>>
                           || #guild_league_alliance{gids = V1_gids,
                                                     names = V1_names,
                                                     totems = V1_totems,
                                                     side = V1_side,
                                                     time = V1_time,
                                                     phase = V1_phase,
                                                     season = V1_season,
                                                     is_win = V1_is_win,
                                                     match_id = V1_match_id,
                                                     member_num = V1_member_num,
                                                     remain_num = V1_remain_num,
                                                     movability = V1_movability,
                                                     score = V1_score,
                                                     guarded_unit =
                                                         V1_guarded_unit,
                                                     attacked_unit =
                                                         V1_attacked_unit,
                                                     win = V1_win,
                                                     remain_unit =
                                                         V1_remain_unit}
                                  <- V0_guild_league_alliance]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17621:16/little,
       D_a_t_a/binary>>};
pack(cli, 17622, {}) ->
    {ok, <<2:32/little, 17622:16/little>>};
pack(srv, 17622, {V0_cd}) ->
    D_a_t_a = <<V0_cd:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17622:16/little,
       D_a_t_a/binary>>};
pack(cli, 17623, {V0_season}) ->
    D_a_t_a = <<V0_season:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17623:16/little,
       D_a_t_a/binary>>};
pack(srv, 17623, {V0_guild_league_guild}) ->
    D_a_t_a = <<(length(V0_guild_league_guild)):16/little,
                (list_to_binary([<<V1_guild_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_totem:8/little,
                                   V1_side:8/little, V1_time:32/little,
                                   V1_phase:8/little, V1_season:32/little,
                                   V1_match_id:32/little, V1_group:8/little,
                                   V1_order:8/little, V1_is_win:8/little,
                                   V1_season_consecutive_win:8/little>>
                                 || #guild_league_guild{id =
                                                            {V1_guild_id,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        lev = V1_lev,
                                                        totem = V1_totem,
                                                        side = V1_side,
                                                        time = V1_time,
                                                        phase = V1_phase,
                                                        season = V1_season,
                                                        match_id = V1_match_id,
                                                        group = V1_group,
                                                        order = V1_order,
                                                        is_win = V1_is_win,
                                                        season_consecutive_win =
                                                            V1_season_consecutive_win}
                                        <- V0_guild_league_guild]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17623:16/little,
       D_a_t_a/binary>>};
pack(cli, 17624,
     {V0_guild_id, V0_platform, V0_zone_id, V0_season}) ->
    D_a_t_a = <<V0_guild_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_season:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17624:16/little,
       D_a_t_a/binary>>};
pack(srv, 17624, {V0_gid, V0_guild_league_alliance}) ->
    D_a_t_a = <<(length(V0_gid)):16/little,
                (list_to_binary([<<V1_guild_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:16/little>>
                                 || {V1_guild_id, V1_g_platform, V1_g_zone_id}
                                        <- V0_gid]))/binary,
                (length(V0_guild_league_alliance)):16/little,
                (list_to_binary([<<(length(V1_gids)):16/little,
                                   (list_to_binary([<<V2_guild_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little>>
                                                    || {V2_guild_id,
                                                        V2_platform,
                                                        V2_zone_id}
                                                           <- V1_gids]))/binary,
                                   (length(V1_names)):16/little,
                                   (list_to_binary([<<(protocol:pack(string,
                                                                     V2_name))/binary>>
                                                    || V2_name
                                                           <- V1_names]))/binary,
                                   (length(V1_totems)):16/little,
                                   (list_to_binary([<<V2_totem:8/little>>
                                                    || V2_totem
                                                           <- V1_totems]))/binary,
                                   V1_side:8/little, V1_time:32/little,
                                   V1_phase:8/little, V1_season:32/little,
                                   V1_is_win:8/little, V1_match_id:32/little>>
                                 || #guild_league_alliance{gids = V1_gids,
                                                           names = V1_names,
                                                           totems = V1_totems,
                                                           side = V1_side,
                                                           time = V1_time,
                                                           phase = V1_phase,
                                                           season = V1_season,
                                                           is_win = V1_is_win,
                                                           match_id =
                                                               V1_match_id}
                                        <- V0_guild_league_alliance]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17624:16/little,
       D_a_t_a/binary>>};
pack(cli, 17625, {}) ->
    {ok, <<2:32/little, 17625:16/little>>};
pack(srv, 17625,
     {V0_guild_league_guess_choice, V0_guild_league_poll}) ->
    D_a_t_a =
        <<(length(V0_guild_league_guess_choice)):16/little,
          (list_to_binary([<<V1_guild_id:32/little,
                             (protocol:pack(string, V1_platform))/binary,
                             V1_zone_id:16/little, V1_phase:8/little,
                             V1_bingo:8/little>>
                           || #guild_league_guess_choice{gid =
                                                             {V1_guild_id,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         phase = V1_phase,
                                                         bingo = V1_bingo}
                                  <- V0_guild_league_guess_choice]))/binary,
          (length(V0_guild_league_poll)):16/little,
          (list_to_binary([<<V1_guild_id:32/little,
                             (protocol:pack(string, V1_platform))/binary,
                             V1_zone_id:16/little, V1_voted:32/little>>
                           || #guild_league_poll{gid =
                                                     {V1_guild_id,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 voted = V1_voted}
                                  <- V0_guild_league_poll]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17625:16/little,
       D_a_t_a/binary>>};
pack(cli, 17626, {V0_id}) ->
    D_a_t_a = <<(length(V0_id)):16/little,
                (list_to_binary([<<V1_guild_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_guild_id, V1_platform, V1_zone_id}
                                        <- V0_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17626:16/little,
       D_a_t_a/binary>>};
pack(srv, 17626, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17626:16/little,
       D_a_t_a/binary>>};
pack(cli, 17627, {}) ->
    {ok, <<2:32/little, 17627:16/little>>};
pack(srv, 17627, {V0_guild_league_live}) ->
    D_a_t_a = <<(length(V0_guild_league_live)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_phase:8/little,
                                   V1_season:32/little, V1_time:32/little,
                                   V1_type:8/little,
                                   (length(V1_names1)):16/little,
                                   (list_to_binary([<<(protocol:pack(string,
                                                                     V2_name1))/binary>>
                                                    || V2_name1
                                                           <- V1_names1]))/binary,
                                   (length(V1_names2)):16/little,
                                   (list_to_binary([<<(protocol:pack(string,
                                                                     V2_name2))/binary>>
                                                    || V2_name2
                                                           <- V1_names2]))/binary>>
                                 || #guild_league_live{id = V1_id,
                                                       phase = V1_phase,
                                                       season = V1_season,
                                                       time = V1_time,
                                                       type = V1_type,
                                                       names1 = V1_names1,
                                                       names2 = V1_names2}
                                        <- V0_guild_league_live]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17627:16/little,
       D_a_t_a/binary>>};
pack(cli, 17628, {V0_match_id}) ->
    D_a_t_a = <<V0_match_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17628:16/little,
       D_a_t_a/binary>>};
pack(srv, 17628,
     {V0_guild_league_alliance,
      V0_guild_league_unit,
      #guild_league_live{type = V0_type, logs = V0_logs}}) ->
    D_a_t_a =
        <<(length(V0_guild_league_alliance)):16/little,
          (list_to_binary([<<(length(V1_gids)):16/little,
                             (list_to_binary([<<V2_guild_id:32/little,
                                                (protocol:pack(string,
                                                               V2_platform))/binary,
                                                V2_zone_id:16/little>>
                                              || {V2_guild_id,
                                                  V2_platform,
                                                  V2_zone_id}
                                                     <- V1_gids]))/binary,
                             (length(V1_names)):16/little,
                             (list_to_binary([<<(protocol:pack(string,
                                                               V2_name))/binary>>
                                              || V2_name <- V1_names]))/binary,
                             (length(V1_totems)):16/little,
                             (list_to_binary([<<V2_totem:8/little>>
                                              || V2_totem
                                                     <- V1_totems]))/binary,
                             V1_side:8/little, V1_time:32/little,
                             V1_phase:8/little, V1_season:32/little,
                             V1_is_win:8/little, V1_match_id:32/little,
                             V1_member_num:32/little, V1_remain_num:32/little,
                             V1_movability:32/little, V1_score:32/little,
                             V1_guarded_unit:32/little,
                             V1_attacked_unit:32/little, V1_win:32/little,
                             V1_remain_unit:8/little, V1_grade:8/little>>
                           || #guild_league_alliance{gids = V1_gids,
                                                     names = V1_names,
                                                     totems = V1_totems,
                                                     side = V1_side,
                                                     time = V1_time,
                                                     phase = V1_phase,
                                                     season = V1_season,
                                                     is_win = V1_is_win,
                                                     match_id = V1_match_id,
                                                     member_num = V1_member_num,
                                                     remain_num = V1_remain_num,
                                                     movability = V1_movability,
                                                     score = V1_score,
                                                     guarded_unit =
                                                         V1_guarded_unit,
                                                     attacked_unit =
                                                         V1_attacked_unit,
                                                     win = V1_win,
                                                     remain_unit =
                                                         V1_remain_unit,
                                                     grade = V1_grade}
                                  <- V0_guild_league_alliance]))/binary,
          (length(V0_guild_league_unit)):16/little,
          (list_to_binary([<<V1_match_id:32/little,
                             V1_unit_id:32/little, V1_battle_id:32/little,
                             V1_last_operated:32/little, V1_duration:32/little,
                             V1_side:8/little>>
                           || #guild_league_unit{id = {V1_match_id, V1_unit_id},
                                                 battle_id = V1_battle_id,
                                                 last_operated =
                                                     V1_last_operated,
                                                 duration = V1_duration,
                                                 side = V1_side}
                                  <- V0_guild_league_unit]))/binary,
          V0_type:8/little, (length(V0_logs)):16/little,
          (list_to_binary([<<V1_log_id:32/little,
                             (protocol:pack(string, V1_log_msg))/binary,
                             V1_log_time:32/little>>
                           || {V1_log_id, V1_log_msg, V1_log_time}
                                  <- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17628:16/little,
       D_a_t_a/binary>>};
pack(cli, 17629, {}) ->
    {ok, <<2:32/little, 17629:16/little>>};
pack(srv, 17629, {V0_guild_league_champion}) ->
    D_a_t_a =
        <<(length(V0_guild_league_champion)):16/little,
          (list_to_binary([<<V1_season:32/little,
                             (length(V1_top3)):16/little,
                             (list_to_binary([<<V2_guild_id:32/little,
                                                (protocol:pack(string,
                                                               V2_platform))/binary,
                                                V2_zone_id:16/little,
                                                (protocol:pack(string,
                                                               V2_name1))/binary,
                                                V2_rank:16/little,
                                                V2_totem:8/little>>
                                              || {{V2_guild_id,
                                                   V2_platform,
                                                   V2_zone_id},
                                                  V2_name1,
                                                  V2_rank,
                                                  V2_totem}
                                                     <- V1_top3]))/binary>>
                           || #guild_league_champion{season = V1_season,
                                                     top3 = V1_top3}
                                  <- V0_guild_league_champion]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17629:16/little,
       D_a_t_a/binary>>};
pack(cli, 17630, {}) ->
    {ok, <<2:32/little, 17630:16/little>>};
pack(srv, 17630, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17630:16/little,
       D_a_t_a/binary>>};
pack(cli, 17631, {}) ->
    {ok, <<2:32/little, 17631:16/little>>};
pack(srv, 17631, {V0_can_worship}) ->
    D_a_t_a = <<V0_can_worship:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17631:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17600, _B0) -> {ok, {}};
unpack(cli, 17600, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 17601, _B0) -> {ok, {}};
unpack(cli, 17601, _B0) ->
    {V1_guild_league_alliance, _B32} = protocol:array(_B0,
                                                      fun (_B1) ->
                                                              {V2_gids, _B7} =
                                                                  protocol:array(_B1,
                                                                                 fun
                                                                                     (_B2) ->
                                                                                         {V3_guild_id,
                                                                                          _B3} =
                                                                                             protocol:uint32(_B2),
                                                                                         {V3_platform,
                                                                                          _B4} =
                                                                                             protocol:string(_B3),
                                                                                         {V3_zone_id,
                                                                                          _B5} =
                                                                                             protocol:uint16(_B4),
                                                                                         {{V3_guild_id,
                                                                                           V3_platform,
                                                                                           V3_zone_id},
                                                                                          _B5}
                                                                                 end),
                                                              {V2_names, _B11} =
                                                                  protocol:array(_B7,
                                                                                 fun
                                                                                     (_B8) ->
                                                                                         {V3_name,
                                                                                          _B9} =
                                                                                             protocol:string(_B8),
                                                                                         {{V3_name},
                                                                                          _B9}
                                                                                 end),
                                                              {V2_totems,
                                                               _B15} =
                                                                  protocol:array(_B11,
                                                                                 fun
                                                                                     (_B12) ->
                                                                                         {V3_totem,
                                                                                          _B13} =
                                                                                             protocol:uint8(_B12),
                                                                                         {{V3_totem},
                                                                                          _B13}
                                                                                 end),
                                                              {V2_side, _B16} =
                                                                  protocol:uint8(_B15),
                                                              {V2_time, _B17} =
                                                                  protocol:uint32(_B16),
                                                              {V2_phase, _B18} =
                                                                  protocol:uint8(_B17),
                                                              {V2_season,
                                                               _B19} =
                                                                  protocol:uint32(_B18),
                                                              {V2_is_win,
                                                               _B20} =
                                                                  protocol:uint8(_B19),
                                                              {V2_match_id,
                                                               _B21} =
                                                                  protocol:uint32(_B20),
                                                              {V2_member_num,
                                                               _B22} =
                                                                  protocol:uint32(_B21),
                                                              {V2_remain_num,
                                                               _B23} =
                                                                  protocol:uint32(_B22),
                                                              {V2_movability,
                                                               _B24} =
                                                                  protocol:uint32(_B23),
                                                              {V2_score, _B25} =
                                                                  protocol:uint32(_B24),
                                                              {V2_guarded_unit,
                                                               _B26} =
                                                                  protocol:uint32(_B25),
                                                              {V2_attacked_unit,
                                                               _B27} =
                                                                  protocol:uint32(_B26),
                                                              {V2_win, _B28} =
                                                                  protocol:uint32(_B27),
                                                              {V2_remain_unit,
                                                               _B29} =
                                                                  protocol:uint8(_B28),
                                                              {V2_grade, _B30} =
                                                                  protocol:uint8(_B29),
                                                              {{V2_gids,
                                                                V2_names,
                                                                V2_totems,
                                                                V2_side,
                                                                V2_time,
                                                                V2_phase,
                                                                V2_season,
                                                                V2_is_win,
                                                                V2_match_id,
                                                                V2_member_num,
                                                                V2_remain_num,
                                                                V2_movability,
                                                                V2_score,
                                                                V2_guarded_unit,
                                                                V2_attacked_unit,
                                                                V2_win,
                                                                V2_remain_unit,
                                                                V2_grade},
                                                               _B30}
                                                      end),
    {ok, {V1_guild_league_alliance}};
unpack(srv, 17602, _B0) -> {ok, {}};
unpack(cli, 17602, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17603, _B0) -> {ok, {}};
unpack(cli, 17603, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17604, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 17604, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17605, _B0) -> {ok, {}};
unpack(cli, 17605, _B0) ->
    {V1_movability, _B1} = protocol:uint32(_B0),
    {V1_win, _B2} = protocol:uint32(_B1),
    {V1_is_trump, _B3} = protocol:uint8(_B2),
    {ok, {V1_movability, V1_win, V1_is_trump}};
unpack(srv, 17606, _B0) ->
    {V1_grade, _B1} = protocol:uint8(_B0),
    {V1_season, _B2} = protocol:uint32(_B1),
    {ok, {V1_grade, V1_season}};
unpack(cli, 17606, _B0) ->
    {V1_guild_league_guild, _B15} = protocol:array(_B0,
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
                                                           {V2_totem, _B7} =
                                                               protocol:uint8(_B6),
                                                           {V2_side, _B8} =
                                                               protocol:uint8(_B7),
                                                           {V2_time, _B9} =
                                                               protocol:uint32(_B8),
                                                           {V2_phase, _B10} =
                                                               protocol:uint8(_B9),
                                                           {V2_season, _B11} =
                                                               protocol:uint32(_B10),
                                                           {V2_match_id, _B12} =
                                                               protocol:uint32(_B11),
                                                           {V2_is_win, _B13} =
                                                               protocol:uint8(_B12),
                                                           {{V2_guild_id,
                                                             V2_platform,
                                                             V2_zone_id,
                                                             V2_name,
                                                             V2_lev,
                                                             V2_totem,
                                                             V2_side,
                                                             V2_time,
                                                             V2_phase,
                                                             V2_season,
                                                             V2_match_id,
                                                             V2_is_win},
                                                            _B13}
                                                   end),
    {ok, {V1_guild_league_guild}};
unpack(srv, 17607, _B0) -> {ok, {}};
unpack(cli, 17607, _B0) ->
    {V1_guild_league_role, _B14} = protocol:array(_B0,
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
                                                          {V2_sex, _B7} =
                                                              protocol:uint8(_B6),
                                                          {V2_classes, _B8} =
                                                              protocol:uint8(_B7),
                                                          {V2_is_trump, _B9} =
                                                              protocol:uint8(_B8),
                                                          {V2_win, _B10} =
                                                              protocol:uint32(_B9),
                                                          {V2_score, _B11} =
                                                              protocol:uint32(_B10),
                                                          {V2_movability,
                                                           _B12} =
                                                              protocol:uint32(_B11),
                                                          {{V2_rid,
                                                            V2_platform,
                                                            V2_zone_id,
                                                            V2_name,
                                                            V2_lev,
                                                            V2_sex,
                                                            V2_classes,
                                                            V2_is_trump,
                                                            V2_win,
                                                            V2_score,
                                                            V2_movability},
                                                           _B12}
                                                  end),
    {ok, {V1_guild_league_role}};
unpack(srv, 17608, _B0) -> {ok, {}};
unpack(cli, 17608, _B0) ->
    {V1_guild_league_role, _B14} = protocol:array(_B0,
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
                                                          {V2_sex, _B7} =
                                                              protocol:uint8(_B6),
                                                          {V2_classes, _B8} =
                                                              protocol:uint8(_B7),
                                                          {V2_is_trump, _B9} =
                                                              protocol:uint8(_B8),
                                                          {V2_win, _B10} =
                                                              protocol:uint32(_B9),
                                                          {V2_score, _B11} =
                                                              protocol:uint32(_B10),
                                                          {V2_movability,
                                                           _B12} =
                                                              protocol:uint32(_B11),
                                                          {{V2_rid,
                                                            V2_platform,
                                                            V2_zone_id,
                                                            V2_name,
                                                            V2_lev,
                                                            V2_sex,
                                                            V2_classes,
                                                            V2_is_trump,
                                                            V2_win,
                                                            V2_score,
                                                            V2_movability},
                                                           _B12}
                                                  end),
    {ok, {V1_guild_league_role}};
unpack(srv, 17609, _B0) -> {ok, {}};
unpack(cli, 17609, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(srv, 17610, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 17610, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 17611, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 17611, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17612, _B0) -> {ok, {}};
unpack(cli, 17612, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 17613, _B0) -> {ok, {}};
unpack(cli, 17613, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17614, _B0) -> {ok, {}};
unpack(cli, 17614, _B0) ->
    {V1_guild_league_unit, _B9} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_match_id, _B2} =
                                                             protocol:uint32(_B1),
                                                         {V2_unit_id, _B3} =
                                                             protocol:uint32(_B2),
                                                         {V2_battle_id, _B4} =
                                                             protocol:uint32(_B3),
                                                         {V2_last_operated,
                                                          _B5} =
                                                             protocol:uint32(_B4),
                                                         {V2_duration, _B6} =
                                                             protocol:uint32(_B5),
                                                         {V2_side, _B7} =
                                                             protocol:uint8(_B6),
                                                         {{V2_match_id,
                                                           V2_unit_id,
                                                           V2_battle_id,
                                                           V2_last_operated,
                                                           V2_duration,
                                                           V2_side},
                                                          _B7}
                                                 end),
    {ok, {V1_guild_league_unit}};
unpack(srv, 17615, _B0) -> {ok, {}};
unpack(cli, 17615, _B0) ->
    {V1_guild_league_trump, _B11} = protocol:array(_B0,
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
                                                           {V2_sex, _B7} =
                                                               protocol:uint8(_B6),
                                                           {V2_classes, _B8} =
                                                               protocol:uint8(_B7),
                                                           {V2_pos, _B9} =
                                                               protocol:uint8(_B8),
                                                           {{V2_rid,
                                                             V2_platform,
                                                             V2_zone_id,
                                                             V2_name,
                                                             V2_lev,
                                                             V2_sex,
                                                             V2_classes,
                                                             V2_pos},
                                                            _B9}
                                                   end),
    {ok, {V1_guild_league_trump}};
unpack(srv, 17616, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_position, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_position}};
unpack(cli, 17616, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17617, _B0) -> {ok, {}};
unpack(cli, 17617, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(srv, 17618, _B0) -> {ok, {}};
unpack(cli, 17618, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_status}};
unpack(srv, 17619, _B0) -> {ok, {}};
unpack(cli, 17619, _B0) ->
    {V1_season_id, _B1} = protocol:uint32(_B0),
    {V1_cur_phase, _B2} = protocol:uint8(_B1),
    {V1_trump_enable, _B3} = protocol:uint8(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_ld_id, _B5} = protocol:uint32(_B4),
    {V1_ld_platform, _B6} = protocol:string(_B5),
    {V1_ld_zone_id, _B7} = protocol:uint16(_B6),
    {V1_leader_name, _B8} = protocol:string(_B7),
    {V1_lev, _B9} = protocol:uint8(_B8),
    {V1_totem, _B10} = protocol:uint8(_B9),
    {V1_season_win, _B11} = protocol:uint32(_B10),
    {V1_season_score, _B12} = protocol:int32(_B11),
    {V1_total_win, _B13} = protocol:uint32(_B12),
    {V1_grade, _B14} = protocol:uint8(_B13),
    {V1_rank, _B15} = protocol:uint32(_B14),
    {V1_group, _B16} = protocol:uint8(_B15),
    {V1_guild_league_guild, _B31} = protocol:array(_B16,
                                                   fun (_B17) ->
                                                           {V2_guild_id, _B18} =
                                                               protocol:uint32(_B17),
                                                           {V2_platform, _B19} =
                                                               protocol:string(_B18),
                                                           {V2_zone_id, _B20} =
                                                               protocol:uint16(_B19),
                                                           {V2_name, _B21} =
                                                               protocol:string(_B20),
                                                           {V2_lev, _B22} =
                                                               protocol:uint8(_B21),
                                                           {V2_totem, _B23} =
                                                               protocol:uint8(_B22),
                                                           {V2_side, _B24} =
                                                               protocol:uint8(_B23),
                                                           {V2_time, _B25} =
                                                               protocol:uint32(_B24),
                                                           {V2_phase, _B26} =
                                                               protocol:uint8(_B25),
                                                           {V2_season, _B27} =
                                                               protocol:uint32(_B26),
                                                           {V2_match_id, _B28} =
                                                               protocol:uint32(_B27),
                                                           {V2_is_win, _B29} =
                                                               protocol:uint8(_B28),
                                                           {{V2_guild_id,
                                                             V2_platform,
                                                             V2_zone_id,
                                                             V2_name,
                                                             V2_lev,
                                                             V2_totem,
                                                             V2_side,
                                                             V2_time,
                                                             V2_phase,
                                                             V2_season,
                                                             V2_match_id,
                                                             V2_is_win},
                                                            _B29}
                                                   end),
    {ok,
     {V1_season_id,
      V1_cur_phase,
      V1_trump_enable,
      V1_name,
      V1_ld_id,
      V1_ld_platform,
      V1_ld_zone_id,
      V1_leader_name,
      V1_lev,
      V1_totem,
      V1_season_win,
      V1_season_score,
      V1_total_win,
      V1_grade,
      V1_rank,
      V1_group,
      V1_guild_league_guild}};
unpack(srv, 17620, _B0) ->
    {V1_grade, _B1} = protocol:uint8(_B0),
    {ok, {V1_grade}};
unpack(cli, 17620, _B0) ->
    {V1_grade, _B1} = protocol:uint8(_B0),
    {V1_guild_league_summary, _B19} = protocol:array(_B1,
                                                     fun (_B2) ->
                                                             {V2_name, _B3} =
                                                                 protocol:string(_B2),
                                                             {V2_ld_id, _B4} =
                                                                 protocol:uint32(_B3),
                                                             {V2_ld_platform,
                                                              _B5} =
                                                                 protocol:string(_B4),
                                                             {V2_ld_zone_id,
                                                              _B6} =
                                                                 protocol:uint16(_B5),
                                                             {V2_leader_name,
                                                              _B7} =
                                                                 protocol:string(_B6),
                                                             {V2_lev, _B8} =
                                                                 protocol:uint8(_B7),
                                                             {V2_totem, _B9} =
                                                                 protocol:uint8(_B8),
                                                             {V2_season_win,
                                                              _B10} =
                                                                 protocol:uint32(_B9),
                                                             {V2_season_lost,
                                                              _B11} =
                                                                 protocol:uint32(_B10),
                                                             {V2_season_draw,
                                                              _B12} =
                                                                 protocol:uint32(_B11),
                                                             {V2_season_score,
                                                              _B13} =
                                                                 protocol:int32(_B12),
                                                             {V2_total_win,
                                                              _B14} =
                                                                 protocol:uint32(_B13),
                                                             {V2_grade, _B15} =
                                                                 protocol:uint8(_B14),
                                                             {V2_group, _B16} =
                                                                 protocol:uint8(_B15),
                                                             {V2_rank, _B17} =
                                                                 protocol:uint32(_B16),
                                                             {{V2_name,
                                                               V2_ld_id,
                                                               V2_ld_platform,
                                                               V2_ld_zone_id,
                                                               V2_leader_name,
                                                               V2_lev,
                                                               V2_totem,
                                                               V2_season_win,
                                                               V2_season_lost,
                                                               V2_season_draw,
                                                               V2_season_score,
                                                               V2_total_win,
                                                               V2_grade,
                                                               V2_group,
                                                               V2_rank},
                                                              _B17}
                                                     end),
    {ok, {V1_grade, V1_guild_league_summary}};
unpack(srv, 17621, _B0) ->
    {V1_match_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_match_id}};
unpack(cli, 17621, _B0) ->
    {V1_guild_league_alliance, _B31} = protocol:array(_B0,
                                                      fun (_B1) ->
                                                              {V2_gids, _B7} =
                                                                  protocol:array(_B1,
                                                                                 fun
                                                                                     (_B2) ->
                                                                                         {V3_guild_id,
                                                                                          _B3} =
                                                                                             protocol:uint32(_B2),
                                                                                         {V3_platform,
                                                                                          _B4} =
                                                                                             protocol:string(_B3),
                                                                                         {V3_zone_id,
                                                                                          _B5} =
                                                                                             protocol:uint16(_B4),
                                                                                         {{V3_guild_id,
                                                                                           V3_platform,
                                                                                           V3_zone_id},
                                                                                          _B5}
                                                                                 end),
                                                              {V2_names, _B11} =
                                                                  protocol:array(_B7,
                                                                                 fun
                                                                                     (_B8) ->
                                                                                         {V3_name,
                                                                                          _B9} =
                                                                                             protocol:string(_B8),
                                                                                         {{V3_name},
                                                                                          _B9}
                                                                                 end),
                                                              {V2_totems,
                                                               _B15} =
                                                                  protocol:array(_B11,
                                                                                 fun
                                                                                     (_B12) ->
                                                                                         {V3_totem,
                                                                                          _B13} =
                                                                                             protocol:uint8(_B12),
                                                                                         {{V3_totem},
                                                                                          _B13}
                                                                                 end),
                                                              {V2_side, _B16} =
                                                                  protocol:uint8(_B15),
                                                              {V2_time, _B17} =
                                                                  protocol:uint32(_B16),
                                                              {V2_phase, _B18} =
                                                                  protocol:uint8(_B17),
                                                              {V2_season,
                                                               _B19} =
                                                                  protocol:uint32(_B18),
                                                              {V2_is_win,
                                                               _B20} =
                                                                  protocol:uint8(_B19),
                                                              {V2_match_id,
                                                               _B21} =
                                                                  protocol:uint32(_B20),
                                                              {V2_member_num,
                                                               _B22} =
                                                                  protocol:uint32(_B21),
                                                              {V2_remain_num,
                                                               _B23} =
                                                                  protocol:uint32(_B22),
                                                              {V2_movability,
                                                               _B24} =
                                                                  protocol:uint32(_B23),
                                                              {V2_score, _B25} =
                                                                  protocol:uint32(_B24),
                                                              {V2_guarded_unit,
                                                               _B26} =
                                                                  protocol:uint32(_B25),
                                                              {V2_attacked_unit,
                                                               _B27} =
                                                                  protocol:uint32(_B26),
                                                              {V2_win, _B28} =
                                                                  protocol:uint32(_B27),
                                                              {V2_remain_unit,
                                                               _B29} =
                                                                  protocol:uint8(_B28),
                                                              {{V2_gids,
                                                                V2_names,
                                                                V2_totems,
                                                                V2_side,
                                                                V2_time,
                                                                V2_phase,
                                                                V2_season,
                                                                V2_is_win,
                                                                V2_match_id,
                                                                V2_member_num,
                                                                V2_remain_num,
                                                                V2_movability,
                                                                V2_score,
                                                                V2_guarded_unit,
                                                                V2_attacked_unit,
                                                                V2_win,
                                                                V2_remain_unit},
                                                               _B29}
                                                      end),
    {ok, {V1_guild_league_alliance}};
unpack(srv, 17622, _B0) -> {ok, {}};
unpack(cli, 17622, _B0) ->
    {V1_cd, _B1} = protocol:uint32(_B0),
    {ok, {V1_cd}};
unpack(srv, 17623, _B0) ->
    {V1_season, _B1} = protocol:uint32(_B0),
    {ok, {V1_season}};
unpack(cli, 17623, _B0) ->
    {V1_guild_league_guild, _B18} = protocol:array(_B0,
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
                                                           {V2_totem, _B7} =
                                                               protocol:uint8(_B6),
                                                           {V2_side, _B8} =
                                                               protocol:uint8(_B7),
                                                           {V2_time, _B9} =
                                                               protocol:uint32(_B8),
                                                           {V2_phase, _B10} =
                                                               protocol:uint8(_B9),
                                                           {V2_season, _B11} =
                                                               protocol:uint32(_B10),
                                                           {V2_match_id, _B12} =
                                                               protocol:uint32(_B11),
                                                           {V2_group, _B13} =
                                                               protocol:uint8(_B12),
                                                           {V2_order, _B14} =
                                                               protocol:uint8(_B13),
                                                           {V2_is_win, _B15} =
                                                               protocol:uint8(_B14),
                                                           {V2_season_consecutive_win,
                                                            _B16} =
                                                               protocol:uint8(_B15),
                                                           {{V2_guild_id,
                                                             V2_platform,
                                                             V2_zone_id,
                                                             V2_name,
                                                             V2_lev,
                                                             V2_totem,
                                                             V2_side,
                                                             V2_time,
                                                             V2_phase,
                                                             V2_season,
                                                             V2_match_id,
                                                             V2_group,
                                                             V2_order,
                                                             V2_is_win,
                                                             V2_season_consecutive_win},
                                                            _B16}
                                                   end),
    {ok, {V1_guild_league_guild}};
unpack(srv, 17624, _B0) ->
    {V1_guild_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_season, _B4} = protocol:uint32(_B3),
    {ok, {V1_guild_id, V1_platform, V1_zone_id, V1_season}};
unpack(cli, 17624, _B0) ->
    {V1_gid, _B6} = protocol:array(_B0,
                                   fun (_B1) ->
                                           {V2_guild_id, _B2} =
                                               protocol:uint32(_B1),
                                           {V2_g_platform, _B3} =
                                               protocol:string(_B2),
                                           {V2_g_zone_id, _B4} =
                                               protocol:uint16(_B3),
                                           {{V2_guild_id,
                                             V2_g_platform,
                                             V2_g_zone_id},
                                            _B4}
                                   end),
    {V1_guild_league_alliance, _B29} = protocol:array(_B6,
                                                      fun (_B7) ->
                                                              {V2_gids, _B13} =
                                                                  protocol:array(_B7,
                                                                                 fun
                                                                                     (_B8) ->
                                                                                         {V3_guild_id,
                                                                                          _B9} =
                                                                                             protocol:uint32(_B8),
                                                                                         {V3_platform,
                                                                                          _B10} =
                                                                                             protocol:string(_B9),
                                                                                         {V3_zone_id,
                                                                                          _B11} =
                                                                                             protocol:uint16(_B10),
                                                                                         {{V3_guild_id,
                                                                                           V3_platform,
                                                                                           V3_zone_id},
                                                                                          _B11}
                                                                                 end),
                                                              {V2_names, _B17} =
                                                                  protocol:array(_B13,
                                                                                 fun
                                                                                     (_B14) ->
                                                                                         {V3_name,
                                                                                          _B15} =
                                                                                             protocol:string(_B14),
                                                                                         {{V3_name},
                                                                                          _B15}
                                                                                 end),
                                                              {V2_totems,
                                                               _B21} =
                                                                  protocol:array(_B17,
                                                                                 fun
                                                                                     (_B18) ->
                                                                                         {V3_totem,
                                                                                          _B19} =
                                                                                             protocol:uint8(_B18),
                                                                                         {{V3_totem},
                                                                                          _B19}
                                                                                 end),
                                                              {V2_side, _B22} =
                                                                  protocol:uint8(_B21),
                                                              {V2_time, _B23} =
                                                                  protocol:uint32(_B22),
                                                              {V2_phase, _B24} =
                                                                  protocol:uint8(_B23),
                                                              {V2_season,
                                                               _B25} =
                                                                  protocol:uint32(_B24),
                                                              {V2_is_win,
                                                               _B26} =
                                                                  protocol:uint8(_B25),
                                                              {V2_match_id,
                                                               _B27} =
                                                                  protocol:uint32(_B26),
                                                              {{V2_gids,
                                                                V2_names,
                                                                V2_totems,
                                                                V2_side,
                                                                V2_time,
                                                                V2_phase,
                                                                V2_season,
                                                                V2_is_win,
                                                                V2_match_id},
                                                               _B27}
                                                      end),
    {ok, {V1_gid, V1_guild_league_alliance}};
unpack(srv, 17625, _B0) -> {ok, {}};
unpack(cli, 17625, _B0) ->
    {V1_guild_league_guess_choice, _B8} =
        protocol:array(_B0,
                       fun (_B1) ->
                               {V2_guild_id, _B2} = protocol:uint32(_B1),
                               {V2_platform, _B3} = protocol:string(_B2),
                               {V2_zone_id, _B4} = protocol:uint16(_B3),
                               {V2_phase, _B5} = protocol:uint8(_B4),
                               {V2_bingo, _B6} = protocol:uint8(_B5),
                               {{V2_guild_id,
                                 V2_platform,
                                 V2_zone_id,
                                 V2_phase,
                                 V2_bingo},
                                _B6}
                       end),
    {V1_guild_league_poll, _B15} = protocol:array(_B8,
                                                  fun (_B9) ->
                                                          {V2_guild_id, _B10} =
                                                              protocol:uint32(_B9),
                                                          {V2_platform, _B11} =
                                                              protocol:string(_B10),
                                                          {V2_zone_id, _B12} =
                                                              protocol:uint16(_B11),
                                                          {V2_voted, _B13} =
                                                              protocol:uint32(_B12),
                                                          {{V2_guild_id,
                                                            V2_platform,
                                                            V2_zone_id,
                                                            V2_voted},
                                                           _B13}
                                                  end),
    {ok,
     {V1_guild_league_guess_choice, V1_guild_league_poll}};
unpack(srv, 17626, _B0) ->
    {V1_id, _B6} = protocol:array(_B0,
                                  fun (_B1) ->
                                          {V2_guild_id, _B2} =
                                              protocol:uint32(_B1),
                                          {V2_platform, _B3} =
                                              protocol:string(_B2),
                                          {V2_zone_id, _B4} =
                                              protocol:uint16(_B3),
                                          {{V2_guild_id,
                                            V2_platform,
                                            V2_zone_id},
                                           _B4}
                                  end),
    {ok, {V1_id}};
unpack(cli, 17626, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17627, _B0) -> {ok, {}};
unpack(cli, 17627, _B0) ->
    {V1_guild_league_live, _B16} = protocol:array(_B0,
                                                  fun (_B1) ->
                                                          {V2_id, _B2} =
                                                              protocol:uint32(_B1),
                                                          {V2_phase, _B3} =
                                                              protocol:uint8(_B2),
                                                          {V2_season, _B4} =
                                                              protocol:uint32(_B3),
                                                          {V2_time, _B5} =
                                                              protocol:uint32(_B4),
                                                          {V2_type, _B6} =
                                                              protocol:uint8(_B5),
                                                          {V2_names1, _B10} =
                                                              protocol:array(_B6,
                                                                             fun
                                                                                 (_B7) ->
                                                                                     {V3_name1,
                                                                                      _B8} =
                                                                                         protocol:string(_B7),
                                                                                     {{V3_name1},
                                                                                      _B8}
                                                                             end),
                                                          {V2_names2, _B14} =
                                                              protocol:array(_B10,
                                                                             fun
                                                                                 (_B11) ->
                                                                                     {V3_name2,
                                                                                      _B12} =
                                                                                         protocol:string(_B11),
                                                                                     {{V3_name2},
                                                                                      _B12}
                                                                             end),
                                                          {{V2_id,
                                                            V2_phase,
                                                            V2_season,
                                                            V2_time,
                                                            V2_type,
                                                            V2_names1,
                                                            V2_names2},
                                                           _B14}
                                                  end),
    {ok, {V1_guild_league_live}};
unpack(srv, 17628, _B0) ->
    {V1_match_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_match_id}};
unpack(cli, 17628, _B0) ->
    {V1_guild_league_alliance, _B32} = protocol:array(_B0,
                                                      fun (_B1) ->
                                                              {V2_gids, _B7} =
                                                                  protocol:array(_B1,
                                                                                 fun
                                                                                     (_B2) ->
                                                                                         {V3_guild_id,
                                                                                          _B3} =
                                                                                             protocol:uint32(_B2),
                                                                                         {V3_platform,
                                                                                          _B4} =
                                                                                             protocol:string(_B3),
                                                                                         {V3_zone_id,
                                                                                          _B5} =
                                                                                             protocol:uint16(_B4),
                                                                                         {{V3_guild_id,
                                                                                           V3_platform,
                                                                                           V3_zone_id},
                                                                                          _B5}
                                                                                 end),
                                                              {V2_names, _B11} =
                                                                  protocol:array(_B7,
                                                                                 fun
                                                                                     (_B8) ->
                                                                                         {V3_name,
                                                                                          _B9} =
                                                                                             protocol:string(_B8),
                                                                                         {{V3_name},
                                                                                          _B9}
                                                                                 end),
                                                              {V2_totems,
                                                               _B15} =
                                                                  protocol:array(_B11,
                                                                                 fun
                                                                                     (_B12) ->
                                                                                         {V3_totem,
                                                                                          _B13} =
                                                                                             protocol:uint8(_B12),
                                                                                         {{V3_totem},
                                                                                          _B13}
                                                                                 end),
                                                              {V2_side, _B16} =
                                                                  protocol:uint8(_B15),
                                                              {V2_time, _B17} =
                                                                  protocol:uint32(_B16),
                                                              {V2_phase, _B18} =
                                                                  protocol:uint8(_B17),
                                                              {V2_season,
                                                               _B19} =
                                                                  protocol:uint32(_B18),
                                                              {V2_is_win,
                                                               _B20} =
                                                                  protocol:uint8(_B19),
                                                              {V2_match_id,
                                                               _B21} =
                                                                  protocol:uint32(_B20),
                                                              {V2_member_num,
                                                               _B22} =
                                                                  protocol:uint32(_B21),
                                                              {V2_remain_num,
                                                               _B23} =
                                                                  protocol:uint32(_B22),
                                                              {V2_movability,
                                                               _B24} =
                                                                  protocol:uint32(_B23),
                                                              {V2_score, _B25} =
                                                                  protocol:uint32(_B24),
                                                              {V2_guarded_unit,
                                                               _B26} =
                                                                  protocol:uint32(_B25),
                                                              {V2_attacked_unit,
                                                               _B27} =
                                                                  protocol:uint32(_B26),
                                                              {V2_win, _B28} =
                                                                  protocol:uint32(_B27),
                                                              {V2_remain_unit,
                                                               _B29} =
                                                                  protocol:uint8(_B28),
                                                              {V2_grade, _B30} =
                                                                  protocol:uint8(_B29),
                                                              {{V2_gids,
                                                                V2_names,
                                                                V2_totems,
                                                                V2_side,
                                                                V2_time,
                                                                V2_phase,
                                                                V2_season,
                                                                V2_is_win,
                                                                V2_match_id,
                                                                V2_member_num,
                                                                V2_remain_num,
                                                                V2_movability,
                                                                V2_score,
                                                                V2_guarded_unit,
                                                                V2_attacked_unit,
                                                                V2_win,
                                                                V2_remain_unit,
                                                                V2_grade},
                                                               _B30}
                                                      end),
    {V1_guild_league_unit, _B41} = protocol:array(_B32,
                                                  fun (_B33) ->
                                                          {V2_match_id, _B34} =
                                                              protocol:uint32(_B33),
                                                          {V2_unit_id, _B35} =
                                                              protocol:uint32(_B34),
                                                          {V2_battle_id, _B36} =
                                                              protocol:uint32(_B35),
                                                          {V2_last_operated,
                                                           _B37} =
                                                              protocol:uint32(_B36),
                                                          {V2_duration, _B38} =
                                                              protocol:uint32(_B37),
                                                          {V2_side, _B39} =
                                                              protocol:uint8(_B38),
                                                          {{V2_match_id,
                                                            V2_unit_id,
                                                            V2_battle_id,
                                                            V2_last_operated,
                                                            V2_duration,
                                                            V2_side},
                                                           _B39}
                                                  end),
    {V1_type, _B42} = protocol:uint8(_B41),
    {V1_logs, _B48} = protocol:array(_B42,
                                     fun (_B43) ->
                                             {V2_log_id, _B44} =
                                                 protocol:uint32(_B43),
                                             {V2_log_msg, _B45} =
                                                 protocol:string(_B44),
                                             {V2_log_time, _B46} =
                                                 protocol:uint32(_B45),
                                             {{V2_log_id,
                                               V2_log_msg,
                                               V2_log_time},
                                              _B46}
                                     end),
    {ok,
     {V1_guild_league_alliance,
      V1_guild_league_unit,
      V1_type,
      V1_logs}};
unpack(srv, 17629, _B0) -> {ok, {}};
unpack(cli, 17629, _B0) ->
    {V1_guild_league_champion, _B13} = protocol:array(_B0,
                                                      fun (_B1) ->
                                                              {V2_season, _B2} =
                                                                  protocol:uint32(_B1),
                                                              {V2_top3, _B11} =
                                                                  protocol:array(_B2,
                                                                                 fun
                                                                                     (_B3) ->
                                                                                         {V3_guild_id,
                                                                                          _B4} =
                                                                                             protocol:uint32(_B3),
                                                                                         {V3_platform,
                                                                                          _B5} =
                                                                                             protocol:string(_B4),
                                                                                         {V3_zone_id,
                                                                                          _B6} =
                                                                                             protocol:uint16(_B5),
                                                                                         {V3_name1,
                                                                                          _B7} =
                                                                                             protocol:string(_B6),
                                                                                         {V3_rank,
                                                                                          _B8} =
                                                                                             protocol:uint16(_B7),
                                                                                         {V3_totem,
                                                                                          _B9} =
                                                                                             protocol:uint8(_B8),
                                                                                         {{V3_guild_id,
                                                                                           V3_platform,
                                                                                           V3_zone_id,
                                                                                           V3_name1,
                                                                                           V3_rank,
                                                                                           V3_totem},
                                                                                          _B9}
                                                                                 end),
                                                              {{V2_season,
                                                                V2_top3},
                                                               _B11}
                                                      end),
    {ok, {V1_guild_league_champion}};
unpack(srv, 17630, _B0) -> {ok, {}};
unpack(cli, 17630, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17631, _B0) -> {ok, {}};
unpack(cli, 17631, _B0) ->
    {V1_can_worship, _B1} = protocol:uint8(_B0),
    {ok, {V1_can_worship}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

