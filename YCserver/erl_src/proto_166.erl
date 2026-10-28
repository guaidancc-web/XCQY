-file("src/proto/proto_166.erl", 1).

-module(proto_166).

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

-file("src/proto/proto_166.erl", 14).

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

-file("src/proto/proto_166.erl", 15).

-file("inc/strategy.hrl", 1).

-record(title,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         content = "" :: list(),
         type = 1 :: non_neg_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         role_name = "" :: list(),
         account = "" :: list(),
         gm = 0 :: 0..1,
         state = 0 :: non_neg_integer(),
         comment_num = 0 :: non_neg_integer(),
         like_num = 0 :: non_neg_integer(),
         time = 0 :: term(),
         answer = 0 :: 0..1,
         order = 0 :: non_neg_integer(),
         question = [] :: list(),
         reward = [] :: list()}).

-record(collect,
        {role_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         list = [] :: list()}).

-record(answer,
        {id = 0 :: pos_integer(),
         name = "" :: list(),
         list = [] :: [{num, content}],
         correct = 0 :: pos_integer()}).

-file("src/proto/proto_166.erl", 16).

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

-file("src/proto/proto_166.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16600,
     {V0_order_type, V0_type, V0_page, V0_len}) ->
    D_a_t_a = <<V0_order_type:8/little, V0_type:8/little,
                V0_page:8/little, V0_len:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16600:16/little,
       D_a_t_a/binary>>};
pack(srv, 16600,
     {V0_order, V0_type, V0_page, V0_page_total, V0_list}) ->
    D_a_t_a = <<V0_order:8/little, V0_type:8/little,
                V0_page:8/little, V0_page_total:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_state:8/little, V1_comment_num:16/little,
                                   V1_like_num:16/little, V1_time:32/little,
                                   V1_order:32/little>>
                                 || #title{id = V1_id, name = V1_name,
                                           role_id =
                                               {V1_role_id,
                                                V1_platform,
                                                V1_zone_id},
                                           role_name = V1_role_name,
                                           state = V1_state,
                                           comment_num = V1_comment_num,
                                           like_num = V1_like_num,
                                           time = V1_time, order = V1_order}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16600:16/little,
       D_a_t_a/binary>>};
pack(cli, 16602,
     {V0_type, V0_title, V0_content, V0_local_id}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_title))/binary,
                (protocol:pack(string, V0_content))/binary,
                V0_local_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16602:16/little,
       D_a_t_a/binary>>};
pack(srv, 16602, {V0_result, V0_msg, V0_local_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_local_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16602:16/little,
       D_a_t_a/binary>>};
pack(cli, 16603,
     {V0_type, V0_order_type, V0_page, V0_count}) ->
    D_a_t_a = <<V0_type:8/little, V0_order_type:8/little,
                V0_page:8/little, V0_count:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16603:16/little,
       D_a_t_a/binary>>};
pack(srv, 16603,
     {V0_order, V0_type, V0_page, V0_page_total, V0_list}) ->
    D_a_t_a = <<V0_order:8/little, V0_type:8/little,
                V0_page:8/little, V0_page_total:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_gm:8/little, V1_comment_num:16/little,
                                   V1_like_num:16/little, V1_time:32/little,
                                   V1_order:32/little>>
                                 || #title{id = V1_id, name = V1_name,
                                           role_id =
                                               {V1_rid,
                                                V1_platform,
                                                V1_zone_id},
                                           role_name = V1_role_name, gm = V1_gm,
                                           comment_num = V1_comment_num,
                                           like_num = V1_like_num,
                                           time = V1_time, order = V1_order}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16603:16/little,
       D_a_t_a/binary>>};
pack(cli, 16604, {V0_title_id, V0_type}) ->
    D_a_t_a = <<V0_title_id:32/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16604:16/little,
       D_a_t_a/binary>>};
pack(srv, 16604,
     {#title{id = V0_id, name = V0_name,
             role_id = {V0_role_id, V0_platform, V0_zone_id},
             role_name = V0_role_name, content = V0_content,
             comment_num = V0_comment_num, like_num = V0_like_num,
             gm = V0_gm, answer = V0_answer, time = V0_time},
      V0_reward,
      V0_like,
      V0_type}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_role_name))/binary,
                (protocol:pack(string, V0_content))/binary,
                V0_comment_num:16/little, V0_like_num:16/little,
                V0_gm:8/little, V0_answer:8/little, V0_time:32/little,
                V0_reward:8/little, V0_like:8/little,
                V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16604:16/little,
       D_a_t_a/binary>>};
pack(cli, 16605, {V0_title_id}) ->
    D_a_t_a = <<V0_title_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16605:16/little,
       D_a_t_a/binary>>};
pack(srv, 16605, {V0_title_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_title_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16605:16/little,
       D_a_t_a/binary>>};
pack(cli, 16606, {V0_title_id}) ->
    D_a_t_a = <<V0_title_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16606:16/little,
       D_a_t_a/binary>>};
pack(srv, 16606, {V0_title_id, V0_answer}) ->
    D_a_t_a = <<V0_title_id:32/little,
                (length(V0_answer)):16/little,
                (list_to_binary([<<V1_id:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (length(V1_list)):16/little,
                                   (list_to_binary([<<V2_question_num:8/little,
                                                      (protocol:pack(string,
                                                                     V2_question_name))/binary>>
                                                    || {V2_question_num,
                                                        V2_question_name}
                                                           <- V1_list]))/binary,
                                   V1_correct:8/little>>
                                 || #answer{id = V1_id, name = V1_name,
                                            list = V1_list,
                                            correct = V1_correct}
                                        <- V0_answer]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16606:16/little,
       D_a_t_a/binary>>};
pack(cli, 16607, {V0_title_id}) ->
    D_a_t_a = <<V0_title_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16607:16/little,
       D_a_t_a/binary>>};
pack(srv, 16607, {V0_title_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_title_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16607:16/little,
       D_a_t_a/binary>>};
pack(cli, 16608,
     {V0_title_id,
      V0_type,
      V0_title,
      V0_content,
      V0_local_id}) ->
    D_a_t_a = <<V0_title_id:32/little, V0_type:8/little,
                (protocol:pack(string, V0_title))/binary,
                (protocol:pack(string, V0_content))/binary,
                V0_local_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16608:16/little,
       D_a_t_a/binary>>};
pack(srv, 16608, {V0_result, V0_msg, V0_local_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_local_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16608:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16600, _B0) ->
    {V1_order_type, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_page, _B3} = protocol:uint8(_B2),
    {V1_len, _B4} = protocol:uint8(_B3),
    {ok, {V1_order_type, V1_type, V1_page, V1_len}};
unpack(cli, 16600, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_page, _B3} = protocol:uint8(_B2),
    {V1_page_total, _B4} = protocol:uint8(_B3),
    {V1_list, _B18} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_role_id, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_platform, _B9} =
                                                 protocol:string(_B8),
                                             {V2_zone_id, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_role_name, _B11} =
                                                 protocol:string(_B10),
                                             {V2_state, _B12} =
                                                 protocol:uint8(_B11),
                                             {V2_comment_num, _B13} =
                                                 protocol:uint16(_B12),
                                             {V2_like_num, _B14} =
                                                 protocol:uint16(_B13),
                                             {V2_time, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_order, _B16} =
                                                 protocol:uint32(_B15),
                                             {{V2_id,
                                               V2_name,
                                               V2_role_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_role_name,
                                               V2_state,
                                               V2_comment_num,
                                               V2_like_num,
                                               V2_time,
                                               V2_order},
                                              _B16}
                                     end),
    {ok,
     {V1_order, V1_type, V1_page, V1_page_total, V1_list}};
unpack(srv, 16602, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_title, _B2} = protocol:string(_B1),
    {V1_content, _B3} = protocol:string(_B2),
    {V1_local_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_type, V1_title, V1_content, V1_local_id}};
unpack(cli, 16602, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_local_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_local_id}};
unpack(srv, 16603, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_order_type, _B2} = protocol:uint8(_B1),
    {V1_page, _B3} = protocol:uint8(_B2),
    {V1_count, _B4} = protocol:uint8(_B3),
    {ok, {V1_type, V1_order_type, V1_page, V1_count}};
unpack(cli, 16603, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_page, _B3} = protocol:uint8(_B2),
    {V1_page_total, _B4} = protocol:uint8(_B3),
    {V1_list, _B18} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_rid, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_platform, _B9} =
                                                 protocol:string(_B8),
                                             {V2_zone_id, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_role_name, _B11} =
                                                 protocol:string(_B10),
                                             {V2_gm, _B12} =
                                                 protocol:uint8(_B11),
                                             {V2_comment_num, _B13} =
                                                 protocol:uint16(_B12),
                                             {V2_like_num, _B14} =
                                                 protocol:uint16(_B13),
                                             {V2_time, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_order, _B16} =
                                                 protocol:uint32(_B15),
                                             {{V2_id,
                                               V2_name,
                                               V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_role_name,
                                               V2_gm,
                                               V2_comment_num,
                                               V2_like_num,
                                               V2_time,
                                               V2_order},
                                              _B16}
                                     end),
    {ok,
     {V1_order, V1_type, V1_page, V1_page_total, V1_list}};
unpack(srv, 16604, _B0) ->
    {V1_title_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_title_id, V1_type}};
unpack(cli, 16604, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_role_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint32(_B4),
    {V1_role_name, _B6} = protocol:string(_B5),
    {V1_content, _B7} = protocol:string(_B6),
    {V1_comment_num, _B8} = protocol:uint16(_B7),
    {V1_like_num, _B9} = protocol:uint16(_B8),
    {V1_gm, _B10} = protocol:uint8(_B9),
    {V1_answer, _B11} = protocol:uint8(_B10),
    {V1_time, _B12} = protocol:uint32(_B11),
    {V1_reward, _B13} = protocol:uint8(_B12),
    {V1_like, _B14} = protocol:uint8(_B13),
    {V1_type, _B15} = protocol:uint8(_B14),
    {ok,
     {V1_id,
      V1_name,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_role_name,
      V1_content,
      V1_comment_num,
      V1_like_num,
      V1_gm,
      V1_answer,
      V1_time,
      V1_reward,
      V1_like,
      V1_type}};
unpack(srv, 16605, _B0) ->
    {V1_title_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_title_id}};
unpack(cli, 16605, _B0) ->
    {V1_title_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_title_id, V1_result, V1_msg}};
unpack(srv, 16606, _B0) ->
    {V1_title_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_title_id}};
unpack(cli, 16606, _B0) ->
    {V1_title_id, _B1} = protocol:uint32(_B0),
    {V1_answer, _B12} = protocol:array(_B1,
                                       fun (_B2) ->
                                               {V2_id, _B3} =
                                                   protocol:uint8(_B2),
                                               {V2_name, _B4} =
                                                   protocol:string(_B3),
                                               {V2_list, _B9} =
                                                   protocol:array(_B4,
                                                                  fun (_B5) ->
                                                                          {V3_question_num,
                                                                           _B6} =
                                                                              protocol:uint8(_B5),
                                                                          {V3_question_name,
                                                                           _B7} =
                                                                              protocol:string(_B6),
                                                                          {{V3_question_num,
                                                                            V3_question_name},
                                                                           _B7}
                                                                  end),
                                               {V2_correct, _B10} =
                                                   protocol:uint8(_B9),
                                               {{V2_id,
                                                 V2_name,
                                                 V2_list,
                                                 V2_correct},
                                                _B10}
                                       end),
    {ok, {V1_title_id, V1_answer}};
unpack(srv, 16607, _B0) ->
    {V1_title_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_title_id}};
unpack(cli, 16607, _B0) ->
    {V1_title_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_title_id, V1_result, V1_msg}};
unpack(srv, 16608, _B0) ->
    {V1_title_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_title, _B3} = protocol:string(_B2),
    {V1_content, _B4} = protocol:string(_B3),
    {V1_local_id, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_title_id,
      V1_type,
      V1_title,
      V1_content,
      V1_local_id}};
unpack(cli, 16608, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_local_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_local_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

