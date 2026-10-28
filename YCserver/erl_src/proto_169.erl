-file("src/proto/proto_169.erl", 1).

-module(proto_169).

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

-file("src/proto/proto_169.erl", 14).

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

-file("src/proto/proto_169.erl", 15).

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

-file("src/proto/proto_169.erl", 16).

-file("inc/lottery.hrl", 1).

-record(lottery,
        {idx = 0 :: non_neg_integer(),
         ver = 2,
         idx_temp = 0 :: non_neg_integer(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         gold_type = 0 :: non_neg_integer(),
         gold_once = 1 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         times_now = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lucky_num = 0 :: non_neg_integer(),
         times_lottery = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         num_sum = 0 :: non_neg_integer(),
         hot = 0 :: non_neg_integer(),
         price = 0 :: non_neg_integer(),
         rare = 0 :: non_neg_integer(),
         sort = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         role_name = "" :: list(),
         history = [] :: list(),
         num_list = [] :: list(),
         id_data = 0 :: non_neg_integer(),
         left_list = [] :: list(),
         buy_list = [] :: list(),
         history_deal = [] :: list()}).

-record(lottery_history,
        {time = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         count = 0 :: non_neg_integer()}).

-record(lottery_mail,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         title = "" :: list(),
         content = "" :: list(),
         item_list = "" :: list(),
         time = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(lottery_reward_log,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         times_buy = 0 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-file("src/proto/proto_169.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16900, {V0_type, V0_time}) ->
    D_a_t_a = <<V0_type:32/little, V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16900:16/little,
       D_a_t_a/binary>>};
pack(srv, 16900,
     {V0_type,
      V0_time,
      V0_lottery,
      V0_my_list,
      V0_history_list,
      V0_times_all,
      V0_focus_list,
      V0_time_list}) ->
    D_a_t_a = <<V0_type:32/little, V0_time:32/little,
                (length(V0_lottery)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_idx))/binary,
                                   V1_pos:8/little, V1_item_idx:32/little,
                                   V1_item_id:32/little,
                                   V1_item_count:32/little,
                                   V1_times_sum:32/little,
                                   V1_times_now:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_times_lottery:32/little,
                                   V1_gold_type:32/little,
                                   V1_gold_once:16/little, V1_state:8/little,
                                   V1_time:32/little, V1_lucky_num:32/little,
                                   V1_hot:8/little, V1_price:32/little,
                                   V1_rare:8/little, V1_sort:8/little>>
                                 || #lottery{idx = V1_idx, pos = V1_pos,
                                             item_idx = V1_item_idx,
                                             item_id = V1_item_id,
                                             item_count = V1_item_count,
                                             times_sum = V1_times_sum,
                                             times_now = V1_times_now,
                                             role_id =
                                                 {V1_rid,
                                                  V1_platform,
                                                  V1_zone_id},
                                             role_name = V1_role_name,
                                             times_lottery = V1_times_lottery,
                                             gold_type = V1_gold_type,
                                             gold_once = V1_gold_once,
                                             state = V1_state, time = V1_time,
                                             lucky_num = V1_lucky_num,
                                             hot = V1_hot, price = V1_price,
                                             rare = V1_rare, sort = V1_sort}
                                        <- V0_lottery]))/binary,
                (length(V0_my_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_idx))/binary,
                                   V1_times_my:32/little>>
                                 || {V1_idx, V1_times_my}
                                        <- V0_my_list]))/binary,
                (length(V0_history_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_idx))/binary,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_item_idx:32/little, V1_item_id:32/little,
                                   V1_item_count:16/little,
                                   V1_times_buy:32/little,
                                   V1_times_sum:32/little, V1_time:32/little>>
                                 || #lottery_reward_log{idx = V1_idx,
                                                        role_name =
                                                            V1_role_name,
                                                        item_idx = V1_item_idx,
                                                        item_id = V1_item_id,
                                                        item_count =
                                                            V1_item_count,
                                                        times_buy =
                                                            V1_times_buy,
                                                        times_sum =
                                                            V1_times_sum,
                                                        time = V1_time}
                                        <- V0_history_list]))/binary,
                V0_times_all:32/little,
                (length(V0_focus_list)):16/little,
                (list_to_binary([<<V1_focus_id:32/little>>
                                 || V1_focus_id <- V0_focus_list]))/binary,
                (length(V0_time_list)):16/little,
                (list_to_binary([<<V1_hour_start:8/little,
                                   V1_min_start:8/little, V1_hour_end:8/little,
                                   V1_min_end:8/little>>
                                 || {V1_hour_start,
                                     V1_min_start,
                                     V1_hour_end,
                                     V1_min_end}
                                        <- V0_time_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16900:16/little,
       D_a_t_a/binary>>};
pack(cli, 16901, {V0_page_now}) ->
    D_a_t_a = <<V0_page_now:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16901:16/little,
       D_a_t_a/binary>>};
pack(srv, 16901,
     {V0_lottery, V0_my_list, V0_page_sum, V0_page_now}) ->
    D_a_t_a = <<(length(V0_lottery)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_idx))/binary,
                                   V1_pos:8/little, V1_item_idx:32/little,
                                   V1_item_id:32/little,
                                   V1_item_count:32/little,
                                   V1_times_sum:32/little,
                                   V1_times_now:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_times_lottery:32/little,
                                   V1_gold_type:32/little,
                                   V1_gold_once:16/little, V1_state:8/little,
                                   V1_time:32/little, V1_lucky_num:32/little,
                                   V1_hot:8/little, V1_price:32/little,
                                   V1_rare:8/little, V1_sort:8/little>>
                                 || #lottery{idx = V1_idx, pos = V1_pos,
                                             item_idx = V1_item_idx,
                                             item_id = V1_item_id,
                                             item_count = V1_item_count,
                                             times_sum = V1_times_sum,
                                             times_now = V1_times_now,
                                             role_id =
                                                 {V1_rid,
                                                  V1_platform,
                                                  V1_zone_id},
                                             role_name = V1_role_name,
                                             times_lottery = V1_times_lottery,
                                             gold_type = V1_gold_type,
                                             gold_once = V1_gold_once,
                                             state = V1_state, time = V1_time,
                                             lucky_num = V1_lucky_num,
                                             hot = V1_hot, price = V1_price,
                                             rare = V1_rare, sort = V1_sort}
                                        <- V0_lottery]))/binary,
                (length(V0_my_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_idx))/binary,
                                   V1_times_my:32/little>>
                                 || {V1_idx, V1_times_my}
                                        <- V0_my_list]))/binary,
                V0_page_sum:16/little, V0_page_now:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16901:16/little,
       D_a_t_a/binary>>};
pack(cli, 16902,
     {V0_idx, V0_item_idx, V0_count, V0_all}) ->
    D_a_t_a = <<(protocol:pack(string, V0_idx))/binary,
                V0_item_idx:32/little, V0_count:16/little,
                V0_all:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16902:16/little,
       D_a_t_a/binary>>};
pack(srv, 16902,
     {#lottery{idx = V0_idx, pos = V0_pos,
               item_idx = V0_item_idx, item_id = V0_item_id,
               item_count = V0_item_count, times_sum = V0_times_sum,
               times_now = V0_times_now,
               role_id = {V0_rid, V0_platform, V0_zone_id},
               role_name = V0_role_name,
               times_lottery = V0_times_lottery,
               gold_type = V0_gold_type, gold_once = V0_gold_once,
               state = V0_state, time = V0_time,
               lucky_num = V0_lucky_num, hot = V0_hot,
               price = V0_price, rare = V0_rare, sort = V0_sort},
      V0_times_my,
      V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_idx))/binary,
                V0_pos:8/little, V0_item_idx:32/little,
                V0_item_id:32/little, V0_item_count:32/little,
                V0_times_sum:32/little, V0_times_now:32/little,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_role_name))/binary,
                V0_times_lottery:32/little, V0_gold_type:32/little,
                V0_gold_once:16/little, V0_state:8/little,
                V0_time:32/little, V0_lucky_num:32/little,
                V0_hot:8/little, V0_price:32/little, V0_rare:8/little,
                V0_sort:8/little, V0_times_my:32/little,
                V0_msg:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16902:16/little,
       D_a_t_a/binary>>};
pack(cli, 16903, {V0_idx}) ->
    D_a_t_a = <<(protocol:pack(string, V0_idx))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16903:16/little,
       D_a_t_a/binary>>};
pack(srv, 16903,
     {#lottery{idx = V0_idx, pos = V0_pos,
               item_idx = V0_item_idx, item_id = V0_item_id,
               item_count = V0_item_count, times_sum = V0_times_sum,
               times_now = V0_times_now,
               role_id = {V0_rid, V0_platform, V0_zone_id},
               role_name = V0_role_name,
               times_lottery = V0_times_lottery,
               gold_type = V0_gold_type, gold_once = V0_gold_once,
               state = V0_state, time = V0_time,
               lucky_num = V0_lucky_num, hot = V0_hot,
               price = V0_price, rare = V0_rare, sort = V0_sort},
      V0_times_my,
      V0_num_sum,
      V0_history_list,
      V0_page_sum,
      V0_page_now,
      V0_num_list}) ->
    D_a_t_a = <<(protocol:pack(string, V0_idx))/binary,
                V0_pos:8/little, V0_item_idx:32/little,
                V0_item_id:32/little, V0_item_count:32/little,
                V0_times_sum:32/little, V0_times_now:32/little,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_role_name))/binary,
                V0_times_lottery:32/little, V0_gold_type:32/little,
                V0_gold_once:16/little, V0_state:8/little,
                V0_time:32/little, V0_lucky_num:32/little,
                V0_hot:8/little, V0_price:32/little, V0_rare:8/little,
                V0_sort:8/little, V0_times_my:32/little,
                V0_num_sum:32/little,
                (length(V0_history_list)):16/little,
                (list_to_binary([<<V1_time:32/little, V1_num:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_item_id:32/little, V1_count:16/little>>
                                 || #lottery_history{time = V1_time,
                                                     num = V1_num,
                                                     role_name = V1_role_name,
                                                     item_id = V1_item_id,
                                                     count = V1_count}
                                        <- V0_history_list]))/binary,
                V0_page_sum:16/little, V0_page_now:16/little,
                (length(V0_num_list)):16/little,
                (list_to_binary([<<V1_num:32/little>>
                                 || V1_num <- V0_num_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16903:16/little,
       D_a_t_a/binary>>};
pack(cli, 16904, {}) ->
    {ok, <<2:32/little, 16904:16/little>>};
pack(srv, 16904,
     {V0_state, V0_time_start, V0_time_end}) ->
    D_a_t_a = <<V0_state:8/little, V0_time_start:32/little,
                V0_time_end:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16904:16/little,
       D_a_t_a/binary>>};
pack(cli, 16906, {V0_idx, V0_page_now}) ->
    D_a_t_a = <<(protocol:pack(string, V0_idx))/binary,
                V0_page_now:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16906:16/little,
       D_a_t_a/binary>>};
pack(srv, 16906,
     {V0_idx, V0_page_sum, V0_page_now, V0_num_list}) ->
    D_a_t_a = <<(protocol:pack(string, V0_idx))/binary,
                V0_page_sum:16/little, V0_page_now:16/little,
                (length(V0_num_list)):16/little,
                (list_to_binary([<<V1_num:32/little>>
                                 || V1_num <- V0_num_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16906:16/little,
       D_a_t_a/binary>>};
pack(cli, 16907, {V0_page_now}) ->
    D_a_t_a = <<V0_page_now:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16907:16/little,
       D_a_t_a/binary>>};
pack(srv, 16907,
     {V0_page_sum, V0_page_now, V0_lottery}) ->
    D_a_t_a = <<V0_page_sum:16/little,
                V0_page_now:16/little, (length(V0_lottery)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_idx))/binary,
                                   V1_pos:8/little, V1_item_idx:32/little,
                                   V1_item_id:32/little,
                                   V1_item_count:32/little,
                                   V1_times_sum:32/little,
                                   V1_times_now:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_times_lottery:32/little,
                                   V1_gold_type:32/little,
                                   V1_gold_once:16/little, V1_state:8/little,
                                   V1_time:32/little, V1_lucky_num:32/little,
                                   V1_hot:8/little, V1_price:32/little,
                                   V1_rare:8/little, V1_sort:8/little>>
                                 || #lottery{idx = V1_idx, pos = V1_pos,
                                             item_idx = V1_item_idx,
                                             item_id = V1_item_id,
                                             item_count = V1_item_count,
                                             times_sum = V1_times_sum,
                                             times_now = V1_times_now,
                                             role_id =
                                                 {V1_rid,
                                                  V1_platform,
                                                  V1_zone_id},
                                             role_name = V1_role_name,
                                             times_lottery = V1_times_lottery,
                                             gold_type = V1_gold_type,
                                             gold_once = V1_gold_once,
                                             state = V1_state, time = V1_time,
                                             lucky_num = V1_lucky_num,
                                             hot = V1_hot, price = V1_price,
                                             rare = V1_rare, sort = V1_sort}
                                        <- V0_lottery]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16907:16/little,
       D_a_t_a/binary>>};
pack(cli, 16908, {V0_idx}) ->
    D_a_t_a = <<(protocol:pack(string, V0_idx))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16908:16/little,
       D_a_t_a/binary>>};
pack(srv, 16908,
     {V0_idx, V0_item_idx, V0_flag, V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_idx))/binary,
                V0_item_idx:32/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16908:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16900, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_time}};
unpack(cli, 16900, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {V1_lottery, _B26} = protocol:array(_B2,
                                        fun (_B3) ->
                                                {V2_idx, _B4} =
                                                    protocol:string(_B3),
                                                {V2_pos, _B5} =
                                                    protocol:uint8(_B4),
                                                {V2_item_idx, _B6} =
                                                    protocol:uint32(_B5),
                                                {V2_item_id, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_item_count, _B8} =
                                                    protocol:uint32(_B7),
                                                {V2_times_sum, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_times_now, _B10} =
                                                    protocol:uint32(_B9),
                                                {V2_rid, _B11} =
                                                    protocol:uint32(_B10),
                                                {V2_platform, _B12} =
                                                    protocol:string(_B11),
                                                {V2_zone_id, _B13} =
                                                    protocol:uint32(_B12),
                                                {V2_role_name, _B14} =
                                                    protocol:string(_B13),
                                                {V2_times_lottery, _B15} =
                                                    protocol:uint32(_B14),
                                                {V2_gold_type, _B16} =
                                                    protocol:uint32(_B15),
                                                {V2_gold_once, _B17} =
                                                    protocol:uint16(_B16),
                                                {V2_state, _B18} =
                                                    protocol:uint8(_B17),
                                                {V2_time, _B19} =
                                                    protocol:uint32(_B18),
                                                {V2_lucky_num, _B20} =
                                                    protocol:uint32(_B19),
                                                {V2_hot, _B21} =
                                                    protocol:uint8(_B20),
                                                {V2_price, _B22} =
                                                    protocol:uint32(_B21),
                                                {V2_rare, _B23} =
                                                    protocol:uint8(_B22),
                                                {V2_sort, _B24} =
                                                    protocol:uint8(_B23),
                                                {{V2_idx,
                                                  V2_pos,
                                                  V2_item_idx,
                                                  V2_item_id,
                                                  V2_item_count,
                                                  V2_times_sum,
                                                  V2_times_now,
                                                  V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_role_name,
                                                  V2_times_lottery,
                                                  V2_gold_type,
                                                  V2_gold_once,
                                                  V2_state,
                                                  V2_time,
                                                  V2_lucky_num,
                                                  V2_hot,
                                                  V2_price,
                                                  V2_rare,
                                                  V2_sort},
                                                 _B24}
                                        end),
    {V1_my_list, _B31} = protocol:array(_B26,
                                        fun (_B27) ->
                                                {V2_idx, _B28} =
                                                    protocol:string(_B27),
                                                {V2_times_my, _B29} =
                                                    protocol:uint32(_B28),
                                                {{V2_idx, V2_times_my}, _B29}
                                        end),
    {V1_history_list, _B42} = protocol:array(_B31,
                                             fun (_B32) ->
                                                     {V2_idx, _B33} =
                                                         protocol:string(_B32),
                                                     {V2_role_name, _B34} =
                                                         protocol:string(_B33),
                                                     {V2_item_idx, _B35} =
                                                         protocol:uint32(_B34),
                                                     {V2_item_id, _B36} =
                                                         protocol:uint32(_B35),
                                                     {V2_item_count, _B37} =
                                                         protocol:uint16(_B36),
                                                     {V2_times_buy, _B38} =
                                                         protocol:uint32(_B37),
                                                     {V2_times_sum, _B39} =
                                                         protocol:uint32(_B38),
                                                     {V2_time, _B40} =
                                                         protocol:uint32(_B39),
                                                     {{V2_idx,
                                                       V2_role_name,
                                                       V2_item_idx,
                                                       V2_item_id,
                                                       V2_item_count,
                                                       V2_times_buy,
                                                       V2_times_sum,
                                                       V2_time},
                                                      _B40}
                                             end),
    {V1_times_all, _B43} = protocol:uint32(_B42),
    {V1_focus_list, _B47} = protocol:array(_B43,
                                           fun (_B44) ->
                                                   {V2_focus_id, _B45} =
                                                       protocol:uint32(_B44),
                                                   {{V2_focus_id}, _B45}
                                           end),
    {V1_time_list, _B54} = protocol:array(_B47,
                                          fun (_B48) ->
                                                  {V2_hour_start, _B49} =
                                                      protocol:uint8(_B48),
                                                  {V2_min_start, _B50} =
                                                      protocol:uint8(_B49),
                                                  {V2_hour_end, _B51} =
                                                      protocol:uint8(_B50),
                                                  {V2_min_end, _B52} =
                                                      protocol:uint8(_B51),
                                                  {{V2_hour_start,
                                                    V2_min_start,
                                                    V2_hour_end,
                                                    V2_min_end},
                                                   _B52}
                                          end),
    {ok,
     {V1_type,
      V1_time,
      V1_lottery,
      V1_my_list,
      V1_history_list,
      V1_times_all,
      V1_focus_list,
      V1_time_list}};
unpack(srv, 16901, _B0) ->
    {V1_page_now, _B1} = protocol:uint16(_B0),
    {ok, {V1_page_now}};
unpack(cli, 16901, _B0) ->
    {V1_lottery, _B24} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_idx, _B2} =
                                                    protocol:string(_B1),
                                                {V2_pos, _B3} =
                                                    protocol:uint8(_B2),
                                                {V2_item_idx, _B4} =
                                                    protocol:uint32(_B3),
                                                {V2_item_id, _B5} =
                                                    protocol:uint32(_B4),
                                                {V2_item_count, _B6} =
                                                    protocol:uint32(_B5),
                                                {V2_times_sum, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_times_now, _B8} =
                                                    protocol:uint32(_B7),
                                                {V2_rid, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_platform, _B10} =
                                                    protocol:string(_B9),
                                                {V2_zone_id, _B11} =
                                                    protocol:uint32(_B10),
                                                {V2_role_name, _B12} =
                                                    protocol:string(_B11),
                                                {V2_times_lottery, _B13} =
                                                    protocol:uint32(_B12),
                                                {V2_gold_type, _B14} =
                                                    protocol:uint32(_B13),
                                                {V2_gold_once, _B15} =
                                                    protocol:uint16(_B14),
                                                {V2_state, _B16} =
                                                    protocol:uint8(_B15),
                                                {V2_time, _B17} =
                                                    protocol:uint32(_B16),
                                                {V2_lucky_num, _B18} =
                                                    protocol:uint32(_B17),
                                                {V2_hot, _B19} =
                                                    protocol:uint8(_B18),
                                                {V2_price, _B20} =
                                                    protocol:uint32(_B19),
                                                {V2_rare, _B21} =
                                                    protocol:uint8(_B20),
                                                {V2_sort, _B22} =
                                                    protocol:uint8(_B21),
                                                {{V2_idx,
                                                  V2_pos,
                                                  V2_item_idx,
                                                  V2_item_id,
                                                  V2_item_count,
                                                  V2_times_sum,
                                                  V2_times_now,
                                                  V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_role_name,
                                                  V2_times_lottery,
                                                  V2_gold_type,
                                                  V2_gold_once,
                                                  V2_state,
                                                  V2_time,
                                                  V2_lucky_num,
                                                  V2_hot,
                                                  V2_price,
                                                  V2_rare,
                                                  V2_sort},
                                                 _B22}
                                        end),
    {V1_my_list, _B29} = protocol:array(_B24,
                                        fun (_B25) ->
                                                {V2_idx, _B26} =
                                                    protocol:string(_B25),
                                                {V2_times_my, _B27} =
                                                    protocol:uint32(_B26),
                                                {{V2_idx, V2_times_my}, _B27}
                                        end),
    {V1_page_sum, _B30} = protocol:uint16(_B29),
    {V1_page_now, _B31} = protocol:uint16(_B30),
    {ok,
     {V1_lottery, V1_my_list, V1_page_sum, V1_page_now}};
unpack(srv, 16902, _B0) ->
    {V1_idx, _B1} = protocol:string(_B0),
    {V1_item_idx, _B2} = protocol:uint32(_B1),
    {V1_count, _B3} = protocol:uint16(_B2),
    {V1_all, _B4} = protocol:uint8(_B3),
    {ok, {V1_idx, V1_item_idx, V1_count, V1_all}};
unpack(cli, 16902, _B0) ->
    {V1_idx, _B1} = protocol:string(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {V1_item_idx, _B3} = protocol:uint32(_B2),
    {V1_item_id, _B4} = protocol:uint32(_B3),
    {V1_item_count, _B5} = protocol:uint32(_B4),
    {V1_times_sum, _B6} = protocol:uint32(_B5),
    {V1_times_now, _B7} = protocol:uint32(_B6),
    {V1_rid, _B8} = protocol:uint32(_B7),
    {V1_platform, _B9} = protocol:string(_B8),
    {V1_zone_id, _B10} = protocol:uint32(_B9),
    {V1_role_name, _B11} = protocol:string(_B10),
    {V1_times_lottery, _B12} = protocol:uint32(_B11),
    {V1_gold_type, _B13} = protocol:uint32(_B12),
    {V1_gold_once, _B14} = protocol:uint16(_B13),
    {V1_state, _B15} = protocol:uint8(_B14),
    {V1_time, _B16} = protocol:uint32(_B15),
    {V1_lucky_num, _B17} = protocol:uint32(_B16),
    {V1_hot, _B18} = protocol:uint8(_B17),
    {V1_price, _B19} = protocol:uint32(_B18),
    {V1_rare, _B20} = protocol:uint8(_B19),
    {V1_sort, _B21} = protocol:uint8(_B20),
    {V1_times_my, _B22} = protocol:uint32(_B21),
    {V1_msg, _B23} = protocol:uint8(_B22),
    {ok,
     {V1_idx,
      V1_pos,
      V1_item_idx,
      V1_item_id,
      V1_item_count,
      V1_times_sum,
      V1_times_now,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_role_name,
      V1_times_lottery,
      V1_gold_type,
      V1_gold_once,
      V1_state,
      V1_time,
      V1_lucky_num,
      V1_hot,
      V1_price,
      V1_rare,
      V1_sort,
      V1_times_my,
      V1_msg}};
unpack(srv, 16903, _B0) ->
    {V1_idx, _B1} = protocol:string(_B0),
    {ok, {V1_idx}};
unpack(cli, 16903, _B0) ->
    {V1_idx, _B1} = protocol:string(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {V1_item_idx, _B3} = protocol:uint32(_B2),
    {V1_item_id, _B4} = protocol:uint32(_B3),
    {V1_item_count, _B5} = protocol:uint32(_B4),
    {V1_times_sum, _B6} = protocol:uint32(_B5),
    {V1_times_now, _B7} = protocol:uint32(_B6),
    {V1_rid, _B8} = protocol:uint32(_B7),
    {V1_platform, _B9} = protocol:string(_B8),
    {V1_zone_id, _B10} = protocol:uint32(_B9),
    {V1_role_name, _B11} = protocol:string(_B10),
    {V1_times_lottery, _B12} = protocol:uint32(_B11),
    {V1_gold_type, _B13} = protocol:uint32(_B12),
    {V1_gold_once, _B14} = protocol:uint16(_B13),
    {V1_state, _B15} = protocol:uint8(_B14),
    {V1_time, _B16} = protocol:uint32(_B15),
    {V1_lucky_num, _B17} = protocol:uint32(_B16),
    {V1_hot, _B18} = protocol:uint8(_B17),
    {V1_price, _B19} = protocol:uint32(_B18),
    {V1_rare, _B20} = protocol:uint8(_B19),
    {V1_sort, _B21} = protocol:uint8(_B20),
    {V1_times_my, _B22} = protocol:uint32(_B21),
    {V1_num_sum, _B23} = protocol:uint32(_B22),
    {V1_history_list, _B31} = protocol:array(_B23,
                                             fun (_B24) ->
                                                     {V2_time, _B25} =
                                                         protocol:uint32(_B24),
                                                     {V2_num, _B26} =
                                                         protocol:uint32(_B25),
                                                     {V2_role_name, _B27} =
                                                         protocol:string(_B26),
                                                     {V2_item_id, _B28} =
                                                         protocol:uint32(_B27),
                                                     {V2_count, _B29} =
                                                         protocol:uint16(_B28),
                                                     {{V2_time,
                                                       V2_num,
                                                       V2_role_name,
                                                       V2_item_id,
                                                       V2_count},
                                                      _B29}
                                             end),
    {V1_page_sum, _B32} = protocol:uint16(_B31),
    {V1_page_now, _B33} = protocol:uint16(_B32),
    {V1_num_list, _B37} = protocol:array(_B33,
                                         fun (_B34) ->
                                                 {V2_num, _B35} =
                                                     protocol:uint32(_B34),
                                                 {{V2_num}, _B35}
                                         end),
    {ok,
     {V1_idx,
      V1_pos,
      V1_item_idx,
      V1_item_id,
      V1_item_count,
      V1_times_sum,
      V1_times_now,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_role_name,
      V1_times_lottery,
      V1_gold_type,
      V1_gold_once,
      V1_state,
      V1_time,
      V1_lucky_num,
      V1_hot,
      V1_price,
      V1_rare,
      V1_sort,
      V1_times_my,
      V1_num_sum,
      V1_history_list,
      V1_page_sum,
      V1_page_now,
      V1_num_list}};
unpack(srv, 16904, _B0) -> {ok, {}};
unpack(cli, 16904, _B0) ->
    {V1_state, _B1} = protocol:uint8(_B0),
    {V1_time_start, _B2} = protocol:uint32(_B1),
    {V1_time_end, _B3} = protocol:uint32(_B2),
    {ok, {V1_state, V1_time_start, V1_time_end}};
unpack(srv, 16906, _B0) ->
    {V1_idx, _B1} = protocol:string(_B0),
    {V1_page_now, _B2} = protocol:uint16(_B1),
    {ok, {V1_idx, V1_page_now}};
unpack(cli, 16906, _B0) ->
    {V1_idx, _B1} = protocol:string(_B0),
    {V1_page_sum, _B2} = protocol:uint16(_B1),
    {V1_page_now, _B3} = protocol:uint16(_B2),
    {V1_num_list, _B7} = protocol:array(_B3,
                                        fun (_B4) ->
                                                {V2_num, _B5} =
                                                    protocol:uint32(_B4),
                                                {{V2_num}, _B5}
                                        end),
    {ok, {V1_idx, V1_page_sum, V1_page_now, V1_num_list}};
unpack(srv, 16907, _B0) ->
    {V1_page_now, _B1} = protocol:uint16(_B0),
    {ok, {V1_page_now}};
unpack(cli, 16907, _B0) ->
    {V1_page_sum, _B1} = protocol:uint16(_B0),
    {V1_page_now, _B2} = protocol:uint16(_B1),
    {V1_lottery, _B26} = protocol:array(_B2,
                                        fun (_B3) ->
                                                {V2_idx, _B4} =
                                                    protocol:string(_B3),
                                                {V2_pos, _B5} =
                                                    protocol:uint8(_B4),
                                                {V2_item_idx, _B6} =
                                                    protocol:uint32(_B5),
                                                {V2_item_id, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_item_count, _B8} =
                                                    protocol:uint32(_B7),
                                                {V2_times_sum, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_times_now, _B10} =
                                                    protocol:uint32(_B9),
                                                {V2_rid, _B11} =
                                                    protocol:uint32(_B10),
                                                {V2_platform, _B12} =
                                                    protocol:string(_B11),
                                                {V2_zone_id, _B13} =
                                                    protocol:uint32(_B12),
                                                {V2_role_name, _B14} =
                                                    protocol:string(_B13),
                                                {V2_times_lottery, _B15} =
                                                    protocol:uint32(_B14),
                                                {V2_gold_type, _B16} =
                                                    protocol:uint32(_B15),
                                                {V2_gold_once, _B17} =
                                                    protocol:uint16(_B16),
                                                {V2_state, _B18} =
                                                    protocol:uint8(_B17),
                                                {V2_time, _B19} =
                                                    protocol:uint32(_B18),
                                                {V2_lucky_num, _B20} =
                                                    protocol:uint32(_B19),
                                                {V2_hot, _B21} =
                                                    protocol:uint8(_B20),
                                                {V2_price, _B22} =
                                                    protocol:uint32(_B21),
                                                {V2_rare, _B23} =
                                                    protocol:uint8(_B22),
                                                {V2_sort, _B24} =
                                                    protocol:uint8(_B23),
                                                {{V2_idx,
                                                  V2_pos,
                                                  V2_item_idx,
                                                  V2_item_id,
                                                  V2_item_count,
                                                  V2_times_sum,
                                                  V2_times_now,
                                                  V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_role_name,
                                                  V2_times_lottery,
                                                  V2_gold_type,
                                                  V2_gold_once,
                                                  V2_state,
                                                  V2_time,
                                                  V2_lucky_num,
                                                  V2_hot,
                                                  V2_price,
                                                  V2_rare,
                                                  V2_sort},
                                                 _B24}
                                        end),
    {ok, {V1_page_sum, V1_page_now, V1_lottery}};
unpack(srv, 16908, _B0) ->
    {V1_idx, _B1} = protocol:string(_B0),
    {ok, {V1_idx}};
unpack(cli, 16908, _B0) ->
    {V1_idx, _B1} = protocol:string(_B0),
    {V1_item_idx, _B2} = protocol:uint32(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_idx, V1_item_idx, V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

