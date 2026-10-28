-file("src/proto/proto_204.erl", 1).

-module(proto_204).

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

-file("src/proto/proto_204.erl", 14).

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

-file("src/proto/proto_204.erl", 15).

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

-file("src/proto/proto_204.erl", 16).

-file("inc/camp_fashion_vote.hrl", 1).

-author("jia").

-record(camp_fashion_vote_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         zone_name = "",
         vote_times = 0,
         voted_times = 0,
         invite_votes = 0,
         reply_invites = 0,
         update_time = 0,
         vote_groups = []}).

-record(camp_fashion_vote_group,
        {group_id = 0,
         vote_list = [],
         vote_num = 0,
         vote_time = 0}).

-record(camp_fashion_vote_lucky,
        {group_id = 0,
         lucky_list = [],
         vote_num = 0,
         vote_rate = 0}).

-record(camp_fashion_vote_invite,
        {invite_key = {{0, "", 0}, {0, "", 0}, 0},
         invite_id = {0, "", 0},
         replay_id = {0, "", 0},
         group_id = 0,
         invite_state = 1,
         invite_time = 0}).

-file("src/proto/proto_204.erl", 17).

-file("inc/camp_lucky_draw.hrl", 1).

-author("jia").

-record(camp_lucky_draw_reward_base,
        {group_id = 0,
         base_id = 0,
         bind = 0,
         num = 0,
         min_times = 0,
         is_free = 0,
         weight = 0,
         icon = "",
         min_lev = 0,
         max_lev = 0,
         sex = 2,
         classes = 0,
         is_record = 0,
         is_effect = 0,
         is_cast = 0,
         add_weight = 0,
         is_zone_cast = 0}).

-record(camp_lucky_draw_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 2,
         classes = 0,
         free_times = 0,
         draw_times = 0,
         update_time = 0}).

-record(camp_lucky_draw_info,
        {camp_id = 0, gold = 0, add_gold = 0, msg_list = []}).

-record(camp_lucky_draw_record_msg,
        {add_time = 0, msg = ""}).

-file("src/proto/proto_204.erl", 18).

-file("inc/camp_rushing_top.hrl", 1).

-author("jia").

-record(camp_rushing_top_season_info,
        {season_id = 0,
         cur_index = 0,
         total_index = 0,
         question_group = 0,
         option_a = 0,
         option_b = 0,
         option_c = 0,
         gold = 0,
         final_num = 0,
         final_roles = [],
         gain_gold = 0,
         last_num = 0}).

-record(camp_rushing_top_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         is_sign = 0,
         in_map = 0,
         index = 0,
         option = 0,
         is_lost = 0,
         sign_times = 0,
         final_times = 0,
         revive_times = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0}).

-record(camp_rushing_top_question_base,
        {question_group = 0,
         question_index = 0,
         question = "",
         option_a = "",
         option_b = "",
         option_c = "",
         answer = 0}).

-file("src/proto/proto_204.erl", 19).

-file("inc/camp_slot_machine.hrl", 1).

-record(m_camp_slot_machine,
        {ver = 1,
         camp_id = 0,
         guarantee = [],
         reward_times = 0,
         items = []}).

-record(camp_slot_machine_role,
        {id = {0, "", 0},
         name = "",
         items = [],
         time = 0,
         type = 0}).

-file("src/proto/proto_204.erl", 20).

-file("inc/camp_zillionaire.hrl", 1).

-record(m_camp_zillionaire,
        {ver = 1,
         camp_id = 0,
         grid_index = 0,
         times = 0,
         lucky_dice = 0,
         event_id = 0,
         ring_times = 0,
         ring_rewards = [],
         guarantee = []}).

-record(camp_zillionaire_event,
        {name = "", event_id = 0, items = []}).

-file("src/proto/proto_204.erl", 21).

-file("inc/camp_score_exchange.hrl", 1).

-author("Liyufei").

-record(m_camp_score_exchange,
        {ver = 1,
         camp_id = 0,
         day = 0,
         acc_score = 0,
         now_score = 0,
         owned_item = [],
         exchange_order = []}).

-record(camp_score_exchange_item,
        {id = 0,
         order_id = 0,
         item_id = 0,
         item_name = "",
         bind = 0,
         base_num = 0,
         exchange_num = 0,
         cost = 0,
         is_effect = 0,
         is_zone_cast = 0,
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0}).

-file("src/proto/proto_204.erl", 22).

-file("inc/camp_new_discount.hrl", 1).

-author("Suhan").

-record(camp_new_discount_config,
        {cost, item_id, bind, num, title, content}).

-record(m_camp_new_discount,
        {role_id, camp_id = 0, total_cost = 0, shop_info = []}).

-record(camp_new_discount_data,
        {id, item, price, left_num, total_num, show_effect}).

-record(camp_new_discount_shop_data,
        {day,
         id,
         item,
         cost,
         min_lev,
         max_lev,
         sex,
         classes,
         limit_role_num,
         show_effect}).

-file("src/proto/proto_204.erl", 23).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20400,
     {V0_tar_role_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_tar_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20400:16/little,
       D_a_t_a/binary>>};
pack(srv, 20400,
     {V0_tar_role_id,
      V0_platform,
      V0_zone_id,
      V0_rest_day,
      V0_price_info,
      V0_log_info,
      V0_can_help}) ->
    D_a_t_a = <<V0_tar_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_rest_day:32/little,
                (length(V0_price_info)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little,
                                   (length(V1_gift_info)):16/little,
                                   (list_to_binary([<<V2_item_id2:32/little,
                                                      V2_num2:32/little,
                                                      V2_spec_effects:32/little>>
                                                    || {V2_item_id2,
                                                        V2_num2,
                                                        V2_spec_effects}
                                                           <- V1_gift_info]))/binary,
                                   V1_type:32/little, V1_old_price:32/little,
                                   V1_price:32/little, V1_min_price:32/little,
                                   V1_buy_limit:8/little,
                                   V1_buy_already:8/little,
                                   (length(V1_change_price)):16/little,
                                   (list_to_binary([<<V2_change_price:32/little>>
                                                    || {V2_change_price}
                                                           <- V1_change_price]))/binary>>
                                 || {V1_item_id,
                                     V1_num,
                                     V1_gift_info,
                                     V1_type,
                                     V1_old_price,
                                     V1_price,
                                     V1_min_price,
                                     V1_buy_limit,
                                     V1_buy_already,
                                     V1_change_price}
                                        <- V0_price_info]))/binary,
                (length(V0_log_info)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_name))/binary,
                                   V1_tar_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_cut_price:32/little,
                                   V1_time:32/little>>
                                 || {V1_name,
                                     V1_tar_role_id,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_sex,
                                     V1_classes,
                                     V1_cut_price,
                                     V1_time}
                                        <- V0_log_info]))/binary,
                V0_can_help:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20400:16/little,
       D_a_t_a/binary>>};
pack(cli, 20401,
     {V0_tar_role_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_tar_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20401:16/little,
       D_a_t_a/binary>>};
pack(srv, 20401, {}) ->
    {ok, <<2:32/little, 20401:16/little>>};
pack(cli, 20402,
     {V0_tar_role_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_tar_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20402:16/little,
       D_a_t_a/binary>>};
pack(srv, 20402, {V0_result, V0_cut_price, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little, V0_cut_price:16/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20402:16/little,
       D_a_t_a/binary>>};
pack(cli, 20403, {V0_item_id}) ->
    D_a_t_a = <<V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20403:16/little,
       D_a_t_a/binary>>};
pack(srv, 20403, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20403:16/little,
       D_a_t_a/binary>>};
pack(cli, 20404, {}) ->
    {ok, <<2:32/little, 20404:16/little>>};
pack(srv, 20404, {V0_lucky_roles}) ->
    D_a_t_a = <<(length(V0_lucky_roles)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_name))/binary,
                                   (protocol:pack(string, V1_zone_name))/binary,
                                   V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_sex:8/little,
                                   V1_classes:8/little,
                                   V1_reward_time:32/little,
                                   V1_reward_item:32/little,
                                   V1_reward_num:32/little,
                                   V1_reward_rank:32/little>>
                                 || {V1_name,
                                     V1_zone_name,
                                     V1_role_id,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_sex,
                                     V1_classes,
                                     V1_reward_time,
                                     V1_reward_item,
                                     V1_reward_num,
                                     V1_reward_rank}
                                        <- V0_lucky_roles]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20404:16/little,
       D_a_t_a/binary>>};
pack(cli, 20405, {}) ->
    {ok, <<2:32/little, 20405:16/little>>};
pack(srv, 20405, {V0_state}) ->
    D_a_t_a = <<V0_state:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20405:16/little,
       D_a_t_a/binary>>};
pack(cli, 20406, {}) ->
    {ok, <<2:32/little, 20406:16/little>>};
pack(srv, 20406, {V0_gift_info}) ->
    D_a_t_a = <<(length(V0_gift_info)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_price:32/little, V1_num:32/little,
                                   (length(V1_spec_effect)):16/little,
                                   (list_to_binary([<<V2_item_id2:32/little,
                                                      V2_num2:32/little,
                                                      V2_spec_effects:32/little>>
                                                    || {V2_item_id2,
                                                        V2_num2,
                                                        V2_spec_effects}
                                                           <- V1_spec_effect]))/binary,
                                   (protocol:pack(string,
                                                  V1_content_name))/binary,
                                   (length(V1_promotion)):16/little,
                                   (list_to_binary([<<V2_cost_num:32/little,
                                                      V2_present_id:32/little,
                                                      V2_bound:32/little,
                                                      V2_present_num:32/little>>
                                                    || {V2_cost_num,
                                                        V2_present_id,
                                                        V2_bound,
                                                        V2_present_num}
                                                           <- V1_promotion]))/binary,
                                   V1_purchased_num:8/little>>
                                 || {V1_item_id,
                                     V1_name,
                                     V1_price,
                                     V1_num,
                                     V1_spec_effect,
                                     V1_content_name,
                                     V1_promotion,
                                     V1_purchased_num}
                                        <- V0_gift_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20406:16/little,
       D_a_t_a/binary>>};
pack(cli, 20407, {}) ->
    {ok, <<2:32/little, 20407:16/little>>};
pack(srv, 20407,
     {V0_result, V0_msg, V0_purchased_num}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_purchased_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20407:16/little,
       D_a_t_a/binary>>};
pack(cli, 20408, {V0_item_id, V0_num}) ->
    D_a_t_a = <<V0_item_id:32/little, V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20408:16/little,
       D_a_t_a/binary>>};
pack(srv, 20408, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20408:16/little,
       D_a_t_a/binary>>};
pack(cli, 20409, {}) ->
    {ok, <<2:32/little, 20409:16/little>>};
pack(srv, 20409,
     {V0_vote_times,
      V0_invite_votes,
      V0_vote_start_time,
      V0_show_start_time,
      V0_group,
      V0_vote_loss,
      V0_max_vote_reward,
      V0_max_reply,
      V0_max_reply_reward}) ->
    D_a_t_a = <<V0_vote_times:32/little,
                V0_invite_votes:32/little, V0_vote_start_time:32/little,
                V0_show_start_time:32/little,
                (length(V0_group)):16/little,
                (list_to_binary([<<V1_group_id:32/little,
                                   V1_set_id:32/little,
                                   (protocol:pack(string, V1_set_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   (length(V1_fashion)):16/little,
                                   (list_to_binary([<<V2_type:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_type, V2_value}
                                                           <- V1_fashion]))/binary,
                                   (length(V1_lucky_rewards)):16/little,
                                   (list_to_binary([<<V2_base_Id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little>>
                                                    || {V2_base_Id,
                                                        V2_bind,
                                                        V2_num}
                                                           <- V1_lucky_rewards]))/binary>>
                                 || {V1_group_id,
                                     V1_set_id,
                                     V1_set_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_fashion,
                                     V1_lucky_rewards}
                                        <- V0_group]))/binary,
                (length(V0_vote_loss)):16/little,
                (list_to_binary([<<V1_days:32/little,
                                   (length(V1_losst)):16/little,
                                   (list_to_binary([<<V2_l_base_Id:32/little,
                                                      V2_l_num:32/little>>
                                                    || {V2_l_base_Id, V2_l_num}
                                                           <- V1_losst]))/binary>>
                                 || {V1_days, V1_losst}
                                        <- V0_vote_loss]))/binary,
                V0_max_vote_reward:32/little, V0_max_reply:32/little,
                V0_max_reply_reward:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20409:16/little,
       D_a_t_a/binary>>};
pack(cli, 20410, {}) ->
    {ok, <<2:32/little, 20410:16/little>>};
pack(srv, 20410,
     {V0_vote_times,
      V0_invite_votes,
      V0_vote_group,
      V0_reply_invites,
      V0_have_votes}) ->
    D_a_t_a = <<V0_vote_times:32/little,
                V0_invite_votes:32/little,
                (length(V0_vote_group)):16/little,
                (list_to_binary([<<V1_group_id:32/little,
                                   V1_vote_num:32/little>>
                                 || {V1_group_id, V1_vote_num}
                                        <- V0_vote_group]))/binary,
                V0_reply_invites:32/little, V0_have_votes:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20410:16/little,
       D_a_t_a/binary>>};
pack(cli, 20411, {V0_group_id}) ->
    D_a_t_a = <<V0_group_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20411:16/little,
       D_a_t_a/binary>>};
pack(srv, 20411, {V0_group_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_group_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20411:16/little,
       D_a_t_a/binary>>};
pack(cli, 20412,
     {V0_group_id, V0_f_id, V0_f_platform, V0_f_zone_id}) ->
    D_a_t_a = <<V0_group_id:32/little, V0_f_id:32/little,
                (protocol:pack(string, V0_f_platform))/binary,
                V0_f_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20412:16/little,
       D_a_t_a/binary>>};
pack(srv, 20412,
     {V0_group_id,
      V0_f_id,
      V0_f_platform,
      V0_f_zone_id,
      V0_result,
      V0_msg}) ->
    D_a_t_a = <<V0_group_id:32/little, V0_f_id:32/little,
                (protocol:pack(string, V0_f_platform))/binary,
                V0_f_zone_id:16/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20412:16/little,
       D_a_t_a/binary>>};
pack(cli, 20413,
     {V0_group_id,
      V0_f_id,
      V0_f_platform,
      V0_f_zone_id,
      V0_invite_code}) ->
    D_a_t_a = <<V0_group_id:32/little, V0_f_id:32/little,
                (protocol:pack(string, V0_f_platform))/binary,
                V0_f_zone_id:16/little, V0_invite_code:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20413:16/little,
       D_a_t_a/binary>>};
pack(srv, 20413,
     {V0_group_id,
      V0_f_id,
      V0_f_platform,
      V0_f_zone_id,
      V0_result,
      V0_msg}) ->
    D_a_t_a = <<V0_group_id:32/little, V0_f_id:32/little,
                (protocol:pack(string, V0_f_platform))/binary,
                V0_f_zone_id:16/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20413:16/little,
       D_a_t_a/binary>>};
pack(cli, 20414, {}) ->
    {ok, <<2:32/little, 20414:16/little>>};
pack(srv, 20414, {V0_group}) ->
    D_a_t_a = <<(length(V0_group)):16/little,
                (list_to_binary([<<V1_group_id:32/little,
                                   (length(V1_lucky_list)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_zone_name))/binary,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_lev:32/little,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little>>
                                                    || {{V2_id,
                                                         V2_platform,
                                                         V2_zone_id},
                                                        V2_zone_name,
                                                        V2_name,
                                                        V2_lev,
                                                        V2_classes,
                                                        V2_sex}
                                                           <- V1_lucky_list]))/binary,
                                   V1_vote_num:32/little,
                                   V1_vote_rate:32/little>>
                                 || #camp_fashion_vote_lucky{group_id =
                                                                 V1_group_id,
                                                             lucky_list =
                                                                 V1_lucky_list,
                                                             vote_num =
                                                                 V1_vote_num,
                                                             vote_rate =
                                                                 V1_vote_rate}
                                        <- V0_group]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20414:16/little,
       D_a_t_a/binary>>};
pack(cli, 20415,
     {V0_group_id, V0_f_id, V0_f_platform, V0_f_zone_id}) ->
    D_a_t_a = <<V0_group_id:32/little, V0_f_id:32/little,
                (protocol:pack(string, V0_f_platform))/binary,
                V0_f_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20415:16/little,
       D_a_t_a/binary>>};
pack(srv, 20415,
     {V0_group_id,
      V0_f_id,
      V0_f_platform,
      V0_f_zone_id,
      V0_invite_state}) ->
    D_a_t_a = <<V0_group_id:32/little, V0_f_id:32/little,
                (protocol:pack(string, V0_f_platform))/binary,
                V0_f_zone_id:16/little, V0_invite_state:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20415:16/little,
       D_a_t_a/binary>>};
pack(cli, 20416, {}) ->
    {ok, <<2:32/little, 20416:16/little>>};
pack(srv, 20416, {V0_fashion_list}) ->
    D_a_t_a = <<(length(V0_fashion_list)):16/little,
                (list_to_binary([<<V1_goods_id:32/little,
                                   (length(V1_fashion_info)):16/little,
                                   (list_to_binary([<<V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      (protocol:pack(string,
                                                                     V2_plan_name))/binary,
                                                      (protocol:pack(string,
                                                                     V2_fashion_name))/binary,
                                                      V2_discount:8/little,
                                                      V2_origin_price:32/little,
                                                      V2_new_price:32/little,
                                                      (length(V2_fashion)):16/little,
                                                      (list_to_binary([<<V3_type:32/little,
                                                                         V3_value:32/little>>
                                                                       || {V3_type,
                                                                           V3_value}
                                                                              <- V2_fashion]))/binary>>
                                                    || {V2_sex,
                                                        V2_classes,
                                                        V2_plan_name,
                                                        V2_fashion_name,
                                                        V2_discount,
                                                        V2_origin_price,
                                                        V2_new_price,
                                                        V2_fashion}
                                                           <- V1_fashion_info]))/binary>>
                                 || {V1_goods_id, V1_fashion_info}
                                        <- V0_fashion_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20416:16/little,
       D_a_t_a/binary>>};
pack(cli, 20417, {V0_plan_id, V0_num, V0_sex}) ->
    D_a_t_a = <<V0_plan_id:32/little, V0_num:8/little,
                V0_sex:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20417:16/little,
       D_a_t_a/binary>>};
pack(srv, 20417, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20417:16/little,
       D_a_t_a/binary>>};
pack(cli, 20418, {}) ->
    {ok, <<2:32/little, 20418:16/little>>};
pack(srv, 20418,
     {V0_max_draw,
      V0_tips_msg,
      V0_draw_loss,
      V0_reward_list}) ->
    D_a_t_a = <<V0_max_draw:32/little,
                (protocol:pack(string, V0_tips_msg))/binary,
                (length(V0_draw_loss)):16/little,
                (list_to_binary([<<V1_loss_id:32/little,
                                   V1_l_num:32/little>>
                                 || {V1_loss_id, V1_l_num}
                                        <- V0_draw_loss]))/binary,
                (length(V0_reward_list)):16/little,
                (list_to_binary([<<V1_group_id:32/little,
                                   (protocol:pack(string, V1_icon))/binary,
                                   (length(V1_draw_reward)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_is_effect:8/little>>
                                                    || {V2_base_id,
                                                        V2_bind,
                                                        V2_num,
                                                        V2_is_effect}
                                                           <- V1_draw_reward]))/binary>>
                                 || {V1_group_id, V1_icon, V1_draw_reward}
                                        <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20418:16/little,
       D_a_t_a/binary>>};
pack(cli, 20419, {}) ->
    {ok, <<2:32/little, 20419:16/little>>};
pack(srv, 20419,
     {V0_free_times,
      V0_draw_times,
      V0_cur_gold,
      V0_record_msg}) ->
    D_a_t_a = <<V0_free_times:32/little,
                V0_draw_times:32/little, V0_cur_gold:32/little,
                (length(V0_record_msg)):16/little,
                (list_to_binary([<<V1_add_time:32/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || #camp_lucky_draw_record_msg{add_time =
                                                                    V1_add_time,
                                                                msg = V1_msg}
                                        <- V0_record_msg]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20419:16/little,
       D_a_t_a/binary>>};
pack(cli, 20420, {V0_draw_num}) ->
    D_a_t_a = <<V0_draw_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20420:16/little,
       D_a_t_a/binary>>};
pack(srv, 20420,
     {V0_result,
      V0_msg,
      V0_draw_num,
      V0_draw_reward,
      V0_group_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_draw_num:32/little,
                (length(V0_draw_reward)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little,
                                   V1_is_effect:8/little>>
                                 || {V1_base_id, V1_bind, V1_num, V1_is_effect}
                                        <- V0_draw_reward]))/binary,
                V0_group_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20420:16/little,
       D_a_t_a/binary>>};
pack(cli, 20421, {}) ->
    {ok, <<2:32/little, 20421:16/little>>};
pack(srv, 20421,
     {V0_gold_item,
      V0_ticket,
      V0_revive,
      V0_min_lev,
      V0_rude,
      V0_info,
      V0_question_time,
      V0_answer_time,
      V0_notice_time,
      V0_max_revive,
      V0_first_time}) ->
    D_a_t_a = <<(length(V0_gold_item)):16/little,
                (list_to_binary([<<V1_g_base_id:32/little,
                                   V1_g_num:32/little>>
                                 || {V1_g_base_id, V1_g_num}
                                        <- V0_gold_item]))/binary,
                (length(V0_ticket)):16/little,
                (list_to_binary([<<V1_t_base_id:32/little,
                                   V1_t_num:32/little>>
                                 || {V1_t_base_id, V1_t_num}
                                        <- V0_ticket]))/binary,
                (length(V0_revive)):16/little,
                (list_to_binary([<<V1_r_base_id:32/little,
                                   V1_r_num:32/little>>
                                 || {V1_r_base_id, V1_r_num}
                                        <- V0_revive]))/binary,
                V0_min_lev:32/little,
                (protocol:pack(string, V0_rude))/binary,
                (protocol:pack(string, V0_info))/binary,
                V0_question_time:32/little, V0_answer_time:32/little,
                V0_notice_time:32/little, V0_max_revive:32/little,
                V0_first_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20421:16/little,
       D_a_t_a/binary>>};
pack(cli, 20422, {}) ->
    {ok, <<2:32/little, 20422:16/little>>};
pack(srv, 20422, {V0_state_code, V0_timeout}) ->
    D_a_t_a = <<V0_state_code:8/little,
                V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20422:16/little,
       D_a_t_a/binary>>};
pack(cli, 20423, {}) ->
    {ok, <<2:32/little, 20423:16/little>>};
pack(srv, 20423, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20423:16/little,
       D_a_t_a/binary>>};
pack(cli, 20424, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20424:16/little,
       D_a_t_a/binary>>};
pack(srv, 20424, {V0_type, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_type:8/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20424:16/little,
       D_a_t_a/binary>>};
pack(cli, 20425, {}) ->
    {ok, <<2:32/little, 20425:16/little>>};
pack(srv, 20425,
     {#camp_rushing_top_question_base{question_index =
                                          V0_question_index,
                                      question = V0_question,
                                      option_a = V0_option_a,
                                      option_b = V0_option_b,
                                      option_c = V0_option_c},
      V0_stop_time,
      V0_role_num}) ->
    D_a_t_a = <<V0_question_index:32/little,
                (protocol:pack(string, V0_question))/binary,
                (protocol:pack(string, V0_option_a))/binary,
                (protocol:pack(string, V0_option_b))/binary,
                (protocol:pack(string, V0_option_c))/binary,
                V0_stop_time:32/little, V0_role_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20425:16/little,
       D_a_t_a/binary>>};
pack(cli, 20426, {V0_index, V0_option}) ->
    D_a_t_a = <<V0_index:32/little, V0_option:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20426:16/little,
       D_a_t_a/binary>>};
pack(srv, 20426, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20426:16/little,
       D_a_t_a/binary>>};
pack(cli, 20427, {}) ->
    {ok, <<2:32/little, 20427:16/little>>};
pack(srv, 20427,
     {V0_question_index,
      V0_option_a,
      V0_option_b,
      V0_option_c,
      V0_answer,
      V0_option,
      V0_last_num}) ->
    D_a_t_a = <<V0_question_index:32/little,
                V0_option_a:32/little, V0_option_b:32/little,
                V0_option_c:32/little, V0_answer:8/little,
                V0_option:8/little, V0_last_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20427:16/little,
       D_a_t_a/binary>>};
pack(cli, 20428, {}) ->
    {ok, <<2:32/little, 20428:16/little>>};
pack(srv, 20428, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20428:16/little,
       D_a_t_a/binary>>};
pack(cli, 20429, {}) ->
    {ok, <<2:32/little, 20429:16/little>>};
pack(srv, 20429,
     {V0_sign,
      V0_revive_times,
      V0_sys_barrage,
      V0_ply_barrage,
      V0_barrage_time,
      V0_final_times,
      V0_sign_times,
      V0_is_lost,
      V0_in_map,
      V0_index}) ->
    D_a_t_a = <<V0_sign:8/little, V0_revive_times:32/little,
                V0_sys_barrage:32/little, V0_ply_barrage:32/little,
                V0_barrage_time:32/little, V0_final_times:32/little,
                V0_sign_times:32/little, V0_is_lost:8/little,
                V0_in_map:8/little, V0_index:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20429:16/little,
       D_a_t_a/binary>>};
pack(cli, 20430, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20430:16/little,
       D_a_t_a/binary>>};
pack(srv, 20430, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20430:16/little,
       D_a_t_a/binary>>};
pack(cli, 20431, {V0_type, V0_value}) ->
    D_a_t_a = <<V0_type:32/little, V0_value:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20431:16/little,
       D_a_t_a/binary>>};
pack(srv, 20431,
     {V0_type, V0_value, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_type:32/little, V0_value:8/little,
                V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20431:16/little,
       D_a_t_a/binary>>};
pack(cli, 20432, {}) ->
    {ok, <<2:32/little, 20432:16/little>>};
pack(srv, 20432, {V0_index, V0_option, V0_answer}) ->
    D_a_t_a = <<V0_index:32/little, V0_option:8/little,
                V0_answer:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20432:16/little,
       D_a_t_a/binary>>};
pack(cli, 20433, {}) ->
    {ok, <<2:32/little, 20433:16/little>>};
pack(srv, 20433,
     {#camp_rushing_top_question_base{question_index =
                                          V0_question_index,
                                      question = V0_question,
                                      option_a = V0_option_a,
                                      option_b = V0_option_b,
                                      option_c = V0_option_c},
      V0_stop_time,
      V0_role_num,
      V0_option,
      V0_answer}) ->
    D_a_t_a = <<V0_question_index:32/little,
                (protocol:pack(string, V0_question))/binary,
                (protocol:pack(string, V0_option_a))/binary,
                (protocol:pack(string, V0_option_b))/binary,
                (protocol:pack(string, V0_option_c))/binary,
                V0_stop_time:32/little, V0_role_num:32/little,
                V0_option:8/little, V0_answer:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20433:16/little,
       D_a_t_a/binary>>};
pack(cli, 20434, {V0_num}) ->
    D_a_t_a = <<V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20434:16/little,
       D_a_t_a/binary>>};
pack(srv, 20434, {V0_flag, V0_msg, V0_result}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_result)):16/little,
                (list_to_binary([<<V1_times:8/little,
                                   (length(V1_items)):16/little,
                                   (list_to_binary([<<V2_index:8/little,
                                                      V2_item_id:32/little,
                                                      V2_item_num:32/little>>
                                                    || {V2_index,
                                                        V2_item_id,
                                                        V2_item_num}
                                                           <- V1_items]))/binary>>
                                 || {V1_times, V1_items}
                                        <- V0_result]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20434:16/little,
       D_a_t_a/binary>>};
pack(cli, 20435, {}) ->
    {ok, <<2:32/little, 20435:16/little>>};
pack(srv, 20435, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20435:16/little,
       D_a_t_a/binary>>};
pack(cli, 20436, {}) ->
    {ok, <<2:32/little, 20436:16/little>>};
pack(srv, 20436, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20436:16/little,
       D_a_t_a/binary>>};
pack(cli, 20437, {}) ->
    {ok, <<2:32/little, 20437:16/little>>};
pack(srv, 20437, {V0_flag, V0_msg, V0_result}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_result)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little,
                                   V1_is_effect:8/little,
                                   V1_base_num:32/little>>
                                 || {V1_base_id,
                                     V1_bind,
                                     V1_num,
                                     V1_is_effect,
                                     V1_base_num}
                                        <- V0_result]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20437:16/little,
       D_a_t_a/binary>>};
pack(cli, 20438, {}) ->
    {ok, <<2:32/little, 20438:16/little>>};
pack(srv, 20438, {V0_reward, V0_number}) ->
    D_a_t_a = <<(length(V0_reward)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_is_effect:8/little,
                                   V1_base_num:32/little>>
                                 || {V1_base_id, V1_is_effect, V1_base_num}
                                        <- V0_reward]))/binary,
                (length(V0_number)):16/little,
                (list_to_binary([<<V1_num:32/little>>
                                 || V1_num <- V0_number]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20438:16/little,
       D_a_t_a/binary>>};
pack(cli, 20439, {}) ->
    {ok, <<2:32/little, 20439:16/little>>};
pack(srv, 20439, {V0_quest, V0_sign}) ->
    D_a_t_a = <<(length(V0_quest)):16/little,
                (list_to_binary([<<V1_quest_id:32/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_base_id, V2_num}
                                                           <- V1_reward]))/binary,
                                   (protocol:pack(string, V1_icon))/binary,
                                   V1_value:32/little, V1_target_val:32/little,
                                   V1_quest_status:8/little,
                                   V1_quest_sort:8/little>>
                                 || {V1_quest_id,
                                     V1_reward,
                                     V1_icon,
                                     V1_value,
                                     V1_target_val,
                                     V1_quest_status,
                                     V1_quest_sort}
                                        <- V0_quest]))/binary,
                (length(V0_sign)):16/little,
                (list_to_binary([<<(length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_sign_base_id:32/little,
                                                      V2_sign_num:32/little>>
                                                    || {V2_sign_base_id,
                                                        V2_sign_num}
                                                           <- V1_reward]))/binary,
                                   V1_sign_status:8/little>>
                                 || {V1_reward, V1_sign_status}
                                        <- V0_sign]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20439:16/little,
       D_a_t_a/binary>>};
pack(cli, 20440, {}) ->
    {ok, <<2:32/little, 20440:16/little>>};
pack(srv, 20440, {V0_reward_info}) ->
    D_a_t_a = <<(length(V0_reward_info)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_name))/binary,
                                   V1_type:8/little,
                                   (length(V1_items)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_val:32/little>>
                                                    || {V2_item_id, V2_val}
                                                           <- V1_items]))/binary>>
                                 || #camp_slot_machine_role{name = V1_name,
                                                            type = V1_type,
                                                            items = V1_items}
                                        <- V0_reward_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20440:16/little,
       D_a_t_a/binary>>};
pack(cli, 20441, {}) ->
    {ok, <<2:32/little, 20441:16/little>>};
pack(srv, 20441, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_point:8/little,
                                   (length(V1_list)):16/little,
                                   (list_to_binary([<<V2_period:8/little,
                                                      V2_status:8/little,
                                                      V2_time_to_start:32/little,
                                                      V2_time_to_end:32/little>>
                                                    || {V2_period,
                                                        V2_status,
                                                        V2_time_to_start,
                                                        V2_time_to_end}
                                                           <- V1_list]))/binary>>
                                 || {V1_id, V1_point, V1_list}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20441:16/little,
       D_a_t_a/binary>>};
pack(cli, 20442, {V0_id, V0_period}) ->
    D_a_t_a = <<V0_id:8/little, V0_period:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20442:16/little,
       D_a_t_a/binary>>};
pack(srv, 20442, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20442:16/little,
       D_a_t_a/binary>>};
pack(cli, 20443, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20443:16/little,
       D_a_t_a/binary>>};
pack(srv, 20443, {}) ->
    {ok, <<2:32/little, 20443:16/little>>};
pack(cli, 20444, {}) ->
    {ok, <<2:32/little, 20444:16/little>>};
pack(srv, 20444,
     {#m_camp_zillionaire{grid_index = V0_grid_index,
                          times = V0_times, lucky_dice = V0_lucky_dice,
                          event_id = V0_event_id, ring_times = V0_ring_times,
                          ring_rewards = V0_ring_rewards}}) ->
    D_a_t_a = <<V0_grid_index:8/little, V0_times:32/little,
                V0_lucky_dice:8/little, V0_event_id:32/little,
                V0_ring_times:32/little,
                (length(V0_ring_rewards)):16/little,
                (list_to_binary([<<V1_times:32/little>>
                                 || V1_times <- V0_ring_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20444:16/little,
       D_a_t_a/binary>>};
pack(cli, 20445, {}) ->
    {ok, <<2:32/little, 20445:16/little>>};
pack(srv, 20445, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20445:16/little,
       D_a_t_a/binary>>};
pack(cli, 20446, {V0_result}) ->
    D_a_t_a = <<V0_result:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20446:16/little,
       D_a_t_a/binary>>};
pack(srv, 20446, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20446:16/little,
       D_a_t_a/binary>>};
pack(cli, 20447, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20447:16/little,
       D_a_t_a/binary>>};
pack(srv, 20447, {V0_flag, V0_msg, V0_event_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_event_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20447:16/little,
       D_a_t_a/binary>>};
pack(cli, 20448, {V0_ring_times}) ->
    D_a_t_a = <<V0_ring_times:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20448:16/little,
       D_a_t_a/binary>>};
pack(srv, 20448, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20448:16/little,
       D_a_t_a/binary>>};
pack(cli, 20449, {}) ->
    {ok, <<2:32/little, 20449:16/little>>};
pack(srv, 20449, {V0_camp_zillionaire_event}) ->
    D_a_t_a =
        <<(length(V0_camp_zillionaire_event)):16/little,
          (list_to_binary([<<(protocol:pack(string,
                                            V1_name))/binary,
                             V1_event_id:32/little,
                             (length(V1_items)):16/little,
                             (list_to_binary([<<V2_item_id:32/little,
                                                V2_val:32/little>>
                                              || {V2_item_id, V2_val}
                                                     <- V1_items]))/binary>>
                           || #camp_zillionaire_event{name = V1_name,
                                                      event_id = V1_event_id,
                                                      items = V1_items}
                                  <- V0_camp_zillionaire_event]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20449:16/little,
       D_a_t_a/binary>>};
pack(cli, 20450, {}) ->
    {ok, <<2:32/little, 20450:16/little>>};
pack(srv, 20450,
     {#m_camp_zillionaire{grid_index = V0_grid_index,
                          times = V0_times, lucky_dice = V0_lucky_dice,
                          ring_times = V0_ring_times,
                          ring_rewards = V0_ring_rewards}}) ->
    D_a_t_a = <<V0_grid_index:8/little, V0_times:32/little,
                V0_lucky_dice:8/little, V0_ring_times:32/little,
                (length(V0_ring_rewards)):16/little,
                (list_to_binary([<<V1_times:32/little>>
                                 || V1_times <- V0_ring_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20450:16/little,
       D_a_t_a/binary>>};
pack(cli, 20451, {}) ->
    {ok, <<2:32/little, 20451:16/little>>};
pack(srv, 20451,
     {V0_flower_info,
      V0_gift_flag,
      V0_finish_num,
      V0_rank}) ->
    D_a_t_a = <<(length(V0_flower_info)):16/little,
                (list_to_binary([<<V1_flower_id:32/little,
                                   V1_pass_flag:8/little,
                                   V1_pass_times:32/little>>
                                 || {V1_flower_id, V1_pass_flag, V1_pass_times}
                                        <- V0_flower_info]))/binary,
                V0_gift_flag:8/little, V0_finish_num:32/little,
                V0_rank:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20451:16/little,
       D_a_t_a/binary>>};
pack(cli, 20452, {V0_reward_type, V0_id}) ->
    D_a_t_a = <<V0_reward_type:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20452:16/little,
       D_a_t_a/binary>>};
pack(srv, 20452, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20452:16/little,
       D_a_t_a/binary>>};
pack(cli, 20453,
     {V0_flower_id, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_flower_id:32/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20453:16/little,
       D_a_t_a/binary>>};
pack(srv, 20453, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20453:16/little,
       D_a_t_a/binary>>};
pack(cli, 20454, {}) ->
    {ok, <<2:32/little, 20454:16/little>>};
pack(srv, 20454,
     {V0_name, V0_flower_id, V0_min, V0_flag}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                V0_flower_id:32/little, V0_min:32/little,
                V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20454:16/little,
       D_a_t_a/binary>>};
pack(cli, 20455, {V0_flower_id}) ->
    D_a_t_a = <<V0_flower_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20455:16/little,
       D_a_t_a/binary>>};
pack(srv, 20455, {V0_role}) ->
    D_a_t_a = <<(length(V0_role)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary>>
                                 || {V1_id, V1_platform, V1_zone_id, V1_name}
                                        <- V0_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20455:16/little,
       D_a_t_a/binary>>};
pack(cli, 20456, {}) ->
    {ok, <<2:32/little, 20456:16/little>>};
pack(srv, 20456, {V0_item_info, V0_rebate_info}) ->
    D_a_t_a = <<(length(V0_item_info)):16/little,
                (list_to_binary([<<V1_id:16/little,
                                   V1_item_id:32/little, V1_inner_num:32/little,
                                   (protocol:pack(string, V1_item_name))/binary,
                                   V1_price:16/little, V1_buy_limit:16/little,
                                   V1_buyed_num:16/little,
                                   V1_is_effect:8/little>>
                                 || {V1_id,
                                     V1_item_id,
                                     V1_inner_num,
                                     V1_item_name,
                                     V1_price,
                                     V1_buy_limit,
                                     V1_buyed_num,
                                     V1_is_effect}
                                        <- V0_item_info]))/binary,
                (length(V0_rebate_info)):16/little,
                (list_to_binary([<<V1_purchase_val:16/little,
                                   V1_rebate_val:16/little>>
                                 || {V1_purchase_val, V1_rebate_val}
                                        <- V0_rebate_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20456:16/little,
       D_a_t_a/binary>>};
pack(cli, 20457, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_buy_num:16/little>>
                                 || {V1_item_id, V1_buy_num}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20457:16/little,
       D_a_t_a/binary>>};
pack(srv, 20457, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20457:16/little,
       D_a_t_a/binary>>};
pack(cli, 20458, {}) ->
    {ok, <<2:32/little, 20458:16/little>>};
pack(srv, 20458, {V0_map_num}) ->
    D_a_t_a = <<(length(V0_map_num)):16/little,
                (list_to_binary([<<V1_map_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_map_id, V1_num}
                                        <- V0_map_num]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20458:16/little,
       D_a_t_a/binary>>};
pack(cli, 20459, {}) ->
    {ok, <<2:32/little, 20459:16/little>>};
pack(srv, 20459,
     {V0_now_times, V0_add_list, V0_last_reward}) ->
    D_a_t_a = <<V0_now_times:32/little,
                (length(V0_add_list)):16/little,
                (list_to_binary([<<V1_times:32/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_effect:8/little>>
                                                    || {V2_item_id,
                                                        V2_bind,
                                                        V2_num,
                                                        V2_effect}
                                                           <- V1_reward]))/binary>>
                                 || {V1_times, V1_reward}
                                        <- V0_add_list]))/binary,
                (length(V0_last_reward)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_bind:8/little, V1_num:32/little,
                                   V1_effect:8/little>>
                                 || {V1_item_id, V1_bind, V1_num, V1_effect}
                                        <- V0_last_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20459:16/little,
       D_a_t_a/binary>>};
pack(cli, 20460, {}) ->
    {ok, <<2:32/little, 20460:16/little>>};
pack(srv, 20460, {V0_special_items, V0_common_items}) ->
    D_a_t_a = <<(length(V0_special_items)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_order_id:8/little,
                                   V1_item_id:32/little, V1_base_num:8/little,
                                   V1_exchange_num:8/little, V1_cost:32/little,
                                   V1_is_effect:8/little>>
                                 || #camp_score_exchange_item{id = V1_id,
                                                              order_id =
                                                                  V1_order_id,
                                                              item_id =
                                                                  V1_item_id,
                                                              base_num =
                                                                  V1_base_num,
                                                              exchange_num =
                                                                  V1_exchange_num,
                                                              cost = V1_cost,
                                                              is_effect =
                                                                  V1_is_effect}
                                        <- V0_special_items]))/binary,
                (length(V0_common_items)):16/little,
                (list_to_binary([<<V1_order_id:8/little,
                                   V1_item_id:32/little, V1_base_num:8/little,
                                   V1_cost:32/little, V1_is_effect:8/little>>
                                 || #camp_score_exchange_item{order_id =
                                                                  V1_order_id,
                                                              item_id =
                                                                  V1_item_id,
                                                              base_num =
                                                                  V1_base_num,
                                                              cost = V1_cost,
                                                              is_effect =
                                                                  V1_is_effect}
                                        <- V0_common_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20460:16/little,
       D_a_t_a/binary>>};
pack(cli, 20461, {}) ->
    {ok, <<2:32/little, 20461:16/little>>};
pack(srv, 20461, {V0_quest}) ->
    D_a_t_a = <<(length(V0_quest)):16/little,
                (list_to_binary([<<V1_quest_id:32/little,
                                   V1_reward_val:32/little,
                                   (protocol:pack(string, V1_icon))/binary,
                                   V1_value:32/little, V1_target_val:32/little,
                                   V1_quest_status:8/little,
                                   V1_quest_sort:8/little>>
                                 || {V1_quest_id,
                                     V1_reward_val,
                                     V1_icon,
                                     V1_value,
                                     V1_target_val,
                                     V1_quest_status,
                                     V1_quest_sort}
                                        <- V0_quest]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20461:16/little,
       D_a_t_a/binary>>};
pack(cli, 20462, {V0_id, V0_order_id, V0_item_id}) ->
    D_a_t_a = <<V0_id:8/little, V0_order_id:8/little,
                V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20462:16/little,
       D_a_t_a/binary>>};
pack(srv, 20462, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20462:16/little,
       D_a_t_a/binary>>};
pack(cli, 20463, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20463:16/little,
       D_a_t_a/binary>>};
pack(srv, 20463, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20463:16/little,
       D_a_t_a/binary>>};
pack(cli, 20464, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20464:16/little,
       D_a_t_a/binary>>};
pack(srv, 20464, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20464:16/little,
       D_a_t_a/binary>>};
pack(cli, 20465, {}) ->
    {ok, <<2:32/little, 20465:16/little>>};
pack(srv, 20465,
     {V0_day, V0_need_cost, V0_shop_list}) ->
    D_a_t_a = <<V0_day:32/little, V0_need_cost:32/little,
                (length(V0_shop_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_item_id:32/little, V1_bind:8/little,
                                   V1_num:32/little, V1_price_item_id:32/little,
                                   V1_price_num:32/little,
                                   V1_left_num:32/little,
                                   V1_total_num:32/little,
                                   V1_show_effect:8/little>>
                                 || #camp_new_discount_data{id = V1_id,
                                                            item =
                                                                {V1_item_id,
                                                                 V1_bind,
                                                                 V1_num},
                                                            price =
                                                                {V1_price_item_id,
                                                                 V1_price_num},
                                                            left_num =
                                                                V1_left_num,
                                                            total_num =
                                                                V1_total_num,
                                                            show_effect =
                                                                V1_show_effect}
                                        <- V0_shop_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20465:16/little,
       D_a_t_a/binary>>};
pack(cli, 20466, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20466:16/little,
       D_a_t_a/binary>>};
pack(srv, 20466, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20466:16/little,
       D_a_t_a/binary>>};
pack(cli, 20467, {}) ->
    {ok, <<2:32/little, 20467:16/little>>};
pack(srv, 20467, {V0_plans, V0_collect_items}) ->
    D_a_t_a = <<(length(V0_plans)):16/little,
                (list_to_binary([<<V1_plan_id:32/little,
                                   (length(V1_items)):16/little,
                                   (list_to_binary([<<V2_item_base_id:32/little>>
                                                    || V2_item_base_id
                                                           <- V1_items]))/binary,
                                   V1_all_times:32/little, V1_times:32/little,
                                   V1_item_id:32/little, V1_base_num:32/little,
                                   V1_is_effect:8/little>>
                                 || {V1_plan_id,
                                     V1_items,
                                     V1_all_times,
                                     V1_times,
                                     V1_item_id,
                                     V1_base_num,
                                     V1_is_effect}
                                        <- V0_plans]))/binary,
                (length(V0_collect_items)):16/little,
                (list_to_binary([<<V1_collect_base_id:32/little>>
                                 || V1_collect_base_id
                                        <- V0_collect_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20467:16/little,
       D_a_t_a/binary>>};
pack(cli, 20468, {V0_plan_id}) ->
    D_a_t_a = <<V0_plan_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20468:16/little,
       D_a_t_a/binary>>};
pack(srv, 20468, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20468:16/little,
       D_a_t_a/binary>>};
pack(cli, 20469, {}) ->
    {ok, <<2:32/little, 20469:16/little>>};
pack(srv, 20469, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20469:16/little,
       D_a_t_a/binary>>};
pack(cli, 20470, {}) ->
    {ok, <<2:32/little, 20470:16/little>>};
pack(srv, 20470, {V0_reward_info}) ->
    D_a_t_a = <<(length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_recharge_day:8/little,
                                   (length(V1_items)):16/little,
                                   (list_to_binary([<<V2_item_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_client_effect:8/little>>
                                                    || {V2_item_base_id,
                                                        V2_bind,
                                                        V2_num,
                                                        V2_client_effect}
                                                           <- V1_items]))/binary,
                                   V1_lower:32/little, V1_v_item_id:32/little,
                                   V1_v_effect:8/little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || {V1_recharge_day,
                                     V1_items,
                                     V1_lower,
                                     V1_v_item_id,
                                     V1_v_effect,
                                     V1_desc}
                                        <- V0_reward_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20470:16/little,
       D_a_t_a/binary>>};
pack(cli, 20471, {}) ->
    {ok, <<2:32/little, 20471:16/little>>};
pack(srv, 20471,
     {V0_recharged_day,
      V0_rewarded_list,
      V0_recharged_val,
      V0_vision_day}) ->
    D_a_t_a = <<V0_recharged_day:8/little,
                (length(V0_rewarded_list)):16/little,
                (list_to_binary([<<V1_day_id:8/little>>
                                 || V1_day_id <- V0_rewarded_list]))/binary,
                V0_recharged_val:32/little, V0_vision_day:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20471:16/little,
       D_a_t_a/binary>>};
pack(cli, 20472, {V0_day_id}) ->
    D_a_t_a = <<V0_day_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20472:16/little,
       D_a_t_a/binary>>};
pack(srv, 20472, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20472:16/little,
       D_a_t_a/binary>>};
pack(cli, 20473, {}) ->
    {ok, <<2:32/little, 20473:16/little>>};
pack(srv, 20473,
     {V0_camp_info,
      V0_bring_up_info,
      V0_bring_up_gift,
      V0_levup_point,
      V0_now_bring_lev,
      V0_now_bring_val,
      V0_active_val}) ->
    D_a_t_a = <<(length(V0_camp_info)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   V1_need_val:32/little, V1_time:8/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_item_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_client_effect:8/little>>
                                                    || {V2_item_base_id,
                                                        V2_bind,
                                                        V2_num,
                                                        V2_client_effect}
                                                           <- V1_reward]))/binary,
                                   V1_add_val:32/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || {V1_type,
                                     V1_need_val,
                                     V1_time,
                                     V1_reward,
                                     V1_add_val,
                                     V1_title,
                                     V1_desc}
                                        <- V0_camp_info]))/binary,
                (length(V0_bring_up_info)):16/little,
                (list_to_binary([<<V1_goal_point:32/little,
                                   V1_client_pic:32/little>>
                                 || {V1_goal_point, V1_client_pic}
                                        <- V0_bring_up_info]))/binary,
                (length(V0_bring_up_gift)):16/little,
                (list_to_binary([<<V1_bring_lev:8/little,
                                   V1_gift_type:32/little, V1_gift_id:32/little,
                                   V1_gift_num:32/little>>
                                 || {V1_bring_lev,
                                     V1_gift_type,
                                     V1_gift_id,
                                     V1_gift_num}
                                        <- V0_bring_up_gift]))/binary,
                V0_levup_point:32/little, V0_now_bring_lev:32/little,
                V0_now_bring_val:32/little, V0_active_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20473:16/little,
       D_a_t_a/binary>>};
pack(cli, 20474, {}) ->
    {ok, <<2:32/little, 20474:16/little>>};
pack(srv, 20474, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20474:16/little,
       D_a_t_a/binary>>};
pack(cli, 20475, {}) ->
    {ok, <<2:32/little, 20475:16/little>>};
pack(srv, 20475, {V0_camp_info}) ->
    D_a_t_a = <<(length(V0_camp_info)):16/little,
                (list_to_binary([<<V1_group_id:8/little,
                                   V1_origin_val:32/little,
                                   V1_need_val:32/little, V1_time:8/little,
                                   V1_all_time:8/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_item_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_client_effect:8/little>>
                                                    || {V2_item_base_id,
                                                        V2_bind,
                                                        V2_num,
                                                        V2_client_effect}
                                                           <- V1_reward]))/binary,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || {V1_group_id,
                                     V1_origin_val,
                                     V1_need_val,
                                     V1_time,
                                     V1_all_time,
                                     V1_reward,
                                     V1_title,
                                     V1_desc}
                                        <- V0_camp_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20475:16/little,
       D_a_t_a/binary>>};
pack(cli, 20476, {V0_group_id}) ->
    D_a_t_a = <<V0_group_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20476:16/little,
       D_a_t_a/binary>>};
pack(srv, 20476, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20476:16/little,
       D_a_t_a/binary>>};
pack(cli, 20477, {}) ->
    {ok, <<2:32/little, 20477:16/little>>};
pack(srv, 20477,
     {V0_reward_info, V0_recharged_val, V0_v_id}) ->
    D_a_t_a = <<(length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_charge:32/little,
                                   (length(V1_items)):16/little,
                                   (list_to_binary([<<V2_item_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_client_effect:8/little>>
                                                    || {V2_item_base_id,
                                                        V2_bind,
                                                        V2_num,
                                                        V2_client_effect}
                                                           <- V1_items]))/binary,
                                   V1_v_item_id:32/little, V1_effect:8/little,
                                   (protocol:pack(string, V1_desc))/binary,
                                   V1_flag:8/little>>
                                 || {V1_id,
                                     V1_charge,
                                     V1_items,
                                     V1_v_item_id,
                                     V1_effect,
                                     V1_desc,
                                     V1_flag}
                                        <- V0_reward_info]))/binary,
                V0_recharged_val:32/little, V0_v_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20477:16/little,
       D_a_t_a/binary>>};
pack(cli, 20478, {V0_group_id}) ->
    D_a_t_a = <<V0_group_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20478:16/little,
       D_a_t_a/binary>>};
pack(srv, 20478, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20478:16/little,
       D_a_t_a/binary>>};
pack(cli, 20479, {}) ->
    {ok, <<2:32/little, 20479:16/little>>};
pack(srv, 20479, {V0_reward_info, V0_value}) ->
    D_a_t_a = <<(length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_gift_id:32/little,
                                   V1_effect:8/little, V1_flag:8/little>>
                                 || {V1_id, V1_gift_id, V1_effect, V1_flag}
                                        <- V0_reward_info]))/binary,
                V0_value:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20479:16/little,
       D_a_t_a/binary>>};
pack(cli, 20480, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20480:16/little,
       D_a_t_a/binary>>};
pack(srv, 20480, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20480:16/little,
       D_a_t_a/binary>>};
pack(cli, 20481, {}) ->
    {ok, <<2:32/little, 20481:16/little>>};
pack(srv, 20481, {V0_camp_id, V0_buy_time}) ->
    D_a_t_a = <<V0_camp_id:32/little,
                V0_buy_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20481:16/little,
       D_a_t_a/binary>>};
pack(cli, 20482, {}) ->
    {ok, <<2:32/little, 20482:16/little>>};
pack(srv, 20482,
     {V0_reward_info,
      V0_cost_item,
      V0_times,
      V0_num,
      V0_exchang_val}) ->
    D_a_t_a = <<(length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_site:8/little,
                                   V1_item_id:32/little, V1_item_num:32/little,
                                   V1_effect:8/little, V1_flag:8/little>>
                                 || {V1_id,
                                     V1_site,
                                     V1_item_id,
                                     V1_item_num,
                                     V1_effect,
                                     V1_flag}
                                        <- V0_reward_info]))/binary,
                V0_cost_item:32/little, V0_times:8/little,
                V0_num:32/little, V0_exchang_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20482:16/little,
       D_a_t_a/binary>>};
pack(cli, 20483, {}) ->
    {ok, <<2:32/little, 20483:16/little>>};
pack(srv, 20483, {V0_item_id, V0_msg}) ->
    D_a_t_a = <<V0_item_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20483:16/little,
       D_a_t_a/binary>>};
pack(cli, 20484, {}) ->
    {ok, <<2:32/little, 20484:16/little>>};
pack(srv, 20484, {V0_items}) ->
    D_a_t_a = <<(length(V0_items)):16/little,
                (list_to_binary([<<V1_item:32/little>>
                                 || {V1_item} <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20484:16/little,
       D_a_t_a/binary>>};
pack(cli, 20485, {}) ->
    {ok, <<2:32/little, 20485:16/little>>};
pack(srv, 20485,
     {V0_lev, V0_val, V0_week_box, V0_token_info}) ->
    D_a_t_a = <<V0_lev:8/little, V0_val:32/little,
                V0_week_box:8/little, (length(V0_token_info)):16/little,
                (list_to_binary([<<V1_id:8/little,
                                   (length(V1_can_draw)):16/little,
                                   (list_to_binary([<<V2_lev_id:8/little>>
                                                    || V2_lev_id
                                                           <- V1_can_draw]))/binary>>
                                 || {V1_id, V1_can_draw}
                                        <- V0_token_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20485:16/little,
       D_a_t_a/binary>>};
pack(cli, 20487, {}) ->
    {ok, <<2:32/little, 20487:16/little>>};
pack(srv, 20487, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20487:16/little,
       D_a_t_a/binary>>};
pack(cli, 20488, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20488:16/little,
       D_a_t_a/binary>>};
pack(srv, 20488, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20488:16/little,
       D_a_t_a/binary>>};
pack(cli, 20489, {V0_id, V0_lev}) ->
    D_a_t_a = <<V0_id:8/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20489:16/little,
       D_a_t_a/binary>>};
pack(srv, 20489, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20489:16/little,
       D_a_t_a/binary>>};
pack(cli, 20490, {}) ->
    {ok, <<2:32/little, 20490:16/little>>};
pack(srv, 20490, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20490:16/little,
       D_a_t_a/binary>>};
pack(cli, 20491, {}) ->
    {ok, <<2:32/little, 20491:16/little>>};
pack(srv, 20491,
     {#camp_gift_custom{gift = V0_gift, buy = V0_buy,
                        extra_reward = V0_extra_reward}}) ->
    D_a_t_a = <<(length(V0_gift)):16/little,
                (list_to_binary([<<V1_gift_id:16/little>>
                                 || V1_gift_id <- V0_gift]))/binary,
                (length(V0_buy)):16/little,
                (list_to_binary([<<V1_gift_id:16/little,
                                   V1_times:8/little>>
                                 || {V1_gift_id, V1_times} <- V0_buy]))/binary,
                V0_extra_reward:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20491:16/little,
       D_a_t_a/binary>>};
pack(cli, 20492, {V0_gift_id, V0_item_ids}) ->
    D_a_t_a = <<V0_gift_id:16/little,
                (length(V0_item_ids)):16/little,
                (list_to_binary([<<V1_index:32/little>>
                                 || V1_index <- V0_item_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20492:16/little,
       D_a_t_a/binary>>};
pack(srv, 20492, {V0_result, V0_msg, V0_item_ids}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_item_ids)):16/little,
                (list_to_binary([<<V1_index:32/little>>
                                 || V1_index <- V0_item_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20492:16/little,
       D_a_t_a/binary>>};
pack(cli, 20493, {}) ->
    {ok, <<2:32/little, 20493:16/little>>};
pack(srv, 20493,
     {V0_camp_info,
      V0_bring_up_info,
      V0_bring_up_gift,
      V0_levup_point,
      V0_now_bring_val,
      V0_active_val}) ->
    D_a_t_a = <<(length(V0_camp_info)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   V1_need_val:32/little, V1_time:8/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_item_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little,
                                                      V2_client_effect:8/little>>
                                                    || {V2_item_base_id,
                                                        V2_bind,
                                                        V2_num,
                                                        V2_client_effect}
                                                           <- V1_reward]))/binary,
                                   V1_add_val:32/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || {V1_type,
                                     V1_need_val,
                                     V1_time,
                                     V1_reward,
                                     V1_add_val,
                                     V1_title,
                                     V1_desc}
                                        <- V0_camp_info]))/binary,
                (length(V0_bring_up_info)):16/little,
                (list_to_binary([<<V1_goal_point:32/little,
                                   V1_client_pic:32/little>>
                                 || {V1_goal_point, V1_client_pic}
                                        <- V0_bring_up_info]))/binary,
                (length(V0_bring_up_gift)):16/little,
                (list_to_binary([<<V1_gift_type:32/little,
                                   V1_gift_id:32/little, V1_gift_num:32/little>>
                                 || {V1_gift_type, V1_gift_id, V1_gift_num}
                                        <- V0_bring_up_gift]))/binary,
                V0_levup_point:32/little, V0_now_bring_val:32/little,
                V0_active_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20493:16/little,
       D_a_t_a/binary>>};
pack(cli, 20494, {}) ->
    {ok, <<2:32/little, 20494:16/little>>};
pack(srv, 20494, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20494:16/little,
       D_a_t_a/binary>>};
pack(cli, 20495, {}) ->
    {ok, <<2:32/little, 20495:16/little>>};
pack(srv, 20495, {V0_token_info}) ->
    D_a_t_a = <<(length(V0_token_info)):16/little,
                (list_to_binary([<<V1_id:8/little,
                                   (length(V1_has_get)):16/little,
                                   (list_to_binary([<<V2_lev_id:8/little>>
                                                    || V2_lev_id
                                                           <- V1_has_get]))/binary>>
                                 || {V1_id, V1_has_get}
                                        <- V0_token_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20495:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20400, _B0) ->
    {V1_tar_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_tar_role_id, V1_platform, V1_zone_id}};
unpack(cli, 20400, _B0) ->
    {V1_tar_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_rest_day, _B4} = protocol:uint32(_B3),
    {V1_price_info, _B25} = protocol:array(_B4,
                                           fun (_B5) ->
                                                   {V2_item_id, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_num, _B7} =
                                                       protocol:uint32(_B6),
                                                   {V2_gift_info, _B13} =
                                                       protocol:array(_B7,
                                                                      fun
                                                                          (_B8) ->
                                                                              {V3_item_id2,
                                                                               _B9} =
                                                                                  protocol:uint32(_B8),
                                                                              {V3_num2,
                                                                               _B10} =
                                                                                  protocol:uint32(_B9),
                                                                              {V3_spec_effects,
                                                                               _B11} =
                                                                                  protocol:uint32(_B10),
                                                                              {{V3_item_id2,
                                                                                V3_num2,
                                                                                V3_spec_effects},
                                                                               _B11}
                                                                      end),
                                                   {V2_type, _B14} =
                                                       protocol:uint32(_B13),
                                                   {V2_old_price, _B15} =
                                                       protocol:uint32(_B14),
                                                   {V2_price, _B16} =
                                                       protocol:uint32(_B15),
                                                   {V2_min_price, _B17} =
                                                       protocol:uint32(_B16),
                                                   {V2_buy_limit, _B18} =
                                                       protocol:uint8(_B17),
                                                   {V2_buy_already, _B19} =
                                                       protocol:uint8(_B18),
                                                   {V2_change_price, _B23} =
                                                       protocol:array(_B19,
                                                                      fun
                                                                          (_B20) ->
                                                                              {V3_change_price,
                                                                               _B21} =
                                                                                  protocol:uint32(_B20),
                                                                              {{V3_change_price},
                                                                               _B21}
                                                                      end),
                                                   {{V2_item_id,
                                                     V2_num,
                                                     V2_gift_info,
                                                     V2_type,
                                                     V2_old_price,
                                                     V2_price,
                                                     V2_min_price,
                                                     V2_buy_limit,
                                                     V2_buy_already,
                                                     V2_change_price},
                                                    _B23}
                                           end),
    {V1_log_info, _B36} = protocol:array(_B25,
                                         fun (_B26) ->
                                                 {V2_name, _B27} =
                                                     protocol:string(_B26),
                                                 {V2_tar_role_id, _B28} =
                                                     protocol:uint32(_B27),
                                                 {V2_platform, _B29} =
                                                     protocol:string(_B28),
                                                 {V2_zone_id, _B30} =
                                                     protocol:uint16(_B29),
                                                 {V2_sex, _B31} =
                                                     protocol:uint8(_B30),
                                                 {V2_classes, _B32} =
                                                     protocol:uint8(_B31),
                                                 {V2_cut_price, _B33} =
                                                     protocol:uint32(_B32),
                                                 {V2_time, _B34} =
                                                     protocol:uint32(_B33),
                                                 {{V2_name,
                                                   V2_tar_role_id,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_cut_price,
                                                   V2_time},
                                                  _B34}
                                         end),
    {V1_can_help, _B37} = protocol:uint32(_B36),
    {ok,
     {V1_tar_role_id,
      V1_platform,
      V1_zone_id,
      V1_rest_day,
      V1_price_info,
      V1_log_info,
      V1_can_help}};
unpack(srv, 20401, _B0) ->
    {V1_tar_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_tar_role_id, V1_platform, V1_zone_id}};
unpack(cli, 20401, _B0) -> {ok, {}};
unpack(srv, 20402, _B0) ->
    {V1_tar_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_tar_role_id, V1_platform, V1_zone_id}};
unpack(cli, 20402, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_cut_price, _B2} = protocol:uint16(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_result, V1_cut_price, V1_msg}};
unpack(srv, 20403, _B0) ->
    {V1_item_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_item_id}};
unpack(cli, 20403, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20404, _B0) -> {ok, {}};
unpack(cli, 20404, _B0) ->
    {V1_lucky_roles, _B14} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_name, _B2} =
                                                        protocol:string(_B1),
                                                    {V2_zone_name, _B3} =
                                                        protocol:string(_B2),
                                                    {V2_role_id, _B4} =
                                                        protocol:uint32(_B3),
                                                    {V2_platform, _B5} =
                                                        protocol:string(_B4),
                                                    {V2_zone_id, _B6} =
                                                        protocol:uint16(_B5),
                                                    {V2_sex, _B7} =
                                                        protocol:uint8(_B6),
                                                    {V2_classes, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_reward_time, _B9} =
                                                        protocol:uint32(_B8),
                                                    {V2_reward_item, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_reward_num, _B11} =
                                                        protocol:uint32(_B10),
                                                    {V2_reward_rank, _B12} =
                                                        protocol:uint32(_B11),
                                                    {{V2_name,
                                                      V2_zone_name,
                                                      V2_role_id,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_sex,
                                                      V2_classes,
                                                      V2_reward_time,
                                                      V2_reward_item,
                                                      V2_reward_num,
                                                      V2_reward_rank},
                                                     _B12}
                                            end),
    {ok, {V1_lucky_roles}};
unpack(srv, 20405, _B0) -> {ok, {}};
unpack(cli, 20405, _B0) ->
    {V1_state, _B1} = protocol:uint32(_B0),
    {ok, {V1_state}};
unpack(srv, 20406, _B0) -> {ok, {}};
unpack(cli, 20406, _B0) ->
    {V1_gift_info, _B22} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_item_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_name, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_price, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_num, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_spec_effect, _B11} =
                                                      protocol:array(_B5,
                                                                     fun
                                                                         (_B6) ->
                                                                             {V3_item_id2,
                                                                              _B7} =
                                                                                 protocol:uint32(_B6),
                                                                             {V3_num2,
                                                                              _B8} =
                                                                                 protocol:uint32(_B7),
                                                                             {V3_spec_effects,
                                                                              _B9} =
                                                                                 protocol:uint32(_B8),
                                                                             {{V3_item_id2,
                                                                               V3_num2,
                                                                               V3_spec_effects},
                                                                              _B9}
                                                                     end),
                                                  {V2_content_name, _B12} =
                                                      protocol:string(_B11),
                                                  {V2_promotion, _B19} =
                                                      protocol:array(_B12,
                                                                     fun
                                                                         (_B13) ->
                                                                             {V3_cost_num,
                                                                              _B14} =
                                                                                 protocol:uint32(_B13),
                                                                             {V3_present_id,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_bound,
                                                                              _B16} =
                                                                                 protocol:uint32(_B15),
                                                                             {V3_present_num,
                                                                              _B17} =
                                                                                 protocol:uint32(_B16),
                                                                             {{V3_cost_num,
                                                                               V3_present_id,
                                                                               V3_bound,
                                                                               V3_present_num},
                                                                              _B17}
                                                                     end),
                                                  {V2_purchased_num, _B20} =
                                                      protocol:uint8(_B19),
                                                  {{V2_item_id,
                                                    V2_name,
                                                    V2_price,
                                                    V2_num,
                                                    V2_spec_effect,
                                                    V2_content_name,
                                                    V2_promotion,
                                                    V2_purchased_num},
                                                   _B20}
                                          end),
    {ok, {V1_gift_info}};
unpack(srv, 20407, _B0) -> {ok, {}};
unpack(cli, 20407, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_purchased_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_purchased_num}};
unpack(srv, 20408, _B0) ->
    {V1_item_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_item_id, V1_num}};
unpack(cli, 20408, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20409, _B0) -> {ok, {}};
unpack(cli, 20409, _B0) ->
    {V1_vote_times, _B1} = protocol:uint32(_B0),
    {V1_invite_votes, _B2} = protocol:uint32(_B1),
    {V1_vote_start_time, _B3} = protocol:uint32(_B2),
    {V1_show_start_time, _B4} = protocol:uint32(_B3),
    {V1_group, _B23} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_group_id, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_set_id, _B7} =
                                                  protocol:uint32(_B6),
                                              {V2_set_name, _B8} =
                                                  protocol:string(_B7),
                                              {V2_sex, _B9} =
                                                  protocol:uint8(_B8),
                                              {V2_classes, _B10} =
                                                  protocol:uint8(_B9),
                                              {V2_fashion, _B15} =
                                                  protocol:array(_B10,
                                                                 fun (_B11) ->
                                                                         {V3_type,
                                                                          _B12} =
                                                                             protocol:uint32(_B11),
                                                                         {V3_value,
                                                                          _B13} =
                                                                             protocol:uint32(_B12),
                                                                         {{V3_type,
                                                                           V3_value},
                                                                          _B13}
                                                                 end),
                                              {V2_lucky_rewards, _B21} =
                                                  protocol:array(_B15,
                                                                 fun (_B16) ->
                                                                         {V3_base_Id,
                                                                          _B17} =
                                                                             protocol:uint32(_B16),
                                                                         {V3_bind,
                                                                          _B18} =
                                                                             protocol:uint8(_B17),
                                                                         {V3_num,
                                                                          _B19} =
                                                                             protocol:uint32(_B18),
                                                                         {{V3_base_Id,
                                                                           V3_bind,
                                                                           V3_num},
                                                                          _B19}
                                                                 end),
                                              {{V2_group_id,
                                                V2_set_id,
                                                V2_set_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_fashion,
                                                V2_lucky_rewards},
                                               _B21}
                                      end),
    {V1_vote_loss, _B32} = protocol:array(_B23,
                                          fun (_B24) ->
                                                  {V2_days, _B25} =
                                                      protocol:uint32(_B24),
                                                  {V2_losst, _B30} =
                                                      protocol:array(_B25,
                                                                     fun
                                                                         (_B26) ->
                                                                             {V3_l_base_Id,
                                                                              _B27} =
                                                                                 protocol:uint32(_B26),
                                                                             {V3_l_num,
                                                                              _B28} =
                                                                                 protocol:uint32(_B27),
                                                                             {{V3_l_base_Id,
                                                                               V3_l_num},
                                                                              _B28}
                                                                     end),
                                                  {{V2_days, V2_losst}, _B30}
                                          end),
    {V1_max_vote_reward, _B33} = protocol:uint32(_B32),
    {V1_max_reply, _B34} = protocol:uint32(_B33),
    {V1_max_reply_reward, _B35} = protocol:uint32(_B34),
    {ok,
     {V1_vote_times,
      V1_invite_votes,
      V1_vote_start_time,
      V1_show_start_time,
      V1_group,
      V1_vote_loss,
      V1_max_vote_reward,
      V1_max_reply,
      V1_max_reply_reward}};
unpack(srv, 20410, _B0) -> {ok, {}};
unpack(cli, 20410, _B0) ->
    {V1_vote_times, _B1} = protocol:uint32(_B0),
    {V1_invite_votes, _B2} = protocol:uint32(_B1),
    {V1_vote_group, _B7} = protocol:array(_B2,
                                          fun (_B3) ->
                                                  {V2_group_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_vote_num, _B5} =
                                                      protocol:uint32(_B4),
                                                  {{V2_group_id, V2_vote_num},
                                                   _B5}
                                          end),
    {V1_reply_invites, _B8} = protocol:uint32(_B7),
    {V1_have_votes, _B9} = protocol:uint32(_B8),
    {ok,
     {V1_vote_times,
      V1_invite_votes,
      V1_vote_group,
      V1_reply_invites,
      V1_have_votes}};
unpack(srv, 20411, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_group_id}};
unpack(cli, 20411, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_group_id, V1_result, V1_msg}};
unpack(srv, 20412, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_f_id, _B2} = protocol:uint32(_B1),
    {V1_f_platform, _B3} = protocol:string(_B2),
    {V1_f_zone_id, _B4} = protocol:uint16(_B3),
    {ok,
     {V1_group_id, V1_f_id, V1_f_platform, V1_f_zone_id}};
unpack(cli, 20412, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_f_id, _B2} = protocol:uint32(_B1),
    {V1_f_platform, _B3} = protocol:string(_B2),
    {V1_f_zone_id, _B4} = protocol:uint16(_B3),
    {V1_result, _B5} = protocol:uint8(_B4),
    {V1_msg, _B6} = protocol:string(_B5),
    {ok,
     {V1_group_id,
      V1_f_id,
      V1_f_platform,
      V1_f_zone_id,
      V1_result,
      V1_msg}};
unpack(srv, 20413, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_f_id, _B2} = protocol:uint32(_B1),
    {V1_f_platform, _B3} = protocol:string(_B2),
    {V1_f_zone_id, _B4} = protocol:uint16(_B3),
    {V1_invite_code, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_group_id,
      V1_f_id,
      V1_f_platform,
      V1_f_zone_id,
      V1_invite_code}};
unpack(cli, 20413, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_f_id, _B2} = protocol:uint32(_B1),
    {V1_f_platform, _B3} = protocol:string(_B2),
    {V1_f_zone_id, _B4} = protocol:uint16(_B3),
    {V1_result, _B5} = protocol:uint8(_B4),
    {V1_msg, _B6} = protocol:string(_B5),
    {ok,
     {V1_group_id,
      V1_f_id,
      V1_f_platform,
      V1_f_zone_id,
      V1_result,
      V1_msg}};
unpack(srv, 20414, _B0) -> {ok, {}};
unpack(cli, 20414, _B0) ->
    {V1_group, _B17} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_group_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_lucky_list, _B13} =
                                                  protocol:array(_B2,
                                                                 fun (_B3) ->
                                                                         {V3_id,
                                                                          _B4} =
                                                                             protocol:uint32(_B3),
                                                                         {V3_platform,
                                                                          _B5} =
                                                                             protocol:string(_B4),
                                                                         {V3_zone_id,
                                                                          _B6} =
                                                                             protocol:uint32(_B5),
                                                                         {V3_zone_name,
                                                                          _B7} =
                                                                             protocol:string(_B6),
                                                                         {V3_name,
                                                                          _B8} =
                                                                             protocol:string(_B7),
                                                                         {V3_lev,
                                                                          _B9} =
                                                                             protocol:uint32(_B8),
                                                                         {V3_classes,
                                                                          _B10} =
                                                                             protocol:uint8(_B9),
                                                                         {V3_sex,
                                                                          _B11} =
                                                                             protocol:uint8(_B10),
                                                                         {{V3_id,
                                                                           V3_platform,
                                                                           V3_zone_id,
                                                                           V3_zone_name,
                                                                           V3_name,
                                                                           V3_lev,
                                                                           V3_classes,
                                                                           V3_sex},
                                                                          _B11}
                                                                 end),
                                              {V2_vote_num, _B14} =
                                                  protocol:uint32(_B13),
                                              {V2_vote_rate, _B15} =
                                                  protocol:uint32(_B14),
                                              {{V2_group_id,
                                                V2_lucky_list,
                                                V2_vote_num,
                                                V2_vote_rate},
                                               _B15}
                                      end),
    {ok, {V1_group}};
unpack(srv, 20415, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_f_id, _B2} = protocol:uint32(_B1),
    {V1_f_platform, _B3} = protocol:string(_B2),
    {V1_f_zone_id, _B4} = protocol:uint16(_B3),
    {ok,
     {V1_group_id, V1_f_id, V1_f_platform, V1_f_zone_id}};
unpack(cli, 20415, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_f_id, _B2} = protocol:uint32(_B1),
    {V1_f_platform, _B3} = protocol:string(_B2),
    {V1_f_zone_id, _B4} = protocol:uint16(_B3),
    {V1_invite_state, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_group_id,
      V1_f_id,
      V1_f_platform,
      V1_f_zone_id,
      V1_invite_state}};
unpack(srv, 20416, _B0) -> {ok, {}};
unpack(cli, 20416, _B0) ->
    {V1_fashion_list, _B19} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_goods_id, _B2} =
                                                         protocol:uint32(_B1),
                                                     {V2_fashion_info, _B17} =
                                                         protocol:array(_B2,
                                                                        fun
                                                                            (_B3) ->
                                                                                {V3_sex,
                                                                                 _B4} =
                                                                                    protocol:uint8(_B3),
                                                                                {V3_classes,
                                                                                 _B5} =
                                                                                    protocol:uint8(_B4),
                                                                                {V3_plan_name,
                                                                                 _B6} =
                                                                                    protocol:string(_B5),
                                                                                {V3_fashion_name,
                                                                                 _B7} =
                                                                                    protocol:string(_B6),
                                                                                {V3_discount,
                                                                                 _B8} =
                                                                                    protocol:uint8(_B7),
                                                                                {V3_origin_price,
                                                                                 _B9} =
                                                                                    protocol:uint32(_B8),
                                                                                {V3_new_price,
                                                                                 _B10} =
                                                                                    protocol:uint32(_B9),
                                                                                {V3_fashion,
                                                                                 _B15} =
                                                                                    protocol:array(_B10,
                                                                                                   fun
                                                                                                       (_B11) ->
                                                                                                           {V4_type,
                                                                                                            _B12} =
                                                                                                               protocol:uint32(_B11),
                                                                                                           {V4_value,
                                                                                                            _B13} =
                                                                                                               protocol:uint32(_B12),
                                                                                                           {{V4_type,
                                                                                                             V4_value},
                                                                                                            _B13}
                                                                                                   end),
                                                                                {{V3_sex,
                                                                                  V3_classes,
                                                                                  V3_plan_name,
                                                                                  V3_fashion_name,
                                                                                  V3_discount,
                                                                                  V3_origin_price,
                                                                                  V3_new_price,
                                                                                  V3_fashion},
                                                                                 _B15}
                                                                        end),
                                                     {{V2_goods_id,
                                                       V2_fashion_info},
                                                      _B17}
                                             end),
    {ok, {V1_fashion_list}};
unpack(srv, 20417, _B0) ->
    {V1_plan_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {V1_sex, _B3} = protocol:uint8(_B2),
    {ok, {V1_plan_id, V1_num, V1_sex}};
unpack(cli, 20417, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20418, _B0) -> {ok, {}};
unpack(cli, 20418, _B0) ->
    {V1_max_draw, _B1} = protocol:uint32(_B0),
    {V1_tips_msg, _B2} = protocol:string(_B1),
    {V1_draw_loss, _B7} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_loss_id, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_l_num, _B5} =
                                                     protocol:uint32(_B4),
                                                 {{V2_loss_id, V2_l_num}, _B5}
                                         end),
    {V1_reward_list, _B19} = protocol:array(_B7,
                                            fun (_B8) ->
                                                    {V2_group_id, _B9} =
                                                        protocol:uint32(_B8),
                                                    {V2_icon, _B10} =
                                                        protocol:string(_B9),
                                                    {V2_draw_reward, _B17} =
                                                        protocol:array(_B10,
                                                                       fun
                                                                           (_B11) ->
                                                                               {V3_base_id,
                                                                                _B12} =
                                                                                   protocol:uint32(_B11),
                                                                               {V3_bind,
                                                                                _B13} =
                                                                                   protocol:uint8(_B12),
                                                                               {V3_num,
                                                                                _B14} =
                                                                                   protocol:uint32(_B13),
                                                                               {V3_is_effect,
                                                                                _B15} =
                                                                                   protocol:uint8(_B14),
                                                                               {{V3_base_id,
                                                                                 V3_bind,
                                                                                 V3_num,
                                                                                 V3_is_effect},
                                                                                _B15}
                                                                       end),
                                                    {{V2_group_id,
                                                      V2_icon,
                                                      V2_draw_reward},
                                                     _B17}
                                            end),
    {ok,
     {V1_max_draw,
      V1_tips_msg,
      V1_draw_loss,
      V1_reward_list}};
unpack(srv, 20419, _B0) -> {ok, {}};
unpack(cli, 20419, _B0) ->
    {V1_free_times, _B1} = protocol:uint32(_B0),
    {V1_draw_times, _B2} = protocol:uint32(_B1),
    {V1_cur_gold, _B3} = protocol:uint32(_B2),
    {V1_record_msg, _B8} = protocol:array(_B3,
                                          fun (_B4) ->
                                                  {V2_add_time, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_msg, _B6} =
                                                      protocol:string(_B5),
                                                  {{V2_add_time, V2_msg}, _B6}
                                          end),
    {ok,
     {V1_free_times,
      V1_draw_times,
      V1_cur_gold,
      V1_record_msg}};
unpack(srv, 20420, _B0) ->
    {V1_draw_num, _B1} = protocol:uint32(_B0),
    {ok, {V1_draw_num}};
unpack(cli, 20420, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_draw_num, _B3} = protocol:uint32(_B2),
    {V1_draw_reward, _B10} = protocol:array(_B3,
                                            fun (_B4) ->
                                                    {V2_base_id, _B5} =
                                                        protocol:uint32(_B4),
                                                    {V2_bind, _B6} =
                                                        protocol:uint8(_B5),
                                                    {V2_num, _B7} =
                                                        protocol:uint32(_B6),
                                                    {V2_is_effect, _B8} =
                                                        protocol:uint8(_B7),
                                                    {{V2_base_id,
                                                      V2_bind,
                                                      V2_num,
                                                      V2_is_effect},
                                                     _B8}
                                            end),
    {V1_group_id, _B11} = protocol:uint32(_B10),
    {ok,
     {V1_result,
      V1_msg,
      V1_draw_num,
      V1_draw_reward,
      V1_group_id}};
unpack(srv, 20421, _B0) -> {ok, {}};
unpack(cli, 20421, _B0) ->
    {V1_gold_item, _B5} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_g_base_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_g_num, _B3} =
                                                     protocol:uint32(_B2),
                                                 {{V2_g_base_id, V2_g_num}, _B3}
                                         end),
    {V1_ticket, _B10} = protocol:array(_B5,
                                       fun (_B6) ->
                                               {V2_t_base_id, _B7} =
                                                   protocol:uint32(_B6),
                                               {V2_t_num, _B8} =
                                                   protocol:uint32(_B7),
                                               {{V2_t_base_id, V2_t_num}, _B8}
                                       end),
    {V1_revive, _B15} = protocol:array(_B10,
                                       fun (_B11) ->
                                               {V2_r_base_id, _B12} =
                                                   protocol:uint32(_B11),
                                               {V2_r_num, _B13} =
                                                   protocol:uint32(_B12),
                                               {{V2_r_base_id, V2_r_num}, _B13}
                                       end),
    {V1_min_lev, _B16} = protocol:uint32(_B15),
    {V1_rude, _B17} = protocol:string(_B16),
    {V1_info, _B18} = protocol:string(_B17),
    {V1_question_time, _B19} = protocol:uint32(_B18),
    {V1_answer_time, _B20} = protocol:uint32(_B19),
    {V1_notice_time, _B21} = protocol:uint32(_B20),
    {V1_max_revive, _B22} = protocol:uint32(_B21),
    {V1_first_time, _B23} = protocol:uint32(_B22),
    {ok,
     {V1_gold_item,
      V1_ticket,
      V1_revive,
      V1_min_lev,
      V1_rude,
      V1_info,
      V1_question_time,
      V1_answer_time,
      V1_notice_time,
      V1_max_revive,
      V1_first_time}};
unpack(srv, 20422, _B0) -> {ok, {}};
unpack(cli, 20422, _B0) ->
    {V1_state_code, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_state_code, V1_timeout}};
unpack(srv, 20423, _B0) -> {ok, {}};
unpack(cli, 20423, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20424, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 20424, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_type, V1_result, V1_msg}};
unpack(srv, 20425, _B0) -> {ok, {}};
unpack(cli, 20425, _B0) ->
    {V1_question_index, _B1} = protocol:uint32(_B0),
    {V1_question, _B2} = protocol:string(_B1),
    {V1_option_a, _B3} = protocol:string(_B2),
    {V1_option_b, _B4} = protocol:string(_B3),
    {V1_option_c, _B5} = protocol:string(_B4),
    {V1_stop_time, _B6} = protocol:uint32(_B5),
    {V1_role_num, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_question_index,
      V1_question,
      V1_option_a,
      V1_option_b,
      V1_option_c,
      V1_stop_time,
      V1_role_num}};
unpack(srv, 20426, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {V1_option, _B2} = protocol:uint32(_B1),
    {ok, {V1_index, V1_option}};
unpack(cli, 20426, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20427, _B0) -> {ok, {}};
unpack(cli, 20427, _B0) ->
    {V1_question_index, _B1} = protocol:uint32(_B0),
    {V1_option_a, _B2} = protocol:uint32(_B1),
    {V1_option_b, _B3} = protocol:uint32(_B2),
    {V1_option_c, _B4} = protocol:uint32(_B3),
    {V1_answer, _B5} = protocol:uint8(_B4),
    {V1_option, _B6} = protocol:uint8(_B5),
    {V1_last_num, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_question_index,
      V1_option_a,
      V1_option_b,
      V1_option_c,
      V1_answer,
      V1_option,
      V1_last_num}};
unpack(srv, 20428, _B0) -> {ok, {}};
unpack(cli, 20428, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20429, _B0) -> {ok, {}};
unpack(cli, 20429, _B0) ->
    {V1_sign, _B1} = protocol:uint8(_B0),
    {V1_revive_times, _B2} = protocol:uint32(_B1),
    {V1_sys_barrage, _B3} = protocol:uint32(_B2),
    {V1_ply_barrage, _B4} = protocol:uint32(_B3),
    {V1_barrage_time, _B5} = protocol:uint32(_B4),
    {V1_final_times, _B6} = protocol:uint32(_B5),
    {V1_sign_times, _B7} = protocol:uint32(_B6),
    {V1_is_lost, _B8} = protocol:uint8(_B7),
    {V1_in_map, _B9} = protocol:uint8(_B8),
    {V1_index, _B10} = protocol:uint32(_B9),
    {ok,
     {V1_sign,
      V1_revive_times,
      V1_sys_barrage,
      V1_ply_barrage,
      V1_barrage_time,
      V1_final_times,
      V1_sign_times,
      V1_is_lost,
      V1_in_map,
      V1_index}};
unpack(srv, 20430, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(cli, 20430, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20431, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_value, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_value}};
unpack(cli, 20431, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_value, _B2} = protocol:uint8(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_type, V1_value, V1_flag, V1_msg}};
unpack(srv, 20432, _B0) -> {ok, {}};
unpack(cli, 20432, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {V1_option, _B2} = protocol:uint8(_B1),
    {V1_answer, _B3} = protocol:uint8(_B2),
    {ok, {V1_index, V1_option, V1_answer}};
unpack(srv, 20433, _B0) -> {ok, {}};
unpack(cli, 20433, _B0) ->
    {V1_question_index, _B1} = protocol:uint32(_B0),
    {V1_question, _B2} = protocol:string(_B1),
    {V1_option_a, _B3} = protocol:string(_B2),
    {V1_option_b, _B4} = protocol:string(_B3),
    {V1_option_c, _B5} = protocol:string(_B4),
    {V1_stop_time, _B6} = protocol:uint32(_B5),
    {V1_role_num, _B7} = protocol:uint32(_B6),
    {V1_option, _B8} = protocol:uint8(_B7),
    {V1_answer, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_question_index,
      V1_question,
      V1_option_a,
      V1_option_b,
      V1_option_c,
      V1_stop_time,
      V1_role_num,
      V1_option,
      V1_answer}};
unpack(srv, 20434, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {ok, {V1_num}};
unpack(cli, 20434, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_result, _B12} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_times, _B4} =
                                                   protocol:uint8(_B3),
                                               {V2_items, _B10} =
                                                   protocol:array(_B4,
                                                                  fun (_B5) ->
                                                                          {V3_index,
                                                                           _B6} =
                                                                              protocol:uint8(_B5),
                                                                          {V3_item_id,
                                                                           _B7} =
                                                                              protocol:uint32(_B6),
                                                                          {V3_item_num,
                                                                           _B8} =
                                                                              protocol:uint32(_B7),
                                                                          {{V3_index,
                                                                            V3_item_id,
                                                                            V3_item_num},
                                                                           _B8}
                                                                  end),
                                               {{V2_times, V2_items}, _B10}
                                       end),
    {ok, {V1_flag, V1_msg, V1_result}};
unpack(srv, 20435, _B0) -> {ok, {}};
unpack(cli, 20435, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20436, _B0) -> {ok, {}};
unpack(cli, 20436, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20437, _B0) -> {ok, {}};
unpack(cli, 20437, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_result, _B10} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_base_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_bind, _B5} =
                                                   protocol:uint8(_B4),
                                               {V2_num, _B6} =
                                                   protocol:uint32(_B5),
                                               {V2_is_effect, _B7} =
                                                   protocol:uint8(_B6),
                                               {V2_base_num, _B8} =
                                                   protocol:uint32(_B7),
                                               {{V2_base_id,
                                                 V2_bind,
                                                 V2_num,
                                                 V2_is_effect,
                                                 V2_base_num},
                                                _B8}
                                       end),
    {ok, {V1_flag, V1_msg, V1_result}};
unpack(srv, 20438, _B0) -> {ok, {}};
unpack(cli, 20438, _B0) ->
    {V1_reward, _B6} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_base_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_is_effect, _B3} =
                                                  protocol:uint8(_B2),
                                              {V2_base_num, _B4} =
                                                  protocol:uint32(_B3),
                                              {{V2_base_id,
                                                V2_is_effect,
                                                V2_base_num},
                                               _B4}
                                      end),
    {V1_number, _B10} = protocol:array(_B6,
                                       fun (_B7) ->
                                               {V2_num, _B8} =
                                                   protocol:uint32(_B7),
                                               {{V2_num}, _B8}
                                       end),
    {ok, {V1_reward, V1_number}};
unpack(srv, 20439, _B0) -> {ok, {}};
unpack(cli, 20439, _B0) ->
    {V1_quest, _B14} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_quest_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_reward, _B7} =
                                                  protocol:array(_B2,
                                                                 fun (_B3) ->
                                                                         {V3_base_id,
                                                                          _B4} =
                                                                             protocol:uint32(_B3),
                                                                         {V3_num,
                                                                          _B5} =
                                                                             protocol:uint32(_B4),
                                                                         {{V3_base_id,
                                                                           V3_num},
                                                                          _B5}
                                                                 end),
                                              {V2_icon, _B8} =
                                                  protocol:string(_B7),
                                              {V2_value, _B9} =
                                                  protocol:uint32(_B8),
                                              {V2_target_val, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_quest_status, _B11} =
                                                  protocol:uint8(_B10),
                                              {V2_quest_sort, _B12} =
                                                  protocol:uint8(_B11),
                                              {{V2_quest_id,
                                                V2_reward,
                                                V2_icon,
                                                V2_value,
                                                V2_target_val,
                                                V2_quest_status,
                                                V2_quest_sort},
                                               _B12}
                                      end),
    {V1_sign, _B23} = protocol:array(_B14,
                                     fun (_B15) ->
                                             {V2_reward, _B20} =
                                                 protocol:array(_B15,
                                                                fun (_B16) ->
                                                                        {V3_sign_base_id,
                                                                         _B17} =
                                                                            protocol:uint32(_B16),
                                                                        {V3_sign_num,
                                                                         _B18} =
                                                                            protocol:uint32(_B17),
                                                                        {{V3_sign_base_id,
                                                                          V3_sign_num},
                                                                         _B18}
                                                                end),
                                             {V2_sign_status, _B21} =
                                                 protocol:uint8(_B20),
                                             {{V2_reward, V2_sign_status}, _B21}
                                     end),
    {ok, {V1_quest, V1_sign}};
unpack(srv, 20440, _B0) -> {ok, {}};
unpack(cli, 20440, _B0) ->
    {V1_reward_info, _B10} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_name, _B2} =
                                                        protocol:string(_B1),
                                                    {V2_type, _B3} =
                                                        protocol:uint8(_B2),
                                                    {V2_items, _B8} =
                                                        protocol:array(_B3,
                                                                       fun
                                                                           (_B4) ->
                                                                               {V3_item_id,
                                                                                _B5} =
                                                                                   protocol:uint32(_B4),
                                                                               {V3_val,
                                                                                _B6} =
                                                                                   protocol:uint32(_B5),
                                                                               {{V3_item_id,
                                                                                 V3_val},
                                                                                _B6}
                                                                       end),
                                                    {{V2_name,
                                                      V2_type,
                                                      V2_items},
                                                     _B8}
                                            end),
    {ok, {V1_reward_info}};
unpack(srv, 20441, _B0) -> {ok, {}};
unpack(cli, 20441, _B0) ->
    {V1_list, _B12} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} = protocol:uint8(_B1),
                                             {V2_point, _B3} =
                                                 protocol:uint8(_B2),
                                             {V2_list, _B10} =
                                                 protocol:array(_B3,
                                                                fun (_B4) ->
                                                                        {V3_period,
                                                                         _B5} =
                                                                            protocol:uint8(_B4),
                                                                        {V3_status,
                                                                         _B6} =
                                                                            protocol:uint8(_B5),
                                                                        {V3_time_to_start,
                                                                         _B7} =
                                                                            protocol:uint32(_B6),
                                                                        {V3_time_to_end,
                                                                         _B8} =
                                                                            protocol:uint32(_B7),
                                                                        {{V3_period,
                                                                          V3_status,
                                                                          V3_time_to_start,
                                                                          V3_time_to_end},
                                                                         _B8}
                                                                end),
                                             {{V2_id, V2_point, V2_list}, _B10}
                                     end),
    {ok, {V1_list}};
unpack(srv, 20442, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_period, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_period}};
unpack(cli, 20442, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20443, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 20443, _B0) -> {ok, {}};
unpack(srv, 20444, _B0) -> {ok, {}};
unpack(cli, 20444, _B0) ->
    {V1_grid_index, _B1} = protocol:uint8(_B0),
    {V1_times, _B2} = protocol:uint32(_B1),
    {V1_lucky_dice, _B3} = protocol:uint8(_B2),
    {V1_event_id, _B4} = protocol:uint32(_B3),
    {V1_ring_times, _B5} = protocol:uint32(_B4),
    {V1_ring_rewards, _B9} = protocol:array(_B5,
                                            fun (_B6) ->
                                                    {V2_times, _B7} =
                                                        protocol:uint32(_B6),
                                                    {{V2_times}, _B7}
                                            end),
    {ok,
     {V1_grid_index,
      V1_times,
      V1_lucky_dice,
      V1_event_id,
      V1_ring_times,
      V1_ring_rewards}};
unpack(srv, 20445, _B0) -> {ok, {}};
unpack(cli, 20445, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20446, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {ok, {V1_result}};
unpack(cli, 20446, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20447, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 20447, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_event_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_event_id}};
unpack(srv, 20448, _B0) ->
    {V1_ring_times, _B1} = protocol:uint8(_B0),
    {ok, {V1_ring_times}};
unpack(cli, 20448, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20449, _B0) -> {ok, {}};
unpack(cli, 20449, _B0) ->
    {V1_camp_zillionaire_event, _B10} = protocol:array(_B0,
                                                       fun (_B1) ->
                                                               {V2_name, _B2} =
                                                                   protocol:string(_B1),
                                                               {V2_event_id,
                                                                _B3} =
                                                                   protocol:uint32(_B2),
                                                               {V2_items, _B8} =
                                                                   protocol:array(_B3,
                                                                                  fun
                                                                                      (_B4) ->
                                                                                          {V3_item_id,
                                                                                           _B5} =
                                                                                              protocol:uint32(_B4),
                                                                                          {V3_val,
                                                                                           _B6} =
                                                                                              protocol:uint32(_B5),
                                                                                          {{V3_item_id,
                                                                                            V3_val},
                                                                                           _B6}
                                                                                  end),
                                                               {{V2_name,
                                                                 V2_event_id,
                                                                 V2_items},
                                                                _B8}
                                                       end),
    {ok, {V1_camp_zillionaire_event}};
unpack(srv, 20450, _B0) -> {ok, {}};
unpack(cli, 20450, _B0) ->
    {V1_grid_index, _B1} = protocol:uint8(_B0),
    {V1_times, _B2} = protocol:uint32(_B1),
    {V1_lucky_dice, _B3} = protocol:uint8(_B2),
    {V1_ring_times, _B4} = protocol:uint32(_B3),
    {V1_ring_rewards, _B8} = protocol:array(_B4,
                                            fun (_B5) ->
                                                    {V2_times, _B6} =
                                                        protocol:uint32(_B5),
                                                    {{V2_times}, _B6}
                                            end),
    {ok,
     {V1_grid_index,
      V1_times,
      V1_lucky_dice,
      V1_ring_times,
      V1_ring_rewards}};
unpack(srv, 20451, _B0) -> {ok, {}};
unpack(cli, 20451, _B0) ->
    {V1_flower_info, _B6} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_flower_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_pass_flag, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_pass_times, _B4} =
                                                       protocol:uint32(_B3),
                                                   {{V2_flower_id,
                                                     V2_pass_flag,
                                                     V2_pass_times},
                                                    _B4}
                                           end),
    {V1_gift_flag, _B7} = protocol:uint8(_B6),
    {V1_finish_num, _B8} = protocol:uint32(_B7),
    {V1_rank, _B9} = protocol:uint32(_B8),
    {ok,
     {V1_flower_info, V1_gift_flag, V1_finish_num, V1_rank}};
unpack(srv, 20452, _B0) ->
    {V1_reward_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_reward_type, V1_id}};
unpack(cli, 20452, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20453, _B0) ->
    {V1_flower_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_flower_id, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 20453, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20454, _B0) -> {ok, {}};
unpack(cli, 20454, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_flower_id, _B2} = protocol:uint32(_B1),
    {V1_min, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_name, V1_flower_id, V1_min, V1_flag}};
unpack(srv, 20455, _B0) ->
    {V1_flower_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_flower_id}};
unpack(cli, 20455, _B0) ->
    {V1_role, _B7} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_zone_id, _B4} =
                                                protocol:uint16(_B3),
                                            {V2_name, _B5} =
                                                protocol:string(_B4),
                                            {{V2_id,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_name},
                                             _B5}
                                    end),
    {ok, {V1_role}};
unpack(srv, 20456, _B0) -> {ok, {}};
unpack(cli, 20456, _B0) ->
    {V1_item_info, _B11} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint16(_B1),
                                                  {V2_item_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_inner_num, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_item_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_price, _B6} =
                                                      protocol:uint16(_B5),
                                                  {V2_buy_limit, _B7} =
                                                      protocol:uint16(_B6),
                                                  {V2_buyed_num, _B8} =
                                                      protocol:uint16(_B7),
                                                  {V2_is_effect, _B9} =
                                                      protocol:uint8(_B8),
                                                  {{V2_id,
                                                    V2_item_id,
                                                    V2_inner_num,
                                                    V2_item_name,
                                                    V2_price,
                                                    V2_buy_limit,
                                                    V2_buyed_num,
                                                    V2_is_effect},
                                                   _B9}
                                          end),
    {V1_rebate_info, _B16} = protocol:array(_B11,
                                            fun (_B12) ->
                                                    {V2_purchase_val, _B13} =
                                                        protocol:uint16(_B12),
                                                    {V2_rebate_val, _B14} =
                                                        protocol:uint16(_B13),
                                                    {{V2_purchase_val,
                                                      V2_rebate_val},
                                                     _B14}
                                            end),
    {ok, {V1_item_info, V1_rebate_info}};
unpack(srv, 20457, _B0) ->
    {V1_item_list, _B5} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_item_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_buy_num, _B3} =
                                                     protocol:uint16(_B2),
                                                 {{V2_item_id, V2_buy_num}, _B3}
                                         end),
    {ok, {V1_item_list}};
unpack(cli, 20457, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20458, _B0) -> {ok, {}};
unpack(cli, 20458, _B0) ->
    {V1_map_num, _B5} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_map_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_num, _B3} =
                                                   protocol:uint32(_B2),
                                               {{V2_map_id, V2_num}, _B3}
                                       end),
    {ok, {V1_map_num}};
unpack(srv, 20459, _B0) -> {ok, {}};
unpack(cli, 20459, _B0) ->
    {V1_now_times, _B1} = protocol:uint32(_B0),
    {V1_add_list, _B12} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_times, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_reward, _B10} =
                                                     protocol:array(_B3,
                                                                    fun (_B4) ->
                                                                            {V3_item_id,
                                                                             _B5} =
                                                                                protocol:uint32(_B4),
                                                                            {V3_bind,
                                                                             _B6} =
                                                                                protocol:uint8(_B5),
                                                                            {V3_num,
                                                                             _B7} =
                                                                                protocol:uint32(_B6),
                                                                            {V3_effect,
                                                                             _B8} =
                                                                                protocol:uint8(_B7),
                                                                            {{V3_item_id,
                                                                              V3_bind,
                                                                              V3_num,
                                                                              V3_effect},
                                                                             _B8}
                                                                    end),
                                                 {{V2_times, V2_reward}, _B10}
                                         end),
    {V1_last_reward, _B19} = protocol:array(_B12,
                                            fun (_B13) ->
                                                    {V2_item_id, _B14} =
                                                        protocol:uint32(_B13),
                                                    {V2_bind, _B15} =
                                                        protocol:uint8(_B14),
                                                    {V2_num, _B16} =
                                                        protocol:uint32(_B15),
                                                    {V2_effect, _B17} =
                                                        protocol:uint8(_B16),
                                                    {{V2_item_id,
                                                      V2_bind,
                                                      V2_num,
                                                      V2_effect},
                                                     _B17}
                                            end),
    {ok, {V1_now_times, V1_add_list, V1_last_reward}};
unpack(srv, 20460, _B0) -> {ok, {}};
unpack(cli, 20460, _B0) ->
    {V1_special_items, _B10} = protocol:array(_B0,
                                              fun (_B1) ->
                                                      {V2_id, _B2} =
                                                          protocol:uint8(_B1),
                                                      {V2_order_id, _B3} =
                                                          protocol:uint8(_B2),
                                                      {V2_item_id, _B4} =
                                                          protocol:uint32(_B3),
                                                      {V2_base_num, _B5} =
                                                          protocol:uint8(_B4),
                                                      {V2_exchange_num, _B6} =
                                                          protocol:uint8(_B5),
                                                      {V2_cost, _B7} =
                                                          protocol:uint32(_B6),
                                                      {V2_is_effect, _B8} =
                                                          protocol:uint8(_B7),
                                                      {{V2_id,
                                                        V2_order_id,
                                                        V2_item_id,
                                                        V2_base_num,
                                                        V2_exchange_num,
                                                        V2_cost,
                                                        V2_is_effect},
                                                       _B8}
                                              end),
    {V1_common_items, _B18} = protocol:array(_B10,
                                             fun (_B11) ->
                                                     {V2_order_id, _B12} =
                                                         protocol:uint8(_B11),
                                                     {V2_item_id, _B13} =
                                                         protocol:uint32(_B12),
                                                     {V2_base_num, _B14} =
                                                         protocol:uint8(_B13),
                                                     {V2_cost, _B15} =
                                                         protocol:uint32(_B14),
                                                     {V2_is_effect, _B16} =
                                                         protocol:uint8(_B15),
                                                     {{V2_order_id,
                                                       V2_item_id,
                                                       V2_base_num,
                                                       V2_cost,
                                                       V2_is_effect},
                                                      _B16}
                                             end),
    {ok, {V1_special_items, V1_common_items}};
unpack(srv, 20461, _B0) -> {ok, {}};
unpack(cli, 20461, _B0) ->
    {V1_quest, _B10} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_quest_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_reward_val, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_icon, _B4} =
                                                  protocol:string(_B3),
                                              {V2_value, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_target_val, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_quest_status, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_quest_sort, _B8} =
                                                  protocol:uint8(_B7),
                                              {{V2_quest_id,
                                                V2_reward_val,
                                                V2_icon,
                                                V2_value,
                                                V2_target_val,
                                                V2_quest_status,
                                                V2_quest_sort},
                                               _B8}
                                      end),
    {ok, {V1_quest}};
unpack(srv, 20462, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_order_id, _B2} = protocol:uint8(_B1),
    {V1_item_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_order_id, V1_item_id}};
unpack(cli, 20462, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20463, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 20463, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 20464, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 20464, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20465, _B0) -> {ok, {}};
unpack(cli, 20465, _B0) ->
    {V1_day, _B1} = protocol:uint32(_B0),
    {V1_need_cost, _B2} = protocol:uint32(_B1),
    {V1_shop_list, _B14} = protocol:array(_B2,
                                          fun (_B3) ->
                                                  {V2_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_item_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_bind, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_num, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_price_item_id, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_price_num, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_left_num, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_total_num, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_show_effect, _B12} =
                                                      protocol:uint8(_B11),
                                                  {{V2_id,
                                                    V2_item_id,
                                                    V2_bind,
                                                    V2_num,
                                                    V2_price_item_id,
                                                    V2_price_num,
                                                    V2_left_num,
                                                    V2_total_num,
                                                    V2_show_effect},
                                                   _B12}
                                          end),
    {ok, {V1_day, V1_need_cost, V1_shop_list}};
unpack(srv, 20466, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 20466, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20467, _B0) -> {ok, {}};
unpack(cli, 20467, _B0) ->
    {V1_plans, _B13} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_plan_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_items, _B6} =
                                                  protocol:array(_B2,
                                                                 fun (_B3) ->
                                                                         {V3_item_base_id,
                                                                          _B4} =
                                                                             protocol:uint32(_B3),
                                                                         {{V3_item_base_id},
                                                                          _B4}
                                                                 end),
                                              {V2_all_times, _B7} =
                                                  protocol:uint32(_B6),
                                              {V2_times, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_item_id, _B9} =
                                                  protocol:uint32(_B8),
                                              {V2_base_num, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_is_effect, _B11} =
                                                  protocol:uint8(_B10),
                                              {{V2_plan_id,
                                                V2_items,
                                                V2_all_times,
                                                V2_times,
                                                V2_item_id,
                                                V2_base_num,
                                                V2_is_effect},
                                               _B11}
                                      end),
    {V1_collect_items, _B17} = protocol:array(_B13,
                                              fun (_B14) ->
                                                      {V2_collect_base_id,
                                                       _B15} =
                                                          protocol:uint32(_B14),
                                                      {{V2_collect_base_id},
                                                       _B15}
                                              end),
    {ok, {V1_plans, V1_collect_items}};
unpack(srv, 20468, _B0) ->
    {V1_plan_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_plan_id}};
unpack(cli, 20468, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20469, _B0) -> {ok, {}};
unpack(cli, 20469, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(srv, 20470, _B0) -> {ok, {}};
unpack(cli, 20470, _B0) ->
    {V1_reward_info, _B15} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_recharge_day, _B2} =
                                                        protocol:uint8(_B1),
                                                    {V2_items, _B9} =
                                                        protocol:array(_B2,
                                                                       fun
                                                                           (_B3) ->
                                                                               {V3_item_base_id,
                                                                                _B4} =
                                                                                   protocol:uint32(_B3),
                                                                               {V3_bind,
                                                                                _B5} =
                                                                                   protocol:uint8(_B4),
                                                                               {V3_num,
                                                                                _B6} =
                                                                                   protocol:uint32(_B5),
                                                                               {V3_client_effect,
                                                                                _B7} =
                                                                                   protocol:uint8(_B6),
                                                                               {{V3_item_base_id,
                                                                                 V3_bind,
                                                                                 V3_num,
                                                                                 V3_client_effect},
                                                                                _B7}
                                                                       end),
                                                    {V2_lower, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_v_item_id, _B11} =
                                                        protocol:uint32(_B10),
                                                    {V2_v_effect, _B12} =
                                                        protocol:uint8(_B11),
                                                    {V2_desc, _B13} =
                                                        protocol:string(_B12),
                                                    {{V2_recharge_day,
                                                      V2_items,
                                                      V2_lower,
                                                      V2_v_item_id,
                                                      V2_v_effect,
                                                      V2_desc},
                                                     _B13}
                                            end),
    {ok, {V1_reward_info}};
unpack(srv, 20471, _B0) -> {ok, {}};
unpack(cli, 20471, _B0) ->
    {V1_recharged_day, _B1} = protocol:uint8(_B0),
    {V1_rewarded_list, _B5} = protocol:array(_B1,
                                             fun (_B2) ->
                                                     {V2_day_id, _B3} =
                                                         protocol:uint8(_B2),
                                                     {{V2_day_id}, _B3}
                                             end),
    {V1_recharged_val, _B6} = protocol:uint32(_B5),
    {V1_vision_day, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_recharged_day,
      V1_rewarded_list,
      V1_recharged_val,
      V1_vision_day}};
unpack(srv, 20472, _B0) ->
    {V1_day_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_day_id}};
unpack(cli, 20472, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20473, _B0) -> {ok, {}};
unpack(cli, 20473, _B0) ->
    {V1_camp_info, _B16} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_type, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_need_val, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_time, _B4} =
                                                      protocol:uint8(_B3),
                                                  {V2_reward, _B11} =
                                                      protocol:array(_B4,
                                                                     fun
                                                                         (_B5) ->
                                                                             {V3_item_base_id,
                                                                              _B6} =
                                                                                 protocol:uint32(_B5),
                                                                             {V3_bind,
                                                                              _B7} =
                                                                                 protocol:uint8(_B6),
                                                                             {V3_num,
                                                                              _B8} =
                                                                                 protocol:uint32(_B7),
                                                                             {V3_client_effect,
                                                                              _B9} =
                                                                                 protocol:uint8(_B8),
                                                                             {{V3_item_base_id,
                                                                               V3_bind,
                                                                               V3_num,
                                                                               V3_client_effect},
                                                                              _B9}
                                                                     end),
                                                  {V2_add_val, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_title, _B13} =
                                                      protocol:string(_B12),
                                                  {V2_desc, _B14} =
                                                      protocol:string(_B13),
                                                  {{V2_type,
                                                    V2_need_val,
                                                    V2_time,
                                                    V2_reward,
                                                    V2_add_val,
                                                    V2_title,
                                                    V2_desc},
                                                   _B14}
                                          end),
    {V1_bring_up_info, _B21} = protocol:array(_B16,
                                              fun (_B17) ->
                                                      {V2_goal_point, _B18} =
                                                          protocol:uint32(_B17),
                                                      {V2_client_pic, _B19} =
                                                          protocol:uint32(_B18),
                                                      {{V2_goal_point,
                                                        V2_client_pic},
                                                       _B19}
                                              end),
    {V1_bring_up_gift, _B28} = protocol:array(_B21,
                                              fun (_B22) ->
                                                      {V2_bring_lev, _B23} =
                                                          protocol:uint8(_B22),
                                                      {V2_gift_type, _B24} =
                                                          protocol:uint32(_B23),
                                                      {V2_gift_id, _B25} =
                                                          protocol:uint32(_B24),
                                                      {V2_gift_num, _B26} =
                                                          protocol:uint32(_B25),
                                                      {{V2_bring_lev,
                                                        V2_gift_type,
                                                        V2_gift_id,
                                                        V2_gift_num},
                                                       _B26}
                                              end),
    {V1_levup_point, _B29} = protocol:uint32(_B28),
    {V1_now_bring_lev, _B30} = protocol:uint32(_B29),
    {V1_now_bring_val, _B31} = protocol:uint32(_B30),
    {V1_active_val, _B32} = protocol:uint32(_B31),
    {ok,
     {V1_camp_info,
      V1_bring_up_info,
      V1_bring_up_gift,
      V1_levup_point,
      V1_now_bring_lev,
      V1_now_bring_val,
      V1_active_val}};
unpack(srv, 20474, _B0) -> {ok, {}};
unpack(cli, 20474, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20475, _B0) -> {ok, {}};
unpack(cli, 20475, _B0) ->
    {V1_camp_info, _B17} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_group_id, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_origin_val, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_need_val, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_time, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_all_time, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_reward, _B13} =
                                                      protocol:array(_B6,
                                                                     fun
                                                                         (_B7) ->
                                                                             {V3_item_base_id,
                                                                              _B8} =
                                                                                 protocol:uint32(_B7),
                                                                             {V3_bind,
                                                                              _B9} =
                                                                                 protocol:uint8(_B8),
                                                                             {V3_num,
                                                                              _B10} =
                                                                                 protocol:uint32(_B9),
                                                                             {V3_client_effect,
                                                                              _B11} =
                                                                                 protocol:uint8(_B10),
                                                                             {{V3_item_base_id,
                                                                               V3_bind,
                                                                               V3_num,
                                                                               V3_client_effect},
                                                                              _B11}
                                                                     end),
                                                  {V2_title, _B14} =
                                                      protocol:string(_B13),
                                                  {V2_desc, _B15} =
                                                      protocol:string(_B14),
                                                  {{V2_group_id,
                                                    V2_origin_val,
                                                    V2_need_val,
                                                    V2_time,
                                                    V2_all_time,
                                                    V2_reward,
                                                    V2_title,
                                                    V2_desc},
                                                   _B15}
                                          end),
    {ok, {V1_camp_info}};
unpack(srv, 20476, _B0) ->
    {V1_group_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_group_id}};
unpack(cli, 20476, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20477, _B0) -> {ok, {}};
unpack(cli, 20477, _B0) ->
    {V1_reward_info, _B16} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_id, _B2} =
                                                        protocol:uint8(_B1),
                                                    {V2_charge, _B3} =
                                                        protocol:uint32(_B2),
                                                    {V2_items, _B10} =
                                                        protocol:array(_B3,
                                                                       fun
                                                                           (_B4) ->
                                                                               {V3_item_base_id,
                                                                                _B5} =
                                                                                   protocol:uint32(_B4),
                                                                               {V3_bind,
                                                                                _B6} =
                                                                                   protocol:uint8(_B5),
                                                                               {V3_num,
                                                                                _B7} =
                                                                                   protocol:uint32(_B6),
                                                                               {V3_client_effect,
                                                                                _B8} =
                                                                                   protocol:uint8(_B7),
                                                                               {{V3_item_base_id,
                                                                                 V3_bind,
                                                                                 V3_num,
                                                                                 V3_client_effect},
                                                                                _B8}
                                                                       end),
                                                    {V2_v_item_id, _B11} =
                                                        protocol:uint32(_B10),
                                                    {V2_effect, _B12} =
                                                        protocol:uint8(_B11),
                                                    {V2_desc, _B13} =
                                                        protocol:string(_B12),
                                                    {V2_flag, _B14} =
                                                        protocol:uint8(_B13),
                                                    {{V2_id,
                                                      V2_charge,
                                                      V2_items,
                                                      V2_v_item_id,
                                                      V2_effect,
                                                      V2_desc,
                                                      V2_flag},
                                                     _B14}
                                            end),
    {V1_recharged_val, _B17} = protocol:uint32(_B16),
    {V1_v_id, _B18} = protocol:uint8(_B17),
    {ok, {V1_reward_info, V1_recharged_val, V1_v_id}};
unpack(srv, 20478, _B0) ->
    {V1_group_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_group_id}};
unpack(cli, 20478, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20479, _B0) -> {ok, {}};
unpack(cli, 20479, _B0) ->
    {V1_reward_info, _B7} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint8(_B1),
                                                   {V2_gift_id, _B3} =
                                                       protocol:uint32(_B2),
                                                   {V2_effect, _B4} =
                                                       protocol:uint8(_B3),
                                                   {V2_flag, _B5} =
                                                       protocol:uint8(_B4),
                                                   {{V2_id,
                                                     V2_gift_id,
                                                     V2_effect,
                                                     V2_flag},
                                                    _B5}
                                           end),
    {V1_value, _B8} = protocol:uint32(_B7),
    {ok, {V1_reward_info, V1_value}};
unpack(srv, 20480, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 20480, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20481, _B0) -> {ok, {}};
unpack(cli, 20481, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_buy_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_camp_id, V1_buy_time}};
unpack(srv, 20482, _B0) -> {ok, {}};
unpack(cli, 20482, _B0) ->
    {V1_reward_info, _B9} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint8(_B1),
                                                   {V2_site, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_item_id, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_item_num, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_effect, _B6} =
                                                       protocol:uint8(_B5),
                                                   {V2_flag, _B7} =
                                                       protocol:uint8(_B6),
                                                   {{V2_id,
                                                     V2_site,
                                                     V2_item_id,
                                                     V2_item_num,
                                                     V2_effect,
                                                     V2_flag},
                                                    _B7}
                                           end),
    {V1_cost_item, _B10} = protocol:uint32(_B9),
    {V1_times, _B11} = protocol:uint8(_B10),
    {V1_num, _B12} = protocol:uint32(_B11),
    {V1_exchang_val, _B13} = protocol:uint32(_B12),
    {ok,
     {V1_reward_info,
      V1_cost_item,
      V1_times,
      V1_num,
      V1_exchang_val}};
unpack(srv, 20483, _B0) -> {ok, {}};
unpack(cli, 20483, _B0) ->
    {V1_item_id, _B1} = protocol:uint32(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_item_id, V1_msg}};
unpack(srv, 20484, _B0) -> {ok, {}};
unpack(cli, 20484, _B0) ->
    {V1_items, _B4} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_item, _B2} =
                                                 protocol:uint32(_B1),
                                             {{V2_item}, _B2}
                                     end),
    {ok, {V1_items}};
unpack(srv, 20485, _B0) -> {ok, {}};
unpack(cli, 20485, _B0) ->
    {V1_lev, _B1} = protocol:uint8(_B0),
    {V1_val, _B2} = protocol:uint32(_B1),
    {V1_week_box, _B3} = protocol:uint8(_B2),
    {V1_token_info, _B11} = protocol:array(_B3,
                                           fun (_B4) ->
                                                   {V2_id, _B5} =
                                                       protocol:uint8(_B4),
                                                   {V2_can_draw, _B9} =
                                                       protocol:array(_B5,
                                                                      fun
                                                                          (_B6) ->
                                                                              {V3_lev_id,
                                                                               _B7} =
                                                                                  protocol:uint8(_B6),
                                                                              {{V3_lev_id},
                                                                               _B7}
                                                                      end),
                                                   {{V2_id, V2_can_draw}, _B9}
                                           end),
    {ok, {V1_lev, V1_val, V1_week_box, V1_token_info}};
unpack(srv, 20487, _B0) -> {ok, {}};
unpack(cli, 20487, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20488, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 20488, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20489, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_lev}};
unpack(cli, 20489, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20490, _B0) -> {ok, {}};
unpack(cli, 20490, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20491, _B0) -> {ok, {}};
unpack(cli, 20491, _B0) ->
    {V1_gift, _B4} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_gift_id, _B2} =
                                                protocol:uint16(_B1),
                                            {{V2_gift_id}, _B2}
                                    end),
    {V1_buy, _B9} = protocol:array(_B4,
                                   fun (_B5) ->
                                           {V2_gift_id, _B6} =
                                               protocol:uint16(_B5),
                                           {V2_times, _B7} =
                                               protocol:uint8(_B6),
                                           {{V2_gift_id, V2_times}, _B7}
                                   end),
    {V1_extra_reward, _B10} = protocol:uint8(_B9),
    {ok, {V1_gift, V1_buy, V1_extra_reward}};
unpack(srv, 20492, _B0) ->
    {V1_gift_id, _B1} = protocol:uint16(_B0),
    {V1_item_ids, _B5} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_index, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_index}, _B3}
                                        end),
    {ok, {V1_gift_id, V1_item_ids}};
unpack(cli, 20492, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_item_ids, _B6} = protocol:array(_B2,
                                        fun (_B3) ->
                                                {V2_index, _B4} =
                                                    protocol:uint32(_B3),
                                                {{V2_index}, _B4}
                                        end),
    {ok, {V1_result, V1_msg, V1_item_ids}};
unpack(srv, 20493, _B0) -> {ok, {}};
unpack(cli, 20493, _B0) ->
    {V1_camp_info, _B16} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_type, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_need_val, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_time, _B4} =
                                                      protocol:uint8(_B3),
                                                  {V2_reward, _B11} =
                                                      protocol:array(_B4,
                                                                     fun
                                                                         (_B5) ->
                                                                             {V3_item_base_id,
                                                                              _B6} =
                                                                                 protocol:uint32(_B5),
                                                                             {V3_bind,
                                                                              _B7} =
                                                                                 protocol:uint8(_B6),
                                                                             {V3_num,
                                                                              _B8} =
                                                                                 protocol:uint32(_B7),
                                                                             {V3_client_effect,
                                                                              _B9} =
                                                                                 protocol:uint8(_B8),
                                                                             {{V3_item_base_id,
                                                                               V3_bind,
                                                                               V3_num,
                                                                               V3_client_effect},
                                                                              _B9}
                                                                     end),
                                                  {V2_add_val, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_title, _B13} =
                                                      protocol:string(_B12),
                                                  {V2_desc, _B14} =
                                                      protocol:string(_B13),
                                                  {{V2_type,
                                                    V2_need_val,
                                                    V2_time,
                                                    V2_reward,
                                                    V2_add_val,
                                                    V2_title,
                                                    V2_desc},
                                                   _B14}
                                          end),
    {V1_bring_up_info, _B21} = protocol:array(_B16,
                                              fun (_B17) ->
                                                      {V2_goal_point, _B18} =
                                                          protocol:uint32(_B17),
                                                      {V2_client_pic, _B19} =
                                                          protocol:uint32(_B18),
                                                      {{V2_goal_point,
                                                        V2_client_pic},
                                                       _B19}
                                              end),
    {V1_bring_up_gift, _B27} = protocol:array(_B21,
                                              fun (_B22) ->
                                                      {V2_gift_type, _B23} =
                                                          protocol:uint32(_B22),
                                                      {V2_gift_id, _B24} =
                                                          protocol:uint32(_B23),
                                                      {V2_gift_num, _B25} =
                                                          protocol:uint32(_B24),
                                                      {{V2_gift_type,
                                                        V2_gift_id,
                                                        V2_gift_num},
                                                       _B25}
                                              end),
    {V1_levup_point, _B28} = protocol:uint32(_B27),
    {V1_now_bring_val, _B29} = protocol:uint32(_B28),
    {V1_active_val, _B30} = protocol:uint32(_B29),
    {ok,
     {V1_camp_info,
      V1_bring_up_info,
      V1_bring_up_gift,
      V1_levup_point,
      V1_now_bring_val,
      V1_active_val}};
unpack(srv, 20494, _B0) -> {ok, {}};
unpack(cli, 20494, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20495, _B0) -> {ok, {}};
unpack(cli, 20495, _B0) ->
    {V1_token_info, _B8} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_has_get, _B6} =
                                                      protocol:array(_B2,
                                                                     fun
                                                                         (_B3) ->
                                                                             {V3_lev_id,
                                                                              _B4} =
                                                                                 protocol:uint8(_B3),
                                                                             {{V3_lev_id},
                                                                              _B4}
                                                                     end),
                                                  {{V2_id, V2_has_get}, _B6}
                                          end),
    {ok, {V1_token_info}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

