-file("src/proto/proto_99.erl", 1).

-module(proto_99).

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

-file("src/proto/proto_99.erl", 14).

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

-file("src/proto/proto_99.erl", 15).

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

-file("src/proto/proto_99.erl", 16).

-file("inc/growth_fund.hrl", 1).

-record(growth_fund,
        {ver = 1 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         rewards = [] :: list()}).

-file("src/proto/proto_99.erl", 17).

-file("inc/regression_login.hrl", 1).

-record(regression_login,
        {flag = 0 :: non_neg_integer(),
         reward_id = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         unixtime = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         reward_all = 0 :: non_neg_integer()}).

-file("src/proto/proto_99.erl", 18).

-file("inc/month_gift.hrl", 1).

-record(m_month_gift, {lists = []}).

-record(month_gift_data,
        {id = 0,
         start_time,
         end_time,
         is_open = 0,
         desc1 = "",
         desc2 = "",
         title = "",
         item_list = []}).

-record(month_gift_item_data,
        {id = 0,
         gift_id = 0,
         group = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         origin_price = [],
         price = [],
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0}).

-record(pay_gift_item_data,
        {gift_id = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         type = 0,
         origin_price = [],
         price = [],
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0,
         desc = ""}).

-file("src/proto/proto_99.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 9900, {V0_cmd}) ->
    D_a_t_a = <<(protocol:pack(string, V0_cmd))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9900:16/little,
       D_a_t_a/binary>>};
pack(srv, 9900, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9900:16/little,
       D_a_t_a/binary>>};
pack(cli, 9901, {}) ->
    {ok, <<2:32/little, 9901:16/little>>};
pack(srv, 9901, {V0_type, V0_msg}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9901:16/little,
       D_a_t_a/binary>>};
pack(cli, 9902, {}) ->
    {ok, <<2:32/little, 9902:16/little>>};
pack(srv, 9902, {V0_type, V0_msg, V0_limit}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_limit)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   V1_value:32/little>>
                                 || {V1_type, V1_value} <- V0_limit]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9902:16/little,
       D_a_t_a/binary>>};
pack(cli, 9903, {}) ->
    {ok, <<2:32/little, 9903:16/little>>};
pack(srv, 9903, {V0_type, V0_msg}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9903:16/little,
       D_a_t_a/binary>>};
pack(cli, 9904, {}) ->
    {ok, <<2:32/little, 9904:16/little>>};
pack(srv, 9904, {V0_world_lev, V0_next_time}) ->
    D_a_t_a = <<V0_world_lev:32/little,
                V0_next_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9904:16/little,
       D_a_t_a/binary>>};
pack(cli, 9905, {}) ->
    {ok, <<2:32/little, 9905:16/little>>};
pack(srv, 9905, {V0_package, V0_items}) ->
    D_a_t_a = <<V0_package:8/little,
                (length(V0_items)):16/little,
                (list_to_binary([<<V1_item_id:32/little>>
                                 || V1_item_id <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9905:16/little,
       D_a_t_a/binary>>};
pack(cli, 9906, {V0_card}) ->
    D_a_t_a = <<(protocol:pack(string, V0_card))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9906:16/little,
       D_a_t_a/binary>>};
pack(srv, 9906, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9906:16/little,
       D_a_t_a/binary>>};
pack(cli, 9907, {}) ->
    {ok, <<2:32/little, 9907:16/little>>};
pack(srv, 9907, {V0_id, V0_type, V0_map, V0_x, V0_y}) ->
    D_a_t_a = <<V0_id:32/little, V0_type:16/little,
                V0_map:32/little, V0_x:32/little, V0_y:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9907:16/little,
       D_a_t_a/binary>>};
pack(cli, 9908, {}) ->
    {ok, <<2:32/little, 9908:16/little>>};
pack(srv, 9908, {V0_enum}) ->
    D_a_t_a = <<V0_enum:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9908:16/little,
       D_a_t_a/binary>>};
pack(cli, 9909, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9909:16/little,
       D_a_t_a/binary>>};
pack(srv, 9909, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9909:16/little,
       D_a_t_a/binary>>};
pack(cli, 9910, {}) ->
    {ok, <<2:32/little, 9910:16/little>>};
pack(srv, 9910, {V0_base_id, V0_msg}) ->
    D_a_t_a = <<V0_base_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9910:16/little,
       D_a_t_a/binary>>};
pack(cli, 9911, {}) ->
    {ok, <<2:32/little, 9911:16/little>>};
pack(srv, 9911, {V0_type, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9911:16/little,
       D_a_t_a/binary>>};
pack(cli, 9920, {}) ->
    {ok, <<2:32/little, 9920:16/little>>};
pack(srv, 9920, {V0_board_list}) ->
    D_a_t_a = <<(length(V0_board_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_type:8/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   (protocol:pack(string, V1_msg))/binary,
                                   (length(V1_gain)):16/little,
                                   (list_to_binary([<<V2_gain_id:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_gain_id, V2_value}
                                                           <- V1_gain]))/binary>>
                                 || #notice_board{id = V1_id, type = V1_type,
                                                  start_time = V1_start_time,
                                                  end_time = V1_end_time,
                                                  title = V1_title,
                                                  content = V1_content,
                                                  msg = V1_msg, gain = V1_gain}
                                        <- V0_board_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9920:16/little,
       D_a_t_a/binary>>};
pack(cli, 9921, {}) ->
    {ok, <<2:32/little, 9921:16/little>>};
pack(srv, 9921,
     #notice_board{id = V0_id, type = V0_type,
                   start_time = V0_start_time, end_time = V0_end_time,
                   title = V0_title, content = V0_content, msg = V0_msg,
                   gain = V0_gain}) ->
    D_a_t_a = <<V0_id:32/little, V0_type:8/little,
                V0_start_time:32/little, V0_end_time:32/little,
                (protocol:pack(string, V0_title))/binary,
                (protocol:pack(string, V0_content))/binary,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_gain)):16/little,
                (list_to_binary([<<V1_gain_id:32/little,
                                   V1_value:32/little>>
                                 || {V1_gain_id, V1_value}
                                        <- V0_gain]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9921:16/little,
       D_a_t_a/binary>>};
pack(cli, 9922, {}) ->
    {ok, <<2:32/little, 9922:16/little>>};
pack(srv, 9922, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9922:16/little,
       D_a_t_a/binary>>};
pack(cli, 9923, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9923:16/little,
       D_a_t_a/binary>>};
pack(srv, 9923, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9923:16/little,
       D_a_t_a/binary>>};
pack(cli, 9924, {}) ->
    {ok, <<2:32/little, 9924:16/little>>};
pack(srv, 9924, {V0_board_list}) ->
    D_a_t_a = <<(length(V0_board_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_type:8/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   (protocol:pack(string, V1_msg))/binary,
                                   (length(V1_gain)):16/little,
                                   (list_to_binary([<<V2_gain_id:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_gain_id, V2_value}
                                                           <- V1_gain]))/binary>>
                                 || #notice_board{id = V1_id, type = V1_type,
                                                  start_time = V1_start_time,
                                                  end_time = V1_end_time,
                                                  title = V1_title,
                                                  content = V1_content,
                                                  msg = V1_msg, gain = V1_gain}
                                        <- V0_board_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9924:16/little,
       D_a_t_a/binary>>};
pack(cli, 9925, {}) ->
    {ok, <<2:32/little, 9925:16/little>>};
pack(srv, 9925,
     {V0_charge,
      V0_authsfz_charge,
      V0_lev,
      V0_list,
      V0_items,
      V0_priviege_list}) ->
    D_a_t_a = <<V0_charge:32/little,
                V0_authsfz_charge:32/little, V0_lev:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_val:32/little>>
                                 || V1_val <- V0_list]))/binary,
                (length(V0_items)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_items]))/binary,
                (length(V0_priviege_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_priviege_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9925:16/little,
       D_a_t_a/binary>>};
pack(cli, 9926, {V0_lev}) ->
    D_a_t_a = <<V0_lev:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9926:16/little,
       D_a_t_a/binary>>};
pack(srv, 9926, {V0_flag, V0_lev}) ->
    D_a_t_a = <<V0_flag:8/little, V0_lev:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9926:16/little,
       D_a_t_a/binary>>};
pack(cli, 9927, {}) ->
    {ok, <<2:32/little, 9927:16/little>>};
pack(srv, 9927,
     {V0_flag,
      V0_keep_time,
      V0_login_time,
      V0_start_time,
      V0_return_val,
      V0_max_time}) ->
    D_a_t_a = <<V0_flag:8/little, V0_keep_time:32/little,
                V0_login_time:32/little, V0_start_time:32/little,
                V0_return_val:32/little, V0_max_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9927:16/little,
       D_a_t_a/binary>>};
pack(cli, 9928, {}) ->
    {ok, <<2:32/little, 9928:16/little>>};
pack(srv, 9928,
     {V0_title,
      V0_content,
      V0_process,
      V0_extern_content,
      V0_rewards}) ->
    D_a_t_a = <<(protocol:pack(string, V0_title))/binary,
                (protocol:pack(string, V0_content))/binary,
                (protocol:pack(string, V0_process))/binary,
                (protocol:pack(string, V0_extern_content))/binary,
                (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_count:32/little>>
                                 || {V1_item_id, V1_count}
                                        <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9928:16/little,
       D_a_t_a/binary>>};
pack(cli, 9929, {}) ->
    {ok, <<2:32/little, 9929:16/little>>};
pack(srv, 9929, {V0_reward_info}) ->
    D_a_t_a = <<(length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   V1_result:8/little>>
                                 || {V1_type, V1_result}
                                        <- V0_reward_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9929:16/little,
       D_a_t_a/binary>>};
pack(cli, 9930, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9930:16/little,
       D_a_t_a/binary>>};
pack(srv, 9930, {V0_type, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_type:8/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9930:16/little,
       D_a_t_a/binary>>};
pack(cli, 9931, {}) ->
    {ok, <<2:32/little, 9931:16/little>>};
pack(srv, 9931, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9931:16/little,
       D_a_t_a/binary>>};
pack(cli, 9932, {}) ->
    {ok, <<2:32/little, 9932:16/little>>};
pack(srv, 9932, {V0_reward, V0_day}) ->
    D_a_t_a = <<V0_reward:8/little, V0_day:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9932:16/little,
       D_a_t_a/binary>>};
pack(cli, 9933, {}) ->
    {ok, <<2:32/little, 9933:16/little>>};
pack(srv, 9933,
     {V0_flag,
      V0_keep_time,
      V0_login_time,
      V0_start_time,
      V0_max_time,
      V0_rewards}) ->
    D_a_t_a = <<V0_flag:8/little, V0_keep_time:32/little,
                V0_login_time:32/little, V0_start_time:32/little,
                V0_max_time:32/little, (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_group:32/little,
                                   V1_count:32/little>>
                                 || {V1_group, V1_count}
                                        <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9933:16/little,
       D_a_t_a/binary>>};
pack(cli, 9934, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9934:16/little,
       D_a_t_a/binary>>};
pack(srv, 9934, {V0_board_list, V0_all_board_list}) ->
    D_a_t_a = <<(length(V0_board_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_type:8/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   (protocol:pack(string, V1_msg))/binary,
                                   (length(V1_gain)):16/little,
                                   (list_to_binary([<<V2_gain_id:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_gain_id, V2_value}
                                                           <- V1_gain]))/binary>>
                                 || #notice_board{id = V1_id, type = V1_type,
                                                  start_time = V1_start_time,
                                                  end_time = V1_end_time,
                                                  title = V1_title,
                                                  content = V1_content,
                                                  msg = V1_msg, gain = V1_gain}
                                        <- V0_board_list]))/binary,
                (length(V0_all_board_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_type:8/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   (protocol:pack(string, V1_msg))/binary,
                                   (length(V1_gain)):16/little,
                                   (list_to_binary([<<V2_gain_id:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_gain_id, V2_value}
                                                           <- V1_gain]))/binary>>
                                 || #notice_board{id = V1_id, type = V1_type,
                                                  start_time = V1_start_time,
                                                  end_time = V1_end_time,
                                                  title = V1_title,
                                                  content = V1_content,
                                                  msg = V1_msg, gain = V1_gain}
                                        <- V0_all_board_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9934:16/little,
       D_a_t_a/binary>>};
pack(cli, 9935, {}) ->
    {ok, <<2:32/little, 9935:16/little>>};
pack(srv, 9935,
     {#growth_fund{gold = V0_gold, rewards = V0_rewards}}) ->
    D_a_t_a = <<V0_gold:32/little,
                (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_id:8/little>>
                                 || V1_id <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9935:16/little,
       D_a_t_a/binary>>};
pack(cli, 9936, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9936:16/little,
       D_a_t_a/binary>>};
pack(srv, 9936, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9936:16/little,
       D_a_t_a/binary>>};
pack(cli, 9937, {}) ->
    {ok, <<2:32/little, 9937:16/little>>};
pack(srv, 9937, {V0_golds}) ->
    D_a_t_a = <<(length(V0_golds)):16/little,
                (list_to_binary([<<V1_gold:16/little>>
                                 || V1_gold <- V0_golds]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9937:16/little,
       D_a_t_a/binary>>};
pack(cli, 9938, {}) ->
    {ok, <<2:32/little, 9938:16/little>>};
pack(srv, 9938,
     {#regression_login{flag = V0_flag,
                        time_return = V0_time_return, rewards = V0_rewards,
                        reward_all = V0_reward_all}}) ->
    D_a_t_a = <<V0_flag:8/little, V0_time_return:32/little,
                (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_day:8/little, V1_status:8/little,
                                   V1_time:32/little>>
                                 || {V1_day, V1_status, V1_time}
                                        <- V0_rewards]))/binary,
                V0_reward_all:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9938:16/little,
       D_a_t_a/binary>>};
pack(cli, 9939, {V0_day}) ->
    D_a_t_a = <<V0_day:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9939:16/little,
       D_a_t_a/binary>>};
pack(srv, 9939, {V0_day, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_day:8/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9939:16/little,
       D_a_t_a/binary>>};
pack(cli, 9940, {}) ->
    {ok, <<2:32/little, 9940:16/little>>};
pack(srv, 9940, {V0_reward_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_reward_id:16/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9940:16/little,
       D_a_t_a/binary>>};
pack(cli, 9941, {}) ->
    {ok, <<2:32/little, 9941:16/little>>};
pack(srv, 9941, {}) ->
    {ok, <<2:32/little, 9941:16/little>>};
pack(cli, 9942, {V0_day}) ->
    D_a_t_a = <<V0_day:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9942:16/little,
       D_a_t_a/binary>>};
pack(srv, 9942, {V0_day, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_day:8/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9942:16/little,
       D_a_t_a/binary>>};
pack(cli, 9943, {}) ->
    {ok, <<2:32/little, 9943:16/little>>};
pack(srv, 9943, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9943:16/little,
       D_a_t_a/binary>>};
pack(cli, 9944, {}) ->
    {ok, <<2:32/little, 9944:16/little>>};
pack(srv, 9944, {V0_pmd_list}) ->
    D_a_t_a = <<(length(V0_pmd_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_msg))/binary,
                                   V1_time:32/little>>
                                 || {V1_msg, V1_time}
                                        <- V0_pmd_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9944:16/little,
       D_a_t_a/binary>>};
pack(cli, 9945, {}) ->
    {ok, <<2:32/little, 9945:16/little>>};
pack(srv, 9945, {}) ->
    {ok, <<2:32/little, 9945:16/little>>};
pack(cli, 9946, {}) ->
    {ok, <<2:32/little, 9946:16/little>>};
pack(srv, 9946, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little,
                                   (protocol:pack(string, V1_desc1))/binary,
                                   (protocol:pack(string, V1_desc2))/binary,
                                   (protocol:pack(string, V1_title))/binary,
                                   (length(V1_item_list)):16/little,
                                   (list_to_binary([<<V2_gift_id:32/little,
                                                      V2_group:32/little,
                                                      V2_item_id:32/little,
                                                      V2_bind:32/little,
                                                      V2_num:32/little,
                                                      (length(V2_origin_price)):16/little,
                                                      (list_to_binary([<<V3_item_id:32/little,
                                                                         V3_num:32/little>>
                                                                       || {V3_item_id,
                                                                           V3_num}
                                                                              <- V2_origin_price]))/binary,
                                                      (length(V2_price)):16/little,
                                                      (list_to_binary([<<V3_item_id:32/little,
                                                                         V3_num:32/little>>
                                                                       || {V3_item_id,
                                                                           V3_num}
                                                                              <- V2_price]))/binary,
                                                      V2_min_lev:32/little,
                                                      V2_max_lev:32/little,
                                                      V2_sex:32/little,
                                                      V2_classes:32/little,
                                                      V2_min_lev_break:32/little,
                                                      V2_max_lev_break:32/little>>
                                                    || #month_gift_item_data{gift_id
                                                                                 =
                                                                                 V2_gift_id,
                                                                             group
                                                                                 =
                                                                                 V2_group,
                                                                             item_id
                                                                                 =
                                                                                 V2_item_id,
                                                                             bind
                                                                                 =
                                                                                 V2_bind,
                                                                             num
                                                                                 =
                                                                                 V2_num,
                                                                             origin_price
                                                                                 =
                                                                                 V2_origin_price,
                                                                             price
                                                                                 =
                                                                                 V2_price,
                                                                             min_lev
                                                                                 =
                                                                                 V2_min_lev,
                                                                             max_lev
                                                                                 =
                                                                                 V2_max_lev,
                                                                             sex
                                                                                 =
                                                                                 V2_sex,
                                                                             classes
                                                                                 =
                                                                                 V2_classes,
                                                                             min_lev_break
                                                                                 =
                                                                                 V2_min_lev_break,
                                                                             max_lev_break
                                                                                 =
                                                                                 V2_max_lev_break}
                                                           <- V1_item_list]))/binary>>
                                 || #month_gift_data{id = V1_id,
                                                     start_time = V1_start_time,
                                                     end_time = V1_end_time,
                                                     desc1 = V1_desc1,
                                                     desc2 = V1_desc2,
                                                     title = V1_title,
                                                     item_list = V1_item_list}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9946:16/little,
       D_a_t_a/binary>>};
pack(cli, 9947, {}) ->
    {ok, <<2:32/little, 9947:16/little>>};
pack(srv, 9947, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_gift_id:32/little, V1_group:32/little>>
                                 || {V1_id, V1_gift_id, V1_group}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9947:16/little,
       D_a_t_a/binary>>};
pack(cli, 9948, {V0_id, V0_gift_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_gift_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9948:16/little,
       D_a_t_a/binary>>};
pack(srv, 9948, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9948:16/little,
       D_a_t_a/binary>>};
pack(cli, 9949, {}) ->
    {ok, <<2:32/little, 9949:16/little>>};
pack(srv, 9949, {V0_luck}) ->
    D_a_t_a = <<V0_luck:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9949:16/little,
       D_a_t_a/binary>>};
pack(cli, 9950, {V0_num}) ->
    D_a_t_a = <<V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9950:16/little,
       D_a_t_a/binary>>};
pack(srv, 9950, {V0_flag, V0_ids, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (length(V0_ids)):16/little,
                (list_to_binary([<<V1_id:16/little>>
                                 || V1_id <- V0_ids]))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9950:16/little,
       D_a_t_a/binary>>};
pack(cli, 9951, {}) ->
    {ok, <<2:32/little, 9951:16/little>>};
pack(srv, 9951, {V0_flag, V0_msg, V0_item_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_item_id)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_bind:32/little, V1_num:32/little>>
                                 || {V1_item_id, V1_bind, V1_num}
                                        <- V0_item_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9951:16/little,
       D_a_t_a/binary>>};
pack(cli, 9952, {V0_gift_id}) ->
    D_a_t_a = <<V0_gift_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9952:16/little,
       D_a_t_a/binary>>};
pack(srv, 9952, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_gift_id:32/little,
                                   V1_item_id:32/little, V1_bind:32/little,
                                   V1_type:32/little, V1_num:32/little,
                                   (length(V1_origin_price)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_item_id, V2_num}
                                                           <- V1_origin_price]))/binary,
                                   (length(V1_price)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_item_id, V2_num}
                                                           <- V1_price]))/binary,
                                   V1_min_lev:32/little, V1_max_lev:32/little,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_min_lev_break:32/little,
                                   V1_max_lev_break:32/little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || #pay_gift_item_data{gift_id = V1_gift_id,
                                                        item_id = V1_item_id,
                                                        bind = V1_bind,
                                                        type = V1_type,
                                                        num = V1_num,
                                                        origin_price =
                                                            V1_origin_price,
                                                        price = V1_price,
                                                        min_lev = V1_min_lev,
                                                        max_lev = V1_max_lev,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        min_lev_break =
                                                            V1_min_lev_break,
                                                        max_lev_break =
                                                            V1_max_lev_break,
                                                        desc = V1_desc}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9952:16/little,
       D_a_t_a/binary>>};
pack(cli, 9953, {}) ->
    {ok, <<2:32/little, 9953:16/little>>};
pack(srv, 9953, {V0_label}) ->
    D_a_t_a = <<(protocol:pack(string, V0_label))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9953:16/little,
       D_a_t_a/binary>>};
pack(cli, 9954, {}) ->
    {ok, <<2:32/little, 9954:16/little>>};
pack(srv, 9954, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9954:16/little,
       D_a_t_a/binary>>};
pack(cli, 9955, {}) ->
    {ok, <<2:32/little, 9955:16/little>>};
pack(srv, 9955, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9955:16/little,
       D_a_t_a/binary>>};
pack(cli, 9956, {}) ->
    {ok, <<2:32/little, 9956:16/little>>};
pack(srv, 9956,
     {V0_flag, V0_val, V0_upper_limit_num}) ->
    D_a_t_a = <<V0_flag:8/little, V0_val:32/signed-little,
                V0_upper_limit_num:32/signed-little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9956:16/little,
       D_a_t_a/binary>>};
pack(cli, 9957, {V0_game_name}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_game_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9957:16/little,
       D_a_t_a/binary>>};
pack(srv, 9957, {V0_recharge_list}) ->
    D_a_t_a = <<(length(V0_recharge_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_tag))/binary,
                                   V1_level:32/little, V1_rmb:32/little,
                                   V1_gold:32/little, V1_tokes:32/little,
                                   (protocol:pack(string, V1_game_name))/binary,
                                   V1_show_state:8/little>>
                                 || {V1_tag,
                                     V1_level,
                                     V1_rmb,
                                     V1_gold,
                                     V1_tokes,
                                     V1_game_name,
                                     V1_show_state}
                                        <- V0_recharge_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 9957:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 9900, _B0) ->
    {V1_cmd, _B1} = protocol:string(_B0),
    {ok, {V1_cmd}};
unpack(cli, 9900, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(srv, 9901, _B0) -> {ok, {}};
unpack(cli, 9901, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_type, V1_msg}};
unpack(srv, 9902, _B0) -> {ok, {}};
unpack(cli, 9902, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_limit, _B7} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_type, _B4} =
                                                 protocol:uint8(_B3),
                                             {V2_value, _B5} =
                                                 protocol:uint32(_B4),
                                             {{V2_type, V2_value}, _B5}
                                     end),
    {ok, {V1_type, V1_msg, V1_limit}};
unpack(srv, 9903, _B0) -> {ok, {}};
unpack(cli, 9903, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_type, V1_msg}};
unpack(srv, 9904, _B0) -> {ok, {}};
unpack(cli, 9904, _B0) ->
    {V1_world_lev, _B1} = protocol:uint32(_B0),
    {V1_next_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_world_lev, V1_next_time}};
unpack(srv, 9905, _B0) -> {ok, {}};
unpack(cli, 9905, _B0) ->
    {V1_package, _B1} = protocol:uint8(_B0),
    {V1_items, _B5} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_item_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {{V2_item_id}, _B3}
                                     end),
    {ok, {V1_package, V1_items}};
unpack(srv, 9906, _B0) ->
    {V1_card, _B1} = protocol:string(_B0),
    {ok, {V1_card}};
unpack(cli, 9906, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 9907, _B0) -> {ok, {}};
unpack(cli, 9907, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint16(_B1),
    {V1_map, _B3} = protocol:uint32(_B2),
    {V1_x, _B4} = protocol:uint32(_B3),
    {V1_y, _B5} = protocol:uint32(_B4),
    {ok, {V1_id, V1_type, V1_map, V1_x, V1_y}};
unpack(srv, 9908, _B0) -> {ok, {}};
unpack(cli, 9908, _B0) ->
    {V1_enum, _B1} = protocol:uint32(_B0),
    {ok, {V1_enum}};
unpack(srv, 9909, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 9909, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 9910, _B0) -> {ok, {}};
unpack(cli, 9910, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_base_id, V1_msg}};
unpack(srv, 9911, _B0) -> {ok, {}};
unpack(cli, 9911, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_type, V1_id, V1_msg}};
unpack(srv, 9920, _B0) -> {ok, {}};
unpack(cli, 9920, _B0) ->
    {V1_board_list, _B15} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_type, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_start_time, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_end_time, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_title, _B6} =
                                                       protocol:string(_B5),
                                                   {V2_content, _B7} =
                                                       protocol:string(_B6),
                                                   {V2_msg, _B8} =
                                                       protocol:string(_B7),
                                                   {V2_gain, _B13} =
                                                       protocol:array(_B8,
                                                                      fun
                                                                          (_B9) ->
                                                                              {V3_gain_id,
                                                                               _B10} =
                                                                                  protocol:uint32(_B9),
                                                                              {V3_value,
                                                                               _B11} =
                                                                                  protocol:uint32(_B10),
                                                                              {{V3_gain_id,
                                                                                V3_value},
                                                                               _B11}
                                                                      end),
                                                   {{V2_id,
                                                     V2_type,
                                                     V2_start_time,
                                                     V2_end_time,
                                                     V2_title,
                                                     V2_content,
                                                     V2_msg,
                                                     V2_gain},
                                                    _B13}
                                           end),
    {ok, {V1_board_list}};
unpack(srv, 9921, _B0) -> {ok, {}};
unpack(cli, 9921, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_start_time, _B3} = protocol:uint32(_B2),
    {V1_end_time, _B4} = protocol:uint32(_B3),
    {V1_title, _B5} = protocol:string(_B4),
    {V1_content, _B6} = protocol:string(_B5),
    {V1_msg, _B7} = protocol:string(_B6),
    {V1_gain, _B12} = protocol:array(_B7,
                                     fun (_B8) ->
                                             {V2_gain_id, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_value, _B10} =
                                                 protocol:uint32(_B9),
                                             {{V2_gain_id, V2_value}, _B10}
                                     end),
    {ok,
     {V1_id,
      V1_type,
      V1_start_time,
      V1_end_time,
      V1_title,
      V1_content,
      V1_msg,
      V1_gain}};
unpack(srv, 9922, _B0) -> {ok, {}};
unpack(cli, 9922, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(srv, 9923, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 9923, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 9924, _B0) -> {ok, {}};
unpack(cli, 9924, _B0) ->
    {V1_board_list, _B15} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_type, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_start_time, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_end_time, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_title, _B6} =
                                                       protocol:string(_B5),
                                                   {V2_content, _B7} =
                                                       protocol:string(_B6),
                                                   {V2_msg, _B8} =
                                                       protocol:string(_B7),
                                                   {V2_gain, _B13} =
                                                       protocol:array(_B8,
                                                                      fun
                                                                          (_B9) ->
                                                                              {V3_gain_id,
                                                                               _B10} =
                                                                                  protocol:uint32(_B9),
                                                                              {V3_value,
                                                                               _B11} =
                                                                                  protocol:uint32(_B10),
                                                                              {{V3_gain_id,
                                                                                V3_value},
                                                                               _B11}
                                                                      end),
                                                   {{V2_id,
                                                     V2_type,
                                                     V2_start_time,
                                                     V2_end_time,
                                                     V2_title,
                                                     V2_content,
                                                     V2_msg,
                                                     V2_gain},
                                                    _B13}
                                           end),
    {ok, {V1_board_list}};
unpack(srv, 9925, _B0) -> {ok, {}};
unpack(cli, 9925, _B0) ->
    {V1_charge, _B1} = protocol:uint32(_B0),
    {V1_authsfz_charge, _B2} = protocol:uint32(_B1),
    {V1_lev, _B3} = protocol:uint32(_B2),
    {V1_list, _B7} = protocol:array(_B3,
                                    fun (_B4) ->
                                            {V2_val, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_val}, _B5}
                                    end),
    {V1_items, _B11} = protocol:array(_B7,
                                      fun (_B8) ->
                                              {V2_id, _B9} =
                                                  protocol:uint32(_B8),
                                              {{V2_id}, _B9}
                                      end),
    {V1_priviege_list, _B15} = protocol:array(_B11,
                                              fun (_B12) ->
                                                      {V2_id, _B13} =
                                                          protocol:uint32(_B12),
                                                      {{V2_id}, _B13}
                                              end),
    {ok,
     {V1_charge,
      V1_authsfz_charge,
      V1_lev,
      V1_list,
      V1_items,
      V1_priviege_list}};
unpack(srv, 9926, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {ok, {V1_lev}};
unpack(cli, 9926, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_lev, _B2} = protocol:uint32(_B1),
    {ok, {V1_flag, V1_lev}};
unpack(srv, 9927, _B0) -> {ok, {}};
unpack(cli, 9927, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_keep_time, _B2} = protocol:uint32(_B1),
    {V1_login_time, _B3} = protocol:uint32(_B2),
    {V1_start_time, _B4} = protocol:uint32(_B3),
    {V1_return_val, _B5} = protocol:uint32(_B4),
    {V1_max_time, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_flag,
      V1_keep_time,
      V1_login_time,
      V1_start_time,
      V1_return_val,
      V1_max_time}};
unpack(srv, 9928, _B0) -> {ok, {}};
unpack(cli, 9928, _B0) ->
    {V1_title, _B1} = protocol:string(_B0),
    {V1_content, _B2} = protocol:string(_B1),
    {V1_process, _B3} = protocol:string(_B2),
    {V1_extern_content, _B4} = protocol:string(_B3),
    {V1_rewards, _B9} = protocol:array(_B4,
                                       fun (_B5) ->
                                               {V2_item_id, _B6} =
                                                   protocol:uint32(_B5),
                                               {V2_count, _B7} =
                                                   protocol:uint32(_B6),
                                               {{V2_item_id, V2_count}, _B7}
                                       end),
    {ok,
     {V1_title,
      V1_content,
      V1_process,
      V1_extern_content,
      V1_rewards}};
unpack(srv, 9929, _B0) -> {ok, {}};
unpack(cli, 9929, _B0) ->
    {V1_reward_info, _B5} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_type, _B2} =
                                                       protocol:uint8(_B1),
                                                   {V2_result, _B3} =
                                                       protocol:uint8(_B2),
                                                   {{V2_type, V2_result}, _B3}
                                           end),
    {ok, {V1_reward_info}};
unpack(srv, 9930, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 9930, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_type, V1_result, V1_msg}};
unpack(srv, 9931, _B0) -> {ok, {}};
unpack(cli, 9931, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 9932, _B0) -> {ok, {}};
unpack(cli, 9932, _B0) ->
    {V1_reward, _B1} = protocol:uint8(_B0),
    {V1_day, _B2} = protocol:uint32(_B1),
    {ok, {V1_reward, V1_day}};
unpack(srv, 9933, _B0) -> {ok, {}};
unpack(cli, 9933, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_keep_time, _B2} = protocol:uint32(_B1),
    {V1_login_time, _B3} = protocol:uint32(_B2),
    {V1_start_time, _B4} = protocol:uint32(_B3),
    {V1_max_time, _B5} = protocol:uint32(_B4),
    {V1_rewards, _B10} = protocol:array(_B5,
                                        fun (_B6) ->
                                                {V2_group, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_count, _B8} =
                                                    protocol:uint32(_B7),
                                                {{V2_group, V2_count}, _B8}
                                        end),
    {ok,
     {V1_flag,
      V1_keep_time,
      V1_login_time,
      V1_start_time,
      V1_max_time,
      V1_rewards}};
unpack(srv, 9934, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 9934, _B0) ->
    {V1_board_list, _B15} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_type, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_start_time, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_end_time, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_title, _B6} =
                                                       protocol:string(_B5),
                                                   {V2_content, _B7} =
                                                       protocol:string(_B6),
                                                   {V2_msg, _B8} =
                                                       protocol:string(_B7),
                                                   {V2_gain, _B13} =
                                                       protocol:array(_B8,
                                                                      fun
                                                                          (_B9) ->
                                                                              {V3_gain_id,
                                                                               _B10} =
                                                                                  protocol:uint32(_B9),
                                                                              {V3_value,
                                                                               _B11} =
                                                                                  protocol:uint32(_B10),
                                                                              {{V3_gain_id,
                                                                                V3_value},
                                                                               _B11}
                                                                      end),
                                                   {{V2_id,
                                                     V2_type,
                                                     V2_start_time,
                                                     V2_end_time,
                                                     V2_title,
                                                     V2_content,
                                                     V2_msg,
                                                     V2_gain},
                                                    _B13}
                                           end),
    {V1_all_board_list, _B30} = protocol:array(_B15,
                                               fun (_B16) ->
                                                       {V2_id, _B17} =
                                                           protocol:uint32(_B16),
                                                       {V2_type, _B18} =
                                                           protocol:uint8(_B17),
                                                       {V2_start_time, _B19} =
                                                           protocol:uint32(_B18),
                                                       {V2_end_time, _B20} =
                                                           protocol:uint32(_B19),
                                                       {V2_title, _B21} =
                                                           protocol:string(_B20),
                                                       {V2_content, _B22} =
                                                           protocol:string(_B21),
                                                       {V2_msg, _B23} =
                                                           protocol:string(_B22),
                                                       {V2_gain, _B28} =
                                                           protocol:array(_B23,
                                                                          fun
                                                                              (_B24) ->
                                                                                  {V3_gain_id,
                                                                                   _B25} =
                                                                                      protocol:uint32(_B24),
                                                                                  {V3_value,
                                                                                   _B26} =
                                                                                      protocol:uint32(_B25),
                                                                                  {{V3_gain_id,
                                                                                    V3_value},
                                                                                   _B26}
                                                                          end),
                                                       {{V2_id,
                                                         V2_type,
                                                         V2_start_time,
                                                         V2_end_time,
                                                         V2_title,
                                                         V2_content,
                                                         V2_msg,
                                                         V2_gain},
                                                        _B28}
                                               end),
    {ok, {V1_board_list, V1_all_board_list}};
unpack(srv, 9935, _B0) -> {ok, {}};
unpack(cli, 9935, _B0) ->
    {V1_gold, _B1} = protocol:uint32(_B0),
    {V1_rewards, _B5} = protocol:array(_B1,
                                       fun (_B2) ->
                                               {V2_id, _B3} =
                                                   protocol:uint8(_B2),
                                               {{V2_id}, _B3}
                                       end),
    {ok, {V1_gold, V1_rewards}};
unpack(srv, 9936, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 9936, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 9937, _B0) -> {ok, {}};
unpack(cli, 9937, _B0) ->
    {V1_golds, _B4} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_gold, _B2} =
                                                 protocol:uint16(_B1),
                                             {{V2_gold}, _B2}
                                     end),
    {ok, {V1_golds}};
unpack(srv, 9938, _B0) -> {ok, {}};
unpack(cli, 9938, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_time_return, _B2} = protocol:uint32(_B1),
    {V1_rewards, _B8} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_day, _B4} =
                                                   protocol:uint8(_B3),
                                               {V2_status, _B5} =
                                                   protocol:uint8(_B4),
                                               {V2_time, _B6} =
                                                   protocol:uint32(_B5),
                                               {{V2_day, V2_status, V2_time},
                                                _B6}
                                       end),
    {V1_reward_all, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_flag, V1_time_return, V1_rewards, V1_reward_all}};
unpack(srv, 9939, _B0) ->
    {V1_day, _B1} = protocol:uint8(_B0),
    {ok, {V1_day}};
unpack(cli, 9939, _B0) ->
    {V1_day, _B1} = protocol:uint8(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_day, V1_result, V1_msg}};
unpack(srv, 9940, _B0) -> {ok, {}};
unpack(cli, 9940, _B0) ->
    {V1_reward_id, _B1} = protocol:uint16(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_reward_id, V1_result, V1_msg}};
unpack(srv, 9941, _B0) -> {ok, {}};
unpack(cli, 9941, _B0) -> {ok, {}};
unpack(srv, 9942, _B0) ->
    {V1_day, _B1} = protocol:uint8(_B0),
    {ok, {V1_day}};
unpack(cli, 9942, _B0) ->
    {V1_day, _B1} = protocol:uint8(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_day, V1_result, V1_msg}};
unpack(srv, 9943, _B0) -> {ok, {}};
unpack(cli, 9943, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(srv, 9944, _B0) -> {ok, {}};
unpack(cli, 9944, _B0) ->
    {V1_pmd_list, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_msg, _B2} =
                                                    protocol:string(_B1),
                                                {V2_time, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_msg, V2_time}, _B3}
                                        end),
    {ok, {V1_pmd_list}};
unpack(srv, 9945, _B0) -> {ok, {}};
unpack(cli, 9945, _B0) -> {ok, {}};
unpack(srv, 9946, _B0) -> {ok, {}};
unpack(cli, 9946, _B0) ->
    {V1_list, _B33} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_start_time, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_end_time, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_desc1, _B5} =
                                                 protocol:string(_B4),
                                             {V2_desc2, _B6} =
                                                 protocol:string(_B5),
                                             {V2_title, _B7} =
                                                 protocol:string(_B6),
                                             {V2_item_list, _B31} =
                                                 protocol:array(_B7,
                                                                fun (_B8) ->
                                                                        {V3_gift_id,
                                                                         _B9} =
                                                                            protocol:uint32(_B8),
                                                                        {V3_group,
                                                                         _B10} =
                                                                            protocol:uint32(_B9),
                                                                        {V3_item_id,
                                                                         _B11} =
                                                                            protocol:uint32(_B10),
                                                                        {V3_bind,
                                                                         _B12} =
                                                                            protocol:uint32(_B11),
                                                                        {V3_num,
                                                                         _B13} =
                                                                            protocol:uint32(_B12),
                                                                        {V3_origin_price,
                                                                         _B18} =
                                                                            protocol:array(_B13,
                                                                                           fun
                                                                                               (_B14) ->
                                                                                                   {V4_item_id,
                                                                                                    _B15} =
                                                                                                       protocol:uint32(_B14),
                                                                                                   {V4_num,
                                                                                                    _B16} =
                                                                                                       protocol:uint32(_B15),
                                                                                                   {{V4_item_id,
                                                                                                     V4_num},
                                                                                                    _B16}
                                                                                           end),
                                                                        {V3_price,
                                                                         _B23} =
                                                                            protocol:array(_B18,
                                                                                           fun
                                                                                               (_B19) ->
                                                                                                   {V4_item_id,
                                                                                                    _B20} =
                                                                                                       protocol:uint32(_B19),
                                                                                                   {V4_num,
                                                                                                    _B21} =
                                                                                                       protocol:uint32(_B20),
                                                                                                   {{V4_item_id,
                                                                                                     V4_num},
                                                                                                    _B21}
                                                                                           end),
                                                                        {V3_min_lev,
                                                                         _B24} =
                                                                            protocol:uint32(_B23),
                                                                        {V3_max_lev,
                                                                         _B25} =
                                                                            protocol:uint32(_B24),
                                                                        {V3_sex,
                                                                         _B26} =
                                                                            protocol:uint32(_B25),
                                                                        {V3_classes,
                                                                         _B27} =
                                                                            protocol:uint32(_B26),
                                                                        {V3_min_lev_break,
                                                                         _B28} =
                                                                            protocol:uint32(_B27),
                                                                        {V3_max_lev_break,
                                                                         _B29} =
                                                                            protocol:uint32(_B28),
                                                                        {{V3_gift_id,
                                                                          V3_group,
                                                                          V3_item_id,
                                                                          V3_bind,
                                                                          V3_num,
                                                                          V3_origin_price,
                                                                          V3_price,
                                                                          V3_min_lev,
                                                                          V3_max_lev,
                                                                          V3_sex,
                                                                          V3_classes,
                                                                          V3_min_lev_break,
                                                                          V3_max_lev_break},
                                                                         _B29}
                                                                end),
                                             {{V2_id,
                                               V2_start_time,
                                               V2_end_time,
                                               V2_desc1,
                                               V2_desc2,
                                               V2_title,
                                               V2_item_list},
                                              _B31}
                                     end),
    {ok, {V1_list}};
unpack(srv, 9947, _B0) -> {ok, {}};
unpack(cli, 9947, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_gift_id, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_group, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_id, V2_gift_id, V2_group}, _B4}
                                    end),
    {ok, {V1_list}};
unpack(srv, 9948, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_gift_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_gift_id}};
unpack(cli, 9948, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 9949, _B0) -> {ok, {}};
unpack(cli, 9949, _B0) ->
    {V1_luck, _B1} = protocol:uint32(_B0),
    {ok, {V1_luck}};
unpack(srv, 9950, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {ok, {V1_num}};
unpack(cli, 9950, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_ids, _B5} = protocol:array(_B1,
                                   fun (_B2) ->
                                           {V2_id, _B3} = protocol:uint16(_B2),
                                           {{V2_id}, _B3}
                                   end),
    {V1_msg, _B6} = protocol:string(_B5),
    {ok, {V1_flag, V1_ids, V1_msg}};
unpack(srv, 9951, _B0) -> {ok, {}};
unpack(cli, 9951, _B0) ->
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
unpack(srv, 9952, _B0) ->
    {V1_gift_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_gift_id}};
unpack(cli, 9952, _B0) ->
    {V1_item_list, _B25} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_gift_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_item_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_bind, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_type, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_num, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_origin_price, _B11} =
                                                      protocol:array(_B6,
                                                                     fun
                                                                         (_B7) ->
                                                                             {V3_item_id,
                                                                              _B8} =
                                                                                 protocol:uint32(_B7),
                                                                             {V3_num,
                                                                              _B9} =
                                                                                 protocol:uint32(_B8),
                                                                             {{V3_item_id,
                                                                               V3_num},
                                                                              _B9}
                                                                     end),
                                                  {V2_price, _B16} =
                                                      protocol:array(_B11,
                                                                     fun
                                                                         (_B12) ->
                                                                             {V3_item_id,
                                                                              _B13} =
                                                                                 protocol:uint32(_B12),
                                                                             {V3_num,
                                                                              _B14} =
                                                                                 protocol:uint32(_B13),
                                                                             {{V3_item_id,
                                                                               V3_num},
                                                                              _B14}
                                                                     end),
                                                  {V2_min_lev, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_max_lev, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_sex, _B19} =
                                                      protocol:uint32(_B18),
                                                  {V2_classes, _B20} =
                                                      protocol:uint32(_B19),
                                                  {V2_min_lev_break, _B21} =
                                                      protocol:uint32(_B20),
                                                  {V2_max_lev_break, _B22} =
                                                      protocol:uint32(_B21),
                                                  {V2_desc, _B23} =
                                                      protocol:string(_B22),
                                                  {{V2_gift_id,
                                                    V2_item_id,
                                                    V2_bind,
                                                    V2_type,
                                                    V2_num,
                                                    V2_origin_price,
                                                    V2_price,
                                                    V2_min_lev,
                                                    V2_max_lev,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_min_lev_break,
                                                    V2_max_lev_break,
                                                    V2_desc},
                                                   _B23}
                                          end),
    {ok, {V1_item_list}};
unpack(srv, 9953, _B0) -> {ok, {}};
unpack(cli, 9953, _B0) ->
    {V1_label, _B1} = protocol:string(_B0),
    {ok, {V1_label}};
unpack(srv, 9954, _B0) -> {ok, {}};
unpack(cli, 9954, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 9955, _B0) -> {ok, {}};
unpack(cli, 9955, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 9956, _B0) -> {ok, {}};
unpack(cli, 9956, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_val, _B2} = protocol:int32(_B1),
    {V1_upper_limit_num, _B3} = protocol:int32(_B2),
    {ok, {V1_flag, V1_val, V1_upper_limit_num}};
unpack(srv, 9957, _B0) ->
    {V1_game_name, _B1} = protocol:string(_B0),
    {ok, {V1_game_name}};
unpack(cli, 9957, _B0) ->
    {V1_recharge_list, _B10} = protocol:array(_B0,
                                              fun (_B1) ->
                                                      {V2_tag, _B2} =
                                                          protocol:string(_B1),
                                                      {V2_level, _B3} =
                                                          protocol:uint32(_B2),
                                                      {V2_rmb, _B4} =
                                                          protocol:uint32(_B3),
                                                      {V2_gold, _B5} =
                                                          protocol:uint32(_B4),
                                                      {V2_tokes, _B6} =
                                                          protocol:uint32(_B5),
                                                      {V2_game_name, _B7} =
                                                          protocol:string(_B6),
                                                      {V2_show_state, _B8} =
                                                          protocol:uint8(_B7),
                                                      {{V2_tag,
                                                        V2_level,
                                                        V2_rmb,
                                                        V2_gold,
                                                        V2_tokes,
                                                        V2_game_name,
                                                        V2_show_state},
                                                       _B8}
                                              end),
    {ok, {V1_recharge_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

