-file("src/proto/proto_177.erl", 1).

-module(proto_177).

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

-file("src/proto/proto_177.erl", 14).

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

-file("src/proto/proto_177.erl", 15).

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

-file("src/proto/proto_177.erl", 16).

-file("inc/sworn.hrl", 1).

-record(m_sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         time = 0 :: list()}).

-record(sworn_role,
        {ver = 0 :: pos_integer(),
         role_id = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         status = 0 :: non_neg_integer()}).

-record(sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         time = 0 :: non_neg_integer(),
         sworn_val = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         head = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         members = [] :: list(),
         votes = [] :: list(),
         trends = [] :: list(),
         lists = [] :: list()}).

-record(sworn_member,
        {ver = 0 :: pos_integer(),
         pos = 0 :: non_neg_integer(),
         role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         name_defined = "" :: string(),
         lev = 0 :: pos_integer(),
         classes = 0 :: pos_integer(),
         sex = 0 :: pos_integer(),
         times = 0 :: pos_integer(),
         free = 0 :: pos_integer()}).

-record(sworn_trend,
        {type = 0 :: non_neg_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         r_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         r_name = "" :: string(),
         r_lev = 0 :: non_neg_integer(),
         r_sex = 0 :: non_neg_integer(),
         r_classes = 0 :: non_neg_integer(),
         rename = "" :: string(),
         timeout = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         reason_id = 0 :: non_neg_integer(),
         reason_msg = "" :: string(),
         votes = [] :: list(),
         agree = 0 :: non_neg_integer(),
         lists = [] :: list()}).

-record(sworn_evt,
        {role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         finish = 0 :: non_neg_integer(),
         skill = 0 :: non_neg_integer(),
         invite = 0 :: non_neg_integer(),
         prefix = 0 :: non_neg_integer(),
         personal = 0 :: non_neg_integer()}).

-file("src/proto/proto_177.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17700, {}) ->
    {ok, <<2:32/little, 17700:16/little>>};
pack(srv, 17700,
     {#sworn{name = V0_name, sworn_val = V0_sworn_val,
             num = V0_num, head = V0_head, status = V0_status,
             time = V0_time, timeout = V0_timeout, pos = V0_pos,
             times = V0_times, members = V0_members,
             votes = V0_votes, trends = V0_trends}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                V0_sworn_val:32/little, V0_num:8/little,
                V0_head:32/little, V0_status:8/little,
                V0_time:32/little, V0_timeout:32/little,
                V0_pos:8/little, V0_times:8/little,
                (length(V0_members)):16/little,
                (list_to_binary([<<V1_pos:8/little, V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string,
                                                  V1_name_defined))/binary,
                                   V1_lev:16/little, V1_classes:16/little,
                                   V1_sex:8/little, V1_times:8/little,
                                   V1_free:8/little>>
                                 || #sworn_member{pos = V1_pos,
                                                  role_id =
                                                      {V1_m_id,
                                                       V1_m_platform,
                                                       V1_m_zone_id},
                                                  name = V1_name,
                                                  name_defined =
                                                      V1_name_defined,
                                                  lev = V1_lev,
                                                  classes = V1_classes,
                                                  sex = V1_sex,
                                                  times = V1_times,
                                                  free = V1_free}
                                        <- V0_members]))/binary,
                (length(V0_votes)):16/little,
                (list_to_binary([<<V1_v_id:32/little,
                                   (protocol:pack(string,
                                                  V1_v_platform))/binary,
                                   V1_v_zone_id:32/little>>
                                 || {V1_v_id, V1_v_platform, V1_v_zone_id}
                                        <- V0_votes]))/binary,
                (length(V0_trends)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_t_id:32/little,
                                   (protocol:pack(string,
                                                  V1_t_platform))/binary,
                                   V1_t_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_t_r_id:32/little,
                                   (protocol:pack(string,
                                                  V1_t_r_platform))/binary,
                                   V1_t_r_zone_id:32/little,
                                   (protocol:pack(string, V1_r_name))/binary,
                                   V1_r_lev:16/little, V1_r_sex:32/little,
                                   V1_r_classes:32/little,
                                   (protocol:pack(string, V1_rename))/binary,
                                   V1_timeout:32/little, V1_reason_id:32/little,
                                   (protocol:pack(string,
                                                  V1_reason_msg))/binary,
                                   (length(V1_votes)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      V2_flag:8/little>>
                                                    || {{V2_rid,
                                                         V2_platform,
                                                         V2_zone_id},
                                                        V2_flag}
                                                           <- V1_votes]))/binary>>
                                 || #sworn_trend{type = V1_type,
                                                 id =
                                                     {V1_t_id,
                                                      V1_t_platform,
                                                      V1_t_zone_id},
                                                 name = V1_name,
                                                 r_id =
                                                     {V1_t_r_id,
                                                      V1_t_r_platform,
                                                      V1_t_r_zone_id},
                                                 r_name = V1_r_name,
                                                 r_lev = V1_r_lev,
                                                 r_sex = V1_r_sex,
                                                 r_classes = V1_r_classes,
                                                 rename = V1_rename,
                                                 timeout = V1_timeout,
                                                 reason_id = V1_reason_id,
                                                 reason_msg = V1_reason_msg,
                                                 votes = V1_votes}
                                        <- V0_trends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17700:16/little,
       D_a_t_a/binary>>};
pack(cli, 17701,
     {V0_rid, V0_platform, V0_zone_id, V0_pos}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_pos:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17701:16/little,
       D_a_t_a/binary>>};
pack(srv, 17701, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17701:16/little,
       D_a_t_a/binary>>};
pack(cli, 17702, {V0_name_head, V0_name_tail}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_name_head))/binary,
                (protocol:pack(string, V0_name_tail))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17702:16/little,
       D_a_t_a/binary>>};
pack(srv, 17702, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17702:16/little,
       D_a_t_a/binary>>};
pack(cli, 17703, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17703:16/little,
       D_a_t_a/binary>>};
pack(srv, 17703, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17703:16/little,
       D_a_t_a/binary>>};
pack(cli, 17704, {}) ->
    {ok, <<2:32/little, 17704:16/little>>};
pack(srv, 17704, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17704:16/little,
       D_a_t_a/binary>>};
pack(cli, 17705, {V0_name_head, V0_name_tail}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_name_head))/binary,
                (protocol:pack(string, V0_name_tail))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17705:16/little,
       D_a_t_a/binary>>};
pack(srv, 17705, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17705:16/little,
       D_a_t_a/binary>>};
pack(cli, 17706, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17706:16/little,
       D_a_t_a/binary>>};
pack(srv, 17706, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17706:16/little,
       D_a_t_a/binary>>};
pack(cli, 17707, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17707:16/little,
       D_a_t_a/binary>>};
pack(srv, 17707, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17707:16/little,
       D_a_t_a/binary>>};
pack(cli, 17708, {}) ->
    {ok, <<2:32/little, 17708:16/little>>};
pack(srv, 17708, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17708:16/little,
       D_a_t_a/binary>>};
pack(cli, 17709,
     {V0_rid, V0_platform, V0_zone_id, V0_name}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17709:16/little,
       D_a_t_a/binary>>};
pack(srv, 17709, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17709:16/little,
       D_a_t_a/binary>>};
pack(cli, 17710,
     {V0_rid, V0_platform, V0_zone_id, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17710:16/little,
       D_a_t_a/binary>>};
pack(srv, 17710, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17710:16/little,
       D_a_t_a/binary>>};
pack(cli, 17711, {V0_photo}) ->
    D_a_t_a = <<(byte_size(V0_photo)):32/little,
                V0_photo/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17711:16/little,
       D_a_t_a/binary>>};
pack(srv, 17711, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17711:16/little,
       D_a_t_a/binary>>};
pack(cli, 17712, {}) ->
    {ok, <<2:32/little, 17712:16/little>>};
pack(srv, 17712, {V0_photo_bin, V0_auditing}) ->
    D_a_t_a = <<(byte_size(V0_photo_bin)):32/little,
                V0_photo_bin/binary, V0_auditing:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17712:16/little,
       D_a_t_a/binary>>};
pack(cli, 17713, {}) ->
    {ok, <<2:32/little, 17713:16/little>>};
pack(srv, 17713, {}) ->
    {ok, <<2:32/little, 17713:16/little>>};
pack(cli, 17714, {}) ->
    {ok, <<2:32/little, 17714:16/little>>};
pack(srv, 17714, {}) ->
    {ok, <<2:32/little, 17714:16/little>>};
pack(cli, 17715, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17715:16/little,
       D_a_t_a/binary>>};
pack(srv, 17715, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17715:16/little,
       D_a_t_a/binary>>};
pack(cli, 17716,
     {V0_type, V0_rid, V0_platform, V0_zone_id, V0_flag}) ->
    D_a_t_a = <<V0_type:8/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17716:16/little,
       D_a_t_a/binary>>};
pack(srv, 17716, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17716:16/little,
       D_a_t_a/binary>>};
pack(cli, 17717, {}) ->
    {ok, <<2:32/little, 17717:16/little>>};
pack(srv, 17717,
     {V0_rid,
      V0_platform,
      V0_zone_id,
      V0_sworn_name,
      V0_name}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_sworn_name))/binary,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17717:16/little,
       D_a_t_a/binary>>};
pack(cli, 17718,
     {V0_rid, V0_platform, V0_zone_id, V0_flag}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17718:16/little,
       D_a_t_a/binary>>};
pack(srv, 17718, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17718:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17700, _B0) -> {ok, {}};
unpack(cli, 17700, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_sworn_val, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {V1_head, _B4} = protocol:uint32(_B3),
    {V1_status, _B5} = protocol:uint8(_B4),
    {V1_time, _B6} = protocol:uint32(_B5),
    {V1_timeout, _B7} = protocol:uint32(_B6),
    {V1_pos, _B8} = protocol:uint8(_B7),
    {V1_times, _B9} = protocol:uint8(_B8),
    {V1_members, _B23} = protocol:array(_B9,
                                        fun (_B10) ->
                                                {V2_pos, _B11} =
                                                    protocol:uint8(_B10),
                                                {V2_m_id, _B12} =
                                                    protocol:uint32(_B11),
                                                {V2_m_platform, _B13} =
                                                    protocol:string(_B12),
                                                {V2_m_zone_id, _B14} =
                                                    protocol:uint32(_B13),
                                                {V2_name, _B15} =
                                                    protocol:string(_B14),
                                                {V2_name_defined, _B16} =
                                                    protocol:string(_B15),
                                                {V2_lev, _B17} =
                                                    protocol:uint16(_B16),
                                                {V2_classes, _B18} =
                                                    protocol:uint16(_B17),
                                                {V2_sex, _B19} =
                                                    protocol:uint8(_B18),
                                                {V2_times, _B20} =
                                                    protocol:uint8(_B19),
                                                {V2_free, _B21} =
                                                    protocol:uint8(_B20),
                                                {{V2_pos,
                                                  V2_m_id,
                                                  V2_m_platform,
                                                  V2_m_zone_id,
                                                  V2_name,
                                                  V2_name_defined,
                                                  V2_lev,
                                                  V2_classes,
                                                  V2_sex,
                                                  V2_times,
                                                  V2_free},
                                                 _B21}
                                        end),
    {V1_votes, _B29} = protocol:array(_B23,
                                      fun (_B24) ->
                                              {V2_v_id, _B25} =
                                                  protocol:uint32(_B24),
                                              {V2_v_platform, _B26} =
                                                  protocol:string(_B25),
                                              {V2_v_zone_id, _B27} =
                                                  protocol:uint32(_B26),
                                              {{V2_v_id,
                                                V2_v_platform,
                                                V2_v_zone_id},
                                               _B27}
                                      end),
    {V1_trends, _B55} = protocol:array(_B29,
                                       fun (_B30) ->
                                               {V2_type, _B31} =
                                                   protocol:uint8(_B30),
                                               {V2_t_id, _B32} =
                                                   protocol:uint32(_B31),
                                               {V2_t_platform, _B33} =
                                                   protocol:string(_B32),
                                               {V2_t_zone_id, _B34} =
                                                   protocol:uint32(_B33),
                                               {V2_name, _B35} =
                                                   protocol:string(_B34),
                                               {V2_t_r_id, _B36} =
                                                   protocol:uint32(_B35),
                                               {V2_t_r_platform, _B37} =
                                                   protocol:string(_B36),
                                               {V2_t_r_zone_id, _B38} =
                                                   protocol:uint32(_B37),
                                               {V2_r_name, _B39} =
                                                   protocol:string(_B38),
                                               {V2_r_lev, _B40} =
                                                   protocol:uint16(_B39),
                                               {V2_r_sex, _B41} =
                                                   protocol:uint32(_B40),
                                               {V2_r_classes, _B42} =
                                                   protocol:uint32(_B41),
                                               {V2_rename, _B43} =
                                                   protocol:string(_B42),
                                               {V2_timeout, _B44} =
                                                   protocol:uint32(_B43),
                                               {V2_reason_id, _B45} =
                                                   protocol:uint32(_B44),
                                               {V2_reason_msg, _B46} =
                                                   protocol:string(_B45),
                                               {V2_votes, _B53} =
                                                   protocol:array(_B46,
                                                                  fun (_B47) ->
                                                                          {V3_rid,
                                                                           _B48} =
                                                                              protocol:uint32(_B47),
                                                                          {V3_platform,
                                                                           _B49} =
                                                                              protocol:string(_B48),
                                                                          {V3_zone_id,
                                                                           _B50} =
                                                                              protocol:uint32(_B49),
                                                                          {V3_flag,
                                                                           _B51} =
                                                                              protocol:uint8(_B50),
                                                                          {{V3_rid,
                                                                            V3_platform,
                                                                            V3_zone_id,
                                                                            V3_flag},
                                                                           _B51}
                                                                  end),
                                               {{V2_type,
                                                 V2_t_id,
                                                 V2_t_platform,
                                                 V2_t_zone_id,
                                                 V2_name,
                                                 V2_t_r_id,
                                                 V2_t_r_platform,
                                                 V2_t_r_zone_id,
                                                 V2_r_name,
                                                 V2_r_lev,
                                                 V2_r_sex,
                                                 V2_r_classes,
                                                 V2_rename,
                                                 V2_timeout,
                                                 V2_reason_id,
                                                 V2_reason_msg,
                                                 V2_votes},
                                                _B53}
                                       end),
    {ok,
     {V1_name,
      V1_sworn_val,
      V1_num,
      V1_head,
      V1_status,
      V1_time,
      V1_timeout,
      V1_pos,
      V1_times,
      V1_members,
      V1_votes,
      V1_trends}};
unpack(srv, 17701, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_pos, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_pos}};
unpack(cli, 17701, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17702, _B0) ->
    {V1_name_head, _B1} = protocol:string(_B0),
    {V1_name_tail, _B2} = protocol:string(_B1),
    {ok, {V1_name_head, V1_name_tail}};
unpack(cli, 17702, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17703, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 17703, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17704, _B0) -> {ok, {}};
unpack(cli, 17704, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17705, _B0) ->
    {V1_name_head, _B1} = protocol:string(_B0),
    {V1_name_tail, _B2} = protocol:string(_B1),
    {ok, {V1_name_head, V1_name_tail}};
unpack(cli, 17705, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17706, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 17706, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17707, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 17707, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17708, _B0) -> {ok, {}};
unpack(cli, 17708, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17709, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_name}};
unpack(cli, 17709, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17710, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok,
     {V1_rid, V1_platform, V1_zone_id, V1_flag, V1_msg}};
unpack(cli, 17710, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17711, _B0) ->
    {V1_photo, _B1} = protocol:byte(_B0),
    {ok, {V1_photo}};
unpack(cli, 17711, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17712, _B0) -> {ok, {}};
unpack(cli, 17712, _B0) ->
    {V1_photo_bin, _B1} = protocol:byte(_B0),
    {V1_auditing, _B2} = protocol:uint8(_B1),
    {ok, {V1_photo_bin, V1_auditing}};
unpack(srv, 17713, _B0) -> {ok, {}};
unpack(cli, 17713, _B0) -> {ok, {}};
unpack(srv, 17714, _B0) -> {ok, {}};
unpack(cli, 17714, _B0) -> {ok, {}};
unpack(srv, 17715, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 17715, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17716, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_flag, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_type, V1_rid, V1_platform, V1_zone_id, V1_flag}};
unpack(cli, 17716, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17717, _B0) -> {ok, {}};
unpack(cli, 17717, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_sworn_name, _B4} = protocol:string(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_sworn_name,
      V1_name}};
unpack(srv, 17718, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_flag}};
unpack(cli, 17718, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

