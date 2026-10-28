-file("src/proto/proto_140.erl", 1).

-module(proto_140).

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

-file("src/proto/proto_140.erl", 14).

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

-file("src/proto/proto_140.erl", 15).

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

-file("src/proto/proto_140.erl", 16).

-file("inc/camp_dragon_boat.hrl", 1).

-record(m_camp_dragon_boat,
        {ver = 0,
         start_time = 0 :: non_neg_integer(),
         time_span = 0 :: non_neg_integer(),
         rewarded = [] :: non_neg_integer(),
         rewarded_time = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         fought = 0 :: non_neg_integer(),
         triggers = []}).

-record(dragon_boat_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..5,
         time_span = 0 :: integer(),
         is_leader = 0 :: 0 | 1}).

-record(dragon_boat_team,
        {ver = 0,
         id = [] :: list(),
         time_span = 0 :: integer(),
         members = [],
         rank = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         leader_name = "" :: list()}).

-file("src/proto/proto_140.erl", 17).

-file("inc/camp_fruit.hrl", 1).

-record(camp_fruit,
        {id = {0, "", 0},
         lev = 0,
         list = [],
         start_time = 0,
         end_time = 0,
         helped = 0}).

-record(camp_fruit_land,
        {id = 0,
         status = 0,
         base_id = 0,
         num = 0,
         need_num = 0,
         start_time = 0,
         end_time = 0,
         guilds = [],
         friends = [],
         log = []}).

-record(camp_fruit_land_log,
        {id = {0, "", 0},
         name = "",
         type = 0,
         base_id = 0,
         num = 0,
         mtime = 0}).

-record(camp_fruit_data,
        {id = 0,
         item_id = 0,
         type = 0,
         num = 0,
         cd = 0,
         reward = [],
         rand_reward = [],
         cast_msg = "",
         help_reward = [],
         help_exp_mode = 0,
         help_exp_radio = 0,
         help_rand_reward = [],
         help_cast_msg = "",
         exp_mode = 0,
         exp_radio = 0,
         plant_reward = [],
         plant_rand_reward = [],
         plant_cast_msg = "",
         plant_exp_mode = 0,
         plant_exp_radio = 0,
         friend_help_id = 0,
         guild_help_id = 0}).

-record(camp_fruit_reward_data,
        {min = 0,
         max = 0,
         reward = [],
         rand_reward = [],
         cast_msg = "",
         exp_mode = 0,
         exp_radio = 0}).

-file("src/proto/proto_140.erl", 18).

-file("inc/camp_hide_seek.hrl", 1).

-record(camp_hide_seek,
        {refresh_time = 0,
         group = 0,
         list = [],
         is_reward = 0,
         active_list = []}).

-record(camp_hide_seek_unit,
        {id = {0, 0}, base_id = 0, pos}).

-record(camp_hide_seek_unit_data,
        {base_id = 0,
         id = 0,
         reward = [],
         rand_reward = [],
         cast_msg = "",
         exp_mode = 0,
         quest_id = 0,
         first_id = 0}).

-record(camp_hide_seek_group_data,
        {id = 0,
         unit_list = [],
         cast_msg = "",
         end_cast_msg = ""}).

-record(camp_hide_seek_reward_data,
        {min = 0,
         max = 0,
         reward = [],
         rand_reward = [],
         cast_msg = "",
         exp_mode = 0}).

-record(camp_hide_seek_quest_data,
        {quest_id = 0, unit_id = 0, next_id = 0}).

-file("src/proto/proto_140.erl", 19).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/proto/proto_140.erl", 20).

-file("inc/camp_web.hrl", 1).

-record(m_camp_web,
        {ver = 4 :: non_neg_integer(),
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list(),
         card_info = {0, 0, 0, []} :: tuple()}).

-record(camp_web_ico,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         title = "" :: bitstring(),
         ico = "" :: bitstring(),
         alert = "" :: bitstring(),
         gif = "" :: bitstring(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         login_open = 0 :: non_neg_integer(),
         is_show_time = 0 :: 0..1,
         menu_list = [] :: list()}).

-record(camp_web_menu,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_mod = 0 :: non_neg_integer(),
         mail_title = "" :: bitstring(),
         mail_content = "" :: bitstring(),
         title = "" :: bitstring(),
         title2 = "" :: bitstring(),
         ico = "" :: bitstring(),
         title_ico = "" :: bitstring(),
         type_ico = "" :: bitstring(),
         total_ico = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         sort_val = 0 :: non_neg_integer(),
         top_banner = "" :: bitstring(),
         rule_str = "" :: bitstring(),
         time_str = "" :: bitstring(),
         bottom_alert = "" :: bitstring(),
         reward_title = "" :: bitstring(),
         panel_type = "" :: bitstring(),
         cli_reward = "" :: bitstring(),
         button_text = "" :: bitstring(),
         is_button = 0 :: 0..1,
         notice_msg = "" :: bitstring(),
         camp_list = [] :: list(),
         is_tran = 0,
         tran_info = ""}).

-record(camp_web,
        {id = 0 :: non_neg_integer(),
         n = 1 :: pos_integer(),
         key = {0, 0} :: tuple(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         third_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_num = 1 :: non_neg_integer(),
         reward_can = 0 :: non_neg_integer(),
         value = 0 :: non_neg_integer(),
         tar_val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         status = 0 :: 0..2,
         cond_msg = "" :: bitstring(),
         loss_items = [] :: list(),
         items = [] :: list(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         str1 = "" :: bitstring(),
         str2 = "" :: bitstring(),
         str3 = "" :: bitstring(),
         str4 = "" :: bitstring(),
         extra = [],
         data :: undefined | any(),
         is_desc = 0 :: 0..1}).

-record(camp_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         total_camp :: undefined | #camp_web_ico{},
         menu :: undefined | #camp_web_menu{},
         camp :: undefined | #camp_web{},
         call_form = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         rpc_reward_num = 1 :: non_neg_integer(),
         push_cli = 0 :: 0..1,
         push_list = [] :: [tuple()],
         to_id,
         return_acc = 0}).

-file("src/proto/proto_140.erl", 21).

-file("inc/camp_web_rank.hrl", 1).

-record(camp_web_rank_cfg,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone}).

-record(camp_web_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(camp_web_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(camp_web_rank_role,
        {key,
         id = {roleid, platform, zoneid} :: term(),
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
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-file("src/proto/proto_140.erl", 22).

-file("inc/camp_rainbow_lottery.hrl", 1).

-record(m_rainbow_lottery,
        {ver = 1 :: pos_integer(),
         prizes = [] :: list(),
         lottery_times = 0,
         buffer_reward = []}).

-record(rainbow_prize,
        {ver = 1,
         id = 0,
         assets = 0,
         val = 0,
         is_hit = 0,
         show_rate = 0,
         rand_rate = 0,
         is_only = 0,
         times_min = 0,
         times_max = 0,
         is_hearsay = 0}).

-file("src/proto/proto_140.erl", 23).

-file("inc/camp_national_wisdom.hrl", 1).

-record(national_wisdom_joiner,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         pid = undefinded,
         looks = [],
         done_answer = 0,
         rank = 0}).

-file("src/proto/proto_140.erl", 24).

-file("inc/camp_login_roll.hrl", 1).

-record(camp_login_roll,
        {id = 0,
         day_time = 0,
         reward = [],
         reward_get = [],
         day = 0,
         roll_times = 0,
         status = 0}).

-file("src/proto/proto_140.erl", 25).

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

-file("src/proto/proto_140.erl", 26).

-file("inc/campaign_group_purchase.hrl", 1).

-record(campaign_group_purchase_base,
        {id = 0,
         base_id = 0,
         num = 0,
         limit_num = 0,
         price = 0,
         price_type = 90003,
         discount_list = [],
         start_time = 0,
         end_time = 0,
         check_list = [],
         lev_min = 0,
         lev_max = 0,
         base_role_num = 0,
         sex = 2}).

-record(campaign_group_purchase_item,
        {id = 0,
         ver = 2,
         base_id = 0,
         num = 0,
         limit_num = 0,
         price = 0,
         price_type = 90003,
         discount = 1000,
         discount_list = [],
         start_time = 0,
         end_time = 0,
         buy_num = 0,
         system_buy_num = 0,
         buy_roles = [],
         is_end = 0,
         lev_min = 0,
         lev_max = 0,
         sex = 2,
         list1 = [],
         list2 = []}).

-record(campaign_group_purchase_role,
        {id = {0, "", 0}, ver = 0, buy_list = []}).

-file("src/proto/proto_140.erl", 27).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14000, {}) ->
    {ok, <<2:32/little, 14000:16/little>>};
pack(srv, 14000, {V0_reward_list}) ->
    D_a_t_a = <<(length(V0_reward_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_status:8/little,
                                   V1_value:32/little, V1_target_val:32/little,
                                   V1_ext_val:32/little,
                                   V1_reward_max:16/little,
                                   V1_reward_can:16/little>>
                                 || {V1_id,
                                     V1_status,
                                     V1_value,
                                     V1_target_val,
                                     V1_ext_val,
                                     V1_reward_max,
                                     V1_reward_can}
                                        <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14000:16/little,
       D_a_t_a/binary>>};
pack(cli, 14001, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14001:16/little,
       D_a_t_a/binary>>};
pack(srv, 14001, {V0_flag, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14001:16/little,
       D_a_t_a/binary>>};
pack(cli, 14002, {}) ->
    {ok, <<2:32/little, 14002:16/little>>};
pack(srv, 14002, {V0_reward_list}) ->
    D_a_t_a = <<(length(V0_reward_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_status:8/little,
                                   V1_value:32/little, V1_target_val:32/little,
                                   V1_ext_val:32/little,
                                   V1_reward_max:16/little,
                                   V1_reward_can:16/little>>
                                 || {V1_id,
                                     V1_status,
                                     V1_value,
                                     V1_target_val,
                                     V1_ext_val,
                                     V1_reward_max,
                                     V1_reward_can}
                                        <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14002:16/little,
       D_a_t_a/binary>>};
pack(cli, 14003, {}) ->
    {ok, <<2:32/little, 14003:16/little>>};
pack(srv, 14003, {V0_camp_list}) ->
    D_a_t_a = <<(length(V0_camp_list)):16/little,
                (list_to_binary([<<V1_id:16/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little>>
                                 || {V1_id, V1_start_time, V1_end_time}
                                        <- V0_camp_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14003:16/little,
       D_a_t_a/binary>>};
pack(cli, 14004, {}) ->
    {ok, <<2:32/little, 14004:16/little>>};
pack(srv, 14004,
     {V0_open_srv_time, V0_merge_srv_time, V0_merge_num}) ->
    D_a_t_a = <<V0_open_srv_time:32/little,
                V0_merge_srv_time:32/little, V0_merge_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14004:16/little,
       D_a_t_a/binary>>};
pack(cli, 14005, {}) ->
    {ok, <<2:32/little, 14005:16/little>>};
pack(srv, 14005, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rank:32/little,
                                   V1_male_id:32/little,
                                   (protocol:pack(string,
                                                  V1_male_platform))/binary,
                                   V1_male_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_lev:32/little, V1_photo:32/little,
                                   V1_photo_auditing:32/little,
                                   V1_g_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_score:32/little,
                                   (length(V1_role_reward)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little>>
                                                    || {V2_item_id,
                                                        V2_bind,
                                                        V2_num}
                                                           <- V1_role_reward]))/binary,
                                   (length(V1_guild_reward)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little>>
                                                    || {V2_item_id,
                                                        V2_bind,
                                                        V2_num}
                                                           <- V1_guild_reward]))/binary,
                                   V1_honor:32/little>>
                                 || {V1_rank,
                                     {V1_male_id,
                                      V1_male_platform,
                                      V1_male_zone_id},
                                     V1_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_lev,
                                     V1_photo,
                                     V1_photo_auditing,
                                     {V1_g_id, V1_g_platform, V1_g_zone_id},
                                     V1_guild_name,
                                     V1_score,
                                     V1_role_reward,
                                     V1_guild_reward,
                                     V1_honor}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14005:16/little,
       D_a_t_a/binary>>};
pack(cli, 14006, {}) ->
    {ok, <<2:32/little, 14006:16/little>>};
pack(srv, 14006,
     {#campaign_eggs{location = V0_location,
                     rolled = V0_rolled, last_moved = V0_last_moved,
                     footprints = V0_footprints, rewarded = V0_rewarded},
      V0_can_roll}) ->
    D_a_t_a = <<V0_location:32/little, V0_rolled:32/little,
                V0_last_moved:32/little,
                (length(V0_footprints)):16/little,
                (list_to_binary([<<V1_fp:32/little>>
                                 || V1_fp <- V0_footprints]))/binary,
                (length(V0_rewarded)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_time:32/little>>
                                 || {V1_id, V1_time} <- V0_rewarded]))/binary,
                V0_can_roll:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14006:16/little,
       D_a_t_a/binary>>};
pack(cli, 14007, {}) ->
    {ok, <<2:32/little, 14007:16/little>>};
pack(srv, 14007,
     {V0_flag, V0_msg, V0_point, V0_base_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_point:8/little, V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14007:16/little,
       D_a_t_a/binary>>};
pack(cli, 14008, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14008:16/little,
       D_a_t_a/binary>>};
pack(srv, 14008, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14008:16/little,
       D_a_t_a/binary>>};
pack(cli, 14009, {}) ->
    {ok, <<2:32/little, 14009:16/little>>};
pack(srv, 14009,
     {#campaign_bags{last_filled = V0_last_filled,
                     rewarded = V0_rewarded, collected = V0_collected},
      V0_bag_rewards}) ->
    D_a_t_a = <<V0_last_filled:32/little,
                V0_rewarded:8/little, (length(V0_collected)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little,
                                   V1_status:8/little>>
                                 || {V1_id, V1_num, V1_status}
                                        <- V0_collected]))/binary,
                (length(V0_bag_rewards)):16/little,
                (list_to_binary([<<V1_c_id:32/little,
                                   (length(V1_rewards)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_base_num:32/little>>
                                                    || {V2_base_id, V2_base_num}
                                                           <- V1_rewards]))/binary>>
                                 || {V1_c_id, V1_rewards}
                                        <- V0_bag_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14009:16/little,
       D_a_t_a/binary>>};
pack(cli, 14010, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14010:16/little,
       D_a_t_a/binary>>};
pack(srv, 14010, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14010:16/little,
       D_a_t_a/binary>>};
pack(cli, 14011, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14011:16/little,
       D_a_t_a/binary>>};
pack(srv, 14011, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14011:16/little,
       D_a_t_a/binary>>};
pack(cli, 14012,
     {V0_rid, V0_platform, V0_zone_id, V0_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14012:16/little,
       D_a_t_a/binary>>};
pack(srv, 14012, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14012:16/little,
       D_a_t_a/binary>>};
pack(cli, 14013, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14013:16/little,
       D_a_t_a/binary>>};
pack(srv, 14013, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14013:16/little,
       D_a_t_a/binary>>};
pack(cli, 14014, {}) ->
    {ok, <<2:32/little, 14014:16/little>>};
pack(srv, 14014, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14014:16/little,
       D_a_t_a/binary>>};
pack(cli, 14019, {}) ->
    {ok, <<2:32/little, 14019:16/little>>};
pack(srv, 14019, {V0_open_time, V0_charged}) ->
    D_a_t_a = <<V0_open_time:32/little,
                (length(V0_charged)):16/little,
                (list_to_binary([<<V1_gold:32/little,
                                   V1_time:32/little>>
                                 || {V1_gold, V1_time}
                                        <- V0_charged]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14019:16/little,
       D_a_t_a/binary>>};
pack(cli, 14021, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14021:16/little,
       D_a_t_a/binary>>};
pack(srv, 14021,
     {{V0_r_id, V0_r_platform, V0_r_zone_id},
      V0_help,
      V0_helped,
      V0_start_time,
      V0_end_time,
      V0_list}) ->
    D_a_t_a = <<V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:32/little, V0_help:32/little,
                V0_helped:32/little, V0_start_time:32/little,
                V0_end_time:32/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_status:32/little,
                                   V1_num:32/little, V1_need_num:32/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little,
                                   (length(V1_guilds)):16/little,
                                   (list_to_binary([<<V2_g_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_g_platform))/binary,
                                                      V2_g_zone_id:32/little>>
                                                    || {V2_g_id,
                                                        V2_g_platform,
                                                        V2_g_zone_id}
                                                           <- V1_guilds]))/binary,
                                   (length(V1_friends)):16/little,
                                   (list_to_binary([<<V2_g_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_g_platform))/binary,
                                                      V2_g_zone_id:32/little>>
                                                    || {V2_g_id,
                                                        V2_g_platform,
                                                        V2_g_zone_id}
                                                           <- V1_friends]))/binary>>
                                 || #camp_fruit_land{id = V1_id,
                                                     status = V1_status,
                                                     num = V1_num,
                                                     need_num = V1_need_num,
                                                     start_time = V1_start_time,
                                                     end_time = V1_end_time,
                                                     guilds = V1_guilds,
                                                     friends = V1_friends}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14021:16/little,
       D_a_t_a/binary>>};
pack(cli, 14022, {V0_type, V0_id, V0_friends}) ->
    D_a_t_a = <<V0_type:32/little, V0_id:32/little,
                (length(V0_friends)):16/little,
                (list_to_binary([<<V1_g_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:32/little>>
                                 || {V1_g_id, V1_g_platform, V1_g_zone_id}
                                        <- V0_friends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14022:16/little,
       D_a_t_a/binary>>};
pack(srv, 14022, {V0_flag, V0_type, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_type:32/little,
                V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14022:16/little,
       D_a_t_a/binary>>};
pack(cli, 14023, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14023:16/little,
       D_a_t_a/binary>>};
pack(srv, 14023, {V0_flag, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14023:16/little,
       D_a_t_a/binary>>};
pack(cli, 14024,
     {V0_r_id,
      V0_r_platform,
      V0_r_zone_id,
      V0_id,
      V0_type,
      V0_base_id,
      V0_num}) ->
    D_a_t_a = <<V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:32/little, V0_id:32/little,
                V0_type:32/little, V0_base_id:32/little,
                V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14024:16/little,
       D_a_t_a/binary>>};
pack(srv, 14024, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14024:16/little,
       D_a_t_a/binary>>};
pack(cli, 14025, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14025:16/little,
       D_a_t_a/binary>>};
pack(srv, 14025, {V0_flag, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14025:16/little,
       D_a_t_a/binary>>};
pack(cli, 14026, {}) ->
    {ok, <<2:32/little, 14026:16/little>>};
pack(srv, 14026, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14026:16/little,
       D_a_t_a/binary>>};
pack(cli, 14027, {}) ->
    {ok, <<2:32/little, 14027:16/little>>};
pack(srv, 14027, {V0_num, V0_days, V0_buys}) ->
    D_a_t_a = <<V0_num:32/little,
                (length(V0_days)):16/little,
                (list_to_binary([<<V1_day:32/little>>
                                 || V1_day <- V0_days]))/binary,
                (length(V0_buys)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_time:32/little>>
                                 || {V1_id, V1_time} <- V0_buys]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14027:16/little,
       D_a_t_a/binary>>};
pack(cli, 14029, {V0_day}) ->
    D_a_t_a = <<V0_day:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14029:16/little,
       D_a_t_a/binary>>};
pack(srv, 14029, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14029:16/little,
       D_a_t_a/binary>>};
pack(cli, 14030, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14030:16/little,
       D_a_t_a/binary>>};
pack(srv, 14030, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14030:16/little,
       D_a_t_a/binary>>};
pack(cli, 14031, {}) ->
    {ok, <<2:32/little, 14031:16/little>>};
pack(srv, 14031, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14031:16/little,
       D_a_t_a/binary>>};
pack(cli, 14032, {}) ->
    {ok, <<2:32/little, 14032:16/little>>};
pack(srv, 14032,
     {V0_group, V0_list, V0_is_reward, V0_active_list}) ->
    D_a_t_a = <<V0_group:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_list]))/binary,
                V0_is_reward:32/little,
                (length(V0_active_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_active_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14032:16/little,
       D_a_t_a/binary>>};
pack(cli, 14033, {}) ->
    {ok, <<2:32/little, 14033:16/little>>};
pack(srv, 14033, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_battle_id:32/little,
                                   V1_u_id:32/little, V1_base_id:32/little,
                                   V1_map:32/little, V1_map_base_id:32/little,
                                   V1_x:32/little, V1_y:32/little>>
                                 || #camp_hide_seek_unit{id =
                                                             {V1_battle_id,
                                                              V1_u_id},
                                                         base_id = V1_base_id,
                                                         pos =
                                                             #pos{map = V1_map,
                                                                  map_base_id =
                                                                      V1_map_base_id,
                                                                  x = V1_x,
                                                                  y = V1_y}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14033:16/little,
       D_a_t_a/binary>>};
pack(cli, 14034, {V0_type, V0_base_id, V0_friends}) ->
    D_a_t_a = <<V0_type:32/little, V0_base_id:32/little,
                (length(V0_friends)):16/little,
                (list_to_binary([<<V1_g_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:32/little>>
                                 || {V1_g_id, V1_g_platform, V1_g_zone_id}
                                        <- V0_friends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14034:16/little,
       D_a_t_a/binary>>};
pack(srv, 14034, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14034:16/little,
       D_a_t_a/binary>>};
pack(cli, 14035, {V0_type, V0_base_id, V0_friends}) ->
    D_a_t_a = <<V0_type:32/little, V0_base_id:32/little,
                (length(V0_friends)):16/little,
                (list_to_binary([<<V1_g_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:32/little>>
                                 || {V1_g_id, V1_g_platform, V1_g_zone_id}
                                        <- V0_friends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14035:16/little,
       D_a_t_a/binary>>};
pack(srv, 14035, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14035:16/little,
       D_a_t_a/binary>>};
pack(cli, 14036, {}) ->
    {ok, <<2:32/little, 14036:16/little>>};
pack(srv, 14036,
     {{V0_r_id, V0_r_platform, V0_r_zone_id},
      V0_name,
      V0_list}) ->
    D_a_t_a = <<V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_status:32/little,
                                   V1_num:32/little, V1_need_num:32/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little,
                                   (length(V1_guilds)):16/little,
                                   (list_to_binary([<<V2_g_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_g_platform))/binary,
                                                      V2_g_zone_id:32/little>>
                                                    || {V2_g_id,
                                                        V2_g_platform,
                                                        V2_g_zone_id}
                                                           <- V1_guilds]))/binary,
                                   (length(V1_friends)):16/little,
                                   (list_to_binary([<<V2_g_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_g_platform))/binary,
                                                      V2_g_zone_id:32/little>>
                                                    || {V2_g_id,
                                                        V2_g_platform,
                                                        V2_g_zone_id}
                                                           <- V1_friends]))/binary>>
                                 || #camp_fruit_land{id = V1_id,
                                                     status = V1_status,
                                                     num = V1_num,
                                                     need_num = V1_need_num,
                                                     start_time = V1_start_time,
                                                     end_time = V1_end_time,
                                                     guilds = V1_guilds,
                                                     friends = V1_friends}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14036:16/little,
       D_a_t_a/binary>>};
pack(cli, 14037, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14037:16/little,
       D_a_t_a/binary>>};
pack(srv, 14037, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14037:16/little,
       D_a_t_a/binary>>};
pack(cli, 14038, {}) ->
    {ok, <<2:32/little, 14038:16/little>>};
pack(srv, 14038, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_type:32/little, V1_num:32/little>>
                                 || {V1_type, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14038:16/little,
       D_a_t_a/binary>>};
pack(cli, 14039, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14039:16/little,
       D_a_t_a/binary>>};
pack(srv, 14039, {V0_flag, V0_type, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_type:32/little,
                V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14039:16/little,
       D_a_t_a/binary>>};
pack(cli, 14040, {}) ->
    {ok, <<2:32/little, 14040:16/little>>};
pack(srv, 14040, {V0_flag, V0_msg, V0_item_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_item_id)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_bind:32/little, V1_num:32/little>>
                                 || {V1_item_id, V1_bind, V1_num}
                                        <- V0_item_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14040:16/little,
       D_a_t_a/binary>>};
pack(cli, 14041, {V0_type, V0_num}) ->
    D_a_t_a = <<V0_type:32/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14041:16/little,
       D_a_t_a/binary>>};
pack(srv, 14041, {V0_flag, V0_type, V0_ids, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_type:32/little,
                (length(V0_ids)):16/little,
                (list_to_binary([<<V1_id:16/little>>
                                 || V1_id <- V0_ids]))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14041:16/little,
       D_a_t_a/binary>>};
pack(cli, 14042, {}) ->
    {ok, <<2:32/little, 14042:16/little>>};
pack(srv, 14042,
     {V0_order, V0_type, V0_gain_list, V0_show_list}) ->
    D_a_t_a = <<V0_order:8/little, V0_type:8/little,
                (length(V0_gain_list)):16/little,
                (list_to_binary([<<V1_item_id1:32/little,
                                   V1_num1:8/little>>
                                 || {V1_item_id1, V1_num1}
                                        <- V0_gain_list]))/binary,
                (length(V0_show_list)):16/little,
                (list_to_binary([<<V1_item_id2:32/little,
                                   V1_num2:8/little>>
                                 || {V1_item_id2, V1_num2}
                                        <- V0_show_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14042:16/little,
       D_a_t_a/binary>>};
pack(cli, 14043, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14043:16/little,
       D_a_t_a/binary>>};
pack(srv, 14043, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14043:16/little,
       D_a_t_a/binary>>};
pack(cli, 14044, {}) ->
    {ok, <<2:32/little, 14044:16/little>>};
pack(srv, 14044, {V0_maps}) ->
    D_a_t_a = <<(length(V0_maps)):16/little,
                (list_to_binary([<<V1_map_id:16/little>>
                                 || V1_map_id <- V0_maps]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14044:16/little,
       D_a_t_a/binary>>};
pack(cli, 14045, {}) ->
    {ok, <<2:32/little, 14045:16/little>>};
pack(srv, 14045,
     {V0_campaign_group_purchase_item,
      V0_buy_list,
      V0_reward_base_id,
      V0_reward_num,
      V0_has_reward}) ->
    D_a_t_a =
        <<(length(V0_campaign_group_purchase_item)):16/little,
          (list_to_binary([<<V1_id:16/little,
                             V1_base_id:32/little, V1_num:32/little,
                             V1_price_type:32/little, V1_price:32/little,
                             V1_discount:16/little, V1_start_time:32/little,
                             V1_end_time:32/little, V1_buy_num:32/little,
                             V1_limit_num:32/little,
                             (length(V1_discount_list)):16/little,
                             (list_to_binary([<<V2_id:16/little,
                                                V2_need_num:16/little>>
                                              || {V2_id, V2_need_num}
                                                     <- V1_discount_list]))/binary,
                             (length(V1_list1)):16/little,
                             (list_to_binary([<<V2_base_id:32/little,
                                                V2_num:32/little>>
                                              || {V2_base_id, V2_num}
                                                     <- V1_list1]))/binary,
                             (length(V1_list2)):16/little,
                             (list_to_binary([<<V2_base_id:32/little,
                                                V2_num:32/little>>
                                              || {V2_base_id, V2_num}
                                                     <- V1_list2]))/binary>>
                           || #campaign_group_purchase_item{id = V1_id,
                                                            base_id =
                                                                V1_base_id,
                                                            num = V1_num,
                                                            price_type =
                                                                V1_price_type,
                                                            price = V1_price,
                                                            discount =
                                                                V1_discount,
                                                            start_time =
                                                                V1_start_time,
                                                            end_time =
                                                                V1_end_time,
                                                            buy_num =
                                                                V1_buy_num,
                                                            limit_num =
                                                                V1_limit_num,
                                                            discount_list =
                                                                V1_discount_list,
                                                            list1 = V1_list1,
                                                            list2 = V1_list2}
                                  <- V0_campaign_group_purchase_item]))/binary,
          (length(V0_buy_list)):16/little,
          (list_to_binary([<<V1_id:16/little,
                             V1_self_buy_num:32/little>>
                           || {V1_id, V1_self_buy_num} <- V0_buy_list]))/binary,
          V0_reward_base_id:32/little, V0_reward_num:32/little,
          V0_has_reward:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14045:16/little,
       D_a_t_a/binary>>};
pack(cli, 14046, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:16/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14046:16/little,
       D_a_t_a/binary>>};
pack(srv, 14046,
     {V0_flag,
      V0_msg,
      V0_id,
      V0_discount,
      V0_buy_num,
      V0_self_buy_num,
      V0_has_reward}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:16/little,
                V0_discount:16/little, V0_buy_num:32/little,
                V0_self_buy_num:32/little, V0_has_reward:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14046:16/little,
       D_a_t_a/binary>>};
pack(cli, 14047, {}) ->
    {ok, <<2:32/little, 14047:16/little>>};
pack(srv, 14047, {V0_card_list}) ->
    D_a_t_a = <<(length(V0_card_list)):16/little,
                (list_to_binary([<<V1_flag:8/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_num:32/little>>
                                 || {V1_flag, V1_base_id, V1_bind, V1_num}
                                        <- V0_card_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14047:16/little,
       D_a_t_a/binary>>};
pack(cli, 14048, {}) ->
    {ok, <<2:32/little, 14048:16/little>>};
pack(srv, 14048, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14048:16/little,
       D_a_t_a/binary>>};
pack(cli, 14049, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14049:16/little,
       D_a_t_a/binary>>};
pack(srv, 14049, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14049:16/little,
       D_a_t_a/binary>>};
pack(cli, 14050, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14050:16/little,
       D_a_t_a/binary>>};
pack(srv, 14050, {V0_mod, V0_camp_web_ico_list}) ->
    D_a_t_a = <<V0_mod:8/little,
                (length(V0_camp_web_ico_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_ico))/binary,
                                   (protocol:pack(string, V1_alert))/binary,
                                   (protocol:pack(string, V1_gif))/binary,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little,
                                   V1_login_open:8/little,
                                   V1_is_show_time:8/little,
                                   (length(V1_menu_list)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_type:32/little,
                                                      V2_sec_type:32/little,
                                                      V2_reward_mod:8/little,
                                                      (protocol:pack(string,
                                                                     V2_title))/binary,
                                                      (protocol:pack(string,
                                                                     V2_title2))/binary,
                                                      (protocol:pack(string,
                                                                     V2_title_ico))/binary,
                                                      (protocol:pack(string,
                                                                     V2_ico))/binary,
                                                      (protocol:pack(string,
                                                                     V2_type_ico))/binary,
                                                      V2_total_ico:32/little,
                                                      V2_start_time:32/little,
                                                      V2_end_time:32/little,
                                                      V2_sort_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_top_banner))/binary,
                                                      (protocol:pack(string,
                                                                     V2_rule_str))/binary,
                                                      (protocol:pack(string,
                                                                     V2_time_str))/binary,
                                                      (protocol:pack(string,
                                                                     V2_bottom_alert))/binary,
                                                      (protocol:pack(string,
                                                                     V2_reward_title))/binary,
                                                      (protocol:pack(string,
                                                                     V2_panel_type))/binary,
                                                      (protocol:pack(string,
                                                                     V2_button_text))/binary,
                                                      V2_is_button:8/little,
                                                      (protocol:pack(string,
                                                                     V2_cli_reward))/binary,
                                                      (protocol:pack(string,
                                                                     V2_tran_info))/binary,
                                                      (length(V2_camp_list)):16/little,
                                                      (list_to_binary([<<V3_n:8/little,
                                                                         V3_status:8/little,
                                                                         V3_value:32/little,
                                                                         V3_tar_val:32/little,
                                                                         V3_ext_val:32/little,
                                                                         V3_reward_num:32/little,
                                                                         V3_reward_can:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_cond_msg))/binary,
                                                                         V3_val1:32/little,
                                                                         V3_val2:32/little,
                                                                         V3_val3:32/little,
                                                                         V3_val4:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_str1))/binary,
                                                                         (protocol:pack(string,
                                                                                        V3_str2))/binary,
                                                                         (protocol:pack(string,
                                                                                        V3_str3))/binary,
                                                                         (protocol:pack(string,
                                                                                        V3_str4))/binary,
                                                                         (length(V3_loss_items)):16/little,
                                                                         (list_to_binary([<<V4_base_id:32/little,
                                                                                            V4_num:32/little>>
                                                                                          || {V4_base_id,
                                                                                              V4_num}
                                                                                                 <- V3_loss_items]))/binary,
                                                                         (length(V3_items)):16/little,
                                                                         (list_to_binary([<<V4_base_id:32/little,
                                                                                            V4_bind:32/little,
                                                                                            V4_num:32/little>>
                                                                                          || {V4_base_id,
                                                                                              V4_bind,
                                                                                              V4_num}
                                                                                                 <- V3_items]))/binary>>
                                                                       || #camp_web{n
                                                                                        =
                                                                                        V3_n,
                                                                                    status
                                                                                        =
                                                                                        V3_status,
                                                                                    value
                                                                                        =
                                                                                        V3_value,
                                                                                    tar_val
                                                                                        =
                                                                                        V3_tar_val,
                                                                                    ext_val
                                                                                        =
                                                                                        V3_ext_val,
                                                                                    reward_num
                                                                                        =
                                                                                        V3_reward_num,
                                                                                    reward_can
                                                                                        =
                                                                                        V3_reward_can,
                                                                                    cond_msg
                                                                                        =
                                                                                        V3_cond_msg,
                                                                                    val1
                                                                                        =
                                                                                        V3_val1,
                                                                                    val2
                                                                                        =
                                                                                        V3_val2,
                                                                                    val3
                                                                                        =
                                                                                        V3_val3,
                                                                                    val4
                                                                                        =
                                                                                        V3_val4,
                                                                                    str1
                                                                                        =
                                                                                        V3_str1,
                                                                                    str2
                                                                                        =
                                                                                        V3_str2,
                                                                                    str3
                                                                                        =
                                                                                        V3_str3,
                                                                                    str4
                                                                                        =
                                                                                        V3_str4,
                                                                                    loss_items
                                                                                        =
                                                                                        V3_loss_items,
                                                                                    items
                                                                                        =
                                                                                        V3_items}
                                                                              <- V2_camp_list]))/binary>>
                                                    || #camp_web_menu{id =
                                                                          V2_id,
                                                                      type =
                                                                          V2_type,
                                                                      sec_type =
                                                                          V2_sec_type,
                                                                      reward_mod
                                                                          =
                                                                          V2_reward_mod,
                                                                      title =
                                                                          V2_title,
                                                                      title2 =
                                                                          V2_title2,
                                                                      title_ico
                                                                          =
                                                                          V2_title_ico,
                                                                      ico =
                                                                          V2_ico,
                                                                      type_ico =
                                                                          V2_type_ico,
                                                                      total_ico
                                                                          =
                                                                          V2_total_ico,
                                                                      start_time
                                                                          =
                                                                          V2_start_time,
                                                                      end_time =
                                                                          V2_end_time,
                                                                      sort_val =
                                                                          V2_sort_val,
                                                                      top_banner
                                                                          =
                                                                          V2_top_banner,
                                                                      rule_str =
                                                                          V2_rule_str,
                                                                      time_str =
                                                                          V2_time_str,
                                                                      bottom_alert
                                                                          =
                                                                          V2_bottom_alert,
                                                                      reward_title
                                                                          =
                                                                          V2_reward_title,
                                                                      panel_type
                                                                          =
                                                                          V2_panel_type,
                                                                      button_text
                                                                          =
                                                                          V2_button_text,
                                                                      is_button
                                                                          =
                                                                          V2_is_button,
                                                                      cli_reward
                                                                          =
                                                                          V2_cli_reward,
                                                                      tran_info
                                                                          =
                                                                          V2_tran_info,
                                                                      camp_list
                                                                          =
                                                                          V2_camp_list}
                                                           <- V1_menu_list]))/binary>>
                                 || #camp_web_ico{id = V1_id, name = V1_name,
                                                  title = V1_title,
                                                  ico = V1_ico,
                                                  alert = V1_alert,
                                                  gif = V1_gif,
                                                  start_time = V1_start_time,
                                                  end_time = V1_end_time,
                                                  login_open = V1_login_open,
                                                  is_show_time =
                                                      V1_is_show_time,
                                                  menu_list = V1_menu_list}
                                        <- V0_camp_web_ico_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14050:16/little,
       D_a_t_a/binary>>};
pack(cli, 14051, {}) ->
    {ok, <<2:32/little, 14051:16/little>>};
pack(srv, 14051, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14051:16/little,
       D_a_t_a/binary>>};
pack(cli, 14052, {}) ->
    {ok, <<2:32/little, 14052:16/little>>};
pack(srv, 14052, {V0_camp_web_update_list}) ->
    D_a_t_a = <<(length(V0_camp_web_update_list)):16/little,
                (list_to_binary([<<V1_total_id:32/little,
                                   V1_menu_id:32/little, V1_n:8/little,
                                   V1_status:8/little, V1_value:32/little,
                                   V1_tar_val:32/little, V1_ext_val:32/little,
                                   V1_reward_can:32/little,
                                   (length(V1_items)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_bind:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_base_id,
                                                        V2_bind,
                                                        V2_num}
                                                           <- V1_items]))/binary>>
                                 || {V1_total_id,
                                     V1_menu_id,
                                     #camp_web{n = V1_n, status = V1_status,
                                               value = V1_value,
                                               tar_val = V1_tar_val,
                                               ext_val = V1_ext_val,
                                               reward_can = V1_reward_can,
                                               items = V1_items}}
                                        <- V0_camp_web_update_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14052:16/little,
       D_a_t_a/binary>>};
pack(cli, 14053,
     {V0_total_id, V0_menu_id, V0_n, V0_num}) ->
    D_a_t_a = <<V0_total_id:32/little, V0_menu_id:32/little,
                V0_n:8/little, V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14053:16/little,
       D_a_t_a/binary>>};
pack(srv, 14053, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14053:16/little,
       D_a_t_a/binary>>};
pack(cli, 14054, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14054:16/little,
       D_a_t_a/binary>>};
pack(srv, 14054, {V0_type, V0_rank_list}) ->
    D_a_t_a = <<V0_type:32/little,
                (length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   V1_rank:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:32/little, V1_val1:32/signed-little,
                                   V1_val2:32/signed-little,
                                   V1_val3:32/signed-little,
                                   V1_val4:32/signed-little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || #camp_web_rank_role{role_id = V1_role_id,
                                                        rank = V1_rank,
                                                        platform = V1_platform,
                                                        zone_id = V1_zone_id,
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        lev = V1_lev,
                                                        val1 = V1_val1,
                                                        val2 = V1_val2,
                                                        val3 = V1_val3,
                                                        val4 = V1_val4,
                                                        desc = V1_desc}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14054:16/little,
       D_a_t_a/binary>>};
pack(cli, 14055, {V0_battle_id, V0_unit_id}) ->
    D_a_t_a = <<V0_battle_id:32/little,
                V0_unit_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14055:16/little,
       D_a_t_a/binary>>};
pack(srv, 14055, {V0_err_code, V0_msg, V0_askid}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_askid:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14055:16/little,
       D_a_t_a/binary>>};
pack(cli, 14056, {V0_anwer}) ->
    D_a_t_a = <<V0_anwer:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14056:16/little,
       D_a_t_a/binary>>};
pack(srv, 14056,
     {V0_err_code, V0_msg, V0_result, V0_anwer}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_result:8/little, V0_anwer:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14056:16/little,
       D_a_t_a/binary>>};
pack(cli, 14057, {}) ->
    {ok, <<2:32/little, 14057:16/little>>};
pack(srv, 14057,
     {V0_left_time,
      V0_state,
      V0_wave,
      V0_left_role,
      V0_left_lanterns}) ->
    D_a_t_a = <<V0_left_time:32/little, V0_state:8/little,
                V0_wave:32/little, V0_left_role:32/little,
                V0_left_lanterns:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14057:16/little,
       D_a_t_a/binary>>};
pack(cli, 14058, {}) ->
    {ok, <<2:32/little, 14058:16/little>>};
pack(srv, 14058, {V0_rewards}) ->
    D_a_t_a = <<(length(V0_rewards)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14058:16/little,
       D_a_t_a/binary>>};
pack(cli, 14059, {}) ->
    {ok, <<2:32/little, 14059:16/little>>};
pack(srv, 14059, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14059:16/little,
       D_a_t_a/binary>>};
pack(cli, 14060, {}) ->
    {ok, <<2:32/little, 14060:16/little>>};
pack(srv, 14060, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14060:16/little,
       D_a_t_a/binary>>};
pack(cli, 14061, {}) ->
    {ok, <<2:32/little, 14061:16/little>>};
pack(srv, 14061, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14061:16/little,
       D_a_t_a/binary>>};
pack(cli, 14062, {V0_type, V0_msg}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14062:16/little,
       D_a_t_a/binary>>};
pack(srv, 14062, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14062:16/little,
       D_a_t_a/binary>>};
pack(cli, 14063, {}) ->
    {ok, <<2:32/little, 14063:16/little>>};
pack(srv, 14063, {V0_wish_msg}) ->
    D_a_t_a = <<(length(V0_wish_msg)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_msg))/binary>>
                                 || V1_msg <- V0_wish_msg]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14063:16/little,
       D_a_t_a/binary>>};
pack(cli, 14064, {V0_battle_id, V0_uint_id}) ->
    D_a_t_a = <<V0_battle_id:32/little,
                V0_uint_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14064:16/little,
       D_a_t_a/binary>>};
pack(srv, 14064, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14064:16/little,
       D_a_t_a/binary>>};
pack(cli, 14065, {}) ->
    {ok, <<2:32/little, 14065:16/little>>};
pack(srv, 14065,
     {V0_left_time,
      V0_add_exp,
      V0_wish_val,
      V0_rank_info}) ->
    D_a_t_a = <<V0_left_time:32/little,
                V0_add_exp:32/little, V0_wish_val:32/little,
                (length(V0_rank_info)):16/little,
                (list_to_binary([<<V1_rank:8/little,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_wish_val:32/little>>
                                 || {V1_rank, V1_guild_name, V1_wish_val}
                                        <- V0_rank_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14065:16/little,
       D_a_t_a/binary>>};
pack(cli, 14066, {}) ->
    {ok, <<2:32/little, 14066:16/little>>};
pack(srv, 14066, {V0_status, V0_left_time}) ->
    D_a_t_a = <<V0_status:8/little,
                V0_left_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14066:16/little,
       D_a_t_a/binary>>};
pack(cli, 14067, {V0_process}) ->
    D_a_t_a = <<V0_process:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14067:16/little,
       D_a_t_a/binary>>};
pack(srv, 14067, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14067:16/little,
       D_a_t_a/binary>>};
pack(cli, 14068, {}) ->
    {ok, <<2:32/little, 14068:16/little>>};
pack(srv, 14068, {V0_role_info}) ->
    D_a_t_a = <<(length(V0_role_info)):16/little,
                (list_to_binary([<<V1_r_id:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_guild_id:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_platform))/binary,
                                   V1_guild_zone_id:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_wish_val:32/little>>
                                 || {{V1_r_id, V1_r_platform, V1_r_zone_id},
                                     V1_name,
                                     {V1_guild_id,
                                      V1_guild_platform,
                                      V1_guild_zone_id},
                                     V1_guild_name,
                                     V1_wish_val}
                                        <- V0_role_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14068:16/little,
       D_a_t_a/binary>>};
pack(cli, 14069, {}) ->
    {ok, <<2:32/little, 14069:16/little>>};
pack(srv, 14069, {V0_info}) ->
    D_a_t_a = <<(length(V0_info)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_flag:8/little>>
                                 || {V1_type, V1_flag} <- V0_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14069:16/little,
       D_a_t_a/binary>>};
pack(cli, 14070, {}) ->
    {ok, <<2:32/little, 14070:16/little>>};
pack(srv, 14070, {V0_status, V0_askid, V0_left_time}) ->
    D_a_t_a = <<V0_status:8/little, V0_askid:32/little,
                V0_left_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14070:16/little,
       D_a_t_a/binary>>};
pack(cli, 14071, {}) ->
    {ok, <<2:32/little, 14071:16/little>>};
pack(srv, 14071,
     {V0_err_code,
      V0_msg,
      V0_askid,
      V0_done_answer,
      V0_lockylist}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_askid:32/little, V0_done_answer:8/little,
                (length(V0_lockylist)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_rank:8/little,
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
                                                           <- V1_looks]))/binary>>
                                 || #national_wisdom_joiner{id =
                                                                {V1_rid,
                                                                 V1_platform,
                                                                 V1_zone_id},
                                                            name = V1_name,
                                                            lev = V1_lev,
                                                            classes =
                                                                V1_classes,
                                                            sex = V1_sex,
                                                            rank = V1_rank,
                                                            looks = V1_looks}
                                        <- V0_lockylist]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14071:16/little,
       D_a_t_a/binary>>};
pack(cli, 14072, {V0_anwer, V0_is_world}) ->
    D_a_t_a = <<V0_anwer:8/little, V0_is_world:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14072:16/little,
       D_a_t_a/binary>>};
pack(srv, 14072,
     {V0_err_code, V0_msg, V0_result, V0_anwer}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_result:8/little, V0_anwer:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14072:16/little,
       D_a_t_a/binary>>};
pack(cli, 14073, {}) ->
    {ok, <<2:32/little, 14073:16/little>>};
pack(srv, 14073,
     {V0_rainbow_prize_list,
      V0_notice_msg,
      V0_last_free_time}) ->
    D_a_t_a = <<(length(V0_rainbow_prize_list)):16/little,
                (list_to_binary([<<V1_id:16/little, V1_assets:32/little,
                                   V1_val:32/little, V1_is_hit:8/little>>
                                 || #rainbow_prize{id = V1_id,
                                                   assets = V1_assets,
                                                   val = V1_val,
                                                   is_hit = V1_is_hit}
                                        <- V0_rainbow_prize_list]))/binary,
                (length(V0_notice_msg)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_content))/binary>>
                                 || V1_content <- V0_notice_msg]))/binary,
                V0_last_free_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14073:16/little,
       D_a_t_a/binary>>};
pack(cli, 14074, {}) ->
    {ok, <<2:32/little, 14074:16/little>>};
pack(srv, 14074, {V0_err_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14074:16/little,
       D_a_t_a/binary>>};
pack(cli, 14075, {}) ->
    {ok, <<2:32/little, 14075:16/little>>};
pack(srv, 14075, {V0_err_code, V0_msg, V0_result}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_result)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_result]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14075:16/little,
       D_a_t_a/binary>>};
pack(cli, 14076, {}) ->
    {ok, <<2:32/little, 14076:16/little>>};
pack(srv, 14076, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14076:16/little,
       D_a_t_a/binary>>};
pack(cli, 14077, {}) ->
    {ok, <<2:32/little, 14077:16/little>>};
pack(srv, 14077, {V0_err_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14077:16/little,
       D_a_t_a/binary>>};
pack(cli, 14078, {}) ->
    {ok, <<2:32/little, 14078:16/little>>};
pack(srv, 14078,
     {V0_result, V0_answer_times, V0_gains}) ->
    D_a_t_a = <<V0_result:8/little,
                V0_answer_times:8/little, (length(V0_gains)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val} <- V0_gains]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14078:16/little,
       D_a_t_a/binary>>};
pack(cli, 14080, {}) ->
    {ok, <<2:32/little, 14080:16/little>>};
pack(srv, 14080,
     {V0_status,
      V0_finish,
      V0_end_time,
      V0_refre_time,
      V0_cake,
      V0_max}) ->
    D_a_t_a = <<V0_status:8/little, V0_finish:32/little,
                V0_end_time:32/little, V0_refre_time:32/little,
                V0_cake:32/little, V0_max:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14080:16/little,
       D_a_t_a/binary>>};
pack(cli, 14081, {}) ->
    {ok, <<2:32/little, 14081:16/little>>};
pack(srv, 14081, {V0_info}) ->
    D_a_t_a = <<(length(V0_info)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_status:32/little>>
                                 || {V1_id, V1_status} <- V0_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14081:16/little,
       D_a_t_a/binary>>};
pack(cli, 14082, {V0_id, V0_answer}) ->
    D_a_t_a = <<V0_id:32/little, V0_answer:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14082:16/little,
       D_a_t_a/binary>>};
pack(srv, 14082,
     {V0_err_code, V0_msg, V0_answer, V0_right_answer}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_answer:32/little, V0_right_answer:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14082:16/little,
       D_a_t_a/binary>>};
pack(cli, 14083, {}) ->
    {ok, <<2:32/little, 14083:16/little>>};
pack(srv, 14083, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14083:16/little,
       D_a_t_a/binary>>};
pack(cli, 14084, {}) ->
    {ok, <<2:32/little, 14084:16/little>>};
pack(srv, 14084, {V0_reward_list}) ->
    D_a_t_a = <<(length(V0_reward_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_item_id, V1_num}
                                        <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14084:16/little,
       D_a_t_a/binary>>};
pack(cli, 14085, {}) ->
    {ok, <<2:32/little, 14085:16/little>>};
pack(srv, 14085, {V0_buff_id}) ->
    D_a_t_a = <<V0_buff_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14085:16/little,
       D_a_t_a/binary>>};
pack(cli, 14086, {}) ->
    {ok, <<2:32/little, 14086:16/little>>};
pack(srv, 14086, {V0_times, V0_max}) ->
    D_a_t_a = <<V0_times:32/little, V0_max:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14086:16/little,
       D_a_t_a/binary>>};
pack(cli, 14087, {}) ->
    {ok, <<2:32/little, 14087:16/little>>};
pack(srv, 14087,
     {#camp_login_roll{id = V0_id, day = V0_day,
                       roll_times = V0_roll_times, status = V0_status,
                       reward = V0_reward, reward_get = V0_reward_get}}) ->
    D_a_t_a = <<V0_id:8/little, V0_day:16/little,
                V0_roll_times:16/little, V0_status:8/little,
                (length(V0_reward)):16/little,
                (list_to_binary([<<V1_reward_id:16/little>>
                                 || V1_reward_id <- V0_reward]))/binary,
                (length(V0_reward_get)):16/little,
                (list_to_binary([<<V1_reward_id_get:16/little>>
                                 || V1_reward_id_get
                                        <- V0_reward_get]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14087:16/little,
       D_a_t_a/binary>>};
pack(cli, 14088, {V0_reward_id}) ->
    D_a_t_a = <<V0_reward_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14088:16/little,
       D_a_t_a/binary>>};
pack(srv, 14088, {V0_reward_id, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_reward_id:16/little,
                V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14088:16/little,
       D_a_t_a/binary>>};
pack(cli, 14089, {}) ->
    {ok, <<2:32/little, 14089:16/little>>};
pack(srv, 14089, {V0_val, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_val:16/little, V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14089:16/little,
       D_a_t_a/binary>>};
pack(cli, 14090, {}) ->
    {ok, <<2:32/little, 14090:16/little>>};
pack(srv, 14090, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14090:16/little,
       D_a_t_a/binary>>};
pack(cli, 14091, {}) ->
    {ok, <<2:32/little, 14091:16/little>>};
pack(srv, 14091,
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
     <<(byte_size(D_a_t_a) + 2):32/little, 14091:16/little,
       D_a_t_a/binary>>};
pack(cli, 14092, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14092:16/little,
       D_a_t_a/binary>>};
pack(srv, 14092, {V0_id, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_id:16/little, V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14092:16/little,
       D_a_t_a/binary>>};
pack(cli, 14093, {}) ->
    {ok, <<2:32/little, 14093:16/little>>};
pack(srv, 14093, {}) ->
    {ok, <<2:32/little, 14093:16/little>>};
pack(cli, 14094, {}) ->
    {ok, <<2:32/little, 14094:16/little>>};
pack(srv, 14094, {V0_pmd_list}) ->
    D_a_t_a = <<(length(V0_pmd_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_msg))/binary,
                                   V1_time:32/little>>
                                 || {V1_msg, V1_time}
                                        <- V0_pmd_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14094:16/little,
       D_a_t_a/binary>>};
pack(cli, 14095, {}) ->
    {ok, <<2:32/little, 14095:16/little>>};
pack(srv, 14095, {V0_gold}) ->
    D_a_t_a = <<V0_gold:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14095:16/little,
       D_a_t_a/binary>>};
pack(cli, 14096, {}) ->
    {ok, <<2:32/little, 14096:16/little>>};
pack(srv, 14096, {V0_gold, V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_gold:32/little, V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14096:16/little,
       D_a_t_a/binary>>};
pack(cli, 14097, {}) ->
    {ok, <<2:32/little, 14097:16/little>>};
pack(srv, 14097, {V0_times}) ->
    D_a_t_a = <<V0_times:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14097:16/little,
       D_a_t_a/binary>>};
pack(cli, 14098, {}) ->
    {ok, <<2:32/little, 14098:16/little>>};
pack(srv, 14098, {V0_camp_id, V0_base_id}) ->
    D_a_t_a = <<V0_camp_id:32/little,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14098:16/little,
       D_a_t_a/binary>>};
pack(cli, 14099, {}) ->
    {ok, <<2:32/little, 14099:16/little>>};
pack(srv, 14099, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14099:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14000, _B0) -> {ok, {}};
unpack(cli, 14000, _B0) ->
    {V1_reward_list, _B10} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_id, _B2} =
                                                        protocol:uint32(_B1),
                                                    {V2_status, _B3} =
                                                        protocol:uint8(_B2),
                                                    {V2_value, _B4} =
                                                        protocol:uint32(_B3),
                                                    {V2_target_val, _B5} =
                                                        protocol:uint32(_B4),
                                                    {V2_ext_val, _B6} =
                                                        protocol:uint32(_B5),
                                                    {V2_reward_max, _B7} =
                                                        protocol:uint16(_B6),
                                                    {V2_reward_can, _B8} =
                                                        protocol:uint16(_B7),
                                                    {{V2_id,
                                                      V2_status,
                                                      V2_value,
                                                      V2_target_val,
                                                      V2_ext_val,
                                                      V2_reward_max,
                                                      V2_reward_can},
                                                     _B8}
                                            end),
    {ok, {V1_reward_list}};
unpack(srv, 14001, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14001, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_flag, V1_id}};
unpack(srv, 14002, _B0) -> {ok, {}};
unpack(cli, 14002, _B0) ->
    {V1_reward_list, _B10} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_id, _B2} =
                                                        protocol:uint32(_B1),
                                                    {V2_status, _B3} =
                                                        protocol:uint8(_B2),
                                                    {V2_value, _B4} =
                                                        protocol:uint32(_B3),
                                                    {V2_target_val, _B5} =
                                                        protocol:uint32(_B4),
                                                    {V2_ext_val, _B6} =
                                                        protocol:uint32(_B5),
                                                    {V2_reward_max, _B7} =
                                                        protocol:uint16(_B6),
                                                    {V2_reward_can, _B8} =
                                                        protocol:uint16(_B7),
                                                    {{V2_id,
                                                      V2_status,
                                                      V2_value,
                                                      V2_target_val,
                                                      V2_ext_val,
                                                      V2_reward_max,
                                                      V2_reward_can},
                                                     _B8}
                                            end),
    {ok, {V1_reward_list}};
unpack(srv, 14003, _B0) -> {ok, {}};
unpack(cli, 14003, _B0) ->
    {V1_camp_list, _B6} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_id, _B2} =
                                                     protocol:uint16(_B1),
                                                 {V2_start_time, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_end_time, _B4} =
                                                     protocol:uint32(_B3),
                                                 {{V2_id,
                                                   V2_start_time,
                                                   V2_end_time},
                                                  _B4}
                                         end),
    {ok, {V1_camp_list}};
unpack(srv, 14004, _B0) -> {ok, {}};
unpack(cli, 14004, _B0) ->
    {V1_open_srv_time, _B1} = protocol:uint32(_B0),
    {V1_merge_srv_time, _B2} = protocol:uint32(_B1),
    {V1_merge_num, _B3} = protocol:uint32(_B2),
    {ok,
     {V1_open_srv_time, V1_merge_srv_time, V1_merge_num}};
unpack(srv, 14005, _B0) -> {ok, {}};
unpack(cli, 14005, _B0) ->
    {V1_list, _B31} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rank, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_male_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_male_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_male_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_sex, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_classes, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_lev, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_photo, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_photo_auditing, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_g_id, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_g_platform, _B13} =
                                                 protocol:string(_B12),
                                             {V2_g_zone_id, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_guild_name, _B15} =
                                                 protocol:string(_B14),
                                             {V2_score, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_role_reward, _B22} =
                                                 protocol:array(_B16,
                                                                fun (_B17) ->
                                                                        {V3_item_id,
                                                                         _B18} =
                                                                            protocol:uint32(_B17),
                                                                        {V3_bind,
                                                                         _B19} =
                                                                            protocol:uint8(_B18),
                                                                        {V3_num,
                                                                         _B20} =
                                                                            protocol:uint32(_B19),
                                                                        {{V3_item_id,
                                                                          V3_bind,
                                                                          V3_num},
                                                                         _B20}
                                                                end),
                                             {V2_guild_reward, _B28} =
                                                 protocol:array(_B22,
                                                                fun (_B23) ->
                                                                        {V3_item_id,
                                                                         _B24} =
                                                                            protocol:uint32(_B23),
                                                                        {V3_bind,
                                                                         _B25} =
                                                                            protocol:uint8(_B24),
                                                                        {V3_num,
                                                                         _B26} =
                                                                            protocol:uint32(_B25),
                                                                        {{V3_item_id,
                                                                          V3_bind,
                                                                          V3_num},
                                                                         _B26}
                                                                end),
                                             {V2_honor, _B29} =
                                                 protocol:uint32(_B28),
                                             {{V2_rank,
                                               V2_male_id,
                                               V2_male_platform,
                                               V2_male_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_photo,
                                               V2_photo_auditing,
                                               V2_g_id,
                                               V2_g_platform,
                                               V2_g_zone_id,
                                               V2_guild_name,
                                               V2_score,
                                               V2_role_reward,
                                               V2_guild_reward,
                                               V2_honor},
                                              _B29}
                                     end),
    {ok, {V1_list}};
unpack(srv, 14006, _B0) -> {ok, {}};
unpack(cli, 14006, _B0) ->
    {V1_location, _B1} = protocol:uint32(_B0),
    {V1_rolled, _B2} = protocol:uint32(_B1),
    {V1_last_moved, _B3} = protocol:uint32(_B2),
    {V1_footprints, _B7} = protocol:array(_B3,
                                          fun (_B4) ->
                                                  {V2_fp, _B5} =
                                                      protocol:uint32(_B4),
                                                  {{V2_fp}, _B5}
                                          end),
    {V1_rewarded, _B12} = protocol:array(_B7,
                                         fun (_B8) ->
                                                 {V2_id, _B9} =
                                                     protocol:uint32(_B8),
                                                 {V2_time, _B10} =
                                                     protocol:uint32(_B9),
                                                 {{V2_id, V2_time}, _B10}
                                         end),
    {V1_can_roll, _B13} = protocol:uint8(_B12),
    {ok,
     {V1_location,
      V1_rolled,
      V1_last_moved,
      V1_footprints,
      V1_rewarded,
      V1_can_roll}};
unpack(srv, 14007, _B0) -> {ok, {}};
unpack(cli, 14007, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_point, _B3} = protocol:uint8(_B2),
    {V1_base_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_point, V1_base_id}};
unpack(srv, 14008, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14008, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14009, _B0) -> {ok, {}};
unpack(cli, 14009, _B0) ->
    {V1_last_filled, _B1} = protocol:uint32(_B0),
    {V1_rewarded, _B2} = protocol:uint8(_B1),
    {V1_collected, _B8} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_id, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_num, _B5} =
                                                     protocol:uint32(_B4),
                                                 {V2_status, _B6} =
                                                     protocol:uint8(_B5),
                                                 {{V2_id, V2_num, V2_status},
                                                  _B6}
                                         end),
    {V1_bag_rewards, _B17} = protocol:array(_B8,
                                            fun (_B9) ->
                                                    {V2_c_id, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_rewards, _B15} =
                                                        protocol:array(_B10,
                                                                       fun
                                                                           (_B11) ->
                                                                               {V3_base_id,
                                                                                _B12} =
                                                                                   protocol:uint32(_B11),
                                                                               {V3_base_num,
                                                                                _B13} =
                                                                                   protocol:uint32(_B12),
                                                                               {{V3_base_id,
                                                                                 V3_base_num},
                                                                                _B13}
                                                                       end),
                                                    {{V2_c_id, V2_rewards},
                                                     _B15}
                                            end),
    {ok,
     {V1_last_filled,
      V1_rewarded,
      V1_collected,
      V1_bag_rewards}};
unpack(srv, 14010, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14010, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14011, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14011, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14012, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_id}};
unpack(cli, 14012, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14013, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14013, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14014, _B0) -> {ok, {}};
unpack(cli, 14014, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14019, _B0) -> {ok, {}};
unpack(cli, 14019, _B0) ->
    {V1_open_time, _B1} = protocol:uint32(_B0),
    {V1_charged, _B6} = protocol:array(_B1,
                                       fun (_B2) ->
                                               {V2_gold, _B3} =
                                                   protocol:uint32(_B2),
                                               {V2_time, _B4} =
                                                   protocol:uint32(_B3),
                                               {{V2_gold, V2_time}, _B4}
                                       end),
    {ok, {V1_open_time, V1_charged}};
unpack(srv, 14021, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 14021, _B0) ->
    {V1_r_id, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint32(_B2),
    {V1_help, _B4} = protocol:uint32(_B3),
    {V1_helped, _B5} = protocol:uint32(_B4),
    {V1_start_time, _B6} = protocol:uint32(_B5),
    {V1_end_time, _B7} = protocol:uint32(_B6),
    {V1_list, _B28} = protocol:array(_B7,
                                     fun (_B8) ->
                                             {V2_id, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_status, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_num, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_need_num, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_start_time, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_end_time, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_guilds, _B20} =
                                                 protocol:array(_B14,
                                                                fun (_B15) ->
                                                                        {V3_g_id,
                                                                         _B16} =
                                                                            protocol:uint32(_B15),
                                                                        {V3_g_platform,
                                                                         _B17} =
                                                                            protocol:string(_B16),
                                                                        {V3_g_zone_id,
                                                                         _B18} =
                                                                            protocol:uint32(_B17),
                                                                        {{V3_g_id,
                                                                          V3_g_platform,
                                                                          V3_g_zone_id},
                                                                         _B18}
                                                                end),
                                             {V2_friends, _B26} =
                                                 protocol:array(_B20,
                                                                fun (_B21) ->
                                                                        {V3_g_id,
                                                                         _B22} =
                                                                            protocol:uint32(_B21),
                                                                        {V3_g_platform,
                                                                         _B23} =
                                                                            protocol:string(_B22),
                                                                        {V3_g_zone_id,
                                                                         _B24} =
                                                                            protocol:uint32(_B23),
                                                                        {{V3_g_id,
                                                                          V3_g_platform,
                                                                          V3_g_zone_id},
                                                                         _B24}
                                                                end),
                                             {{V2_id,
                                               V2_status,
                                               V2_num,
                                               V2_need_num,
                                               V2_start_time,
                                               V2_end_time,
                                               V2_guilds,
                                               V2_friends},
                                              _B26}
                                     end),
    {ok,
     {V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_help,
      V1_helped,
      V1_start_time,
      V1_end_time,
      V1_list}};
unpack(srv, 14022, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_friends, _B8} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_g_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_g_platform, _B5} =
                                                   protocol:string(_B4),
                                               {V2_g_zone_id, _B6} =
                                                   protocol:uint32(_B5),
                                               {{V2_g_id,
                                                 V2_g_platform,
                                                 V2_g_zone_id},
                                                _B6}
                                       end),
    {ok, {V1_type, V1_id, V1_friends}};
unpack(cli, 14022, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_type, V1_id, V1_msg}};
unpack(srv, 14023, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14023, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_id, V1_msg}};
unpack(srv, 14024, _B0) ->
    {V1_r_id, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_type, _B5} = protocol:uint32(_B4),
    {V1_base_id, _B6} = protocol:uint32(_B5),
    {V1_num, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_id,
      V1_type,
      V1_base_id,
      V1_num}};
unpack(cli, 14024, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14025, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14025, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_id, V1_msg}};
unpack(srv, 14026, _B0) -> {ok, {}};
unpack(cli, 14026, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14027, _B0) -> {ok, {}};
unpack(cli, 14027, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {V1_days, _B5} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_day, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_day}, _B3}
                                    end),
    {V1_buys, _B10} = protocol:array(_B5,
                                     fun (_B6) ->
                                             {V2_id, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_time, _B8} =
                                                 protocol:uint32(_B7),
                                             {{V2_id, V2_time}, _B8}
                                     end),
    {ok, {V1_num, V1_days, V1_buys}};
unpack(srv, 14029, _B0) ->
    {V1_day, _B1} = protocol:uint32(_B0),
    {ok, {V1_day}};
unpack(cli, 14029, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14030, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14030, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14031, _B0) -> {ok, {}};
unpack(cli, 14031, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14032, _B0) -> {ok, {}};
unpack(cli, 14032, _B0) ->
    {V1_group, _B1} = protocol:uint32(_B0),
    {V1_list, _B5} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_id, _B3} = protocol:uint32(_B2),
                                            {{V2_id}, _B3}
                                    end),
    {V1_is_reward, _B6} = protocol:uint32(_B5),
    {V1_active_list, _B10} = protocol:array(_B6,
                                            fun (_B7) ->
                                                    {V2_id, _B8} =
                                                        protocol:uint32(_B7),
                                                    {{V2_id}, _B8}
                                            end),
    {ok, {V1_group, V1_list, V1_is_reward, V1_active_list}};
unpack(srv, 14033, _B0) -> {ok, {}};
unpack(cli, 14033, _B0) ->
    {V1_list, _B10} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_battle_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_u_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_base_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_map, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_map_base_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_x, _B7} = protocol:uint32(_B6),
                                             {V2_y, _B8} = protocol:uint32(_B7),
                                             {{V2_battle_id,
                                               V2_u_id,
                                               V2_base_id,
                                               V2_map,
                                               V2_map_base_id,
                                               V2_x,
                                               V2_y},
                                              _B8}
                                     end),
    {ok, {V1_list}};
unpack(srv, 14034, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_friends, _B8} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_g_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_g_platform, _B5} =
                                                   protocol:string(_B4),
                                               {V2_g_zone_id, _B6} =
                                                   protocol:uint32(_B5),
                                               {{V2_g_id,
                                                 V2_g_platform,
                                                 V2_g_zone_id},
                                                _B6}
                                       end),
    {ok, {V1_type, V1_base_id, V1_friends}};
unpack(cli, 14034, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14035, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_friends, _B8} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_g_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_g_platform, _B5} =
                                                   protocol:string(_B4),
                                               {V2_g_zone_id, _B6} =
                                                   protocol:uint32(_B5),
                                               {{V2_g_id,
                                                 V2_g_platform,
                                                 V2_g_zone_id},
                                                _B6}
                                       end),
    {ok, {V1_type, V1_base_id, V1_friends}};
unpack(cli, 14035, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14036, _B0) -> {ok, {}};
unpack(cli, 14036, _B0) ->
    {V1_r_id, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_list, _B25} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_status, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_num, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_need_num, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_start_time, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_end_time, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_guilds, _B17} =
                                                 protocol:array(_B11,
                                                                fun (_B12) ->
                                                                        {V3_g_id,
                                                                         _B13} =
                                                                            protocol:uint32(_B12),
                                                                        {V3_g_platform,
                                                                         _B14} =
                                                                            protocol:string(_B13),
                                                                        {V3_g_zone_id,
                                                                         _B15} =
                                                                            protocol:uint32(_B14),
                                                                        {{V3_g_id,
                                                                          V3_g_platform,
                                                                          V3_g_zone_id},
                                                                         _B15}
                                                                end),
                                             {V2_friends, _B23} =
                                                 protocol:array(_B17,
                                                                fun (_B18) ->
                                                                        {V3_g_id,
                                                                         _B19} =
                                                                            protocol:uint32(_B18),
                                                                        {V3_g_platform,
                                                                         _B20} =
                                                                            protocol:string(_B19),
                                                                        {V3_g_zone_id,
                                                                         _B21} =
                                                                            protocol:uint32(_B20),
                                                                        {{V3_g_id,
                                                                          V3_g_platform,
                                                                          V3_g_zone_id},
                                                                         _B21}
                                                                end),
                                             {{V2_id,
                                               V2_status,
                                               V2_num,
                                               V2_need_num,
                                               V2_start_time,
                                               V2_end_time,
                                               V2_guilds,
                                               V2_friends},
                                              _B23}
                                     end),
    {ok,
     {V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_name,
      V1_list}};
unpack(srv, 14037, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 14037, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14038, _B0) -> {ok, {}};
unpack(cli, 14038, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_type, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_num, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_type, V2_num}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 14039, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 14039, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_type, V1_id, V1_msg}};
unpack(srv, 14040, _B0) -> {ok, {}};
unpack(cli, 14040, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_item_id, _B8} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_item_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_bind, _B5} =
                                                   protocol:uint32(_B4),
                                               {V2_num, _B6} =
                                                   protocol:uint32(_B5),
                                               {{V2_item_id, V2_bind, V2_num},
                                                _B6}
                                       end),
    {ok, {V1_flag, V1_msg, V1_item_id}};
unpack(srv, 14041, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_num}};
unpack(cli, 14041, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {V1_ids, _B6} = protocol:array(_B2,
                                   fun (_B3) ->
                                           {V2_id, _B4} = protocol:uint16(_B3),
                                           {{V2_id}, _B4}
                                   end),
    {V1_msg, _B7} = protocol:string(_B6),
    {ok, {V1_flag, V1_type, V1_ids, V1_msg}};
unpack(srv, 14042, _B0) -> {ok, {}};
unpack(cli, 14042, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_gain_list, _B7} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_item_id1, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_num1, _B5} =
                                                     protocol:uint8(_B4),
                                                 {{V2_item_id1, V2_num1}, _B5}
                                         end),
    {V1_show_list, _B12} = protocol:array(_B7,
                                          fun (_B8) ->
                                                  {V2_item_id2, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_num2, _B10} =
                                                      protocol:uint8(_B9),
                                                  {{V2_item_id2, V2_num2}, _B10}
                                          end),
    {ok, {V1_order, V1_type, V1_gain_list, V1_show_list}};
unpack(srv, 14043, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 14043, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14044, _B0) -> {ok, {}};
unpack(cli, 14044, _B0) ->
    {V1_maps, _B4} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_map_id, _B2} =
                                                protocol:uint16(_B1),
                                            {{V2_map_id}, _B2}
                                    end),
    {ok, {V1_maps}};
unpack(srv, 14045, _B0) -> {ok, {}};
unpack(cli, 14045, _B0) ->
    {V1_campaign_group_purchase_item, _B28} =
        protocol:array(_B0,
                       fun (_B1) ->
                               {V2_id, _B2} = protocol:uint16(_B1),
                               {V2_base_id, _B3} = protocol:uint32(_B2),
                               {V2_num, _B4} = protocol:uint32(_B3),
                               {V2_price_type, _B5} = protocol:uint32(_B4),
                               {V2_price, _B6} = protocol:uint32(_B5),
                               {V2_discount, _B7} = protocol:uint16(_B6),
                               {V2_start_time, _B8} = protocol:uint32(_B7),
                               {V2_end_time, _B9} = protocol:uint32(_B8),
                               {V2_buy_num, _B10} = protocol:uint32(_B9),
                               {V2_limit_num, _B11} = protocol:uint32(_B10),
                               {V2_discount_list, _B16} = protocol:array(_B11,
                                                                         fun
                                                                             (_B12) ->
                                                                                 {V3_id,
                                                                                  _B13} =
                                                                                     protocol:uint16(_B12),
                                                                                 {V3_need_num,
                                                                                  _B14} =
                                                                                     protocol:uint16(_B13),
                                                                                 {{V3_id,
                                                                                   V3_need_num},
                                                                                  _B14}
                                                                         end),
                               {V2_list1, _B21} = protocol:array(_B16,
                                                                 fun (_B17) ->
                                                                         {V3_base_id,
                                                                          _B18} =
                                                                             protocol:uint32(_B17),
                                                                         {V3_num,
                                                                          _B19} =
                                                                             protocol:uint32(_B18),
                                                                         {{V3_base_id,
                                                                           V3_num},
                                                                          _B19}
                                                                 end),
                               {V2_list2, _B26} = protocol:array(_B21,
                                                                 fun (_B22) ->
                                                                         {V3_base_id,
                                                                          _B23} =
                                                                             protocol:uint32(_B22),
                                                                         {V3_num,
                                                                          _B24} =
                                                                             protocol:uint32(_B23),
                                                                         {{V3_base_id,
                                                                           V3_num},
                                                                          _B24}
                                                                 end),
                               {{V2_id,
                                 V2_base_id,
                                 V2_num,
                                 V2_price_type,
                                 V2_price,
                                 V2_discount,
                                 V2_start_time,
                                 V2_end_time,
                                 V2_buy_num,
                                 V2_limit_num,
                                 V2_discount_list,
                                 V2_list1,
                                 V2_list2},
                                _B26}
                       end),
    {V1_buy_list, _B33} = protocol:array(_B28,
                                         fun (_B29) ->
                                                 {V2_id, _B30} =
                                                     protocol:uint16(_B29),
                                                 {V2_self_buy_num, _B31} =
                                                     protocol:uint32(_B30),
                                                 {{V2_id, V2_self_buy_num},
                                                  _B31}
                                         end),
    {V1_reward_base_id, _B34} = protocol:uint32(_B33),
    {V1_reward_num, _B35} = protocol:uint32(_B34),
    {V1_has_reward, _B36} = protocol:uint8(_B35),
    {ok,
     {V1_campaign_group_purchase_item,
      V1_buy_list,
      V1_reward_base_id,
      V1_reward_num,
      V1_has_reward}};
unpack(srv, 14046, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 14046, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint16(_B2),
    {V1_discount, _B4} = protocol:uint16(_B3),
    {V1_buy_num, _B5} = protocol:uint32(_B4),
    {V1_self_buy_num, _B6} = protocol:uint32(_B5),
    {V1_has_reward, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_flag,
      V1_msg,
      V1_id,
      V1_discount,
      V1_buy_num,
      V1_self_buy_num,
      V1_has_reward}};
unpack(srv, 14047, _B0) -> {ok, {}};
unpack(cli, 14047, _B0) ->
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
    {ok, {V1_card_list}};
unpack(srv, 14048, _B0) -> {ok, {}};
unpack(cli, 14048, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14049, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 14049, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14050, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14050, _B0) ->
    {V1_mod, _B1} = protocol:uint8(_B0),
    {V1_camp_web_ico_list, _B70} = protocol:array(_B1,
                                                  fun (_B2) ->
                                                          {V2_id, _B3} =
                                                              protocol:uint32(_B2),
                                                          {V2_name, _B4} =
                                                              protocol:string(_B3),
                                                          {V2_title, _B5} =
                                                              protocol:string(_B4),
                                                          {V2_ico, _B6} =
                                                              protocol:string(_B5),
                                                          {V2_alert, _B7} =
                                                              protocol:string(_B6),
                                                          {V2_gif, _B8} =
                                                              protocol:string(_B7),
                                                          {V2_start_time, _B9} =
                                                              protocol:uint32(_B8),
                                                          {V2_end_time, _B10} =
                                                              protocol:uint32(_B9),
                                                          {V2_login_open,
                                                           _B11} =
                                                              protocol:uint8(_B10),
                                                          {V2_is_show_time,
                                                           _B12} =
                                                              protocol:uint8(_B11),
                                                          {V2_menu_list, _B68} =
                                                              protocol:array(_B12,
                                                                             fun
                                                                                 (_B13) ->
                                                                                     {V3_id,
                                                                                      _B14} =
                                                                                         protocol:uint32(_B13),
                                                                                     {V3_type,
                                                                                      _B15} =
                                                                                         protocol:uint32(_B14),
                                                                                     {V3_sec_type,
                                                                                      _B16} =
                                                                                         protocol:uint32(_B15),
                                                                                     {V3_reward_mod,
                                                                                      _B17} =
                                                                                         protocol:uint8(_B16),
                                                                                     {V3_title,
                                                                                      _B18} =
                                                                                         protocol:string(_B17),
                                                                                     {V3_title2,
                                                                                      _B19} =
                                                                                         protocol:string(_B18),
                                                                                     {V3_title_ico,
                                                                                      _B20} =
                                                                                         protocol:string(_B19),
                                                                                     {V3_ico,
                                                                                      _B21} =
                                                                                         protocol:string(_B20),
                                                                                     {V3_type_ico,
                                                                                      _B22} =
                                                                                         protocol:string(_B21),
                                                                                     {V3_total_ico,
                                                                                      _B23} =
                                                                                         protocol:uint32(_B22),
                                                                                     {V3_start_time,
                                                                                      _B24} =
                                                                                         protocol:uint32(_B23),
                                                                                     {V3_end_time,
                                                                                      _B25} =
                                                                                         protocol:uint32(_B24),
                                                                                     {V3_sort_val,
                                                                                      _B26} =
                                                                                         protocol:uint32(_B25),
                                                                                     {V3_top_banner,
                                                                                      _B27} =
                                                                                         protocol:string(_B26),
                                                                                     {V3_rule_str,
                                                                                      _B28} =
                                                                                         protocol:string(_B27),
                                                                                     {V3_time_str,
                                                                                      _B29} =
                                                                                         protocol:string(_B28),
                                                                                     {V3_bottom_alert,
                                                                                      _B30} =
                                                                                         protocol:string(_B29),
                                                                                     {V3_reward_title,
                                                                                      _B31} =
                                                                                         protocol:string(_B30),
                                                                                     {V3_panel_type,
                                                                                      _B32} =
                                                                                         protocol:string(_B31),
                                                                                     {V3_button_text,
                                                                                      _B33} =
                                                                                         protocol:string(_B32),
                                                                                     {V3_is_button,
                                                                                      _B34} =
                                                                                         protocol:uint8(_B33),
                                                                                     {V3_cli_reward,
                                                                                      _B35} =
                                                                                         protocol:string(_B34),
                                                                                     {V3_tran_info,
                                                                                      _B36} =
                                                                                         protocol:string(_B35),
                                                                                     {V3_camp_list,
                                                                                      _B66} =
                                                                                         protocol:array(_B36,
                                                                                                        fun
                                                                                                            (_B37) ->
                                                                                                                {V4_n,
                                                                                                                 _B38} =
                                                                                                                    protocol:uint8(_B37),
                                                                                                                {V4_status,
                                                                                                                 _B39} =
                                                                                                                    protocol:uint8(_B38),
                                                                                                                {V4_value,
                                                                                                                 _B40} =
                                                                                                                    protocol:uint32(_B39),
                                                                                                                {V4_tar_val,
                                                                                                                 _B41} =
                                                                                                                    protocol:uint32(_B40),
                                                                                                                {V4_ext_val,
                                                                                                                 _B42} =
                                                                                                                    protocol:uint32(_B41),
                                                                                                                {V4_reward_num,
                                                                                                                 _B43} =
                                                                                                                    protocol:uint32(_B42),
                                                                                                                {V4_reward_can,
                                                                                                                 _B44} =
                                                                                                                    protocol:uint32(_B43),
                                                                                                                {V4_cond_msg,
                                                                                                                 _B45} =
                                                                                                                    protocol:string(_B44),
                                                                                                                {V4_val1,
                                                                                                                 _B46} =
                                                                                                                    protocol:uint32(_B45),
                                                                                                                {V4_val2,
                                                                                                                 _B47} =
                                                                                                                    protocol:uint32(_B46),
                                                                                                                {V4_val3,
                                                                                                                 _B48} =
                                                                                                                    protocol:uint32(_B47),
                                                                                                                {V4_val4,
                                                                                                                 _B49} =
                                                                                                                    protocol:uint32(_B48),
                                                                                                                {V4_str1,
                                                                                                                 _B50} =
                                                                                                                    protocol:string(_B49),
                                                                                                                {V4_str2,
                                                                                                                 _B51} =
                                                                                                                    protocol:string(_B50),
                                                                                                                {V4_str3,
                                                                                                                 _B52} =
                                                                                                                    protocol:string(_B51),
                                                                                                                {V4_str4,
                                                                                                                 _B53} =
                                                                                                                    protocol:string(_B52),
                                                                                                                {V4_loss_items,
                                                                                                                 _B58} =
                                                                                                                    protocol:array(_B53,
                                                                                                                                   fun
                                                                                                                                       (_B54) ->
                                                                                                                                           {V5_base_id,
                                                                                                                                            _B55} =
                                                                                                                                               protocol:uint32(_B54),
                                                                                                                                           {V5_num,
                                                                                                                                            _B56} =
                                                                                                                                               protocol:uint32(_B55),
                                                                                                                                           {{V5_base_id,
                                                                                                                                             V5_num},
                                                                                                                                            _B56}
                                                                                                                                   end),
                                                                                                                {V4_items,
                                                                                                                 _B64} =
                                                                                                                    protocol:array(_B58,
                                                                                                                                   fun
                                                                                                                                       (_B59) ->
                                                                                                                                           {V5_base_id,
                                                                                                                                            _B60} =
                                                                                                                                               protocol:uint32(_B59),
                                                                                                                                           {V5_bind,
                                                                                                                                            _B61} =
                                                                                                                                               protocol:uint32(_B60),
                                                                                                                                           {V5_num,
                                                                                                                                            _B62} =
                                                                                                                                               protocol:uint32(_B61),
                                                                                                                                           {{V5_base_id,
                                                                                                                                             V5_bind,
                                                                                                                                             V5_num},
                                                                                                                                            _B62}
                                                                                                                                   end),
                                                                                                                {{V4_n,
                                                                                                                  V4_status,
                                                                                                                  V4_value,
                                                                                                                  V4_tar_val,
                                                                                                                  V4_ext_val,
                                                                                                                  V4_reward_num,
                                                                                                                  V4_reward_can,
                                                                                                                  V4_cond_msg,
                                                                                                                  V4_val1,
                                                                                                                  V4_val2,
                                                                                                                  V4_val3,
                                                                                                                  V4_val4,
                                                                                                                  V4_str1,
                                                                                                                  V4_str2,
                                                                                                                  V4_str3,
                                                                                                                  V4_str4,
                                                                                                                  V4_loss_items,
                                                                                                                  V4_items},
                                                                                                                 _B64}
                                                                                                        end),
                                                                                     {{V3_id,
                                                                                       V3_type,
                                                                                       V3_sec_type,
                                                                                       V3_reward_mod,
                                                                                       V3_title,
                                                                                       V3_title2,
                                                                                       V3_title_ico,
                                                                                       V3_ico,
                                                                                       V3_type_ico,
                                                                                       V3_total_ico,
                                                                                       V3_start_time,
                                                                                       V3_end_time,
                                                                                       V3_sort_val,
                                                                                       V3_top_banner,
                                                                                       V3_rule_str,
                                                                                       V3_time_str,
                                                                                       V3_bottom_alert,
                                                                                       V3_reward_title,
                                                                                       V3_panel_type,
                                                                                       V3_button_text,
                                                                                       V3_is_button,
                                                                                       V3_cli_reward,
                                                                                       V3_tran_info,
                                                                                       V3_camp_list},
                                                                                      _B66}
                                                                             end),
                                                          {{V2_id,
                                                            V2_name,
                                                            V2_title,
                                                            V2_ico,
                                                            V2_alert,
                                                            V2_gif,
                                                            V2_start_time,
                                                            V2_end_time,
                                                            V2_login_open,
                                                            V2_is_show_time,
                                                            V2_menu_list},
                                                           _B68}
                                                  end),
    {ok, {V1_mod, V1_camp_web_ico_list}};
unpack(srv, 14051, _B0) -> {ok, {}};
unpack(cli, 14051, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(srv, 14052, _B0) -> {ok, {}};
unpack(cli, 14052, _B0) ->
    {V1_camp_web_update_list, _B17} = protocol:array(_B0,
                                                     fun (_B1) ->
                                                             {V2_total_id,
                                                              _B2} =
                                                                 protocol:uint32(_B1),
                                                             {V2_menu_id, _B3} =
                                                                 protocol:uint32(_B2),
                                                             {V2_n, _B4} =
                                                                 protocol:uint8(_B3),
                                                             {V2_status, _B5} =
                                                                 protocol:uint8(_B4),
                                                             {V2_value, _B6} =
                                                                 protocol:uint32(_B5),
                                                             {V2_tar_val, _B7} =
                                                                 protocol:uint32(_B6),
                                                             {V2_ext_val, _B8} =
                                                                 protocol:uint32(_B7),
                                                             {V2_reward_can,
                                                              _B9} =
                                                                 protocol:uint32(_B8),
                                                             {V2_items, _B15} =
                                                                 protocol:array(_B9,
                                                                                fun
                                                                                    (_B10) ->
                                                                                        {V3_base_id,
                                                                                         _B11} =
                                                                                            protocol:uint32(_B10),
                                                                                        {V3_bind,
                                                                                         _B12} =
                                                                                            protocol:uint32(_B11),
                                                                                        {V3_num,
                                                                                         _B13} =
                                                                                            protocol:uint32(_B12),
                                                                                        {{V3_base_id,
                                                                                          V3_bind,
                                                                                          V3_num},
                                                                                         _B13}
                                                                                end),
                                                             {{V2_total_id,
                                                               V2_menu_id,
                                                               V2_n,
                                                               V2_status,
                                                               V2_value,
                                                               V2_tar_val,
                                                               V2_ext_val,
                                                               V2_reward_can,
                                                               V2_items},
                                                              _B15}
                                                     end),
    {ok, {V1_camp_web_update_list}};
unpack(srv, 14053, _B0) ->
    {V1_total_id, _B1} = protocol:uint32(_B0),
    {V1_menu_id, _B2} = protocol:uint32(_B1),
    {V1_n, _B3} = protocol:uint8(_B2),
    {V1_num, _B4} = protocol:uint16(_B3),
    {ok, {V1_total_id, V1_menu_id, V1_n, V1_num}};
unpack(cli, 14053, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 14054, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 14054, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_rank_list, _B17} = protocol:array(_B1,
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
                                                  {V2_val1, _B11} =
                                                      protocol:int32(_B10),
                                                  {V2_val2, _B12} =
                                                      protocol:int32(_B11),
                                                  {V2_val3, _B13} =
                                                      protocol:int32(_B12),
                                                  {V2_val4, _B14} =
                                                      protocol:int32(_B13),
                                                  {V2_desc, _B15} =
                                                      protocol:string(_B14),
                                                  {{V2_role_id,
                                                    V2_rank,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_lev,
                                                    V2_val1,
                                                    V2_val2,
                                                    V2_val3,
                                                    V2_val4,
                                                    V2_desc},
                                                   _B15}
                                          end),
    {ok, {V1_type, V1_rank_list}};
unpack(srv, 14055, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_unit_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_unit_id}};
unpack(cli, 14055, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_askid, _B3} = protocol:uint32(_B2),
    {ok, {V1_err_code, V1_msg, V1_askid}};
unpack(srv, 14056, _B0) ->
    {V1_anwer, _B1} = protocol:uint8(_B0),
    {ok, {V1_anwer}};
unpack(cli, 14056, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_result, _B3} = protocol:uint8(_B2),
    {V1_anwer, _B4} = protocol:uint8(_B3),
    {ok, {V1_err_code, V1_msg, V1_result, V1_anwer}};
unpack(srv, 14057, _B0) -> {ok, {}};
unpack(cli, 14057, _B0) ->
    {V1_left_time, _B1} = protocol:uint32(_B0),
    {V1_state, _B2} = protocol:uint8(_B1),
    {V1_wave, _B3} = protocol:uint32(_B2),
    {V1_left_role, _B4} = protocol:uint32(_B3),
    {V1_left_lanterns, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_left_time,
      V1_state,
      V1_wave,
      V1_left_role,
      V1_left_lanterns}};
unpack(srv, 14058, _B0) -> {ok, {}};
unpack(cli, 14058, _B0) ->
    {V1_rewards, _B5} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_assets, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_val, _B3} =
                                                   protocol:uint32(_B2),
                                               {{V2_assets, V2_val}, _B3}
                                       end),
    {ok, {V1_rewards}};
unpack(srv, 14059, _B0) -> {ok, {}};
unpack(cli, 14059, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14060, _B0) -> {ok, {}};
unpack(cli, 14060, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14061, _B0) -> {ok, {}};
unpack(cli, 14061, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14062, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_type, V1_msg}};
unpack(cli, 14062, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14063, _B0) -> {ok, {}};
unpack(cli, 14063, _B0) ->
    {V1_wish_msg, _B4} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_msg, _B2} =
                                                    protocol:string(_B1),
                                                {{V2_msg}, _B2}
                                        end),
    {ok, {V1_wish_msg}};
unpack(srv, 14064, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_uint_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_uint_id}};
unpack(cli, 14064, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14065, _B0) -> {ok, {}};
unpack(cli, 14065, _B0) ->
    {V1_left_time, _B1} = protocol:uint32(_B0),
    {V1_add_exp, _B2} = protocol:uint32(_B1),
    {V1_wish_val, _B3} = protocol:uint32(_B2),
    {V1_rank_info, _B9} = protocol:array(_B3,
                                         fun (_B4) ->
                                                 {V2_rank, _B5} =
                                                     protocol:uint8(_B4),
                                                 {V2_guild_name, _B6} =
                                                     protocol:string(_B5),
                                                 {V2_wish_val, _B7} =
                                                     protocol:uint32(_B6),
                                                 {{V2_rank,
                                                   V2_guild_name,
                                                   V2_wish_val},
                                                  _B7}
                                         end),
    {ok,
     {V1_left_time, V1_add_exp, V1_wish_val, V1_rank_info}};
unpack(srv, 14066, _B0) -> {ok, {}};
unpack(cli, 14066, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_left_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_left_time}};
unpack(srv, 14067, _B0) ->
    {V1_process, _B1} = protocol:uint8(_B0),
    {ok, {V1_process}};
unpack(cli, 14067, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14068, _B0) -> {ok, {}};
unpack(cli, 14068, _B0) ->
    {V1_role_info, _B12} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_r_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_r_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_r_zone_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_guild_id, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_guild_platform, _B7} =
                                                      protocol:string(_B6),
                                                  {V2_guild_zone_id, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_guild_name, _B9} =
                                                      protocol:string(_B8),
                                                  {V2_wish_val, _B10} =
                                                      protocol:uint32(_B9),
                                                  {{V2_r_id,
                                                    V2_r_platform,
                                                    V2_r_zone_id,
                                                    V2_name,
                                                    V2_guild_id,
                                                    V2_guild_platform,
                                                    V2_guild_zone_id,
                                                    V2_guild_name,
                                                    V2_wish_val},
                                                   _B10}
                                          end),
    {ok, {V1_role_info}};
unpack(srv, 14069, _B0) -> {ok, {}};
unpack(cli, 14069, _B0) ->
    {V1_info, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_type, _B2} =
                                                protocol:uint8(_B1),
                                            {V2_flag, _B3} =
                                                protocol:uint8(_B2),
                                            {{V2_type, V2_flag}, _B3}
                                    end),
    {ok, {V1_info}};
unpack(srv, 14070, _B0) -> {ok, {}};
unpack(cli, 14070, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_askid, _B2} = protocol:uint32(_B1),
    {V1_left_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_status, V1_askid, V1_left_time}};
unpack(srv, 14071, _B0) -> {ok, {}};
unpack(cli, 14071, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_askid, _B3} = protocol:uint32(_B2),
    {V1_done_answer, _B4} = protocol:uint8(_B3),
    {V1_lockylist, _B22} = protocol:array(_B4,
                                          fun (_B5) ->
                                                  {V2_rid, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_platform, _B7} =
                                                      protocol:string(_B6),
                                                  {V2_zone_id, _B8} =
                                                      protocol:uint16(_B7),
                                                  {V2_name, _B9} =
                                                      protocol:string(_B8),
                                                  {V2_lev, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_classes, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_sex, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_rank, _B13} =
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
                                                  {{V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_rank,
                                                    V2_looks},
                                                   _B20}
                                          end),
    {ok,
     {V1_err_code,
      V1_msg,
      V1_askid,
      V1_done_answer,
      V1_lockylist}};
unpack(srv, 14072, _B0) ->
    {V1_anwer, _B1} = protocol:uint8(_B0),
    {V1_is_world, _B2} = protocol:uint8(_B1),
    {ok, {V1_anwer, V1_is_world}};
unpack(cli, 14072, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_result, _B3} = protocol:uint8(_B2),
    {V1_anwer, _B4} = protocol:uint8(_B3),
    {ok, {V1_err_code, V1_msg, V1_result, V1_anwer}};
unpack(srv, 14073, _B0) -> {ok, {}};
unpack(cli, 14073, _B0) ->
    {V1_rainbow_prize_list, _B7} = protocol:array(_B0,
                                                  fun (_B1) ->
                                                          {V2_id, _B2} =
                                                              protocol:uint16(_B1),
                                                          {V2_assets, _B3} =
                                                              protocol:uint32(_B2),
                                                          {V2_val, _B4} =
                                                              protocol:uint32(_B3),
                                                          {V2_is_hit, _B5} =
                                                              protocol:uint8(_B4),
                                                          {{V2_id,
                                                            V2_assets,
                                                            V2_val,
                                                            V2_is_hit},
                                                           _B5}
                                                  end),
    {V1_notice_msg, _B11} = protocol:array(_B7,
                                           fun (_B8) ->
                                                   {V2_content, _B9} =
                                                       protocol:string(_B8),
                                                   {{V2_content}, _B9}
                                           end),
    {V1_last_free_time, _B12} = protocol:uint32(_B11),
    {ok,
     {V1_rainbow_prize_list,
      V1_notice_msg,
      V1_last_free_time}};
unpack(srv, 14074, _B0) -> {ok, {}};
unpack(cli, 14074, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_err_code, V1_msg, V1_id}};
unpack(srv, 14075, _B0) -> {ok, {}};
unpack(cli, 14075, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_result, _B7} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_assets, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_val, _B5} =
                                                  protocol:uint32(_B4),
                                              {{V2_assets, V2_val}, _B5}
                                      end),
    {ok, {V1_err_code, V1_msg, V1_result}};
unpack(srv, 14076, _B0) -> {ok, {}};
unpack(cli, 14076, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14077, _B0) -> {ok, {}};
unpack(cli, 14077, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_err_code, V1_msg, V1_id}};
unpack(srv, 14078, _B0) -> {ok, {}};
unpack(cli, 14078, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_answer_times, _B2} = protocol:uint8(_B1),
    {V1_gains, _B7} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_assets, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_val, _B5} =
                                                 protocol:uint32(_B4),
                                             {{V2_assets, V2_val}, _B5}
                                     end),
    {ok, {V1_result, V1_answer_times, V1_gains}};
unpack(srv, 14080, _B0) -> {ok, {}};
unpack(cli, 14080, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_finish, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_refre_time, _B4} = protocol:uint32(_B3),
    {V1_cake, _B5} = protocol:uint32(_B4),
    {V1_max, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_status,
      V1_finish,
      V1_end_time,
      V1_refre_time,
      V1_cake,
      V1_max}};
unpack(srv, 14081, _B0) -> {ok, {}};
unpack(cli, 14081, _B0) ->
    {V1_info, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_status, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_id, V2_status}, _B3}
                                    end),
    {ok, {V1_info}};
unpack(srv, 14082, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_answer, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_answer}};
unpack(cli, 14082, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_answer, _B3} = protocol:uint32(_B2),
    {V1_right_answer, _B4} = protocol:uint32(_B3),
    {ok, {V1_err_code, V1_msg, V1_answer, V1_right_answer}};
unpack(srv, 14083, _B0) -> {ok, {}};
unpack(cli, 14083, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 14084, _B0) -> {ok, {}};
unpack(cli, 14084, _B0) ->
    {V1_reward_list, _B5} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_item_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_num, _B3} =
                                                       protocol:uint32(_B2),
                                                   {{V2_item_id, V2_num}, _B3}
                                           end),
    {ok, {V1_reward_list}};
unpack(srv, 14085, _B0) -> {ok, {}};
unpack(cli, 14085, _B0) ->
    {V1_buff_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_buff_id}};
unpack(srv, 14086, _B0) -> {ok, {}};
unpack(cli, 14086, _B0) ->
    {V1_times, _B1} = protocol:uint32(_B0),
    {V1_max, _B2} = protocol:uint32(_B1),
    {ok, {V1_times, V1_max}};
unpack(srv, 14087, _B0) -> {ok, {}};
unpack(cli, 14087, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_day, _B2} = protocol:uint16(_B1),
    {V1_roll_times, _B3} = protocol:uint16(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {V1_reward, _B8} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_reward_id, _B6} =
                                                  protocol:uint16(_B5),
                                              {{V2_reward_id}, _B6}
                                      end),
    {V1_reward_get, _B12} = protocol:array(_B8,
                                           fun (_B9) ->
                                                   {V2_reward_id_get, _B10} =
                                                       protocol:uint16(_B9),
                                                   {{V2_reward_id_get}, _B10}
                                           end),
    {ok,
     {V1_id,
      V1_day,
      V1_roll_times,
      V1_status,
      V1_reward,
      V1_reward_get}};
unpack(srv, 14088, _B0) ->
    {V1_reward_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_reward_id}};
unpack(cli, 14088, _B0) ->
    {V1_reward_id, _B1} = protocol:uint16(_B0),
    {V1_err_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_reward_id, V1_err_code, V1_msg}};
unpack(srv, 14089, _B0) -> {ok, {}};
unpack(cli, 14089, _B0) ->
    {V1_val, _B1} = protocol:uint16(_B0),
    {V1_err_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_val, V1_err_code, V1_msg}};
unpack(srv, 14090, _B0) -> {ok, {}};
unpack(cli, 14090, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(srv, 14091, _B0) -> {ok, {}};
unpack(cli, 14091, _B0) ->
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
unpack(srv, 14092, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 14092, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_err_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_id, V1_err_code, V1_msg}};
unpack(srv, 14093, _B0) -> {ok, {}};
unpack(cli, 14093, _B0) -> {ok, {}};
unpack(srv, 14094, _B0) -> {ok, {}};
unpack(cli, 14094, _B0) ->
    {V1_pmd_list, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_msg, _B2} =
                                                    protocol:string(_B1),
                                                {V2_time, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_msg, V2_time}, _B3}
                                        end),
    {ok, {V1_pmd_list}};
unpack(srv, 14095, _B0) -> {ok, {}};
unpack(cli, 14095, _B0) ->
    {V1_gold, _B1} = protocol:uint32(_B0),
    {ok, {V1_gold}};
unpack(srv, 14096, _B0) -> {ok, {}};
unpack(cli, 14096, _B0) ->
    {V1_gold, _B1} = protocol:uint32(_B0),
    {V1_err_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_gold, V1_err_code, V1_msg}};
unpack(srv, 14097, _B0) -> {ok, {}};
unpack(cli, 14097, _B0) ->
    {V1_times, _B1} = protocol:uint16(_B0),
    {ok, {V1_times}};
unpack(srv, 14098, _B0) -> {ok, {}};
unpack(cli, 14098, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_camp_id, V1_base_id}};
unpack(srv, 14099, _B0) -> {ok, {}};
unpack(cli, 14099, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_num, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_id, V2_num}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

