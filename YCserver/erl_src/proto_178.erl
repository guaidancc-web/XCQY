-file("src/proto/proto_178.erl", 1).

-module(proto_178).

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

-file("src/proto/proto_178.erl", 14).

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

-file("src/proto/proto_178.erl", 15).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/proto/proto_178.erl", 16).

-file("inc/camp_halloween.hrl", 1).

-record(halloween_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         camp = 0,
         sex = 0,
         classes = 0,
         lev = 0,
         times = 0,
         times_cd = 0,
         die = 0,
         win = 0,
         score = 0,
         zone_id = 0,
         zone_pid,
         num = 0,
         pos,
         mtime = 0,
         escape_time = 0}).

-record(halloween_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         flag = 0}).

-record(halloween_rank_data,
        {min = 0,
         max = 0,
         win = 0,
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         title = "",
         content = ""}).

-record(halloween_reward_data,
        {min = 0,
         max = 0,
         win = 0,
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         pet_exp_mode = 0,
         pet_exp_radio = 0}).

-record(halloween_item_reward_data,
        {id = 0,
         type = 0,
         min_lev = 0,
         max_lev = 0,
         item_id = 0,
         num = 0,
         bind = 0,
         is_cast = 0,
         weigth = 0}).

-record(halloween_exp_reward_data,
        {type = 0,
         min = 0,
         max = 0,
         exp_mode = 0,
         exp_radio = 0,
         pet_exp_mode = 0,
         pet_exp_radio = 0}).

-file("src/proto/proto_178.erl", 17).

-file("inc/camp_series_recharge.hrl", 1).

-record(camp_series_recharge,
        {var = 1,
         day_time = 0,
         day_gold = 0,
         reward = [],
         day = 0,
         status = 0,
         first_time = 0,
         activity_time = 0}).

-file("src/proto/proto_178.erl", 18).

-file("inc/camp_whiteday.hrl", 1).

-record(camp_whiteday,
        {id = {0, "", 0},
         owner = {0, "", 0},
         role_id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         type = 0,
         reward = [],
         wish = "",
         flag = 0,
         timeout = 0,
         intimacy = 0}).

-record(camp_whiteday_index,
        {id = 0, role_id = {0, "", 0}}).

-file("src/proto/proto_178.erl", 19).

-file("inc/camp_misc.hrl", 1).

-record(camp_doll,
        {ver = 3,
         camp_id = 0,
         free_times = 0,
         lucky = 0,
         dolls = [],
         open_times = 0,
         logs = [],
         type1_times = 0,
         type2_times = 0,
         guarantee = []}).

-record(camp_doll_data,
        {pos = 0, open = 0, type = 0, reward = []}).

-record(camp_doll_item_data,
        {id = 1,
         type = 0,
         item_id = 20306,
         bind = 0,
         num = 1,
         odds = 100,
         is_cast = 1,
         lev_min = 1,
         lev_max = 100,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0,
         min_times = 0,
         max_times = 0,
         ring_times = 0}).

-file("src/proto/proto_178.erl", 20).

-file("inc/camp_animal_chess.hrl", 1).

-record(animal_chess,
        {id = 0,
         first_id = {0, "", 0},
         first_name = "",
         first_lev = 0,
         first_classes = 0,
         first_sex = 0,
         first_pid,
         first_looks = [],
         first_grade = 0,
         first_score = 0,
         second_id = {0, "", 0},
         second_name = "",
         second_lev = 0,
         second_classes = 0,
         second_sex = 0,
         second_pid,
         second_looks = [],
         second_grade = 0,
         second_score = 0,
         chesses = [],
         no_open = [],
         list = []}).

-record(animal_chess_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         looks = [],
         grade = 0,
         score = 0,
         time = 0}).

-record(animal_chess_pos,
        {pos = {0, 0},
         x = 0,
         y = 0,
         camp = 0,
         grade = 0,
         status = 0}).

-record(m_animal_chess,
        {grade = 1, score = 0, all_score = 0}).

-file("src/proto/proto_178.erl", 21).

-file("inc/campaign_rank.hrl", 1).

-record(campaign_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(campaign_rank_role,
        {key,
         id = {0, "", 0} :: term(),
         id2 = {0, "", 0} :: term(),
         sec_type = 0,
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         role_id2 = 0 :: non_neg_integer(),
         platform2 = "" :: list(),
         zone_id2 = 0 :: non_neg_integer(),
         name2 = "" :: list(),
         sex2 = 0 :: 0..2,
         classes2 = 0 :: 0..4,
         lev2 = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(campaign_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(campaign_rank_data,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone,
         title = "",
         content = "",
         desc = "",
         cast = "",
         cast_rank = 1,
         merge_flag = 0}).

-record(camp_rank_reward_data,
        {min_rank = 0,
         max_rank = 0,
         sec_type = 0,
         item_list = [],
         title = "",
         content = "",
         limit = 0}).

-record(camp_rank_self_reward_data,
        {sec_type = 0, item_list = [], num = 0}).

-file("src/proto/proto_178.erl", 22).

-file("inc/camp_box.hrl", 1).

-record(m_camp_box,
        {camp_id = 0,
         pos_list = [],
         list = [],
         log = [],
         refresh_num = 0,
         auto_refresh_num = 0,
         open_num = 0}).

-record(camp_box_type_data,
        {type = 1,
         name = "",
         is_open = 0,
         day_time = [],
         cast_msg = "",
         cost = [],
         refresh_cost = [],
         gain = [],
         is_repeat = 0,
         auto_num = 0,
         total_num = 0}).

-record(camp_box_group_data,
        {group, type = 1, box_list = []}).

-record(camp_box_item_data,
        {id = 0,
         type = 1,
         group = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         box_weigth = 0,
         weigth = 0,
         must = 0,
         must_no = 0,
         min_box = 0,
         max_box = 0,
         max_num = 0,
         is_cast = 0,
         is_log = 0,
         lev_min = 0,
         lev_max = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0}).

-file("src/proto/proto_178.erl", 23).

-file("inc/camp_discount.hrl", 1).

-record(camp_discount_config_data,
        {id = 0,
         group_id = 0,
         item_list = [],
         cost1 = 0,
         cost2 = [],
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         limit_role_num = 0,
         limit_zone_num = 0,
         weigth = 0,
         show_effect = 0,
         show_item = [],
         show_type = 0}).

-record(m_camp_discount,
        {camp_id = 0,
         refresh_time = 0,
         shop_list = [],
         limit_list = [],
         refresh_num = 0,
         last_group = 0}).

-record(camp_discount_limit, {id, num}).

-file("src/proto/proto_178.erl", 24).

-file("inc/camp_exchange.hrl", 1).

-record(camp_exchange,
        {camp_id = 0, lev = 0, list = [], num = 0}).

-record(camp_exchange_data,
        {id = 0,
         lev = 0,
         item_list = [],
         item_gift_name = "",
         item_gift_id = 0,
         cost = 0,
         max = 0,
         camp_max = 0,
         min_day = 0,
         max_day = 100,
         pre_id = 0,
         pre_num = 0,
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0}).

-file("src/proto/proto_178.erl", 25).

-file("inc/camp_7_7th.hrl", 1).

-author("jia").

-record(camp_7_7th_sign,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         head_id = 0,
         sex = 0 :: 0..2,
         lev = 0,
         time,
         msg = "",
         is_sign = 0,
         online = 0}).

-record(m_camp_7_7th,
        {other_id = {0, "", 0},
         other_name = "",
         other_sex = 0,
         other_lev = 0,
         other_classes = 0,
         status = 0,
         point = 0,
         get_times = 1,
         time = 0}).

-record(camp_7_7th_link,
        {id = {0, "", 0}, is_break = 0}).

-file("src/proto/proto_178.erl", 26).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17800, {}) ->
    {ok, <<2:32/little, 17800:16/little>>};
pack(srv, 17800, {V0_statue, V0_mtime}) ->
    D_a_t_a = <<V0_statue:8/little, V0_mtime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17800:16/little,
       D_a_t_a/binary>>};
pack(cli, 17801, {}) ->
    {ok, <<2:32/little, 17801:16/little>>};
pack(srv, 17801, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17801:16/little,
       D_a_t_a/binary>>};
pack(cli, 17802, {}) ->
    {ok, <<2:32/little, 17802:16/little>>};
pack(srv, 17802, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17802:16/little,
       D_a_t_a/binary>>};
pack(cli, 17803, {}) ->
    {ok, <<2:32/little, 17803:16/little>>};
pack(srv, 17803, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little, V1_times:32/little,
                                   V1_times_cd:32/little, V1_die:32/little,
                                   V1_score:32/little>>
                                 || #halloween_role{id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_r_zone_id},
                                                    times = V1_times,
                                                    times_cd = V1_times_cd,
                                                    die = V1_die,
                                                    score = V1_score}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17803:16/little,
       D_a_t_a/binary>>};
pack(cli, 17804, {}) ->
    {ok, <<2:32/little, 17804:16/little>>};
pack(srv, 17804,
     {V0_list,
      V0_green_score,
      V0_blue_score,
      V0_end_time}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_times:32/little,
                                   V1_die:32/little, V1_score:32/little,
                                   V1_zone_id:32/little, V1_camp:32/little>>
                                 || #halloween_role{id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_r_zone_id},
                                                    name = V1_name,
                                                    classes = V1_classes,
                                                    sex = V1_sex,
                                                    status = V1_status,
                                                    lev = V1_lev, win = V1_win,
                                                    times = V1_times,
                                                    die = V1_die,
                                                    score = V1_score,
                                                    zone_id = V1_zone_id,
                                                    camp = V1_camp}
                                        <- V0_list]))/binary,
                V0_green_score:32/little, V0_blue_score:32/little,
                V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17804:16/little,
       D_a_t_a/binary>>};
pack(cli, 17805, {}) ->
    {ok, <<2:32/little, 17805:16/little>>};
pack(srv, 17805,
     {V0_win,
      V0_fail,
      V0_green_score,
      V0_blue_score,
      V0_is_win,
      V0_show}) ->
    D_a_t_a = <<(length(V0_win)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_times:32/little,
                                   V1_die:32/little, V1_score:32/little,
                                   V1_zone_id:32/little, V1_camp:32/little>>
                                 || #halloween_role{id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_r_zone_id},
                                                    name = V1_name,
                                                    classes = V1_classes,
                                                    sex = V1_sex,
                                                    status = V1_status,
                                                    lev = V1_lev, win = V1_win,
                                                    times = V1_times,
                                                    die = V1_die,
                                                    score = V1_score,
                                                    zone_id = V1_zone_id,
                                                    camp = V1_camp}
                                        <- V0_win]))/binary,
                (length(V0_fail)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_times:32/little,
                                   V1_die:32/little, V1_score:32/little,
                                   V1_zone_id:32/little, V1_camp:32/little>>
                                 || #halloween_role{id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_r_zone_id},
                                                    name = V1_name,
                                                    classes = V1_classes,
                                                    sex = V1_sex,
                                                    status = V1_status,
                                                    lev = V1_lev, win = V1_win,
                                                    times = V1_times,
                                                    die = V1_die,
                                                    score = V1_score,
                                                    zone_id = V1_zone_id,
                                                    camp = V1_camp}
                                        <- V0_fail]))/binary,
                V0_green_score:32/little, V0_blue_score:32/little,
                V0_is_win:32/little, (length(V0_show)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num} <- V0_show]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17805:16/little,
       D_a_t_a/binary>>};
pack(cli, 17806,
     {V0_type, V0_rid, V0_platform, V0_r_zone_id}) ->
    D_a_t_a = <<V0_type:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_r_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17806:16/little,
       D_a_t_a/binary>>};
pack(srv, 17806, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17806:16/little,
       D_a_t_a/binary>>};
pack(cli, 17807, {}) ->
    {ok, <<2:32/little, 17807:16/little>>};
pack(srv, 17807, {V0_times}) ->
    D_a_t_a = <<V0_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17807:16/little,
       D_a_t_a/binary>>};
pack(cli, 17808, {}) ->
    {ok, <<2:32/little, 17808:16/little>>};
pack(srv, 17808, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_times:32/little,
                                   V1_die:32/little, V1_score:32/little,
                                   V1_zone_id:32/little, V1_camp:32/little,
                                   V1_mtime:32/little>>
                                 || #halloween_role{id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_r_zone_id},
                                                    name = V1_name,
                                                    classes = V1_classes,
                                                    sex = V1_sex,
                                                    status = V1_status,
                                                    lev = V1_lev, win = V1_win,
                                                    times = V1_times,
                                                    die = V1_die,
                                                    score = V1_score,
                                                    zone_id = V1_zone_id,
                                                    camp = V1_camp,
                                                    mtime = V1_mtime}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17808:16/little,
       D_a_t_a/binary>>};
pack(cli, 17809, {}) ->
    {ok, <<2:32/little, 17809:16/little>>};
pack(srv, 17809, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_times:32/little,
                                   V1_die:32/little, V1_score:32/little,
                                   V1_zone_id:32/little, V1_camp:32/little>>
                                 || #halloween_role{id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_r_zone_id},
                                                    name = V1_name,
                                                    classes = V1_classes,
                                                    sex = V1_sex,
                                                    status = V1_status,
                                                    lev = V1_lev, win = V1_win,
                                                    times = V1_times,
                                                    die = V1_die,
                                                    score = V1_score,
                                                    zone_id = V1_zone_id,
                                                    camp = V1_camp}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17809:16/little,
       D_a_t_a/binary>>};
pack(cli, 17810, {}) ->
    {ok, <<2:32/little, 17810:16/little>>};
pack(srv, 17810,
     {V0_bid, V0_id, V0_base_id, V0_x, V0_y, V0_round}) ->
    D_a_t_a = <<V0_bid:32/little, V0_id:32/little,
                V0_base_id:32/little, V0_x:32/little, V0_y:32/little,
                V0_round:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17810:16/little,
       D_a_t_a/binary>>};
pack(cli, 17811, {}) ->
    {ok, <<2:32/little, 17811:16/little>>};
pack(srv, 17811, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17811:16/little,
       D_a_t_a/binary>>};
pack(cli, 17812, {}) ->
    {ok, <<2:32/little, 17812:16/little>>};
pack(srv, 17812, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:16/little>>
                                 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17812:16/little,
       D_a_t_a/binary>>};
pack(cli, 17813, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17813:16/little,
       D_a_t_a/binary>>};
pack(srv, 17813, {V0_id, V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_id:16/little, V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17813:16/little,
       D_a_t_a/binary>>};
pack(cli, 17814, {}) ->
    {ok, <<2:32/little, 17814:16/little>>};
pack(srv, 17814, {V0_card_list, V0_times}) ->
    D_a_t_a = <<(length(V0_card_list)):16/little,
                (list_to_binary([<<V1_flag:8/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_num:32/little>>
                                 || {V1_flag, V1_base_id, V1_bind, V1_num}
                                        <- V0_card_list]))/binary,
                V0_times:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17814:16/little,
       D_a_t_a/binary>>};
pack(cli, 17815, {}) ->
    {ok, <<2:32/little, 17815:16/little>>};
pack(srv, 17815, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17815:16/little,
       D_a_t_a/binary>>};
pack(cli, 17816, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17816:16/little,
       D_a_t_a/binary>>};
pack(srv, 17816, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17816:16/little,
       D_a_t_a/binary>>};
pack(cli, 17817, {}) ->
    {ok, <<2:32/little, 17817:16/little>>};
pack(srv, 17817,
     {V0_day_now,
      #camp_series_recharge{first_time = V0_first_time,
                            reward = V0_reward}}) ->
    D_a_t_a = <<V0_day_now:8/little,
                V0_first_time:32/little, (length(V0_reward)):16/little,
                (list_to_binary([<<V1_day_id:8/little,
                                   V1_day_status:8/little>>
                                 || {V1_day_id, V1_day_status}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17817:16/little,
       D_a_t_a/binary>>};
pack(cli, 17818, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17818:16/little,
       D_a_t_a/binary>>};
pack(srv, 17818, {V0_id, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_id:16/little, V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17818:16/little,
       D_a_t_a/binary>>};
pack(cli, 17819, {}) ->
    {ok, <<2:32/little, 17819:16/little>>};
pack(srv, 17819,
     {V0_start_time, V0_end_time, V0_val}) ->
    D_a_t_a = <<V0_start_time:32/little,
                V0_end_time:32/little, V0_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17819:16/little,
       D_a_t_a/binary>>};
pack(cli, 17820, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17820:16/little,
       D_a_t_a/binary>>};
pack(srv, 17820, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17820:16/little,
       D_a_t_a/binary>>};
pack(cli, 17821, {}) ->
    {ok, <<2:32/little, 17821:16/little>>};
pack(srv, 17821, {V0_count}) ->
    D_a_t_a = <<V0_count:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17821:16/little,
       D_a_t_a/binary>>};
pack(cli, 17822, {}) ->
    {ok, <<2:32/little, 17822:16/little>>};
pack(srv, 17822, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17822:16/little,
       D_a_t_a/binary>>};
pack(cli, 17823, {V0_count}) ->
    D_a_t_a = <<V0_count:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17823:16/little,
       D_a_t_a/binary>>};
pack(srv, 17823, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17823:16/little,
       D_a_t_a/binary>>};
pack(cli, 17824, {}) ->
    {ok, <<2:32/little, 17824:16/little>>};
pack(srv, 17824, {V0_floor, V0_times, V0_rewards}) ->
    D_a_t_a = <<V0_floor:16/little, V0_times:16/little,
                (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_next_times:32/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_num:32/little,
                                                      V2_effect:8/little>>
                                                    || {V2_base_id,
                                                        V2_num,
                                                        V2_effect}
                                                           <- V1_reward]))/binary>>
                                 || {V1_next_times, V1_reward}
                                        <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17824:16/little,
       D_a_t_a/binary>>};
pack(cli, 17825, {V0_times}) ->
    D_a_t_a = <<V0_times:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17825:16/little,
       D_a_t_a/binary>>};
pack(srv, 17825, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:16/little, V1_floor:16/little>>
                                 || {V1_id, V1_floor} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17825:16/little,
       D_a_t_a/binary>>};
pack(cli, 17826, {}) ->
    {ok, <<2:32/little, 17826:16/little>>};
pack(srv, 17826, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17826:16/little,
       D_a_t_a/binary>>};
pack(cli, 17827, {}) ->
    {ok, <<2:32/little, 17827:16/little>>};
pack(srv, 17827, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_msg))/binary,
                                   V1_time:32/signed-little>>
                                 || {V1_msg, V1_time} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17827:16/little,
       D_a_t_a/binary>>};
pack(cli, 17828, {}) ->
    {ok, <<2:32/little, 17828:16/little>>};
pack(srv, 17828,
     {V0_wish, V0_votive, V0_get, V0_get_votive}) ->
    D_a_t_a = <<V0_wish:16/little, V0_votive:16/little,
                V0_get:16/little, V0_get_votive:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17828:16/little,
       D_a_t_a/binary>>};
pack(cli, 17829, {V0_wish, V0_type}) ->
    D_a_t_a = <<(protocol:pack(string, V0_wish))/binary,
                V0_type:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17829:16/little,
       D_a_t_a/binary>>};
pack(srv, 17829, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17829:16/little,
       D_a_t_a/binary>>};
pack(cli, 17830, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17830:16/little,
       D_a_t_a/binary>>};
pack(srv, 17830,
     {V0_time,
      #camp_whiteday{role_id =
                         {V0_role_id, V0_platform, V0_zone_id},
                     name = V0_name, classes = V0_classes, sex = V0_sex,
                     wish = V0_wish, type = V0_type}}) ->
    D_a_t_a = <<V0_time:32/little, V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/signed-little,
                (protocol:pack(string, V0_name))/binary,
                V0_classes:8/little, V0_sex:8/little,
                (protocol:pack(string, V0_wish))/binary,
                V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17830:16/little,
       D_a_t_a/binary>>};
pack(cli, 17831, {V0_type}) ->
    D_a_t_a = <<V0_type:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17831:16/little,
       D_a_t_a/binary>>};
pack(srv, 17831, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17831:16/little,
       D_a_t_a/binary>>};
pack(cli, 17832, {}) ->
    {ok, <<2:32/little, 17832:16/little>>};
pack(srv, 17832, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17832:16/little,
       D_a_t_a/binary>>};
pack(cli, 17833, {}) ->
    {ok, <<2:32/little, 17833:16/little>>};
pack(srv, 17833, {V0_skill}) ->
    D_a_t_a = <<(length(V0_skill)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_timestamp:32/little>>
                                 || {V1_id, V1_timestamp}
                                        <- V0_skill]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17833:16/little,
       D_a_t_a/binary>>};
pack(cli, 17834, {}) ->
    {ok, <<2:32/little, 17834:16/little>>};
pack(srv, 17834, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17834:16/little,
       D_a_t_a/binary>>};
pack(cli, 17835, {}) ->
    {ok, <<2:32/little, 17835:16/little>>};
pack(srv, 17835, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17835:16/little,
       D_a_t_a/binary>>};
pack(cli, 17836, {V0_type}) ->
    D_a_t_a = <<V0_type:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17836:16/little,
       D_a_t_a/binary>>};
pack(srv, 17836, {}) ->
    {ok, <<2:32/little, 17836:16/little>>};
pack(cli, 17837, {}) ->
    {ok, <<2:32/little, 17837:16/little>>};
pack(srv, 17837, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17837:16/little,
       D_a_t_a/binary>>};
pack(cli, 17838, {}) ->
    {ok, <<2:32/little, 17838:16/little>>};
pack(srv, 17838,
     {#camp_doll{lucky = V0_lucky,
                 free_times = V0_free_times, dolls = V0_dolls}}) ->
    D_a_t_a = <<V0_lucky:16/little, V0_free_times:8/little,
                (length(V0_dolls)):16/little,
                (list_to_binary([<<V1_pos:8/little, V1_type:8/little,
                                   V1_open:8/little>>
                                 || #camp_doll_data{pos = V1_pos,
                                                    type = V1_type,
                                                    open = V1_open}
                                        <- V0_dolls]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17838:16/little,
       D_a_t_a/binary>>};
pack(cli, 17839, {V0_type, V0_pos}) ->
    D_a_t_a = <<V0_type:8/little, V0_pos:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17839:16/little,
       D_a_t_a/binary>>};
pack(srv, 17839, {V0_type, V0_pos, V0_reward}) ->
    D_a_t_a = <<V0_type:8/little, V0_pos:8/little,
                (length(V0_reward)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17839:16/little,
       D_a_t_a/binary>>};
pack(cli, 17840, {}) ->
    {ok, <<2:32/little, 17840:16/little>>};
pack(srv, 17840, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17840:16/little,
       D_a_t_a/binary>>};
pack(cli, 17842, {}) ->
    {ok, <<2:32/little, 17842:16/little>>};
pack(srv, 17842, {V0_map_num, V0_camp_unit}) ->
    D_a_t_a = <<(length(V0_map_num)):16/little,
                (list_to_binary([<<V1_map_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_map_id, V1_num} <- V0_map_num]))/binary,
                (length(V0_camp_unit)):16/little,
                (list_to_binary([<<V1_battle_id:32/little,
                                   V1_id:32/little, V1_map_id:32/little,
                                   V1_base_id:32/little, V1_x:32/little,
                                   V1_y:32/little>>
                                 || {V1_battle_id,
                                     V1_id,
                                     V1_map_id,
                                     V1_base_id,
                                     V1_x,
                                     V1_y}
                                        <- V0_camp_unit]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17842:16/little,
       D_a_t_a/binary>>};
pack(cli, 17843, {}) ->
    {ok, <<2:32/little, 17843:16/little>>};
pack(srv, 17843, {V0_flag, V0_num}) ->
    D_a_t_a = <<V0_flag:8/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17843:16/little,
       D_a_t_a/binary>>};
pack(cli, 17844, {}) ->
    {ok, <<2:32/little, 17844:16/little>>};
pack(srv, 17844, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17844:16/little,
       D_a_t_a/binary>>};
pack(cli, 17845, {}) ->
    {ok, <<2:32/little, 17845:16/little>>};
pack(srv, 17845,
     {V0_lev, V0_list, V0_day_list, V0_day, V0_dollar}) ->
    D_a_t_a = <<V0_lev:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_list]))/binary,
                (length(V0_day_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_day_list]))/binary,
                V0_day:32/little, V0_dollar:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17845:16/little,
       D_a_t_a/binary>>};
pack(cli, 17846, {V0_lev, V0_id}) ->
    D_a_t_a = <<V0_lev:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17846:16/little,
       D_a_t_a/binary>>};
pack(srv, 17846, {V0_flag, V0_lev, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_lev:32/little,
                V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17846:16/little,
       D_a_t_a/binary>>};
pack(cli, 17847, {}) ->
    {ok, <<2:32/little, 17847:16/little>>};
pack(srv, 17847, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17847:16/little,
       D_a_t_a/binary>>};
pack(cli, 17848, {}) ->
    {ok, <<2:32/little, 17848:16/little>>};
pack(srv, 17848,
     {V0_round,
      V0_time,
      V0_next_move,
      V0_draw_list,
      #animal_chess{first_id =
                        {V0_role_id1, V0_platform1, V0_zone_id1},
                    first_name = V0_first_name, first_lev = V0_first_lev,
                    first_classes = V0_first_classes,
                    first_sex = V0_first_sex, first_looks = V0_first_looks,
                    first_grade = V0_first_grade,
                    first_score = V0_first_score,
                    second_id = {V0_role_id2, V0_platform2, V0_zone_id2},
                    second_name = V0_second_name,
                    second_lev = V0_second_lev,
                    second_classes = V0_second_classes,
                    second_sex = V0_second_sex,
                    second_looks = V0_second_looks, chesses = V0_chesses,
                    second_grade = V0_second_grade,
                    second_score = V0_second_score}}) ->
    D_a_t_a = <<V0_round:8/little, V0_time:32/little,
                V0_next_move:8/little, (length(V0_draw_list)):16/little,
                (list_to_binary([<<V1_camp:8/little,
                                   V1_draw_time1:32/little,
                                   V1_draw_time2:32/little>>
                                 || {V1_camp, V1_draw_time1, V1_draw_time2}
                                        <- V0_draw_list]))/binary,
                V0_role_id1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:16/signed-little,
                (protocol:pack(string, V0_first_name))/binary,
                V0_first_lev:16/little, V0_first_classes:8/little,
                V0_first_sex:8/little,
                (length(V0_first_looks)):16/little,
                (list_to_binary([<<V1_looks_type1:32/little,
                                   V1_looks_mode1:32/little,
                                   V1_looks_val1:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str1))/binary>>
                                 || {V1_looks_type1,
                                     V1_looks_mode1,
                                     V1_looks_val1,
                                     V1_looks_str1}
                                        <- V0_first_looks]))/binary,
                V0_first_grade:16/little, V0_first_score:32/little,
                V0_role_id2:32/little,
                (protocol:pack(string, V0_platform2))/binary,
                V0_zone_id2:16/signed-little,
                (protocol:pack(string, V0_second_name))/binary,
                V0_second_lev:16/little, V0_second_classes:8/little,
                V0_second_sex:8/little,
                (length(V0_second_looks)):16/little,
                (list_to_binary([<<V1_looks_type2:32/little,
                                   V1_looks_mode2:32/little,
                                   V1_looks_val2:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str2))/binary>>
                                 || {V1_looks_type2,
                                     V1_looks_mode2,
                                     V1_looks_val2,
                                     V1_looks_str2}
                                        <- V0_second_looks]))/binary,
                (length(V0_chesses)):16/little,
                (list_to_binary([<<V1_x:8/little, V1_y:8/little,
                                   V1_camp:8/little, V1_grade:8/little,
                                   V1_status:8/little>>
                                 || #animal_chess_pos{x = V1_x, y = V1_y,
                                                      camp = V1_camp,
                                                      grade = V1_grade,
                                                      status = V1_status}
                                        <- V0_chesses]))/binary,
                V0_second_grade:16/little, V0_second_score:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17848:16/little,
       D_a_t_a/binary>>};
pack(cli, 17849,
     {V0_start_x, V0_start_y, V0_end_x, V0_end_y}) ->
    D_a_t_a = <<V0_start_x:8/little, V0_start_y:8/little,
                V0_end_x:8/little, V0_end_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17849:16/little,
       D_a_t_a/binary>>};
pack(srv, 17849, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17849:16/little,
       D_a_t_a/binary>>};
pack(cli, 17850, {}) ->
    {ok, <<2:32/little, 17850:16/little>>};
pack(srv, 17850, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17850:16/little,
       D_a_t_a/binary>>};
pack(cli, 17851, {}) ->
    {ok, <<2:32/little, 17851:16/little>>};
pack(srv, 17851, {V0_times, V0_status, V0_time}) ->
    D_a_t_a = <<V0_times:8/little, V0_status:8/little,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17851:16/little,
       D_a_t_a/binary>>};
pack(cli, 17852, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17852:16/little,
       D_a_t_a/binary>>};
pack(srv, 17852, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17852:16/little,
       D_a_t_a/binary>>};
pack(cli, 17853, {}) ->
    {ok, <<2:32/little, 17853:16/little>>};
pack(srv, 17853,
     {V0_flag, V0_grade, V0_score, V0_reward}) ->
    D_a_t_a = <<V0_flag:8/little, V0_grade:16/little,
                V0_score:32/little, (length(V0_reward)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17853:16/little,
       D_a_t_a/binary>>};
pack(cli, 17854, {}) ->
    {ok, <<2:32/little, 17854:16/little>>};
pack(srv, 17854, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17854:16/little,
       D_a_t_a/binary>>};
pack(cli, 17855, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17855:16/little,
       D_a_t_a/binary>>};
pack(srv, 17855, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17855:16/little,
       D_a_t_a/binary>>};
pack(cli, 17856, {}) ->
    {ok, <<2:32/little, 17856:16/little>>};
pack(srv, 17856, {V0_lev, V0_score}) ->
    D_a_t_a = <<V0_lev:16/little, V0_score:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17856:16/little,
       D_a_t_a/binary>>};
pack(cli, 17857, {}) ->
    {ok, <<2:32/little, 17857:16/little>>};
pack(srv, 17857, {}) ->
    {ok, <<2:32/little, 17857:16/little>>};
pack(cli, 17858, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17858:16/little,
       D_a_t_a/binary>>};
pack(srv, 17858, {V0_type, V0_rank_list}) ->
    D_a_t_a = <<V0_type:32/little,
                (length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   V1_rank:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:32/little, V1_role_id2:32/little,
                                   (protocol:pack(string, V1_platform2))/binary,
                                   V1_zone_id2:16/little,
                                   (protocol:pack(string, V1_name2))/binary,
                                   V1_sex2:8/little, V1_classes2:8/little,
                                   V1_lev2:32/little, V1_val1:32/signed-little,
                                   V1_val2:32/signed-little,
                                   V1_val3:32/signed-little,
                                   V1_val4:32/signed-little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || #campaign_rank_role{role_id = V1_role_id,
                                                        rank = V1_rank,
                                                        platform = V1_platform,
                                                        zone_id = V1_zone_id,
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        lev = V1_lev,
                                                        role_id2 = V1_role_id2,
                                                        platform2 =
                                                            V1_platform2,
                                                        zone_id2 = V1_zone_id2,
                                                        name2 = V1_name2,
                                                        sex2 = V1_sex2,
                                                        classes2 = V1_classes2,
                                                        lev2 = V1_lev2,
                                                        val1 = V1_val1,
                                                        val2 = V1_val2,
                                                        val3 = V1_val3,
                                                        val4 = V1_val4,
                                                        desc = V1_desc}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17858:16/little,
       D_a_t_a/binary>>};
pack(cli, 17859, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17859:16/little,
       D_a_t_a/binary>>};
pack(srv, 17859, {V0_type, V0_rank_list}) ->
    D_a_t_a = <<V0_type:32/little,
                (length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:32/little, V1_role_id2:32/little,
                                   (protocol:pack(string, V1_platform2))/binary,
                                   V1_zone_id2:16/little,
                                   (protocol:pack(string, V1_name2))/binary,
                                   V1_sex2:8/little, V1_classes2:8/little,
                                   V1_lev2:32/little, V1_val1:32/signed-little,
                                   V1_val2:32/signed-little,
                                   V1_val3:32/signed-little,
                                   V1_val4:32/signed-little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || #campaign_rank_role{role_id = V1_role_id,
                                                        platform = V1_platform,
                                                        zone_id = V1_zone_id,
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        lev = V1_lev,
                                                        role_id2 = V1_role_id2,
                                                        platform2 =
                                                            V1_platform2,
                                                        zone_id2 = V1_zone_id2,
                                                        name2 = V1_name2,
                                                        sex2 = V1_sex2,
                                                        classes2 = V1_classes2,
                                                        lev2 = V1_lev2,
                                                        val1 = V1_val1,
                                                        val2 = V1_val2,
                                                        val3 = V1_val3,
                                                        val4 = V1_val4,
                                                        desc = V1_desc}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17859:16/little,
       D_a_t_a/binary>>};
pack(cli, 17860, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17860:16/little,
       D_a_t_a/binary>>};
pack(srv, 17860, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_val:32/little>>
                                 || V1_val <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17860:16/little,
       D_a_t_a/binary>>};
pack(cli, 17861, {V0_type, V0_val}) ->
    D_a_t_a = <<V0_type:32/little, V0_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17861:16/little,
       D_a_t_a/binary>>};
pack(srv, 17861, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17861:16/little,
       D_a_t_a/binary>>};
pack(cli, 17862, {V0_id, V0_count}) ->
    D_a_t_a = <<V0_id:16/little, V0_count:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17862:16/little,
       D_a_t_a/binary>>};
pack(srv, 17862, {V0_err_code, V0_msg, V0_show}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_show)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_show]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17862:16/little,
       D_a_t_a/binary>>};
pack(cli, 17863, {}) ->
    {ok, <<2:32/little, 17863:16/little>>};
pack(srv, 17863, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_times:16/little>>
                                 || {V1_id, V1_times} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17863:16/little,
       D_a_t_a/binary>>};
pack(cli, 17864, {}) ->
    {ok, <<2:32/little, 17864:16/little>>};
pack(srv, 17864,
     {V0_pos_list, V0_list, V0_refresh_num, V0_open_num}) ->
    D_a_t_a = <<(length(V0_pos_list)):16/little,
                (list_to_binary([<<V1_pos:32/little, V1_id:32/little>>
                                 || {V1_pos, V1_id} <- V0_pos_list]))/binary,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_list]))/binary,
                V0_refresh_num:32/little, V0_open_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17864:16/little,
       D_a_t_a/binary>>};
pack(cli, 17865, {}) ->
    {ok, <<2:32/little, 17865:16/little>>};
pack(srv, 17865, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/signed-little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_item_id:32/little, V1_bind:32/little,
                                   V1_num:32/little>>
                                 || {{V1_role_id, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_item_id,
                                     V1_bind,
                                     V1_num}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17865:16/little,
       D_a_t_a/binary>>};
pack(cli, 17866, {V0_pos}) ->
    D_a_t_a = <<V0_pos:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17866:16/little,
       D_a_t_a/binary>>};
pack(srv, 17866, {V0_err_code, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_pos:32/little, V1_id:32/little>>
                                 || {V1_pos, V1_id} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17866:16/little,
       D_a_t_a/binary>>};
pack(cli, 17867, {}) ->
    {ok, <<2:32/little, 17867:16/little>>};
pack(srv, 17867, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17867:16/little,
       D_a_t_a/binary>>};
pack(cli, 17868, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17868:16/little,
       D_a_t_a/binary>>};
pack(srv, 17868, {V0_id, V0_start_time, V0_end_time}) ->
    D_a_t_a = <<V0_id:32/little, V0_start_time:32/little,
                V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17868:16/little,
       D_a_t_a/binary>>};
pack(cli, 17869, {}) ->
    {ok, <<2:32/little, 17869:16/little>>};
pack(srv, 17869, {V0_day, V0_mtime, V0_list}) ->
    D_a_t_a = <<V0_day:32/little, V0_mtime:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17869:16/little,
       D_a_t_a/binary>>};
pack(cli, 17870, {V0_target_day}) ->
    D_a_t_a = <<V0_target_day:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17870:16/little,
       D_a_t_a/binary>>};
pack(srv, 17870, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17870:16/little,
       D_a_t_a/binary>>};
pack(cli, 17871, {}) ->
    {ok, <<2:32/little, 17871:16/little>>};
pack(srv, 17871,
     {V0_shop_list, V0_ref_time, V0_ref_num}) ->
    D_a_t_a = <<(length(V0_shop_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_isbuy:8/little,
                                   V1_num:32/little, V1_id:32/little,
                                   (length(V1_item_list)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_bind:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_item_id,
                                                        V2_bind,
                                                        V2_num}
                                                           <- V1_item_list]))/binary,
                                   V1_cost1:32/little,
                                   (length(V1_cost2)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_item_id, V2_num}
                                                           <- V1_cost2]))/binary,
                                   V1_limit_zone_num:32/little,
                                   V1_show_effect:8/little,
                                   (length(V1_show_item)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_bind:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_item_id,
                                                        V2_bind,
                                                        V2_num}
                                                           <- V1_show_item]))/binary,
                                   V1_show_type:32/little>>
                                 || {V1_id,
                                     V1_isbuy,
                                     V1_num,
                                     #camp_discount_config_data{id = V1_id,
                                                                item_list =
                                                                    V1_item_list,
                                                                cost1 =
                                                                    V1_cost1,
                                                                cost2 =
                                                                    V1_cost2,
                                                                limit_zone_num =
                                                                    V1_limit_zone_num,
                                                                show_effect =
                                                                    V1_show_effect,
                                                                show_item =
                                                                    V1_show_item,
                                                                show_type =
                                                                    V1_show_type}}
                                        <- V0_shop_list]))/binary,
                V0_ref_time:32/little, V0_ref_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17871:16/little,
       D_a_t_a/binary>>};
pack(cli, 17872, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17872:16/little,
       D_a_t_a/binary>>};
pack(srv, 17872, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17872:16/little,
       D_a_t_a/binary>>};
pack(cli, 17873, {}) ->
    {ok, <<2:32/little, 17873:16/little>>};
pack(srv, 17873, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17873:16/little,
       D_a_t_a/binary>>};
pack(cli, 17874, {}) ->
    {ok, <<2:32/little, 17874:16/little>>};
pack(srv, 17874, {V0_day, V0_bags_list}) ->
    D_a_t_a = <<V0_day:32/little,
                (length(V0_bags_list)):16/little,
                (list_to_binary([<<V1_lev:32/little, V1_id:32/little,
                                   (length(V1_item_list)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_eff:8/little>>
                                                    || {V2_item_id,
                                                        V2_bind,
                                                        V2_num,
                                                        V2_eff}
                                                           <- V1_item_list]))/binary,
                                   (protocol:pack(string,
                                                  V1_item_gift_name))/binary,
                                   V1_item_gift_id:32/little, V1_cost:32/little,
                                   V1_max:32/little, V1_camp_max:32/little,
                                   V1_min_day:32/little, V1_max_day:32/little,
                                   V1_pre_id:32/little, V1_pre_num:32/little,
                                   V1_min_lev:32/little, V1_max_lev:32/little,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_min_lev_break:32/little,
                                   V1_max_lev_break:32/little>>
                                 || #camp_exchange_data{lev = V1_lev,
                                                        id = V1_id,
                                                        item_list =
                                                            V1_item_list,
                                                        item_gift_name =
                                                            V1_item_gift_name,
                                                        item_gift_id =
                                                            V1_item_gift_id,
                                                        cost = V1_cost,
                                                        max = V1_max,
                                                        camp_max = V1_camp_max,
                                                        min_day = V1_min_day,
                                                        max_day = V1_max_day,
                                                        pre_id = V1_pre_id,
                                                        pre_num = V1_pre_num,
                                                        min_lev = V1_min_lev,
                                                        max_lev = V1_max_lev,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        min_lev_break =
                                                            V1_min_lev_break,
                                                        max_lev_break =
                                                            V1_max_lev_break}
                                        <- V0_bags_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17874:16/little,
       D_a_t_a/binary>>};
pack(cli, 17875, {}) ->
    {ok, <<2:32/little, 17875:16/little>>};
pack(srv, 17875,
     {V0_card_list,
      V0_times,
      V0_last_group,
      V0_act_cost,
      V0_start_time,
      V0_end_time}) ->
    D_a_t_a = <<(length(V0_card_list)):16/little,
                (list_to_binary([<<V1_flag:8/little, V1_group:32/little,
                                   V1_reward_id:32/little,
                                   (length(V1_item_id)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_id, V2_num}
                                                           <- V1_item_id]))/binary,
                                   V1_lev_low:32/little, V1_effect:8/little>>
                                 || {V1_flag,
                                     V1_group,
                                     V1_reward_id,
                                     V1_item_id,
                                     V1_lev_low,
                                     V1_effect}
                                        <- V0_card_list]))/binary,
                V0_times:8/little, V0_last_group:32/little,
                (length(V0_act_cost)):16/little,
                (list_to_binary([<<V1_acticity:32/little,
                                   (length(V1_cost)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_id, V2_num}
                                                           <- V1_cost]))/binary>>
                                 || {V1_acticity, V1_cost}
                                        <- V0_act_cost]))/binary,
                V0_start_time:32/little, V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17875:16/little,
       D_a_t_a/binary>>};
pack(cli, 17876, {}) ->
    {ok, <<2:32/little, 17876:16/little>>};
pack(srv, 17876, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17876:16/little,
       D_a_t_a/binary>>};
pack(cli, 17877, {V0_order}) ->
    D_a_t_a = <<V0_order:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17877:16/little,
       D_a_t_a/binary>>};
pack(srv, 17877, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17877:16/little,
       D_a_t_a/binary>>};
pack(cli, 17878, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17878:16/little,
       D_a_t_a/binary>>};
pack(srv, 17878, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17878:16/little,
       D_a_t_a/binary>>};
pack(cli, 17879, {}) ->
    {ok, <<2:32/little, 17879:16/little>>};
pack(srv, 17879, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_lev:32/little,
                                   (protocol:pack(string, V1_msg))/binary,
                                   V1_head_id:32/little>>
                                 || #camp_7_7th_sign{id =
                                                         {V1_rid,
                                                          V1_platform,
                                                          V1_zone_id},
                                                     name = V1_name,
                                                     sex = V1_sex,
                                                     classes = V1_classes,
                                                     lev = V1_lev, msg = V1_msg,
                                                     head_id = V1_head_id}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17879:16/little,
       D_a_t_a/binary>>};
pack(cli, 17880, {}) ->
    {ok, <<2:32/little, 17880:16/little>>};
pack(srv, 17880,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_other_name,
      V0_other_sex,
      V0_other_classes,
      V0_status,
      V0_reward,
      V0_point,
      V0_lev}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_other_name))/binary,
                V0_other_sex:8/little, V0_other_classes:8/little,
                V0_status:8/little, (length(V0_reward)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_is_bind:8/little,
                                   V1_num:32/little, V1_is_effet:8/little>>
                                 || {V1_id, V1_is_bind, V1_num, V1_is_effet}
                                        <- V0_reward]))/binary,
                V0_point:32/little, V0_lev:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17880:16/little,
       D_a_t_a/binary>>};
pack(cli, 17881, {}) ->
    {ok, <<2:32/little, 17881:16/little>>};
pack(srv, 17881, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17881:16/little,
       D_a_t_a/binary>>};
pack(cli, 17882, {}) ->
    {ok, <<2:32/little, 17882:16/little>>};
pack(srv, 17882, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17882:16/little,
       D_a_t_a/binary>>};
pack(cli, 17883, {V0_days}) ->
    D_a_t_a = <<V0_days:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17883:16/little,
       D_a_t_a/binary>>};
pack(srv, 17883,
     {V0_days,
      V0_reg_point,
      V0_rd_times,
      V0_rd_reward,
      V0_box_reward,
      V0_random_cost}) ->
    D_a_t_a = <<V0_days:32/little, V0_reg_point:32/little,
                V0_rd_times:32/little, (length(V0_rd_reward)):16/little,
                (list_to_binary([<<V1_group_id:32/little,
                                   V1_item_id:32/little, V1_is_bind:8/little,
                                   V1_num:32/little, V1_weight:32/little,
                                   V1_index:32/little, V1_is_effet:8/little,
                                   V1_is_random:8/little>>
                                 || {V1_group_id,
                                     V1_item_id,
                                     V1_is_bind,
                                     V1_num,
                                     V1_weight,
                                     V1_index,
                                     V1_is_effet,
                                     V1_is_random}
                                        <- V0_rd_reward]))/binary,
                (length(V0_box_reward)):16/little,
                (list_to_binary([<<V1_box_id:32/little,
                                   V1_need_point:32/little,
                                   (length(V1_box_reward)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_is_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_is_effet:8/little>>
                                                    || {V2_item_id,
                                                        V2_is_bind,
                                                        V2_num,
                                                        V2_is_effet}
                                                           <- V1_box_reward]))/binary,
                                   V1_is_reward:8/little>>
                                 || {V1_box_id,
                                     V1_need_point,
                                     V1_box_reward,
                                     V1_is_reward}
                                        <- V0_box_reward]))/binary,
                (length(V0_random_cost)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_item_id, V1_num}
                                        <- V0_random_cost]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17883:16/little,
       D_a_t_a/binary>>};
pack(cli, 17884, {V0_days}) ->
    D_a_t_a = <<V0_days:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17884:16/little,
       D_a_t_a/binary>>};
pack(srv, 17884,
     {V0_days, V0_index, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_days:32/little, V0_index:32/little,
                V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17884:16/little,
       D_a_t_a/binary>>};
pack(cli, 17885, {V0_days}) ->
    D_a_t_a = <<V0_days:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17885:16/little,
       D_a_t_a/binary>>};
pack(srv, 17885,
     {V0_days, V0_item_list, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_days:32/little,
                (length(V0_item_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_is_bind:8/little, V1_num:32/little>>
                                 || {V1_item_id, V1_is_bind, V1_num}
                                        <- V0_item_list]))/binary,
                V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17885:16/little,
       D_a_t_a/binary>>};
pack(cli, 17886, {V0_days, V0_box_id}) ->
    D_a_t_a = <<V0_days:32/little, V0_box_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17886:16/little,
       D_a_t_a/binary>>};
pack(srv, 17886,
     {V0_days, V0_box_id, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_days:32/little, V0_box_id:32/little,
                V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17886:16/little,
       D_a_t_a/binary>>};
pack(cli, 17887, {}) ->
    {ok, <<2:32/little, 17887:16/little>>};
pack(srv, 17887, {V0_curdays}) ->
    D_a_t_a = <<V0_curdays:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17887:16/little,
       D_a_t_a/binary>>};
pack(cli, 17888, {V0_days}) ->
    D_a_t_a = <<V0_days:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17888:16/little,
       D_a_t_a/binary>>};
pack(srv, 17888,
     {V0_days,
      V0_times,
      V0_max_times,
      V0_gift_name,
      V0_old_price,
      V0_now_price,
      V0_reward,
      V0_fashion,
      V0_show_item}) ->
    D_a_t_a = <<V0_days:32/little, V0_times:32/little,
                V0_max_times:32/little,
                (protocol:pack(string, V0_gift_name))/binary,
                V0_old_price:32/little, V0_now_price:32/little,
                (length(V0_reward)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_is_bind:8/little, V1_num:32/little,
                                   V1_is_effet:8/little>>
                                 || {V1_item_id,
                                     V1_is_bind,
                                     V1_num,
                                     V1_is_effet}
                                        <- V0_reward]))/binary,
                (length(V0_fashion)):16/little,
                (list_to_binary([<<V1_partt_id:32/little,
                                   V1_partt_val:32/little>>
                                 || {V1_partt_id, V1_partt_val}
                                        <- V0_fashion]))/binary,
                (length(V0_show_item)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_is_bind:8/little, V1_num:32/little,
                                   V1_is_effet:8/little>>
                                 || {V1_item_id,
                                     V1_is_bind,
                                     V1_num,
                                     V1_is_effet}
                                        <- V0_show_item]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17888:16/little,
       D_a_t_a/binary>>};
pack(cli, 17889, {}) ->
    {ok, <<2:32/little, 17889:16/little>>};
pack(srv, 17889, {V0_curdays}) ->
    D_a_t_a = <<V0_curdays:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17889:16/little,
       D_a_t_a/binary>>};
pack(cli, 17890, {}) ->
    {ok, <<2:32/little, 17890:16/little>>};
pack(srv, 17890,
     {V0_login_reward_state,
      V0_final_reward_state,
      V0_send_red_dot,
      V0_roll_cost,
      V0_flowers_info}) ->
    D_a_t_a = <<V0_login_reward_state:32/little,
                V0_final_reward_state:32/little,
                V0_send_red_dot:32/little, V0_roll_cost:32/little,
                (length(V0_flowers_info)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_index:32/little,
                                   V1_num:32/little>>
                                 || {V1_id, V1_index, V1_num}
                                        <- V0_flowers_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17890:16/little,
       D_a_t_a/binary>>};
pack(cli, 17891, {}) ->
    {ok, <<2:32/little, 17891:16/little>>};
pack(srv, 17891, {V0_index, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_index:32/little, V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17891:16/little,
       D_a_t_a/binary>>};
pack(cli, 17892, {}) ->
    {ok, <<2:32/little, 17892:16/little>>};
pack(srv, 17892,
     {V0_item_list, V0_gift_list, V0_err_code, V0_msg}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_index:32/little,
                                   V1_num:32/little>>
                                 || {V1_id, V1_index, V1_num}
                                        <- V0_item_list]))/binary,
                (length(V0_gift_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_item_id, V1_num}
                                        <- V0_gift_list]))/binary,
                V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17892:16/little,
       D_a_t_a/binary>>};
pack(cli, 17893, {}) ->
    {ok, <<2:32/little, 17893:16/little>>};
pack(srv, 17893, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17893:16/little,
       D_a_t_a/binary>>};
pack(cli, 17894, {}) ->
    {ok, <<2:32/little, 17894:16/little>>};
pack(srv, 17894,
     {V0_base_id, V0_num, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_num:32/little,
                V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17894:16/little,
       D_a_t_a/binary>>};
pack(cli, 17895, {}) ->
    {ok, <<2:32/little, 17895:16/little>>};
pack(srv, 17895, {V0_box_info}) ->
    D_a_t_a = <<(length(V0_box_info)):16/little,
                (list_to_binary([<<V1_index:32/little,
                                   V1_base_id:32/little, V1_num:32/little,
                                   V1_old_price:32/little, V1_price:32/little,
                                   V1_is_get:32/little>>
                                 || {V1_index,
                                     V1_base_id,
                                     V1_num,
                                     V1_old_price,
                                     V1_price,
                                     V1_is_get}
                                        <- V0_box_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17895:16/little,
       D_a_t_a/binary>>};
pack(cli, 17896,
     {{V0_id, V0_platform, V0_zone_id}, V0_list}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17896:16/little,
       D_a_t_a/binary>>};
pack(srv, 17896, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17896:16/little,
       D_a_t_a/binary>>};
pack(cli, 17897, {V0_index}) ->
    D_a_t_a = <<V0_index:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17897:16/little,
       D_a_t_a/binary>>};
pack(srv, 17897, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17897:16/little,
       D_a_t_a/binary>>};
pack(cli, 17898, {}) ->
    {ok, <<2:32/little, 17898:16/little>>};
pack(srv, 17898, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17898:16/little,
       D_a_t_a/binary>>};
pack(cli, 17899, {}) ->
    {ok, <<2:32/little, 17899:16/little>>};
pack(srv, 17899, {V0_map_num, V0_camp_unit}) ->
    D_a_t_a = <<(length(V0_map_num)):16/little,
                (list_to_binary([<<V1_map_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_map_id, V1_num} <- V0_map_num]))/binary,
                (length(V0_camp_unit)):16/little,
                (list_to_binary([<<V1_battle_id:32/little,
                                   V1_id:32/little, V1_map_id:32/little,
                                   V1_base_id:32/little, V1_x:32/little,
                                   V1_y:32/little>>
                                 || {V1_battle_id,
                                     V1_id,
                                     V1_map_id,
                                     V1_base_id,
                                     V1_x,
                                     V1_y}
                                        <- V0_camp_unit]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17899:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17800, _B0) -> {ok, {}};
unpack(cli, 17800, _B0) ->
    {V1_statue, _B1} = protocol:uint8(_B0),
    {V1_mtime, _B2} = protocol:uint32(_B1),
    {ok, {V1_statue, V1_mtime}};
unpack(srv, 17801, _B0) -> {ok, {}};
unpack(cli, 17801, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 17802, _B0) -> {ok, {}};
unpack(cli, 17802, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 17803, _B0) -> {ok, {}};
unpack(cli, 17803, _B0) ->
    {V1_list, _B10} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_r_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_times, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_times_cd, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_die, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_score, _B8} =
                                                 protocol:uint32(_B7),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_r_zone_id,
                                               V2_times,
                                               V2_times_cd,
                                               V2_die,
                                               V2_score},
                                              _B8}
                                     end),
    {ok, {V1_list}};
unpack(srv, 17804, _B0) -> {ok, {}};
unpack(cli, 17804, _B0) ->
    {V1_list, _B17} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_r_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_classes, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_sex, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_status, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_lev, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_win, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_times, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_die, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_score, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_zone_id, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_camp, _B15} =
                                                 protocol:uint32(_B14),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_r_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_status,
                                               V2_lev,
                                               V2_win,
                                               V2_times,
                                               V2_die,
                                               V2_score,
                                               V2_zone_id,
                                               V2_camp},
                                              _B15}
                                     end),
    {V1_green_score, _B18} = protocol:uint32(_B17),
    {V1_blue_score, _B19} = protocol:uint32(_B18),
    {V1_end_time, _B20} = protocol:uint32(_B19),
    {ok,
     {V1_list, V1_green_score, V1_blue_score, V1_end_time}};
unpack(srv, 17805, _B0) -> {ok, {}};
unpack(cli, 17805, _B0) ->
    {V1_win, _B17} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_rid, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_r_zone_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_name, _B5} =
                                                protocol:string(_B4),
                                            {V2_classes, _B6} =
                                                protocol:uint32(_B5),
                                            {V2_sex, _B7} =
                                                protocol:uint32(_B6),
                                            {V2_status, _B8} =
                                                protocol:uint32(_B7),
                                            {V2_lev, _B9} =
                                                protocol:uint32(_B8),
                                            {V2_win, _B10} =
                                                protocol:uint32(_B9),
                                            {V2_times, _B11} =
                                                protocol:uint32(_B10),
                                            {V2_die, _B12} =
                                                protocol:uint32(_B11),
                                            {V2_score, _B13} =
                                                protocol:uint32(_B12),
                                            {V2_zone_id, _B14} =
                                                protocol:uint32(_B13),
                                            {V2_camp, _B15} =
                                                protocol:uint32(_B14),
                                            {{V2_rid,
                                              V2_platform,
                                              V2_r_zone_id,
                                              V2_name,
                                              V2_classes,
                                              V2_sex,
                                              V2_status,
                                              V2_lev,
                                              V2_win,
                                              V2_times,
                                              V2_die,
                                              V2_score,
                                              V2_zone_id,
                                              V2_camp},
                                             _B15}
                                    end),
    {V1_fail, _B34} = protocol:array(_B17,
                                     fun (_B18) ->
                                             {V2_rid, _B19} =
                                                 protocol:uint32(_B18),
                                             {V2_platform, _B20} =
                                                 protocol:string(_B19),
                                             {V2_r_zone_id, _B21} =
                                                 protocol:uint32(_B20),
                                             {V2_name, _B22} =
                                                 protocol:string(_B21),
                                             {V2_classes, _B23} =
                                                 protocol:uint32(_B22),
                                             {V2_sex, _B24} =
                                                 protocol:uint32(_B23),
                                             {V2_status, _B25} =
                                                 protocol:uint32(_B24),
                                             {V2_lev, _B26} =
                                                 protocol:uint32(_B25),
                                             {V2_win, _B27} =
                                                 protocol:uint32(_B26),
                                             {V2_times, _B28} =
                                                 protocol:uint32(_B27),
                                             {V2_die, _B29} =
                                                 protocol:uint32(_B28),
                                             {V2_score, _B30} =
                                                 protocol:uint32(_B29),
                                             {V2_zone_id, _B31} =
                                                 protocol:uint32(_B30),
                                             {V2_camp, _B32} =
                                                 protocol:uint32(_B31),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_r_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_status,
                                               V2_lev,
                                               V2_win,
                                               V2_times,
                                               V2_die,
                                               V2_score,
                                               V2_zone_id,
                                               V2_camp},
                                              _B32}
                                     end),
    {V1_green_score, _B35} = protocol:uint32(_B34),
    {V1_blue_score, _B36} = protocol:uint32(_B35),
    {V1_is_win, _B37} = protocol:uint32(_B36),
    {V1_show, _B42} = protocol:array(_B37,
                                     fun (_B38) ->
                                             {V2_base_id, _B39} =
                                                 protocol:uint32(_B38),
                                             {V2_num, _B40} =
                                                 protocol:uint32(_B39),
                                             {{V2_base_id, V2_num}, _B40}
                                     end),
    {ok,
     {V1_win,
      V1_fail,
      V1_green_score,
      V1_blue_score,
      V1_is_win,
      V1_show}};
unpack(srv, 17806, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_r_zone_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_type, V1_rid, V1_platform, V1_r_zone_id}};
unpack(cli, 17806, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 17807, _B0) -> {ok, {}};
unpack(cli, 17807, _B0) ->
    {V1_times, _B1} = protocol:uint32(_B0),
    {ok, {V1_times}};
unpack(srv, 17808, _B0) -> {ok, {}};
unpack(cli, 17808, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_list, _B19} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_rid, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_r_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_sex, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_status, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_lev, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_win, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_times, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_die, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_score, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_zone_id, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_camp, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_mtime, _B17} =
                                                 protocol:uint32(_B16),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_r_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_status,
                                               V2_lev,
                                               V2_win,
                                               V2_times,
                                               V2_die,
                                               V2_score,
                                               V2_zone_id,
                                               V2_camp,
                                               V2_mtime},
                                              _B17}
                                     end),
    {ok, {V1_type, V1_list}};
unpack(srv, 17809, _B0) -> {ok, {}};
unpack(cli, 17809, _B0) ->
    {V1_list, _B17} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_r_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_classes, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_sex, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_status, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_lev, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_win, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_times, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_die, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_score, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_zone_id, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_camp, _B15} =
                                                 protocol:uint32(_B14),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_r_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_status,
                                               V2_lev,
                                               V2_win,
                                               V2_times,
                                               V2_die,
                                               V2_score,
                                               V2_zone_id,
                                               V2_camp},
                                              _B15}
                                     end),
    {ok, {V1_list}};
unpack(srv, 17810, _B0) -> {ok, {}};
unpack(cli, 17810, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_x, _B4} = protocol:uint32(_B3),
    {V1_y, _B5} = protocol:uint32(_B4),
    {V1_round, _B6} = protocol:uint32(_B5),
    {ok, {V1_bid, V1_id, V1_base_id, V1_x, V1_y, V1_round}};
unpack(srv, 17811, _B0) -> {ok, {}};
unpack(cli, 17811, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(srv, 17812, _B0) -> {ok, {}};
unpack(cli, 17812, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint16(_B1),
                                            {{V2_id}, _B2}
                                    end),
    {ok, {V1_list}};
unpack(srv, 17813, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 17813, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_op_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_id, V1_op_code, V1_msg}};
unpack(srv, 17814, _B0) -> {ok, {}};
unpack(cli, 17814, _B0) ->
    {V1_card_list, _B7} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_flag, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_base_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_bind, _B4} =
                                                     protocol:uint8(_B3),
                                                 {V2_num, _B5} =
                                                     protocol:uint32(_B4),
                                                 {{V2_flag,
                                                   V2_base_id,
                                                   V2_bind,
                                                   V2_num},
                                                  _B5}
                                         end),
    {V1_times, _B8} = protocol:uint8(_B7),
    {ok, {V1_card_list, V1_times}};
unpack(srv, 17815, _B0) -> {ok, {}};
unpack(cli, 17815, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17816, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 17816, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17817, _B0) -> {ok, {}};
unpack(cli, 17817, _B0) ->
    {V1_day_now, _B1} = protocol:uint8(_B0),
    {V1_first_time, _B2} = protocol:uint32(_B1),
    {V1_reward, _B7} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_day_id, _B4} =
                                                  protocol:uint8(_B3),
                                              {V2_day_status, _B5} =
                                                  protocol:uint8(_B4),
                                              {{V2_day_id, V2_day_status}, _B5}
                                      end),
    {ok, {V1_day_now, V1_first_time, V1_reward}};
unpack(srv, 17818, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 17818, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_err_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_id, V1_err_code, V1_msg}};
unpack(srv, 17819, _B0) -> {ok, {}};
unpack(cli, 17819, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_val, _B3} = protocol:uint32(_B2),
    {ok, {V1_start_time, V1_end_time, V1_val}};
unpack(srv, 17820, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 17820, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17821, _B0) -> {ok, {}};
unpack(cli, 17821, _B0) ->
    {V1_count, _B1} = protocol:uint16(_B0),
    {ok, {V1_count}};
unpack(srv, 17822, _B0) -> {ok, {}};
unpack(cli, 17822, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17823, _B0) ->
    {V1_count, _B1} = protocol:uint16(_B0),
    {ok, {V1_count}};
unpack(cli, 17823, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17824, _B0) -> {ok, {}};
unpack(cli, 17824, _B0) ->
    {V1_floor, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint16(_B1),
    {V1_rewards, _B12} = protocol:array(_B2,
                                        fun (_B3) ->
                                                {V2_next_times, _B4} =
                                                    protocol:uint32(_B3),
                                                {V2_reward, _B10} =
                                                    protocol:array(_B4,
                                                                   fun (_B5) ->
                                                                           {V3_base_id,
                                                                            _B6} =
                                                                               protocol:uint32(_B5),
                                                                           {V3_num,
                                                                            _B7} =
                                                                               protocol:uint32(_B6),
                                                                           {V3_effect,
                                                                            _B8} =
                                                                               protocol:uint8(_B7),
                                                                           {{V3_base_id,
                                                                             V3_num,
                                                                             V3_effect},
                                                                            _B8}
                                                                   end),
                                                {{V2_next_times, V2_reward},
                                                 _B10}
                                        end),
    {ok, {V1_floor, V1_times, V1_rewards}};
unpack(srv, 17825, _B0) ->
    {V1_times, _B1} = protocol:uint16(_B0),
    {ok, {V1_times}};
unpack(cli, 17825, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint16(_B1),
                                            {V2_floor, _B3} =
                                                protocol:uint16(_B2),
                                            {{V2_id, V2_floor}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 17826, _B0) -> {ok, {}};
unpack(cli, 17826, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(srv, 17827, _B0) -> {ok, {}};
unpack(cli, 17827, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_msg, _B2} =
                                                protocol:string(_B1),
                                            {V2_time, _B3} =
                                                protocol:int32(_B2),
                                            {{V2_msg, V2_time}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 17828, _B0) -> {ok, {}};
unpack(cli, 17828, _B0) ->
    {V1_wish, _B1} = protocol:uint16(_B0),
    {V1_votive, _B2} = protocol:uint16(_B1),
    {V1_get, _B3} = protocol:uint16(_B2),
    {V1_get_votive, _B4} = protocol:uint16(_B3),
    {ok, {V1_wish, V1_votive, V1_get, V1_get_votive}};
unpack(srv, 17829, _B0) ->
    {V1_wish, _B1} = protocol:string(_B0),
    {V1_type, _B2} = protocol:uint16(_B1),
    {ok, {V1_wish, V1_type}};
unpack(cli, 17829, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17830, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 17830, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {V1_role_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:int16(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_wish, _B8} = protocol:string(_B7),
    {V1_type, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_time,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_classes,
      V1_sex,
      V1_wish,
      V1_type}};
unpack(srv, 17831, _B0) ->
    {V1_type, _B1} = protocol:uint16(_B0),
    {ok, {V1_type}};
unpack(cli, 17831, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17832, _B0) -> {ok, {}};
unpack(cli, 17832, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17833, _B0) -> {ok, {}};
unpack(cli, 17833, _B0) ->
    {V1_skill, _B5} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_timestamp, _B3} =
                                                 protocol:uint32(_B2),
                                             {{V2_id, V2_timestamp}, _B3}
                                     end),
    {ok, {V1_skill}};
unpack(srv, 17834, _B0) -> {ok, {}};
unpack(cli, 17834, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17835, _B0) -> {ok, {}};
unpack(cli, 17835, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17836, _B0) ->
    {V1_type, _B1} = protocol:uint16(_B0),
    {ok, {V1_type}};
unpack(cli, 17836, _B0) -> {ok, {}};
unpack(srv, 17837, _B0) -> {ok, {}};
unpack(cli, 17837, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17838, _B0) -> {ok, {}};
unpack(cli, 17838, _B0) ->
    {V1_lucky, _B1} = protocol:uint16(_B0),
    {V1_free_times, _B2} = protocol:uint8(_B1),
    {V1_dolls, _B8} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_pos, _B4} =
                                                 protocol:uint8(_B3),
                                             {V2_type, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_open, _B6} =
                                                 protocol:uint8(_B5),
                                             {{V2_pos, V2_type, V2_open}, _B6}
                                     end),
    {ok, {V1_lucky, V1_free_times, V1_dolls}};
unpack(srv, 17839, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_pos}};
unpack(cli, 17839, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {V1_reward, _B8} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_base_id, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_bind, _B5} =
                                                  protocol:uint8(_B4),
                                              {V2_num, _B6} =
                                                  protocol:uint32(_B5),
                                              {{V2_base_id, V2_bind, V2_num},
                                               _B6}
                                      end),
    {ok, {V1_type, V1_pos, V1_reward}};
unpack(srv, 17840, _B0) -> {ok, {}};
unpack(cli, 17840, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17842, _B0) -> {ok, {}};
unpack(cli, 17842, _B0) ->
    {V1_map_num, _B5} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_map_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_num, _B3} =
                                                   protocol:uint32(_B2),
                                               {{V2_map_id, V2_num}, _B3}
                                       end),
    {V1_camp_unit, _B14} = protocol:array(_B5,
                                          fun (_B6) ->
                                                  {V2_battle_id, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_id, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_map_id, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_base_id, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_x, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_y, _B12} =
                                                      protocol:uint32(_B11),
                                                  {{V2_battle_id,
                                                    V2_id,
                                                    V2_map_id,
                                                    V2_base_id,
                                                    V2_x,
                                                    V2_y},
                                                   _B12}
                                          end),
    {ok, {V1_map_num, V1_camp_unit}};
unpack(srv, 17843, _B0) -> {ok, {}};
unpack(cli, 17843, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_flag, V1_num}};
unpack(srv, 17844, _B0) -> {ok, {}};
unpack(cli, 17844, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17845, _B0) -> {ok, {}};
unpack(cli, 17845, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_list, _B6} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_id, _B3} = protocol:uint32(_B2),
                                            {V2_num, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_id, V2_num}, _B4}
                                    end),
    {V1_day_list, _B11} = protocol:array(_B6,
                                         fun (_B7) ->
                                                 {V2_id, _B8} =
                                                     protocol:uint32(_B7),
                                                 {V2_num, _B9} =
                                                     protocol:uint32(_B8),
                                                 {{V2_id, V2_num}, _B9}
                                         end),
    {V1_day, _B12} = protocol:uint32(_B11),
    {V1_dollar, _B13} = protocol:uint32(_B12),
    {ok, {V1_lev, V1_list, V1_day_list, V1_day, V1_dollar}};
unpack(srv, 17846, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_lev, V1_id}};
unpack(cli, 17846, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_lev, _B2} = protocol:uint32(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_lev, V1_id, V1_msg}};
unpack(srv, 17847, _B0) -> {ok, {}};
unpack(cli, 17847, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17848, _B0) -> {ok, {}};
unpack(cli, 17848, _B0) ->
    {V1_round, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {V1_next_move, _B3} = protocol:uint8(_B2),
    {V1_draw_list, _B9} = protocol:array(_B3,
                                         fun (_B4) ->
                                                 {V2_camp, _B5} =
                                                     protocol:uint8(_B4),
                                                 {V2_draw_time1, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_draw_time2, _B7} =
                                                     protocol:uint32(_B6),
                                                 {{V2_camp,
                                                   V2_draw_time1,
                                                   V2_draw_time2},
                                                  _B7}
                                         end),
    {V1_role_id1, _B10} = protocol:uint32(_B9),
    {V1_platform1, _B11} = protocol:string(_B10),
    {V1_zone_id1, _B12} = protocol:int16(_B11),
    {V1_first_name, _B13} = protocol:string(_B12),
    {V1_first_lev, _B14} = protocol:uint16(_B13),
    {V1_first_classes, _B15} = protocol:uint8(_B14),
    {V1_first_sex, _B16} = protocol:uint8(_B15),
    {V1_first_looks, _B23} = protocol:array(_B16,
                                            fun (_B17) ->
                                                    {V2_looks_type1, _B18} =
                                                        protocol:uint32(_B17),
                                                    {V2_looks_mode1, _B19} =
                                                        protocol:uint32(_B18),
                                                    {V2_looks_val1, _B20} =
                                                        protocol:uint32(_B19),
                                                    {V2_looks_str1, _B21} =
                                                        protocol:string(_B20),
                                                    {{V2_looks_type1,
                                                      V2_looks_mode1,
                                                      V2_looks_val1,
                                                      V2_looks_str1},
                                                     _B21}
                                            end),
    {V1_first_grade, _B24} = protocol:uint16(_B23),
    {V1_first_score, _B25} = protocol:uint32(_B24),
    {V1_role_id2, _B26} = protocol:uint32(_B25),
    {V1_platform2, _B27} = protocol:string(_B26),
    {V1_zone_id2, _B28} = protocol:int16(_B27),
    {V1_second_name, _B29} = protocol:string(_B28),
    {V1_second_lev, _B30} = protocol:uint16(_B29),
    {V1_second_classes, _B31} = protocol:uint8(_B30),
    {V1_second_sex, _B32} = protocol:uint8(_B31),
    {V1_second_looks, _B39} = protocol:array(_B32,
                                             fun (_B33) ->
                                                     {V2_looks_type2, _B34} =
                                                         protocol:uint32(_B33),
                                                     {V2_looks_mode2, _B35} =
                                                         protocol:uint32(_B34),
                                                     {V2_looks_val2, _B36} =
                                                         protocol:uint32(_B35),
                                                     {V2_looks_str2, _B37} =
                                                         protocol:string(_B36),
                                                     {{V2_looks_type2,
                                                       V2_looks_mode2,
                                                       V2_looks_val2,
                                                       V2_looks_str2},
                                                      _B37}
                                             end),
    {V1_chesses, _B47} = protocol:array(_B39,
                                        fun (_B40) ->
                                                {V2_x, _B41} =
                                                    protocol:uint8(_B40),
                                                {V2_y, _B42} =
                                                    protocol:uint8(_B41),
                                                {V2_camp, _B43} =
                                                    protocol:uint8(_B42),
                                                {V2_grade, _B44} =
                                                    protocol:uint8(_B43),
                                                {V2_status, _B45} =
                                                    protocol:uint8(_B44),
                                                {{V2_x,
                                                  V2_y,
                                                  V2_camp,
                                                  V2_grade,
                                                  V2_status},
                                                 _B45}
                                        end),
    {V1_second_grade, _B48} = protocol:uint16(_B47),
    {V1_second_score, _B49} = protocol:uint32(_B48),
    {ok,
     {V1_round,
      V1_time,
      V1_next_move,
      V1_draw_list,
      V1_role_id1,
      V1_platform1,
      V1_zone_id1,
      V1_first_name,
      V1_first_lev,
      V1_first_classes,
      V1_first_sex,
      V1_first_looks,
      V1_first_grade,
      V1_first_score,
      V1_role_id2,
      V1_platform2,
      V1_zone_id2,
      V1_second_name,
      V1_second_lev,
      V1_second_classes,
      V1_second_sex,
      V1_second_looks,
      V1_chesses,
      V1_second_grade,
      V1_second_score}};
unpack(srv, 17849, _B0) ->
    {V1_start_x, _B1} = protocol:uint8(_B0),
    {V1_start_y, _B2} = protocol:uint8(_B1),
    {V1_end_x, _B3} = protocol:uint8(_B2),
    {V1_end_y, _B4} = protocol:uint8(_B3),
    {ok, {V1_start_x, V1_start_y, V1_end_x, V1_end_y}};
unpack(cli, 17849, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17850, _B0) -> {ok, {}};
unpack(cli, 17850, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17851, _B0) -> {ok, {}};
unpack(cli, 17851, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {V1_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_times, V1_status, V1_time}};
unpack(srv, 17852, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 17852, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17853, _B0) -> {ok, {}};
unpack(cli, 17853, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_grade, _B2} = protocol:uint16(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_reward, _B9} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_base_id, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_bind, _B6} =
                                                  protocol:uint8(_B5),
                                              {V2_num, _B7} =
                                                  protocol:uint32(_B6),
                                              {{V2_base_id, V2_bind, V2_num},
                                               _B7}
                                      end),
    {ok, {V1_flag, V1_grade, V1_score, V1_reward}};
unpack(srv, 17854, _B0) -> {ok, {}};
unpack(cli, 17854, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17855, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 17855, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17856, _B0) -> {ok, {}};
unpack(cli, 17856, _B0) ->
    {V1_lev, _B1} = protocol:uint16(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {ok, {V1_lev, V1_score}};
unpack(srv, 17857, _B0) -> {ok, {}};
unpack(cli, 17857, _B0) -> {ok, {}};
unpack(srv, 17858, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 17858, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_rank_list, _B24} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_role_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_rank, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_platform, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_zone_id, _B6} =
                                                      protocol:uint16(_B5),
                                                  {V2_name, _B7} =
                                                      protocol:string(_B6),
                                                  {V2_sex, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_classes, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_lev, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_role_id2, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_platform2, _B12} =
                                                      protocol:string(_B11),
                                                  {V2_zone_id2, _B13} =
                                                      protocol:uint16(_B12),
                                                  {V2_name2, _B14} =
                                                      protocol:string(_B13),
                                                  {V2_sex2, _B15} =
                                                      protocol:uint8(_B14),
                                                  {V2_classes2, _B16} =
                                                      protocol:uint8(_B15),
                                                  {V2_lev2, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_val1, _B18} =
                                                      protocol:int32(_B17),
                                                  {V2_val2, _B19} =
                                                      protocol:int32(_B18),
                                                  {V2_val3, _B20} =
                                                      protocol:int32(_B19),
                                                  {V2_val4, _B21} =
                                                      protocol:int32(_B20),
                                                  {V2_desc, _B22} =
                                                      protocol:string(_B21),
                                                  {{V2_role_id,
                                                    V2_rank,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_lev,
                                                    V2_role_id2,
                                                    V2_platform2,
                                                    V2_zone_id2,
                                                    V2_name2,
                                                    V2_sex2,
                                                    V2_classes2,
                                                    V2_lev2,
                                                    V2_val1,
                                                    V2_val2,
                                                    V2_val3,
                                                    V2_val4,
                                                    V2_desc},
                                                   _B22}
                                          end),
    {ok, {V1_type, V1_rank_list}};
unpack(srv, 17859, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 17859, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_rank_list, _B23} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_role_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_platform, _B4} =
                                                      protocol:string(_B3),
                                                  {V2_zone_id, _B5} =
                                                      protocol:uint16(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:string(_B5),
                                                  {V2_sex, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_classes, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_lev, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_role_id2, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_platform2, _B11} =
                                                      protocol:string(_B10),
                                                  {V2_zone_id2, _B12} =
                                                      protocol:uint16(_B11),
                                                  {V2_name2, _B13} =
                                                      protocol:string(_B12),
                                                  {V2_sex2, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_classes2, _B15} =
                                                      protocol:uint8(_B14),
                                                  {V2_lev2, _B16} =
                                                      protocol:uint32(_B15),
                                                  {V2_val1, _B17} =
                                                      protocol:int32(_B16),
                                                  {V2_val2, _B18} =
                                                      protocol:int32(_B17),
                                                  {V2_val3, _B19} =
                                                      protocol:int32(_B18),
                                                  {V2_val4, _B20} =
                                                      protocol:int32(_B19),
                                                  {V2_desc, _B21} =
                                                      protocol:string(_B20),
                                                  {{V2_role_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_lev,
                                                    V2_role_id2,
                                                    V2_platform2,
                                                    V2_zone_id2,
                                                    V2_name2,
                                                    V2_sex2,
                                                    V2_classes2,
                                                    V2_lev2,
                                                    V2_val1,
                                                    V2_val2,
                                                    V2_val3,
                                                    V2_val4,
                                                    V2_desc},
                                                   _B21}
                                          end),
    {ok, {V1_type, V1_rank_list}};
unpack(srv, 17860, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 17860, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_list, _B5} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_val, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_val}, _B3}
                                    end),
    {ok, {V1_type, V1_list}};
unpack(srv, 17861, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_val, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_val}};
unpack(cli, 17861, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17862, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_count, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_count}};
unpack(cli, 17862, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_show, _B8} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_base_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_bind, _B5} =
                                                protocol:uint8(_B4),
                                            {V2_num, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_base_id, V2_bind, V2_num}, _B6}
                                    end),
    {ok, {V1_err_code, V1_msg, V1_show}};
unpack(srv, 17863, _B0) -> {ok, {}};
unpack(cli, 17863, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_times, _B3} =
                                                protocol:uint16(_B2),
                                            {{V2_id, V2_times}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 17864, _B0) -> {ok, {}};
unpack(cli, 17864, _B0) ->
    {V1_pos_list, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_pos, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_id, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_pos, V2_id}, _B3}
                                        end),
    {V1_list, _B9} = protocol:array(_B5,
                                    fun (_B6) ->
                                            {V2_id, _B7} = protocol:uint32(_B6),
                                            {{V2_id}, _B7}
                                    end),
    {V1_refresh_num, _B10} = protocol:uint32(_B9),
    {V1_open_num, _B11} = protocol:uint32(_B10),
    {ok,
     {V1_pos_list, V1_list, V1_refresh_num, V1_open_num}};
unpack(srv, 17865, _B0) -> {ok, {}};
unpack(cli, 17865, _B0) ->
    {V1_list, _B10} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_role_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:int16(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_item_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_bind, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_num, _B8} =
                                                 protocol:uint32(_B7),
                                             {{V2_role_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_item_id,
                                               V2_bind,
                                               V2_num},
                                              _B8}
                                     end),
    {ok, {V1_list}};
unpack(srv, 17866, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0),
    {ok, {V1_pos}};
unpack(cli, 17866, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B7} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_pos, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_id, _B5} = protocol:uint32(_B4),
                                            {{V2_pos, V2_id}, _B5}
                                    end),
    {ok, {V1_err_code, V1_msg, V1_list}};
unpack(srv, 17867, _B0) -> {ok, {}};
unpack(cli, 17867, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17868, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 17868, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_start_time, V1_end_time}};
unpack(srv, 17869, _B0) -> {ok, {}};
unpack(cli, 17869, _B0) ->
    {V1_day, _B1} = protocol:uint32(_B0),
    {V1_mtime, _B2} = protocol:uint32(_B1),
    {V1_list, _B6} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_id, _B4} = protocol:uint32(_B3),
                                            {{V2_id}, _B4}
                                    end),
    {ok, {V1_day, V1_mtime, V1_list}};
unpack(srv, 17870, _B0) ->
    {V1_target_day, _B1} = protocol:uint32(_B0),
    {ok, {V1_target_day}};
unpack(cli, 17870, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17871, _B0) -> {ok, {}};
unpack(cli, 17871, _B0) ->
    {V1_shop_list, _B28} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_isbuy, _B3} =
                                                      protocol:uint8(_B2),
                                                  {V2_num, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_item_list, _B11} =
                                                      protocol:array(_B5,
                                                                     fun
                                                                         (_B6) ->
                                                                             {V3_item_id,
                                                                              _B7} =
                                                                                 protocol:uint32(_B6),
                                                                             {V3_bind,
                                                                              _B8} =
                                                                                 protocol:uint32(_B7),
                                                                             {V3_num,
                                                                              _B9} =
                                                                                 protocol:uint32(_B8),
                                                                             {{V3_item_id,
                                                                               V3_bind,
                                                                               V3_num},
                                                                              _B9}
                                                                     end),
                                                  {V2_cost1, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_cost2, _B17} =
                                                      protocol:array(_B12,
                                                                     fun
                                                                         (_B13) ->
                                                                             {V3_item_id,
                                                                              _B14} =
                                                                                 protocol:uint32(_B13),
                                                                             {V3_num,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {{V3_item_id,
                                                                               V3_num},
                                                                              _B15}
                                                                     end),
                                                  {V2_limit_zone_num, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_show_effect, _B19} =
                                                      protocol:uint8(_B18),
                                                  {V2_show_item, _B25} =
                                                      protocol:array(_B19,
                                                                     fun
                                                                         (_B20) ->
                                                                             {V3_item_id,
                                                                              _B21} =
                                                                                 protocol:uint32(_B20),
                                                                             {V3_bind,
                                                                              _B22} =
                                                                                 protocol:uint32(_B21),
                                                                             {V3_num,
                                                                              _B23} =
                                                                                 protocol:uint32(_B22),
                                                                             {{V3_item_id,
                                                                               V3_bind,
                                                                               V3_num},
                                                                              _B23}
                                                                     end),
                                                  {V2_show_type, _B26} =
                                                      protocol:uint32(_B25),
                                                  {{V2_id,
                                                    V2_isbuy,
                                                    V2_num,
                                                    V2_id,
                                                    V2_item_list,
                                                    V2_cost1,
                                                    V2_cost2,
                                                    V2_limit_zone_num,
                                                    V2_show_effect,
                                                    V2_show_item,
                                                    V2_show_type},
                                                   _B26}
                                          end),
    {V1_ref_time, _B29} = protocol:uint32(_B28),
    {V1_ref_num, _B30} = protocol:uint32(_B29),
    {ok, {V1_shop_list, V1_ref_time, V1_ref_num}};
unpack(srv, 17872, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 17872, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17873, _B0) -> {ok, {}};
unpack(cli, 17873, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17874, _B0) -> {ok, {}};
unpack(cli, 17874, _B0) ->
    {V1_day, _B1} = protocol:uint32(_B0),
    {V1_bags_list, _B28} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_lev, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_item_list, _B11} =
                                                      protocol:array(_B4,
                                                                     fun
                                                                         (_B5) ->
                                                                             {V3_item_id,
                                                                              _B6} =
                                                                                 protocol:uint32(_B5),
                                                                             {V3_bind,
                                                                              _B7} =
                                                                                 protocol:uint8(_B6),
                                                                             {V3_num,
                                                                              _B8} =
                                                                                 protocol:uint32(_B7),
                                                                             {V3_eff,
                                                                              _B9} =
                                                                                 protocol:uint8(_B8),
                                                                             {{V3_item_id,
                                                                               V3_bind,
                                                                               V3_num,
                                                                               V3_eff},
                                                                              _B9}
                                                                     end),
                                                  {V2_item_gift_name, _B12} =
                                                      protocol:string(_B11),
                                                  {V2_item_gift_id, _B13} =
                                                      protocol:uint32(_B12),
                                                  {V2_cost, _B14} =
                                                      protocol:uint32(_B13),
                                                  {V2_max, _B15} =
                                                      protocol:uint32(_B14),
                                                  {V2_camp_max, _B16} =
                                                      protocol:uint32(_B15),
                                                  {V2_min_day, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_max_day, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_pre_id, _B19} =
                                                      protocol:uint32(_B18),
                                                  {V2_pre_num, _B20} =
                                                      protocol:uint32(_B19),
                                                  {V2_min_lev, _B21} =
                                                      protocol:uint32(_B20),
                                                  {V2_max_lev, _B22} =
                                                      protocol:uint32(_B21),
                                                  {V2_sex, _B23} =
                                                      protocol:uint8(_B22),
                                                  {V2_classes, _B24} =
                                                      protocol:uint8(_B23),
                                                  {V2_min_lev_break, _B25} =
                                                      protocol:uint32(_B24),
                                                  {V2_max_lev_break, _B26} =
                                                      protocol:uint32(_B25),
                                                  {{V2_lev,
                                                    V2_id,
                                                    V2_item_list,
                                                    V2_item_gift_name,
                                                    V2_item_gift_id,
                                                    V2_cost,
                                                    V2_max,
                                                    V2_camp_max,
                                                    V2_min_day,
                                                    V2_max_day,
                                                    V2_pre_id,
                                                    V2_pre_num,
                                                    V2_min_lev,
                                                    V2_max_lev,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_min_lev_break,
                                                    V2_max_lev_break},
                                                   _B26}
                                          end),
    {ok, {V1_day, V1_bags_list}};
unpack(srv, 17875, _B0) -> {ok, {}};
unpack(cli, 17875, _B0) ->
    {V1_card_list, _B13} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_flag, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_group, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_reward_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_item_id, _B9} =
                                                      protocol:array(_B4,
                                                                     fun
                                                                         (_B5) ->
                                                                             {V3_id,
                                                                              _B6} =
                                                                                 protocol:uint32(_B5),
                                                                             {V3_num,
                                                                              _B7} =
                                                                                 protocol:uint32(_B6),
                                                                             {{V3_id,
                                                                               V3_num},
                                                                              _B7}
                                                                     end),
                                                  {V2_lev_low, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_effect, _B11} =
                                                      protocol:uint8(_B10),
                                                  {{V2_flag,
                                                    V2_group,
                                                    V2_reward_id,
                                                    V2_item_id,
                                                    V2_lev_low,
                                                    V2_effect},
                                                   _B11}
                                          end),
    {V1_times, _B14} = protocol:uint8(_B13),
    {V1_last_group, _B15} = protocol:uint32(_B14),
    {V1_act_cost, _B24} = protocol:array(_B15,
                                         fun (_B16) ->
                                                 {V2_acticity, _B17} =
                                                     protocol:uint32(_B16),
                                                 {V2_cost, _B22} =
                                                     protocol:array(_B17,
                                                                    fun
                                                                        (_B18) ->
                                                                            {V3_id,
                                                                             _B19} =
                                                                                protocol:uint32(_B18),
                                                                            {V3_num,
                                                                             _B20} =
                                                                                protocol:uint32(_B19),
                                                                            {{V3_id,
                                                                              V3_num},
                                                                             _B20}
                                                                    end),
                                                 {{V2_acticity, V2_cost}, _B22}
                                         end),
    {V1_start_time, _B25} = protocol:uint32(_B24),
    {V1_end_time, _B26} = protocol:uint32(_B25),
    {ok,
     {V1_card_list,
      V1_times,
      V1_last_group,
      V1_act_cost,
      V1_start_time,
      V1_end_time}};
unpack(srv, 17876, _B0) -> {ok, {}};
unpack(cli, 17876, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17877, _B0) ->
    {V1_order, _B1} = protocol:uint32(_B0),
    {ok, {V1_order}};
unpack(cli, 17877, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17878, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(cli, 17878, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17879, _B0) -> {ok, {}};
unpack(cli, 17879, _B0) ->
    {V1_list, _B12} = protocol:array(_B0,
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
                                                 protocol:uint32(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_lev, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_msg, _B9} =
                                                 protocol:string(_B8),
                                             {V2_head_id, _B10} =
                                                 protocol:uint32(_B9),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_msg,
                                               V2_head_id},
                                              _B10}
                                     end),
    {ok, {V1_list}};
unpack(srv, 17880, _B0) -> {ok, {}};
unpack(cli, 17880, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_other_name, _B4} = protocol:string(_B3),
    {V1_other_sex, _B5} = protocol:uint8(_B4),
    {V1_other_classes, _B6} = protocol:uint8(_B5),
    {V1_status, _B7} = protocol:uint8(_B6),
    {V1_reward, _B14} = protocol:array(_B7,
                                       fun (_B8) ->
                                               {V2_id, _B9} =
                                                   protocol:uint32(_B8),
                                               {V2_is_bind, _B10} =
                                                   protocol:uint8(_B9),
                                               {V2_num, _B11} =
                                                   protocol:uint32(_B10),
                                               {V2_is_effet, _B12} =
                                                   protocol:uint8(_B11),
                                               {{V2_id,
                                                 V2_is_bind,
                                                 V2_num,
                                                 V2_is_effet},
                                                _B12}
                                       end),
    {V1_point, _B15} = protocol:uint32(_B14),
    {V1_lev, _B16} = protocol:uint32(_B15),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_other_name,
      V1_other_sex,
      V1_other_classes,
      V1_status,
      V1_reward,
      V1_point,
      V1_lev}};
unpack(srv, 17881, _B0) -> {ok, {}};
unpack(cli, 17881, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17882, _B0) -> {ok, {}};
unpack(cli, 17882, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17883, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {ok, {V1_days}};
unpack(cli, 17883, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {V1_reg_point, _B2} = protocol:uint32(_B1),
    {V1_rd_times, _B3} = protocol:uint32(_B2),
    {V1_rd_reward, _B14} = protocol:array(_B3,
                                          fun (_B4) ->
                                                  {V2_group_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_item_id, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_is_bind, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_num, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_weight, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_index, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_is_effet, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_is_random, _B12} =
                                                      protocol:uint8(_B11),
                                                  {{V2_group_id,
                                                    V2_item_id,
                                                    V2_is_bind,
                                                    V2_num,
                                                    V2_weight,
                                                    V2_index,
                                                    V2_is_effet,
                                                    V2_is_random},
                                                   _B12}
                                          end),
    {V1_box_reward, _B27} = protocol:array(_B14,
                                           fun (_B15) ->
                                                   {V2_box_id, _B16} =
                                                       protocol:uint32(_B15),
                                                   {V2_need_point, _B17} =
                                                       protocol:uint32(_B16),
                                                   {V2_box_reward, _B24} =
                                                       protocol:array(_B17,
                                                                      fun
                                                                          (_B18) ->
                                                                              {V3_item_id,
                                                                               _B19} =
                                                                                  protocol:uint32(_B18),
                                                                              {V3_is_bind,
                                                                               _B20} =
                                                                                  protocol:uint8(_B19),
                                                                              {V3_num,
                                                                               _B21} =
                                                                                  protocol:uint32(_B20),
                                                                              {V3_is_effet,
                                                                               _B22} =
                                                                                  protocol:uint8(_B21),
                                                                              {{V3_item_id,
                                                                                V3_is_bind,
                                                                                V3_num,
                                                                                V3_is_effet},
                                                                               _B22}
                                                                      end),
                                                   {V2_is_reward, _B25} =
                                                       protocol:uint8(_B24),
                                                   {{V2_box_id,
                                                     V2_need_point,
                                                     V2_box_reward,
                                                     V2_is_reward},
                                                    _B25}
                                           end),
    {V1_random_cost, _B32} = protocol:array(_B27,
                                            fun (_B28) ->
                                                    {V2_item_id, _B29} =
                                                        protocol:uint32(_B28),
                                                    {V2_num, _B30} =
                                                        protocol:uint32(_B29),
                                                    {{V2_item_id, V2_num}, _B30}
                                            end),
    {ok,
     {V1_days,
      V1_reg_point,
      V1_rd_times,
      V1_rd_reward,
      V1_box_reward,
      V1_random_cost}};
unpack(srv, 17884, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {ok, {V1_days}};
unpack(cli, 17884, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {V1_index, _B2} = protocol:uint32(_B1),
    {V1_err_code, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_days, V1_index, V1_err_code, V1_msg}};
unpack(srv, 17885, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {ok, {V1_days}};
unpack(cli, 17885, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {V1_item_list, _B7} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_item_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_is_bind, _B4} =
                                                     protocol:uint8(_B3),
                                                 {V2_num, _B5} =
                                                     protocol:uint32(_B4),
                                                 {{V2_item_id,
                                                   V2_is_bind,
                                                   V2_num},
                                                  _B5}
                                         end),
    {V1_err_code, _B8} = protocol:uint8(_B7),
    {V1_msg, _B9} = protocol:string(_B8),
    {ok, {V1_days, V1_item_list, V1_err_code, V1_msg}};
unpack(srv, 17886, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {V1_box_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_days, V1_box_id}};
unpack(cli, 17886, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {V1_box_id, _B2} = protocol:uint32(_B1),
    {V1_err_code, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_days, V1_box_id, V1_err_code, V1_msg}};
unpack(srv, 17887, _B0) -> {ok, {}};
unpack(cli, 17887, _B0) ->
    {V1_curdays, _B1} = protocol:uint32(_B0),
    {ok, {V1_curdays}};
unpack(srv, 17888, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {ok, {V1_days}};
unpack(cli, 17888, _B0) ->
    {V1_days, _B1} = protocol:uint32(_B0),
    {V1_times, _B2} = protocol:uint32(_B1),
    {V1_max_times, _B3} = protocol:uint32(_B2),
    {V1_gift_name, _B4} = protocol:string(_B3),
    {V1_old_price, _B5} = protocol:uint32(_B4),
    {V1_now_price, _B6} = protocol:uint32(_B5),
    {V1_reward, _B13} = protocol:array(_B6,
                                       fun (_B7) ->
                                               {V2_item_id, _B8} =
                                                   protocol:uint32(_B7),
                                               {V2_is_bind, _B9} =
                                                   protocol:uint8(_B8),
                                               {V2_num, _B10} =
                                                   protocol:uint32(_B9),
                                               {V2_is_effet, _B11} =
                                                   protocol:uint8(_B10),
                                               {{V2_item_id,
                                                 V2_is_bind,
                                                 V2_num,
                                                 V2_is_effet},
                                                _B11}
                                       end),
    {V1_fashion, _B18} = protocol:array(_B13,
                                        fun (_B14) ->
                                                {V2_partt_id, _B15} =
                                                    protocol:uint32(_B14),
                                                {V2_partt_val, _B16} =
                                                    protocol:uint32(_B15),
                                                {{V2_partt_id, V2_partt_val},
                                                 _B16}
                                        end),
    {V1_show_item, _B25} = protocol:array(_B18,
                                          fun (_B19) ->
                                                  {V2_item_id, _B20} =
                                                      protocol:uint32(_B19),
                                                  {V2_is_bind, _B21} =
                                                      protocol:uint8(_B20),
                                                  {V2_num, _B22} =
                                                      protocol:uint32(_B21),
                                                  {V2_is_effet, _B23} =
                                                      protocol:uint8(_B22),
                                                  {{V2_item_id,
                                                    V2_is_bind,
                                                    V2_num,
                                                    V2_is_effet},
                                                   _B23}
                                          end),
    {ok,
     {V1_days,
      V1_times,
      V1_max_times,
      V1_gift_name,
      V1_old_price,
      V1_now_price,
      V1_reward,
      V1_fashion,
      V1_show_item}};
unpack(srv, 17889, _B0) -> {ok, {}};
unpack(cli, 17889, _B0) ->
    {V1_curdays, _B1} = protocol:uint32(_B0),
    {ok, {V1_curdays}};
unpack(srv, 17890, _B0) -> {ok, {}};
unpack(cli, 17890, _B0) ->
    {V1_login_reward_state, _B1} = protocol:uint32(_B0),
    {V1_final_reward_state, _B2} = protocol:uint32(_B1),
    {V1_send_red_dot, _B3} = protocol:uint32(_B2),
    {V1_roll_cost, _B4} = protocol:uint32(_B3),
    {V1_flowers_info, _B10} = protocol:array(_B4,
                                             fun (_B5) ->
                                                     {V2_id, _B6} =
                                                         protocol:uint32(_B5),
                                                     {V2_index, _B7} =
                                                         protocol:uint32(_B6),
                                                     {V2_num, _B8} =
                                                         protocol:uint32(_B7),
                                                     {{V2_id, V2_index, V2_num},
                                                      _B8}
                                             end),
    {ok,
     {V1_login_reward_state,
      V1_final_reward_state,
      V1_send_red_dot,
      V1_roll_cost,
      V1_flowers_info}};
unpack(srv, 17891, _B0) -> {ok, {}};
unpack(cli, 17891, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {V1_err_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_index, V1_err_code, V1_msg}};
unpack(srv, 17892, _B0) -> {ok, {}};
unpack(cli, 17892, _B0) ->
    {V1_item_list, _B6} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_index, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_num, _B4} =
                                                     protocol:uint32(_B3),
                                                 {{V2_id, V2_index, V2_num},
                                                  _B4}
                                         end),
    {V1_gift_list, _B11} = protocol:array(_B6,
                                          fun (_B7) ->
                                                  {V2_item_id, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_num, _B9} =
                                                      protocol:uint32(_B8),
                                                  {{V2_item_id, V2_num}, _B9}
                                          end),
    {V1_err_code, _B12} = protocol:uint8(_B11),
    {V1_msg, _B13} = protocol:string(_B12),
    {ok, {V1_item_list, V1_gift_list, V1_err_code, V1_msg}};
unpack(srv, 17893, _B0) -> {ok, {}};
unpack(cli, 17893, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17894, _B0) -> {ok, {}};
unpack(cli, 17894, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {V1_err_code, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_base_id, V1_num, V1_err_code, V1_msg}};
unpack(srv, 17895, _B0) -> {ok, {}};
unpack(cli, 17895, _B0) ->
    {V1_box_info, _B9} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_index, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_base_id, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_num, _B4} =
                                                    protocol:uint32(_B3),
                                                {V2_old_price, _B5} =
                                                    protocol:uint32(_B4),
                                                {V2_price, _B6} =
                                                    protocol:uint32(_B5),
                                                {V2_is_get, _B7} =
                                                    protocol:uint32(_B6),
                                                {{V2_index,
                                                  V2_base_id,
                                                  V2_num,
                                                  V2_old_price,
                                                  V2_price,
                                                  V2_is_get},
                                                 _B7}
                                        end),
    {ok, {V1_box_info}};
unpack(srv, 17896, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_list, _B8} = protocol:array(_B3,
                                    fun (_B4) ->
                                            {V2_id, _B5} = protocol:uint32(_B4),
                                            {V2_num, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_id, V2_num}, _B6}
                                    end),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_list}};
unpack(cli, 17896, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 17897, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {ok, {V1_index}};
unpack(cli, 17897, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 17898, _B0) -> {ok, {}};
unpack(cli, 17898, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_num, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_id, V2_num}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 17899, _B0) -> {ok, {}};
unpack(cli, 17899, _B0) ->
    {V1_map_num, _B5} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_map_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_num, _B3} =
                                                   protocol:uint32(_B2),
                                               {{V2_map_id, V2_num}, _B3}
                                       end),
    {V1_camp_unit, _B14} = protocol:array(_B5,
                                          fun (_B6) ->
                                                  {V2_battle_id, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_id, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_map_id, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_base_id, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_x, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_y, _B12} =
                                                      protocol:uint32(_B11),
                                                  {{V2_battle_id,
                                                    V2_id,
                                                    V2_map_id,
                                                    V2_base_id,
                                                    V2_x,
                                                    V2_y},
                                                   _B12}
                                          end),
    {ok, {V1_map_num, V1_camp_unit}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

