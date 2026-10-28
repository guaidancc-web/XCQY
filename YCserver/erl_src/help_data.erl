-file("src/data/help_data.erl", 1).

-module(help_data).

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

-file("src/data/help_data.erl", 14).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/data/help_data.erl", 15).

-export([get/1]).

get(1) -> #help_data{id = 1, type = 1, fun_type = 1};
get(2) -> #help_data{id = 2, type = 1, fun_type = 2};
get(3) -> #help_data{id = 3, type = 1, fun_type = 3};
get(4) -> #help_data{id = 4, type = 1, fun_type = 4};
get(5) -> #help_data{id = 5, type = 2, fun_type = 4};
get(6) -> #help_data{id = 6, type = 2, fun_type = 5};
get(7) -> #help_data{id = 7, type = 2, fun_type = 5};
get(8) -> #help_data{id = 8, type = 2, fun_type = 5};
get(9) -> #help_data{id = 9, type = 2, fun_type = 5};
get(10) -> #help_data{id = 10, type = 2, fun_type = 5};
get(11) -> #help_data{id = 11, type = 2, fun_type = 5};
get(12) -> #help_data{id = 12, type = 2, fun_type = 5};
get(13) -> #help_data{id = 13, type = 2, fun_type = 5};
get(14) -> #help_data{id = 14, type = 1, fun_type = 5};
get(15) -> #help_data{id = 15, type = 1, fun_type = 5};
get(16) -> #help_data{id = 16, type = 1, fun_type = 5};
get(17) -> #help_data{id = 17, type = 1, fun_type = 5};
get(18) -> #help_data{id = 18, type = 1, fun_type = 5};
get(19) -> #help_data{id = 19, type = 1, fun_type = 5};
get(20) -> #help_data{id = 20, type = 1, fun_type = 5};
get(21) -> #help_data{id = 21, type = 1, fun_type = 5};
get(22) -> #help_data{id = 22, type = 1, fun_type = 6};
get(23) -> #help_data{id = 23, type = 1, fun_type = 7};
get(24) -> #help_data{id = 24, type = 1, fun_type = 8};
get(1000) ->
    #help_data{id = 1000, type = 1, fun_type = 9};
get(_Id) -> false.

