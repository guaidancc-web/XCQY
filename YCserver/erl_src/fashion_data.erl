-file("src/data/fashion_data.erl", 1).

-module(fashion_data).

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

-file("src/data/fashion_data.erl", 14).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/data/fashion_data.erl", 15).

-file("inc/fashion.hrl", 1).

-record(m_fashion,
        {ver = 5,
         head = [],
         clothes = [],
         belt = [],
         ring = [],
         head_dyeing = [],
         clothes_dyeing = [],
         head_ornament = [],
         collect_lev = 0,
         collect_val = 0,
         classes_eqm = 0,
         eqm = []}).

-record(fashion_dress_data,
        {base_id = 0,
         name = "",
         type,
         quality = 0,
         classes = 0,
         sex = 2,
         lev,
         set_id = 0,
         texture_id = 0,
         is_origin = 0,
         loss = [],
         attrs = [],
         score = 0,
         can_use = 0,
         model_id = 0}).

-record(fashion_wear_data,
        {id = 0,
         base_id = 0,
         expire_type = 0,
         expire_time = 0}).

-record(fashion_dress,
        {base_id = 0,
         expire_type = 0,
         expire_time = 0,
         is_wear = 0}).

-record(fashion_dyeing, {dyeing_id = 0, is_use = 0}).

-record(fashion_time_data,
        {id = 0, expire_type = 0, expire_time = 0}).

-file("src/data/fashion_data.erl", 16).

-export([get_dress/1,
         get_time/1,
         get_dyeing/1,
         get_compensate/1,
         get_ornament_price/1,
         get_dress_collect_val/1,
         get_dyeing_collect_val/1,
         get_collect/1,
         get_fashion_class_modify/1,
         get_fashion_forever_time/1]).

get_dress(50001) ->
    #fashion_dress_data{base_id = 50001, type = 2,
                        quality = 0, classes = 1, sex = 1, lev = 1,
                        model_id = 50001, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50002) ->
    #fashion_dress_data{base_id = 50002, type = 2,
                        quality = 0, classes = 1, sex = 0, lev = 1,
                        model_id = 50002, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50003) ->
    #fashion_dress_data{base_id = 50003, type = 2,
                        quality = 0, classes = 2, sex = 1, lev = 1,
                        model_id = 50003, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50004) ->
    #fashion_dress_data{base_id = 50004, type = 2,
                        quality = 0, classes = 2, sex = 0, lev = 1,
                        model_id = 50004, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50005) ->
    #fashion_dress_data{base_id = 50005, type = 2,
                        quality = 0, classes = 3, sex = 1, lev = 1,
                        model_id = 50005, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50006) ->
    #fashion_dress_data{base_id = 50006, type = 2,
                        quality = 0, classes = 3, sex = 0, lev = 1,
                        model_id = 50006, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50007) ->
    #fashion_dress_data{base_id = 50007, type = 2,
                        quality = 0, classes = 4, sex = 1, lev = 1,
                        model_id = 50007, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50008) ->
    #fashion_dress_data{base_id = 50008, type = 2,
                        quality = 0, classes = 4, sex = 0, lev = 1,
                        model_id = 50008, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50009) ->
    #fashion_dress_data{base_id = 50009, type = 2,
                        quality = 0, classes = 5, sex = 1, lev = 1,
                        model_id = 50009, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50010) ->
    #fashion_dress_data{base_id = 50010, type = 2,
                        quality = 0, classes = 5, sex = 0, lev = 1,
                        model_id = 50010, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50071) ->
    #fashion_dress_data{base_id = 50071, type = 2,
                        quality = 0, classes = 6, sex = 1, lev = 1,
                        model_id = 50071, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50070) ->
    #fashion_dress_data{base_id = 50070, type = 2,
                        quality = 0, classes = 6, sex = 0, lev = 1,
                        model_id = 50070, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50038) ->
    #fashion_dress_data{base_id = 50038, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51038, model_id = 50038, texture_id = 50038,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29294, 1}]}],
                        can_use = 1};
get_dress(50039) ->
    #fashion_dress_data{base_id = 50039, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51039, model_id = 50039, texture_id = 50039,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29295, 1}]}],
                        can_use = 1};
get_dress(50040) ->
    #fashion_dress_data{base_id = 50040, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51040, model_id = 50040, texture_id = 50040,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29296, 1}]}],
                        can_use = 1};
get_dress(50041) ->
    #fashion_dress_data{base_id = 50041, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51041, model_id = 50041, texture_id = 50041,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29297, 1}]}],
                        can_use = 1};
get_dress(50042) ->
    #fashion_dress_data{base_id = 50042, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 50042, texture_id = 50042, is_origin = 0,
                        loss = [], can_use = 1};
get_dress(50043) ->
    #fashion_dress_data{base_id = 50043, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 50043, texture_id = 50043, is_origin = 0,
                        loss = [], can_use = 1};
get_dress(50046) ->
    #fashion_dress_data{base_id = 50046, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51046, model_id = 50046, texture_id = 50046,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29139, 1}]}],
                        can_use = 1};
get_dress(50047) ->
    #fashion_dress_data{base_id = 50047, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51047, model_id = 50047, texture_id = 50047,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29139, 1}]}],
                        can_use = 1};
get_dress(50048) ->
    #fashion_dress_data{base_id = 50048, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51048, model_id = 50048, texture_id = 50048,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29148, 1}]}],
                        can_use = 1};
get_dress(50049) ->
    #fashion_dress_data{base_id = 50049, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51049, model_id = 50049, texture_id = 50049,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29149, 1}]}],
                        can_use = 1};
get_dress(50052) ->
    #fashion_dress_data{base_id = 50052, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51052, model_id = 50052, texture_id = 50052,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29487, 1}]}],
                        can_use = 1};
get_dress(50053) ->
    #fashion_dress_data{base_id = 50053, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51053, model_id = 50053, texture_id = 50053,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29488, 1}]}],
                        can_use = 1};
get_dress(50054) ->
    #fashion_dress_data{base_id = 50054, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51054, model_id = 50054, texture_id = 50054,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29483, 1}]}],
                        can_use = 1};
get_dress(50055) ->
    #fashion_dress_data{base_id = 50055, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51055, model_id = 50055, texture_id = 50055,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29484, 1}]}],
                        can_use = 1};
get_dress(50056) ->
    #fashion_dress_data{base_id = 50056, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51056, model_id = 50056, texture_id = 50056,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29485, 1}]}],
                        can_use = 1};
get_dress(50057) ->
    #fashion_dress_data{base_id = 50057, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51057, model_id = 50057, texture_id = 50057,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29486, 1}]}],
                        can_use = 1};
get_dress(50058) ->
    #fashion_dress_data{base_id = 50058, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51058, model_id = 50058, texture_id = 50058,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29482, 1}]}],
                        can_use = 1};
get_dress(50059) ->
    #fashion_dress_data{base_id = 50059, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51059, model_id = 50059, texture_id = 50059,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29481, 1}]}],
                        can_use = 1};
get_dress(50060) ->
    #fashion_dress_data{base_id = 50060, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51060, model_id = 50060, texture_id = 50060,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29479, 1}]}],
                        can_use = 1};
get_dress(50061) ->
    #fashion_dress_data{base_id = 50061, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51061, model_id = 50061, texture_id = 50061,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29480, 1}]}],
                        can_use = 1};
get_dress(50062) ->
    #fashion_dress_data{base_id = 50062, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51062, model_id = 50062, texture_id = 50062,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29352, 1}]}],
                        can_use = 1};
get_dress(50063) ->
    #fashion_dress_data{base_id = 50063, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51063, model_id = 50063, texture_id = 50063,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29353, 1}]}],
                        can_use = 1};
get_dress(50064) ->
    #fashion_dress_data{base_id = 50064, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51064, model_id = 50064, texture_id = 50064,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29357, 1}]}],
                        can_use = 1};
get_dress(50065) ->
    #fashion_dress_data{base_id = 50065, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51065, model_id = 50065, texture_id = 50065,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29358, 1}]}],
                        can_use = 1};
get_dress(50066) ->
    #fashion_dress_data{base_id = 50066, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51066, model_id = 50066, texture_id = 50066,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29367, 1}]}],
                        can_use = 1};
get_dress(50067) ->
    #fashion_dress_data{base_id = 50067, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51067, model_id = 50067, texture_id = 50067,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29368, 1}]}],
                        can_use = 1};
get_dress(50068) ->
    #fashion_dress_data{base_id = 50068, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51068, model_id = 50068, texture_id = 50068,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29367, 1}]}],
                        can_use = 1};
get_dress(50069) ->
    #fashion_dress_data{base_id = 50069, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51069, model_id = 50069, texture_id = 50069,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29368, 1}]}],
                        can_use = 1};
get_dress(50072) ->
    #fashion_dress_data{base_id = 50072, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51072, model_id = 50072, texture_id = 50072,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29399, 1}]}],
                        can_use = 1};
get_dress(50073) ->
    #fashion_dress_data{base_id = 50073, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51073, model_id = 50073, texture_id = 50073,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29400, 1}]}],
                        can_use = 1};
get_dress(50076) ->
    #fashion_dress_data{base_id = 50076, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51076, model_id = 50076, texture_id = 50076,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29433, 1}]}],
                        can_use = 1};
get_dress(50077) ->
    #fashion_dress_data{base_id = 50077, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51077, model_id = 50077, texture_id = 50077,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29434, 1}]}],
                        can_use = 1};
get_dress(50078) ->
    #fashion_dress_data{base_id = 50078, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51078, model_id = 50078, texture_id = 50078,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29443, 1}]}],
                        can_use = 1};
get_dress(50079) ->
    #fashion_dress_data{base_id = 50079, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51079, model_id = 50079, texture_id = 50079,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29444, 1}]}],
                        can_use = 1};
get_dress(50074) ->
    #fashion_dress_data{base_id = 50074, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51074, model_id = 50074, texture_id = 50074,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29448, 1}]}],
                        can_use = 1};
get_dress(50075) ->
    #fashion_dress_data{base_id = 50075, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51075, model_id = 50075, texture_id = 50075,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29449, 1}]}],
                        can_use = 1};
get_dress(50080) ->
    #fashion_dress_data{base_id = 50080, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51080, model_id = 50080, texture_id = 50080,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29457, 1}]}],
                        can_use = 1};
get_dress(50081) ->
    #fashion_dress_data{base_id = 50081, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51081, model_id = 50081, texture_id = 50081,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29458, 1}]}],
                        can_use = 1};
get_dress(50082) ->
    #fashion_dress_data{base_id = 50082, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51082, model_id = 50082, texture_id = 50082,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29466, 1}]}],
                        can_use = 1};
get_dress(50083) ->
    #fashion_dress_data{base_id = 50083, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51083, model_id = 50083, texture_id = 50083,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29467, 1}]}],
                        can_use = 1};
get_dress(50084) ->
    #fashion_dress_data{base_id = 50084, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51084, model_id = 50084, texture_id = 50084,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29489, 1}]}],
                        can_use = 1};
get_dress(50085) ->
    #fashion_dress_data{base_id = 50085, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51085, model_id = 50085, texture_id = 50085,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29490, 1}]}],
                        can_use = 1};
get_dress(50086) ->
    #fashion_dress_data{base_id = 50086, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51086, model_id = 50086, texture_id = 50086,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29518, 1}]}],
                        can_use = 1};
get_dress(50087) ->
    #fashion_dress_data{base_id = 50087, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51087, model_id = 50087, texture_id = 50087,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29519, 1}]}],
                        can_use = 1};
get_dress(50088) ->
    #fashion_dress_data{base_id = 50088, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51088, model_id = 50088, texture_id = 50088,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29540, 1}]}],
                        can_use = 1};
get_dress(50089) ->
    #fashion_dress_data{base_id = 50089, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51089, model_id = 50089, texture_id = 50089,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29541, 1}]}],
                        can_use = 1};
get_dress(50090) ->
    #fashion_dress_data{base_id = 50090, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51090, model_id = 50090, texture_id = 50090,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29540, 1}]}],
                        can_use = 1};
get_dress(50091) ->
    #fashion_dress_data{base_id = 50091, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51091, model_id = 50091, texture_id = 50091,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29541, 1}]}],
                        can_use = 1};
get_dress(50092) ->
    #fashion_dress_data{base_id = 50092, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51092, model_id = 50092, texture_id = 50092,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29558, 1}]}],
                        can_use = 1};
get_dress(50093) ->
    #fashion_dress_data{base_id = 50093, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51093, model_id = 50093, texture_id = 50093,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29559, 1}]}],
                        can_use = 1};
get_dress(50096) ->
    #fashion_dress_data{base_id = 50096, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51096, model_id = 50096, texture_id = 50096,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29552, 1}]}],
                        can_use = 1};
get_dress(50097) ->
    #fashion_dress_data{base_id = 50097, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51097, model_id = 50097, texture_id = 50097,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29553, 1}]}],
                        can_use = 1};
get_dress(50098) ->
    #fashion_dress_data{base_id = 50098, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51098, model_id = 50098, texture_id = 50098,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29577, 1}]}],
                        can_use = 1};
get_dress(50099) ->
    #fashion_dress_data{base_id = 50099, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51099, model_id = 50099, texture_id = 50099,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29578, 1}]}],
                        can_use = 1};
get_dress(50100) ->
    #fashion_dress_data{base_id = 50100, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51100, model_id = 50100, texture_id = 50100,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29590, 1}]}],
                        can_use = 1};
get_dress(50101) ->
    #fashion_dress_data{base_id = 50101, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51101, model_id = 50101, texture_id = 50101,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29591, 1}]}],
                        can_use = 1};
get_dress(50104) ->
    #fashion_dress_data{base_id = 50104, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51104, model_id = 50104, texture_id = 50104,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29652, 1}]}],
                        can_use = 1};
get_dress(50105) ->
    #fashion_dress_data{base_id = 50105, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51105, model_id = 50105, texture_id = 50105,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29653, 1}]}],
                        can_use = 1};
get_dress(50102) ->
    #fashion_dress_data{base_id = 50102, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51102, model_id = 50102, texture_id = 50102,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29664, 1}]}],
                        can_use = 1};
get_dress(50103) ->
    #fashion_dress_data{base_id = 50103, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51103, model_id = 50103, texture_id = 50103,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29665, 1}]}],
                        can_use = 1};
get_dress(50106) ->
    #fashion_dress_data{base_id = 50106, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51106, model_id = 50106, texture_id = 50106,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29676, 1}]}],
                        can_use = 1};
get_dress(50107) ->
    #fashion_dress_data{base_id = 50107, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51107, model_id = 50107, texture_id = 50107,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29677, 1}]}],
                        can_use = 1};
get_dress(50112) ->
    #fashion_dress_data{base_id = 50112, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51112, model_id = 50112, texture_id = 50112,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29681, 1}]}],
                        can_use = 1};
get_dress(50113) ->
    #fashion_dress_data{base_id = 50113, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51113, model_id = 50113, texture_id = 50113,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29684, 1}]}],
                        can_use = 1};
get_dress(50013) ->
    #fashion_dress_data{base_id = 50013, type = 2,
                        quality = 0, classes = 7, sex = 1, lev = 1,
                        model_id = 50013, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50012) ->
    #fashion_dress_data{base_id = 50012, type = 2,
                        quality = 0, classes = 7, sex = 0, lev = 1,
                        model_id = 50012, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(50110) ->
    #fashion_dress_data{base_id = 50110, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51110, model_id = 50110, texture_id = 50110,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29698, 1}]}],
                        can_use = 1};
get_dress(50111) ->
    #fashion_dress_data{base_id = 50111, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51111, model_id = 50111, texture_id = 50111,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29800, 1}]}],
                        can_use = 1};
get_dress(50114) ->
    #fashion_dress_data{base_id = 50114, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 50114, model_id = 50114, texture_id = 50114,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29825, 1}]}],
                        can_use = 1};
get_dress(50115) ->
    #fashion_dress_data{base_id = 50115, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 50115, model_id = 50115, texture_id = 50115,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29828, 1}]}],
                        can_use = 1};
get_dress(50094) ->
    #fashion_dress_data{base_id = 50094, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51094, model_id = 50094, texture_id = 50094,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29857, 1}]}],
                        can_use = 1};
get_dress(50095) ->
    #fashion_dress_data{base_id = 50095, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51095, model_id = 50095, texture_id = 50095,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29860, 1}]}],
                        can_use = 1};
get_dress(50116) ->
    #fashion_dress_data{base_id = 50116, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51116, model_id = 50116, texture_id = 50116,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29902, 1}]}],
                        can_use = 1};
get_dress(50117) ->
    #fashion_dress_data{base_id = 50117, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51117, model_id = 50117, texture_id = 50117,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29905, 1}]}],
                        can_use = 1};
get_dress(50118) ->
    #fashion_dress_data{base_id = 50118, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51118, model_id = 50118, texture_id = 50118,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{26003, 1}]}],
                        can_use = 1};
get_dress(50119) ->
    #fashion_dress_data{base_id = 50119, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51119, model_id = 50119, texture_id = 50119,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{26006, 1}]}],
                        can_use = 1};
get_dress(50120) ->
    #fashion_dress_data{base_id = 50120, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51120, model_id = 50120, texture_id = 50120,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29994, 1}]}],
                        can_use = 1};
get_dress(50121) ->
    #fashion_dress_data{base_id = 50121, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51121, model_id = 50121, texture_id = 50121,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29997, 1}]}],
                        can_use = 1};
get_dress(50122) ->
    #fashion_dress_data{base_id = 50122, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51122, model_id = 50122, texture_id = 50122,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70049, 1}]}],
                        can_use = 1};
get_dress(50123) ->
    #fashion_dress_data{base_id = 50123, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51123, model_id = 50123, texture_id = 50123,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70051, 1}]}],
                        can_use = 1};
get_dress(50124) ->
    #fashion_dress_data{base_id = 50124, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51124, model_id = 50124, texture_id = 50124,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70095, 1}]}],
                        can_use = 1};
get_dress(50125) ->
    #fashion_dress_data{base_id = 50125, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51125, model_id = 50125, texture_id = 50125,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70098, 1}]}],
                        can_use = 1};
get_dress(50126) ->
    #fashion_dress_data{base_id = 50126, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51126, model_id = 50126, texture_id = 50126,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70248, 1}]}],
                        can_use = 1};
get_dress(50127) ->
    #fashion_dress_data{base_id = 50127, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51127, model_id = 50127, texture_id = 50127,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70251, 1}]}],
                        can_use = 1};
get_dress(50128) ->
    #fashion_dress_data{base_id = 50128, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51128, model_id = 50128, texture_id = 50128,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70293, 1}]}],
                        can_use = 1};
get_dress(50129) ->
    #fashion_dress_data{base_id = 50129, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51129, model_id = 50129, texture_id = 50129,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70297, 1}]}],
                        can_use = 1};
get_dress(50130) ->
    #fashion_dress_data{base_id = 50130, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51130, model_id = 50130, texture_id = 50130,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70334, 1}]}],
                        can_use = 1};
get_dress(50131) ->
    #fashion_dress_data{base_id = 50131, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51131, model_id = 50131, texture_id = 50131,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70338, 1}]}],
                        can_use = 1};
get_dress(50132) ->
    #fashion_dress_data{base_id = 50132, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51132, model_id = 50132, texture_id = 50132,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70422, 1}]}],
                        can_use = 1};
get_dress(50133) ->
    #fashion_dress_data{base_id = 50133, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51133, model_id = 50133, texture_id = 50133,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70426, 1}]}],
                        can_use = 1};
get_dress(50134) ->
    #fashion_dress_data{base_id = 50134, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51134, model_id = 50134, texture_id = 50134,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70459, 1}]}],
                        can_use = 1};
get_dress(50135) ->
    #fashion_dress_data{base_id = 50135, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51135, model_id = 50135, texture_id = 50135,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70463, 1}]}],
                        can_use = 1};
get_dress(50136) ->
    #fashion_dress_data{base_id = 50136, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51136, model_id = 50136, texture_id = 50136,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70516, 1}]}],
                        can_use = 1};
get_dress(50137) ->
    #fashion_dress_data{base_id = 50137, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51137, model_id = 50137, texture_id = 50137,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70520, 1}]}],
                        can_use = 1};
get_dress(50138) ->
    #fashion_dress_data{base_id = 50138, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51138, model_id = 50138, texture_id = 50138,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70588, 1}]}],
                        can_use = 1};
get_dress(50139) ->
    #fashion_dress_data{base_id = 50139, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51139, model_id = 50139, texture_id = 50139,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70592, 1}]}],
                        can_use = 1};
get_dress(50140) ->
    #fashion_dress_data{base_id = 50140, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51140, model_id = 50140, texture_id = 50140,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70656, 1}]}],
                        can_use = 1};
get_dress(50141) ->
    #fashion_dress_data{base_id = 50141, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51141, model_id = 50141, texture_id = 50141,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70660, 1}]}],
                        can_use = 1};
get_dress(50142) ->
    #fashion_dress_data{base_id = 50142, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51142, model_id = 50142, texture_id = 50142,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70718, 1}]}],
                        can_use = 1};
get_dress(50143) ->
    #fashion_dress_data{base_id = 50143, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51143, model_id = 50143, texture_id = 50143,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70722, 1}]}],
                        can_use = 1};
get_dress(50144) ->
    #fashion_dress_data{base_id = 50144, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51144, model_id = 50144, texture_id = 50144,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70758, 1}]}],
                        can_use = 1};
get_dress(50145) ->
    #fashion_dress_data{base_id = 50145, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51145, model_id = 50145, texture_id = 50145,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70762, 1}]}],
                        can_use = 1};
get_dress(50146) ->
    #fashion_dress_data{base_id = 50146, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51146, model_id = 50146, texture_id = 50146,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70832, 1}]}],
                        can_use = 1};
get_dress(50147) ->
    #fashion_dress_data{base_id = 50147, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51147, model_id = 50147, texture_id = 50147,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70836, 1}]}],
                        can_use = 1};
get_dress(50148) ->
    #fashion_dress_data{base_id = 50148, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51148, model_id = 50148, texture_id = 50148,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70902, 1}]}],
                        can_use = 1};
get_dress(50149) ->
    #fashion_dress_data{base_id = 50149, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51149, model_id = 50149, texture_id = 50149,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70906, 1}]}],
                        can_use = 1};
get_dress(50150) ->
    #fashion_dress_data{base_id = 50150, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51150, model_id = 50150, texture_id = 50150,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70963, 1}]}],
                        can_use = 1};
get_dress(50151) ->
    #fashion_dress_data{base_id = 50151, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51151, model_id = 50151, texture_id = 50151,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70967, 1}]}],
                        can_use = 1};
get_dress(50152) ->
    #fashion_dress_data{base_id = 50152, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51152, model_id = 50152, texture_id = 50152,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71033, 1}]}],
                        can_use = 1};
get_dress(50153) ->
    #fashion_dress_data{base_id = 50153, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51153, model_id = 50153, texture_id = 50153,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71037, 1}]}],
                        can_use = 1};
get_dress(50154) ->
    #fashion_dress_data{base_id = 50154, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51154, model_id = 50154, texture_id = 50154,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71105, 1}]}],
                        can_use = 1};
get_dress(50155) ->
    #fashion_dress_data{base_id = 50155, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51155, model_id = 50155, texture_id = 50155,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71109, 1}]}],
                        can_use = 1};
get_dress(50156) ->
    #fashion_dress_data{base_id = 50156, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51156, model_id = 50156, texture_id = 50156,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71171, 1}]}],
                        can_use = 1};
get_dress(50157) ->
    #fashion_dress_data{base_id = 50157, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51157, model_id = 50157, texture_id = 50157,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71175, 1}]}],
                        can_use = 1};
get_dress(50158) ->
    #fashion_dress_data{base_id = 50158, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51158, model_id = 50158, texture_id = 50158,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71209, 1}]}],
                        can_use = 1};
get_dress(50159) ->
    #fashion_dress_data{base_id = 50159, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51159, model_id = 50159, texture_id = 50159,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71213, 1}]}],
                        can_use = 1};
get_dress(50160) ->
    #fashion_dress_data{base_id = 50160, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51160, model_id = 50160, texture_id = 50160,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71291, 1}]}],
                        can_use = 1};
get_dress(50161) ->
    #fashion_dress_data{base_id = 50161, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51161, model_id = 50161, texture_id = 50161,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71295, 1}]}],
                        can_use = 1};
get_dress(50162) ->
    #fashion_dress_data{base_id = 50162, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51162, model_id = 50162, texture_id = 50162,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71348, 1}]}],
                        can_use = 1};
get_dress(50163) ->
    #fashion_dress_data{base_id = 50163, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51163, model_id = 50163, texture_id = 50163,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71352, 1}]}],
                        can_use = 1};
get_dress(50164) ->
    #fashion_dress_data{base_id = 50164, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51164, model_id = 50164, texture_id = 50164,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71422, 1}]}],
                        can_use = 1};
get_dress(50165) ->
    #fashion_dress_data{base_id = 50165, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51165, model_id = 50165, texture_id = 50165,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71426, 1}]}],
                        can_use = 1};
get_dress(50166) ->
    #fashion_dress_data{base_id = 50166, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51166, model_id = 50166, texture_id = 50166,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71474, 1}]}],
                        can_use = 1};
get_dress(50167) ->
    #fashion_dress_data{base_id = 50167, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51167, model_id = 50167, texture_id = 50167,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71478, 1}]}],
                        can_use = 1};
get_dress(50168) ->
    #fashion_dress_data{base_id = 50168, type = 2,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51168, model_id = 50168, texture_id = 50168,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71549, 1}]}],
                        can_use = 1};
get_dress(50169) ->
    #fashion_dress_data{base_id = 50169, type = 2,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51169, model_id = 50169, texture_id = 50169,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71553, 1}]}],
                        can_use = 1};
get_dress(51001) ->
    #fashion_dress_data{base_id = 51001, type = 3,
                        quality = 0, classes = 1, sex = 1, lev = 1,
                        model_id = 51001, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51002) ->
    #fashion_dress_data{base_id = 51002, type = 3,
                        quality = 0, classes = 1, sex = 0, lev = 1,
                        model_id = 51002, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51003) ->
    #fashion_dress_data{base_id = 51003, type = 3,
                        quality = 0, classes = 2, sex = 1, lev = 1,
                        model_id = 51003, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51004) ->
    #fashion_dress_data{base_id = 51004, type = 3,
                        quality = 0, classes = 2, sex = 0, lev = 1,
                        model_id = 51004, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51005) ->
    #fashion_dress_data{base_id = 51005, type = 3,
                        quality = 0, classes = 3, sex = 1, lev = 1,
                        model_id = 51005, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51006) ->
    #fashion_dress_data{base_id = 51006, type = 3,
                        quality = 0, classes = 3, sex = 0, lev = 1,
                        model_id = 51006, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51007) ->
    #fashion_dress_data{base_id = 51007, type = 3,
                        quality = 0, classes = 4, sex = 1, lev = 1,
                        model_id = 51007, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51008) ->
    #fashion_dress_data{base_id = 51008, type = 3,
                        quality = 0, classes = 4, sex = 0, lev = 1,
                        model_id = 51008, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51009) ->
    #fashion_dress_data{base_id = 51009, type = 3,
                        quality = 0, classes = 5, sex = 1, lev = 1,
                        model_id = 51009, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51010) ->
    #fashion_dress_data{base_id = 51010, type = 3,
                        quality = 0, classes = 5, sex = 0, lev = 1,
                        model_id = 51010, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51071) ->
    #fashion_dress_data{base_id = 51071, type = 3,
                        quality = 0, classes = 6, sex = 1, lev = 1,
                        model_id = 51071, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51070) ->
    #fashion_dress_data{base_id = 51070, type = 3,
                        quality = 0, classes = 6, sex = 0, lev = 1,
                        model_id = 51070, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51038) ->
    #fashion_dress_data{base_id = 51038, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51038, model_id = 51038, texture_id = 51038,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29294, 1}]}],
                        can_use = 1};
get_dress(51039) ->
    #fashion_dress_data{base_id = 51039, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51039, model_id = 51039, texture_id = 51039,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29295, 1}]}],
                        can_use = 1};
get_dress(51040) ->
    #fashion_dress_data{base_id = 51040, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51040, model_id = 51040, texture_id = 51040,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29296, 1}]}],
                        can_use = 1};
get_dress(51041) ->
    #fashion_dress_data{base_id = 51041, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51041, model_id = 51041, texture_id = 51041,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29297, 1}]}],
                        can_use = 1};
get_dress(51042) ->
    #fashion_dress_data{base_id = 51042, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 51042, texture_id = 51042, is_origin = 0,
                        loss = [], can_use = 1};
get_dress(51043) ->
    #fashion_dress_data{base_id = 51043, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 51043, texture_id = 51043, is_origin = 0,
                        loss = [], can_use = 1};
get_dress(51046) ->
    #fashion_dress_data{base_id = 51046, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51046, model_id = 51046, texture_id = 51046,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29139, 1}]}],
                        can_use = 1};
get_dress(51047) ->
    #fashion_dress_data{base_id = 51047, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51047, model_id = 51047, texture_id = 51047,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29139, 1}]}],
                        can_use = 1};
get_dress(51048) ->
    #fashion_dress_data{base_id = 51048, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51048, model_id = 51048, texture_id = 51048,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29148, 1}]}],
                        can_use = 1};
get_dress(51049) ->
    #fashion_dress_data{base_id = 51049, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51049, model_id = 51049, texture_id = 51049,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29149, 1}]}],
                        can_use = 1};
get_dress(51052) ->
    #fashion_dress_data{base_id = 51052, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51052, model_id = 51052, texture_id = 51052,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29487, 1}]}],
                        can_use = 1};
get_dress(51053) ->
    #fashion_dress_data{base_id = 51053, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51053, model_id = 51053, texture_id = 51053,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29488, 1}]}],
                        can_use = 1};
get_dress(51054) ->
    #fashion_dress_data{base_id = 51054, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51054, model_id = 51054, texture_id = 51054,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29483, 1}]}],
                        can_use = 1};
get_dress(51055) ->
    #fashion_dress_data{base_id = 51055, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51055, model_id = 51055, texture_id = 51055,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29484, 1}]}],
                        can_use = 1};
get_dress(51056) ->
    #fashion_dress_data{base_id = 51056, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51056, model_id = 51056, texture_id = 51056,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29485, 1}]}],
                        can_use = 1};
get_dress(51057) ->
    #fashion_dress_data{base_id = 51057, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51057, model_id = 51057, texture_id = 51057,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29486, 1}]}],
                        can_use = 1};
get_dress(51058) ->
    #fashion_dress_data{base_id = 51058, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51058, model_id = 51058, texture_id = 51058,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29482, 1}]}],
                        can_use = 1};
get_dress(51059) ->
    #fashion_dress_data{base_id = 51059, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51059, model_id = 51059, texture_id = 51059,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29481, 1}]}],
                        can_use = 1};
get_dress(51060) ->
    #fashion_dress_data{base_id = 51060, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51060, model_id = 51060, texture_id = 51060,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29479, 1}]}],
                        can_use = 1};
get_dress(51061) ->
    #fashion_dress_data{base_id = 51061, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51061, model_id = 51061, texture_id = 51061,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29480, 1}]}],
                        can_use = 1};
get_dress(51062) ->
    #fashion_dress_data{base_id = 51062, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51062, model_id = 51062, texture_id = 51062,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29352, 1}]}],
                        can_use = 1};
get_dress(51063) ->
    #fashion_dress_data{base_id = 51063, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51063, model_id = 51063, texture_id = 51063,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29353, 1}]}],
                        can_use = 1};
get_dress(51064) ->
    #fashion_dress_data{base_id = 51064, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51064, model_id = 51064, texture_id = 51064,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29357, 1}]}],
                        can_use = 1};
get_dress(51065) ->
    #fashion_dress_data{base_id = 51065, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51065, model_id = 51065, texture_id = 51065,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29358, 1}]}],
                        can_use = 1};
get_dress(51066) ->
    #fashion_dress_data{base_id = 51066, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51066, model_id = 51066, texture_id = 51066,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29367, 1}]}],
                        can_use = 1};
get_dress(51067) ->
    #fashion_dress_data{base_id = 51067, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51067, model_id = 51067, texture_id = 51067,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29368, 1}]}],
                        can_use = 1};
get_dress(51068) ->
    #fashion_dress_data{base_id = 51068, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51068, model_id = 51068, texture_id = 51068,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29381, 1}]}],
                        can_use = 1};
get_dress(51069) ->
    #fashion_dress_data{base_id = 51069, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51069, model_id = 51069, texture_id = 51069,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29382, 1}]}],
                        can_use = 1};
get_dress(51072) ->
    #fashion_dress_data{base_id = 51072, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51072, model_id = 51072, texture_id = 51072,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29399, 1}]}],
                        can_use = 1};
get_dress(51073) ->
    #fashion_dress_data{base_id = 51073, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51073, model_id = 51073, texture_id = 51073,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29400, 1}]}],
                        can_use = 1};
get_dress(51076) ->
    #fashion_dress_data{base_id = 51076, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51076, model_id = 51076, texture_id = 51076,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29433, 1}]}],
                        can_use = 1};
get_dress(51077) ->
    #fashion_dress_data{base_id = 51077, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51077, model_id = 51077, texture_id = 51077,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29434, 1}]}],
                        can_use = 1};
get_dress(51078) ->
    #fashion_dress_data{base_id = 51078, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51078, model_id = 51078, texture_id = 51078,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29443, 1}]}],
                        can_use = 1};
get_dress(51079) ->
    #fashion_dress_data{base_id = 51079, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51079, model_id = 51079, texture_id = 51079,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29444, 1}]}],
                        can_use = 1};
get_dress(51074) ->
    #fashion_dress_data{base_id = 51074, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51074, model_id = 51074, texture_id = 51074,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29448, 1}]}],
                        can_use = 1};
get_dress(51075) ->
    #fashion_dress_data{base_id = 51075, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51075, model_id = 51075, texture_id = 51075,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29449, 1}]}],
                        can_use = 1};
get_dress(51080) ->
    #fashion_dress_data{base_id = 51080, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51080, model_id = 51080, texture_id = 51080,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29457, 1}]}],
                        can_use = 1};
get_dress(51081) ->
    #fashion_dress_data{base_id = 51081, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51081, model_id = 51081, texture_id = 51081,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29458, 1}]}],
                        can_use = 1};
get_dress(51082) ->
    #fashion_dress_data{base_id = 51082, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51082, model_id = 51082, texture_id = 51082,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29466, 1}]}],
                        can_use = 1};
get_dress(51083) ->
    #fashion_dress_data{base_id = 51083, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51083, model_id = 51083, texture_id = 51083,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29467, 1}]}],
                        can_use = 1};
get_dress(51084) ->
    #fashion_dress_data{base_id = 51084, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51084, model_id = 51084, texture_id = 51084,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29489, 1}]}],
                        can_use = 1};
get_dress(51085) ->
    #fashion_dress_data{base_id = 51085, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51085, model_id = 51085, texture_id = 51085,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29490, 1}]}],
                        can_use = 1};
get_dress(51086) ->
    #fashion_dress_data{base_id = 51086, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51086, model_id = 51086, texture_id = 51086,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29518, 1}]}],
                        can_use = 1};
get_dress(51087) ->
    #fashion_dress_data{base_id = 51087, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51087, model_id = 51087, texture_id = 51087,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29519, 1}]}],
                        can_use = 1};
get_dress(51088) ->
    #fashion_dress_data{base_id = 51088, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51088, model_id = 51088, texture_id = 51088,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29540, 1}]}],
                        can_use = 1};
get_dress(51089) ->
    #fashion_dress_data{base_id = 51089, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51089, model_id = 51089, texture_id = 51089,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29541, 1}]}],
                        can_use = 1};
get_dress(51090) ->
    #fashion_dress_data{base_id = 51090, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51090, model_id = 51090, texture_id = 51090,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29544, 1}]}],
                        can_use = 1};
get_dress(51091) ->
    #fashion_dress_data{base_id = 51091, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51091, model_id = 51091, texture_id = 51091,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29545, 1}]}],
                        can_use = 1};
get_dress(51092) ->
    #fashion_dress_data{base_id = 51092, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51092, model_id = 51092, texture_id = 51092,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29558, 1}]}],
                        can_use = 1};
get_dress(51093) ->
    #fashion_dress_data{base_id = 51093, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51093, model_id = 51093, texture_id = 51093,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29559, 1}]}],
                        can_use = 1};
get_dress(51096) ->
    #fashion_dress_data{base_id = 51096, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51096, model_id = 51096, texture_id = 51096,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29552, 1}]}],
                        can_use = 1};
get_dress(51097) ->
    #fashion_dress_data{base_id = 51097, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51097, model_id = 51097, texture_id = 51097,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29553, 1}]}],
                        can_use = 1};
get_dress(51098) ->
    #fashion_dress_data{base_id = 51098, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51098, model_id = 51098, texture_id = 51098,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29577, 1}]}],
                        can_use = 1};
get_dress(51099) ->
    #fashion_dress_data{base_id = 51099, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51099, model_id = 51099, texture_id = 51099,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29578, 1}]}],
                        can_use = 1};
get_dress(51100) ->
    #fashion_dress_data{base_id = 51100, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51100, model_id = 51100, texture_id = 51100,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29590, 1}]}],
                        can_use = 1};
get_dress(51101) ->
    #fashion_dress_data{base_id = 51101, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51101, model_id = 51101, texture_id = 51101,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29591, 1}]}],
                        can_use = 1};
get_dress(51104) ->
    #fashion_dress_data{base_id = 51104, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51104, model_id = 51104, texture_id = 51104,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29652, 1}]}],
                        can_use = 1};
get_dress(51105) ->
    #fashion_dress_data{base_id = 51105, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51105, model_id = 51105, texture_id = 51105,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29653, 1}]}],
                        can_use = 1};
get_dress(51102) ->
    #fashion_dress_data{base_id = 51102, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51102, model_id = 51102, texture_id = 51102,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29664, 1}]}],
                        can_use = 1};
get_dress(51103) ->
    #fashion_dress_data{base_id = 51103, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51103, model_id = 51103, texture_id = 51103,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29665, 1}]}],
                        can_use = 1};
get_dress(51106) ->
    #fashion_dress_data{base_id = 51106, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51106, model_id = 51106, texture_id = 51106,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29676, 1}]}],
                        can_use = 1};
get_dress(51107) ->
    #fashion_dress_data{base_id = 51107, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51107, model_id = 51107, texture_id = 51107,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29677, 1}]}],
                        can_use = 1};
get_dress(51112) ->
    #fashion_dress_data{base_id = 51112, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51112, model_id = 51112, texture_id = 51112,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29681, 1}]}],
                        can_use = 1};
get_dress(51113) ->
    #fashion_dress_data{base_id = 51113, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51113, model_id = 51113, texture_id = 51113,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29684, 1}]}],
                        can_use = 1};
get_dress(51013) ->
    #fashion_dress_data{base_id = 51013, type = 3,
                        quality = 0, classes = 7, sex = 1, lev = 1,
                        model_id = 51013, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51012) ->
    #fashion_dress_data{base_id = 51012, type = 3,
                        quality = 0, classes = 7, sex = 0, lev = 1,
                        model_id = 51012, is_origin = 1, loss = [],
                        can_use = 1};
get_dress(51110) ->
    #fashion_dress_data{base_id = 51110, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51110, model_id = 51110, texture_id = 51110,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29698, 1}]}],
                        can_use = 1};
get_dress(51111) ->
    #fashion_dress_data{base_id = 51111, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51111, model_id = 51111, texture_id = 51111,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29800, 1}]}],
                        can_use = 1};
get_dress(51114) ->
    #fashion_dress_data{base_id = 51114, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51114, model_id = 51114, texture_id = 51114,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29825, 1}]}],
                        can_use = 1};
get_dress(51115) ->
    #fashion_dress_data{base_id = 51115, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51115, model_id = 51115, texture_id = 51115,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29828, 1}]}],
                        can_use = 1};
get_dress(51094) ->
    #fashion_dress_data{base_id = 51094, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51094, model_id = 51094, texture_id = 51094,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29857, 1}]}],
                        can_use = 1};
get_dress(51095) ->
    #fashion_dress_data{base_id = 51095, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51095, model_id = 51095, texture_id = 51095,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29860, 1}]}],
                        can_use = 1};
get_dress(51116) ->
    #fashion_dress_data{base_id = 51116, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51116, model_id = 51116, texture_id = 51116,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29902, 1}]}],
                        can_use = 1};
get_dress(51117) ->
    #fashion_dress_data{base_id = 51117, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51117, model_id = 51117, texture_id = 51117,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29905, 1}]}],
                        can_use = 1};
get_dress(51118) ->
    #fashion_dress_data{base_id = 51118, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51118, model_id = 51118, texture_id = 51118,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{26003, 1}]}],
                        can_use = 1};
get_dress(51119) ->
    #fashion_dress_data{base_id = 51119, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51119, model_id = 51119, texture_id = 51119,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{26006, 1}]}],
                        can_use = 1};
get_dress(51120) ->
    #fashion_dress_data{base_id = 51120, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51120, model_id = 51120, texture_id = 51120,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29994, 1}]}],
                        can_use = 1};
get_dress(51121) ->
    #fashion_dress_data{base_id = 51121, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51121, model_id = 51121, texture_id = 51121,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29997, 1}]}],
                        can_use = 1};
get_dress(51122) ->
    #fashion_dress_data{base_id = 51122, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51122, model_id = 51122, texture_id = 51122,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70049, 1}]}],
                        can_use = 1};
get_dress(51123) ->
    #fashion_dress_data{base_id = 51123, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51123, model_id = 51123, texture_id = 51123,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70051, 1}]}],
                        can_use = 1};
get_dress(51124) ->
    #fashion_dress_data{base_id = 51124, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51124, model_id = 51124, texture_id = 51124,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70095, 1}]}],
                        can_use = 1};
get_dress(51125) ->
    #fashion_dress_data{base_id = 51125, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51125, model_id = 51125, texture_id = 51125,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70098, 1}]}],
                        can_use = 1};
get_dress(51126) ->
    #fashion_dress_data{base_id = 51126, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51126, model_id = 51126, texture_id = 51126,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70248, 1}]}],
                        can_use = 1};
get_dress(51127) ->
    #fashion_dress_data{base_id = 51127, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51127, model_id = 51127, texture_id = 51127,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70251, 1}]}],
                        can_use = 1};
get_dress(51128) ->
    #fashion_dress_data{base_id = 51128, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51128, model_id = 51128, texture_id = 51128,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70293, 1}]}],
                        can_use = 1};
get_dress(51129) ->
    #fashion_dress_data{base_id = 51129, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51129, model_id = 51129, texture_id = 51129,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70297, 1}]}],
                        can_use = 1};
get_dress(51130) ->
    #fashion_dress_data{base_id = 51130, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51130, model_id = 51130, texture_id = 51130,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70334, 1}]}],
                        can_use = 1};
get_dress(51131) ->
    #fashion_dress_data{base_id = 51131, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51131, model_id = 51131, texture_id = 51131,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70338, 1}]}],
                        can_use = 1};
get_dress(51132) ->
    #fashion_dress_data{base_id = 51132, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51132, model_id = 51132, texture_id = 51132,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70422, 1}]}],
                        can_use = 1};
get_dress(51133) ->
    #fashion_dress_data{base_id = 51133, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51133, model_id = 51133, texture_id = 51133,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70426, 1}]}],
                        can_use = 1};
get_dress(51134) ->
    #fashion_dress_data{base_id = 51134, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51134, model_id = 51134, texture_id = 51134,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70459, 1}]}],
                        can_use = 1};
get_dress(51135) ->
    #fashion_dress_data{base_id = 51135, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51135, model_id = 51135, texture_id = 51135,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70463, 1}]}],
                        can_use = 1};
get_dress(51136) ->
    #fashion_dress_data{base_id = 51136, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51136, model_id = 51136, texture_id = 51136,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70516, 1}]}],
                        can_use = 1};
get_dress(51137) ->
    #fashion_dress_data{base_id = 51137, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51137, model_id = 51137, texture_id = 51137,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70520, 1}]}],
                        can_use = 1};
get_dress(51138) ->
    #fashion_dress_data{base_id = 51138, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51138, model_id = 51138, texture_id = 51138,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70588, 1}]}],
                        can_use = 1};
get_dress(51139) ->
    #fashion_dress_data{base_id = 51139, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51139, model_id = 51139, texture_id = 51139,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70592, 1}]}],
                        can_use = 1};
get_dress(51140) ->
    #fashion_dress_data{base_id = 51140, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51140, model_id = 51140, texture_id = 51140,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70656, 1}]}],
                        can_use = 1};
get_dress(51141) ->
    #fashion_dress_data{base_id = 51141, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51141, model_id = 51141, texture_id = 51141,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70660, 1}]}],
                        can_use = 1};
get_dress(51142) ->
    #fashion_dress_data{base_id = 51142, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51142, model_id = 51142, texture_id = 51142,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70718, 1}]}],
                        can_use = 1};
get_dress(51143) ->
    #fashion_dress_data{base_id = 51143, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51143, model_id = 51143, texture_id = 51143,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70722, 1}]}],
                        can_use = 1};
get_dress(51144) ->
    #fashion_dress_data{base_id = 51144, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51144, model_id = 51144, texture_id = 51144,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70758, 1}]}],
                        can_use = 1};
get_dress(51145) ->
    #fashion_dress_data{base_id = 51145, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51145, model_id = 51145, texture_id = 51145,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70762, 1}]}],
                        can_use = 1};
get_dress(51146) ->
    #fashion_dress_data{base_id = 51146, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51146, model_id = 51146, texture_id = 51146,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70832, 1}]}],
                        can_use = 1};
get_dress(51147) ->
    #fashion_dress_data{base_id = 51147, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51147, model_id = 51147, texture_id = 51147,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70836, 1}]}],
                        can_use = 1};
get_dress(51148) ->
    #fashion_dress_data{base_id = 51148, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51148, model_id = 51148, texture_id = 51148,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70902, 1}]}],
                        can_use = 1};
get_dress(51149) ->
    #fashion_dress_data{base_id = 51149, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51149, model_id = 51149, texture_id = 51149,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70906, 1}]}],
                        can_use = 1};
get_dress(51150) ->
    #fashion_dress_data{base_id = 51150, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51150, model_id = 51150, texture_id = 51150,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70963, 1}]}],
                        can_use = 1};
get_dress(51151) ->
    #fashion_dress_data{base_id = 51151, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51151, model_id = 51151, texture_id = 51151,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70967, 1}]}],
                        can_use = 1};
get_dress(51152) ->
    #fashion_dress_data{base_id = 51152, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51152, model_id = 51152, texture_id = 51152,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71033, 1}]}],
                        can_use = 1};
get_dress(51153) ->
    #fashion_dress_data{base_id = 51153, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51153, model_id = 51153, texture_id = 51153,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71037, 1}]}],
                        can_use = 1};
get_dress(51154) ->
    #fashion_dress_data{base_id = 51154, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51154, model_id = 51154, texture_id = 51154,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71105, 1}]}],
                        can_use = 1};
get_dress(51155) ->
    #fashion_dress_data{base_id = 51155, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51155, model_id = 51155, texture_id = 51155,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71109, 1}]}],
                        can_use = 1};
get_dress(51156) ->
    #fashion_dress_data{base_id = 51156, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51156, model_id = 51156, texture_id = 51156,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71171, 1}]}],
                        can_use = 1};
get_dress(51157) ->
    #fashion_dress_data{base_id = 51157, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51157, model_id = 51157, texture_id = 51157,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71175, 1}]}],
                        can_use = 1};
get_dress(51158) ->
    #fashion_dress_data{base_id = 51158, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51158, model_id = 51158, texture_id = 51158,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71209, 1}]}],
                        can_use = 1};
get_dress(51159) ->
    #fashion_dress_data{base_id = 51159, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51159, model_id = 51159, texture_id = 51159,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71213, 1}]}],
                        can_use = 1};
get_dress(51160) ->
    #fashion_dress_data{base_id = 51160, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51160, model_id = 51160, texture_id = 51160,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71291, 1}]}],
                        can_use = 1};
get_dress(51161) ->
    #fashion_dress_data{base_id = 51161, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51161, model_id = 51161, texture_id = 51161,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71295, 1}]}],
                        can_use = 1};
get_dress(51162) ->
    #fashion_dress_data{base_id = 51162, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51162, model_id = 51162, texture_id = 51162,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71348, 1}]}],
                        can_use = 1};
get_dress(51163) ->
    #fashion_dress_data{base_id = 51163, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51163, model_id = 51163, texture_id = 51163,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71352, 1}]}],
                        can_use = 1};
get_dress(51164) ->
    #fashion_dress_data{base_id = 51164, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51164, model_id = 51164, texture_id = 51164,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71422, 1}]}],
                        can_use = 1};
get_dress(51165) ->
    #fashion_dress_data{base_id = 51165, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51165, model_id = 51165, texture_id = 51165,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71426, 1}]}],
                        can_use = 1};
get_dress(51166) ->
    #fashion_dress_data{base_id = 51166, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51166, model_id = 51166, texture_id = 51166,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71474, 1}]}],
                        can_use = 1};
get_dress(51167) ->
    #fashion_dress_data{base_id = 51167, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51167, model_id = 51167, texture_id = 51167,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71478, 1}]}],
                        can_use = 1};
get_dress(51168) ->
    #fashion_dress_data{base_id = 51168, type = 3,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        set_id = 51168, model_id = 51168, texture_id = 51168,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71549, 1}]}],
                        can_use = 1};
get_dress(51169) ->
    #fashion_dress_data{base_id = 51169, type = 3,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        set_id = 51169, model_id = 51169, texture_id = 51169,
                        is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71553, 1}]}],
                        can_use = 1};
get_dress(0) ->
    #fashion_dress_data{base_id = 0, type = 4, quality = 3,
                        classes = 0, sex = 2, lev = 1, model_id = 0,
                        is_origin = 1, loss = [], can_use = 1};
get_dress(52001) ->
    #fashion_dress_data{base_id = 52001, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52001, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29225, 1}]}],
                        can_use = 1};
get_dress(52002) ->
    #fashion_dress_data{base_id = 52002, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52002, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29207, 1}]}],
                        can_use = 1};
get_dress(52003) ->
    #fashion_dress_data{base_id = 52003, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52003, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29283, 1}]}],
                        can_use = 1};
get_dress(52004) ->
    #fashion_dress_data{base_id = 52004, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52004, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29279, 1}]}],
                        can_use = 1};
get_dress(52005) ->
    #fashion_dress_data{base_id = 52005, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52005, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29298, 1}]}],
                        can_use = 1};
get_dress(52007) ->
    #fashion_dress_data{base_id = 52007, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52007, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29300, 1}]}],
                        can_use = 1};
get_dress(52008) ->
    #fashion_dress_data{base_id = 52008, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52008, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29301, 1}]}],
                        can_use = 1};
get_dress(52009) ->
    #fashion_dress_data{base_id = 52009, type = 4,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 52009, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29335, 1}]}],
                        can_use = 1};
get_dress(52010) ->
    #fashion_dress_data{base_id = 52010, type = 4,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 52010, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29335, 1}]}],
                        can_use = 1};
get_dress(52011) ->
    #fashion_dress_data{base_id = 52011, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52011, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29339, 1}]}],
                        can_use = 1};
get_dress(52012) ->
    #fashion_dress_data{base_id = 52012, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52012, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29330, 1}]}],
                        can_use = 1};
get_dress(52013) ->
    #fashion_dress_data{base_id = 52013, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52013, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29345, 1}]}],
                        can_use = 1};
get_dress(52014) ->
    #fashion_dress_data{base_id = 52014, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52014, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29350, 1}]}],
                        can_use = 1};
get_dress(52015) ->
    #fashion_dress_data{base_id = 52015, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52015, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29351, 1}]}],
                        can_use = 1};
get_dress(52016) ->
    #fashion_dress_data{base_id = 52016, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52016, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29360, 1}]}],
                        can_use = 1};
get_dress(52017) ->
    #fashion_dress_data{base_id = 52017, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52017, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29359, 1}]}],
                        can_use = 1};
get_dress(52018) ->
    #fashion_dress_data{base_id = 52018, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52018, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29369, 1}]}],
                        can_use = 1};
get_dress(52019) ->
    #fashion_dress_data{base_id = 52019, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52019, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29370, 1}]}],
                        can_use = 1};
get_dress(52020) ->
    #fashion_dress_data{base_id = 52020, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52020, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29383, 1}]}],
                        can_use = 1};
get_dress(52021) ->
    #fashion_dress_data{base_id = 52021, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52021, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29392, 1}]}],
                        can_use = 1};
get_dress(52022) ->
    #fashion_dress_data{base_id = 52022, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52022, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29394, 1}]}],
                        can_use = 1};
get_dress(52023) ->
    #fashion_dress_data{base_id = 52023, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52023, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29401, 1}]}],
                        can_use = 1};
get_dress(52024) ->
    #fashion_dress_data{base_id = 52024, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52024, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29404, 1}]}],
                        can_use = 1};
get_dress(52025) ->
    #fashion_dress_data{base_id = 52025, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52025, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29436, 1}]}],
                        can_use = 1};
get_dress(52026) ->
    #fashion_dress_data{base_id = 52026, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52026, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29445, 1}]}],
                        can_use = 1};
get_dress(52027) ->
    #fashion_dress_data{base_id = 52027, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52027, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29452, 1}]}],
                        can_use = 1};
get_dress(52028) ->
    #fashion_dress_data{base_id = 52028, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52028, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29460, 1}]}],
                        can_use = 1};
get_dress(52029) ->
    #fashion_dress_data{base_id = 52029, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52029, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29469, 1}]}],
                        can_use = 1};
get_dress(52030) ->
    #fashion_dress_data{base_id = 52030, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52030, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29493, 1}]}],
                        can_use = 1};
get_dress(52031) ->
    #fashion_dress_data{base_id = 52031, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52031, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29526, 1}]}],
                        can_use = 1};
get_dress(52032) ->
    #fashion_dress_data{base_id = 52032, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52032, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29527, 1}]}],
                        can_use = 1};
get_dress(52033) ->
    #fashion_dress_data{base_id = 52033, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52033, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29528, 1}]}],
                        can_use = 1};
get_dress(52034) ->
    #fashion_dress_data{base_id = 52034, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52034, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29529, 1}]}],
                        can_use = 1};
get_dress(52035) ->
    #fashion_dress_data{base_id = 52035, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52035, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29530, 1}]}],
                        can_use = 1};
get_dress(52037) ->
    #fashion_dress_data{base_id = 52037, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52037, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29547, 1}]}],
                        can_use = 1};
get_dress(52038) ->
    #fashion_dress_data{base_id = 52038, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52038, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29560, 1}]}],
                        can_use = 1};
get_dress(52040) ->
    #fashion_dress_data{base_id = 52040, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52040, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29554, 1}]}],
                        can_use = 1};
get_dress(52041) ->
    #fashion_dress_data{base_id = 52041, type = 4,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 52041, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29555, 1}]}],
                        can_use = 1};
get_dress(52042) ->
    #fashion_dress_data{base_id = 52042, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52042, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29575, 1}]}],
                        can_use = 1};
get_dress(52043) ->
    #fashion_dress_data{base_id = 52043, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52043, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29579, 1}]}],
                        can_use = 1};
get_dress(52045) ->
    #fashion_dress_data{base_id = 52045, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52045, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29584, 1}]}],
                        can_use = 1};
get_dress(52046) ->
    #fashion_dress_data{base_id = 52046, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52046, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29585, 1}]}],
                        can_use = 1};
get_dress(52047) ->
    #fashion_dress_data{base_id = 52047, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52047, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29592, 1}]}],
                        can_use = 1};
get_dress(52048) ->
    #fashion_dress_data{base_id = 52048, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52048, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29593, 1}]}],
                        can_use = 1};
get_dress(52050) ->
    #fashion_dress_data{base_id = 52050, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52050, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29598, 1}]}],
                        can_use = 1};
get_dress(52051) ->
    #fashion_dress_data{base_id = 52051, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52051, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29599, 1}]}],
                        can_use = 1};
get_dress(52049) ->
    #fashion_dress_data{base_id = 52049, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52049, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29650, 1}]}],
                        can_use = 1};
get_dress(52052) ->
    #fashion_dress_data{base_id = 52052, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52052, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29666, 1}]}],
                        can_use = 1};
get_dress(52053) ->
    #fashion_dress_data{base_id = 52053, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52053, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29668, 1}]}],
                        can_use = 1};
get_dress(52054) ->
    #fashion_dress_data{base_id = 52054, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52054, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29678, 1}]}],
                        can_use = 1};
get_dress(52056) ->
    #fashion_dress_data{base_id = 52056, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52056, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29687, 1}]}],
                        can_use = 1};
get_dress(52055) ->
    #fashion_dress_data{base_id = 52055, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52055, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29809, 1}]}],
                        can_use = 1};
get_dress(52057) ->
    #fashion_dress_data{base_id = 52057, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52057, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29837, 1}]}],
                        can_use = 1};
get_dress(52058) ->
    #fashion_dress_data{base_id = 52058, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52058, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29840, 1}]}],
                        can_use = 1};
get_dress(52039) ->
    #fashion_dress_data{base_id = 52039, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52039, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29869, 1}]}],
                        can_use = 1};
get_dress(52059) ->
    #fashion_dress_data{base_id = 52059, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52059, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29878, 1}]}],
                        can_use = 1};
get_dress(52060) ->
    #fashion_dress_data{base_id = 52060, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52060, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29899, 1}]}],
                        can_use = 1};
get_dress(52061) ->
    #fashion_dress_data{base_id = 52061, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52061, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29937, 1}]}],
                        can_use = 1};
get_dress(52062) ->
    #fashion_dress_data{base_id = 52062, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52062, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29949, 1}]}],
                        can_use = 1};
get_dress(52063) ->
    #fashion_dress_data{base_id = 52063, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52063, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{26012, 1}]}],
                        can_use = 1};
get_dress(52064) ->
    #fashion_dress_data{base_id = 52064, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52064, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70012, 1}]}],
                        can_use = 1};
get_dress(52065) ->
    #fashion_dress_data{base_id = 52065, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52065, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70107, 1}]}],
                        can_use = 1};
get_dress(52066) ->
    #fashion_dress_data{base_id = 52066, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52066, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70202, 1}]}],
                        can_use = 1};
get_dress(52067) ->
    #fashion_dress_data{base_id = 52067, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52067, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70205, 1}]}],
                        can_use = 1};
get_dress(52068) ->
    #fashion_dress_data{base_id = 52068, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52068, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70260, 1}]}],
                        can_use = 1};
get_dress(52069) ->
    #fashion_dress_data{base_id = 52069, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52069, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70309, 1}]}],
                        can_use = 1};
get_dress(52071) ->
    #fashion_dress_data{base_id = 52071, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52071, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70351, 1}]}],
                        can_use = 1};
get_dress(52070) ->
    #fashion_dress_data{base_id = 52070, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52070, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70350, 1}]}],
                        can_use = 1};
get_dress(52072) ->
    #fashion_dress_data{base_id = 52072, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52072, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70438, 1}]}],
                        can_use = 1};
get_dress(52073) ->
    #fashion_dress_data{base_id = 52073, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52073, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70475, 1}]}],
                        can_use = 1};
get_dress(52074) ->
    #fashion_dress_data{base_id = 52074, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52074, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70532, 1}]}],
                        can_use = 1};
get_dress(52075) ->
    #fashion_dress_data{base_id = 52075, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52075, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70604, 1}]}],
                        can_use = 1};
get_dress(52076) ->
    #fashion_dress_data{base_id = 52076, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52076, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70668, 1}]}],
                        can_use = 1};
get_dress(52077) ->
    #fashion_dress_data{base_id = 52077, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52077, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70734, 1}]}],
                        can_use = 1};
get_dress(52078) ->
    #fashion_dress_data{base_id = 52078, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52078, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70774, 1}]}],
                        can_use = 1};
get_dress(52079) ->
    #fashion_dress_data{base_id = 52079, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52079, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70848, 1}]}],
                        can_use = 1};
get_dress(52080) ->
    #fashion_dress_data{base_id = 52080, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52080, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70918, 1}]}],
                        can_use = 1};
get_dress(52081) ->
    #fashion_dress_data{base_id = 52081, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52081, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70958, 1}]}],
                        can_use = 1};
get_dress(52082) ->
    #fashion_dress_data{base_id = 52082, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52082, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71049, 1}]}],
                        can_use = 1};
get_dress(52083) ->
    #fashion_dress_data{base_id = 52083, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52083, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71091, 1}]}],
                        can_use = 1};
get_dress(52084) ->
    #fashion_dress_data{base_id = 52084, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52084, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71095, 1}]}],
                        can_use = 1};
get_dress(52085) ->
    #fashion_dress_data{base_id = 52085, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52085, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71121, 1}]}],
                        can_use = 1};
get_dress(52086) ->
    #fashion_dress_data{base_id = 52086, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52086, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71183, 1}]}],
                        can_use = 1};
get_dress(52087) ->
    #fashion_dress_data{base_id = 52087, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52087, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71225, 1}]}],
                        can_use = 1};
get_dress(52088) ->
    #fashion_dress_data{base_id = 52088, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52088, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71253, 1}]}],
                        can_use = 1};
get_dress(52089) ->
    #fashion_dress_data{base_id = 52089, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52089, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71315, 1}]}],
                        can_use = 1};
get_dress(52090) ->
    #fashion_dress_data{base_id = 52090, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52090, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71303, 1}]}],
                        can_use = 1};
get_dress(52091) ->
    #fashion_dress_data{base_id = 52091, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52091, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71364, 1}]}],
                        can_use = 1};
get_dress(52092) ->
    #fashion_dress_data{base_id = 52092, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52092, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71438, 1}]}],
                        can_use = 1};
get_dress(52093) ->
    #fashion_dress_data{base_id = 52093, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52093, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71463, 1}]}],
                        can_use = 1};
get_dress(52094) ->
    #fashion_dress_data{base_id = 52094, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52094, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71490, 1}]}],
                        can_use = 1};
get_dress(52095) ->
    #fashion_dress_data{base_id = 52095, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52095, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71525, 1}]}],
                        can_use = 1};
get_dress(52096) ->
    #fashion_dress_data{base_id = 52096, type = 4,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 52096, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71565, 1}]}],
                        can_use = 1};
get_dress(1) ->
    #fashion_dress_data{base_id = 1, type = 6, quality = 3,
                        classes = 0, sex = 2, lev = 1, model_id = 1,
                        is_origin = 1, loss = [], can_use = 1};
get_dress(53003) ->
    #fashion_dress_data{base_id = 53003, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53003, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29200, 1}]}],
                        can_use = 1};
get_dress(53004) ->
    #fashion_dress_data{base_id = 53004, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53004, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29271, 1}]}],
                        can_use = 1};
get_dress(53005) ->
    #fashion_dress_data{base_id = 53005, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53005, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29272, 1}]}],
                        can_use = 1};
get_dress(53006) ->
    #fashion_dress_data{base_id = 53006, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53006, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29273, 1}]}],
                        can_use = 1};
get_dress(53007) ->
    #fashion_dress_data{base_id = 53007, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53007, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29286, 1}]}],
                        can_use = 1};
get_dress(53010) ->
    #fashion_dress_data{base_id = 53010, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53010, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29274, 1}]}],
                        can_use = 1};
get_dress(53011) ->
    #fashion_dress_data{base_id = 53011, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53011, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29280, 1}]}],
                        can_use = 1};
get_dress(53012) ->
    #fashion_dress_data{base_id = 53012, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53012, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29276, 1}]}],
                        can_use = 1};
get_dress(53013) ->
    #fashion_dress_data{base_id = 53013, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53013, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29277, 1}]}],
                        can_use = 1};
get_dress(53015) ->
    #fashion_dress_data{base_id = 53015, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53015, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29341, 1}]}],
                        can_use = 1};
get_dress(53016) ->
    #fashion_dress_data{base_id = 53016, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53016, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29303, 1}]}],
                        can_use = 1};
get_dress(53019) ->
    #fashion_dress_data{base_id = 53019, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53019, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29305, 1}]}],
                        can_use = 1};
get_dress(53021) ->
    #fashion_dress_data{base_id = 53021, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53021, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29338, 1}]}],
                        can_use = 1};
get_dress(53022) ->
    #fashion_dress_data{base_id = 53022, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53022, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29338, 1}]}],
                        can_use = 1};
get_dress(53023) ->
    #fashion_dress_data{base_id = 53023, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53023, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29331, 1}]}],
                        can_use = 1};
get_dress(53024) ->
    #fashion_dress_data{base_id = 53024, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53024, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29332, 1}]}],
                        can_use = 1};
get_dress(53025) ->
    #fashion_dress_data{base_id = 53025, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53025, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29342, 1}]}],
                        can_use = 1};
get_dress(53026) ->
    #fashion_dress_data{base_id = 53026, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53026, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29343, 1}]}],
                        can_use = 1};
get_dress(53027) ->
    #fashion_dress_data{base_id = 53027, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53027, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29344, 1}]}],
                        can_use = 1};
get_dress(53028) ->
    #fashion_dress_data{base_id = 53028, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53028, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29348, 1}]}],
                        can_use = 1};
get_dress(53029) ->
    #fashion_dress_data{base_id = 53029, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53029, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29349, 1}]}],
                        can_use = 1};
get_dress(53030) ->
    #fashion_dress_data{base_id = 53030, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53030, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29361, 1}]}],
                        can_use = 1};
get_dress(53031) ->
    #fashion_dress_data{base_id = 53031, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53031, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29371, 1}]}],
                        can_use = 1};
get_dress(53032) ->
    #fashion_dress_data{base_id = 53032, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53032, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29384, 1}]}],
                        can_use = 1};
get_dress(53033) ->
    #fashion_dress_data{base_id = 53033, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53033, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29395, 1}]}],
                        can_use = 1};
get_dress(53034) ->
    #fashion_dress_data{base_id = 53034, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53034, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29396, 1}]}],
                        can_use = 1};
get_dress(53035) ->
    #fashion_dress_data{base_id = 53035, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53035, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29402, 1}]}],
                        can_use = 1};
get_dress(53036) ->
    #fashion_dress_data{base_id = 53036, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53036, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29403, 1}]}],
                        can_use = 1};
get_dress(53039) ->
    #fashion_dress_data{base_id = 53039, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53039, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29405, 1}]}],
                        can_use = 1};
get_dress(53040) ->
    #fashion_dress_data{base_id = 53040, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53040, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29406, 1}]}],
                        can_use = 1};
get_dress(53041) ->
    #fashion_dress_data{base_id = 53041, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53041, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29435, 1}]}],
                        can_use = 1};
get_dress(53042) ->
    #fashion_dress_data{base_id = 53042, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53042, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29435, 1}]}],
                        can_use = 1};
get_dress(53044) ->
    #fashion_dress_data{base_id = 53044, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53044, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29446, 1}]}],
                        can_use = 1};
get_dress(53045) ->
    #fashion_dress_data{base_id = 53045, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53045, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29442, 1}]}],
                        attrs = [{1, 200}, {2, 100}], score = 69, can_use = 1};
get_dress(53037) ->
    #fashion_dress_data{base_id = 53037, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53037, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29450, 1}]}],
                        can_use = 1};
get_dress(53038) ->
    #fashion_dress_data{base_id = 53038, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53038, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29451, 1}]}],
                        can_use = 1};
get_dress(53046) ->
    #fashion_dress_data{base_id = 53046, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53046, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29459, 1}]}],
                        can_use = 1};
get_dress(53047) ->
    #fashion_dress_data{base_id = 53047, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53047, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29468, 1}]}],
                        can_use = 1};
get_dress(53048) ->
    #fashion_dress_data{base_id = 53048, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53048, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29491, 1}]}],
                        can_use = 1};
get_dress(53049) ->
    #fashion_dress_data{base_id = 53049, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53049, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29492, 1}]}],
                        can_use = 1};
get_dress(53050) ->
    #fashion_dress_data{base_id = 53050, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53050, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29522, 1}]}],
                        can_use = 1};
get_dress(53051) ->
    #fashion_dress_data{base_id = 53051, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53051, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29523, 1}]}],
                        can_use = 1};
get_dress(53052) ->
    #fashion_dress_data{base_id = 53052, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53052, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29525, 1}]}],
                        can_use = 1};
get_dress(53053) ->
    #fashion_dress_data{base_id = 53053, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53053, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29524, 1}]}],
                        can_use = 1};
get_dress(53054) ->
    #fashion_dress_data{base_id = 53054, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53054, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29548, 1}]}],
                        can_use = 1};
get_dress(53055) ->
    #fashion_dress_data{base_id = 53055, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53055, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29549, 1}]}],
                        can_use = 1};
get_dress(53056) ->
    #fashion_dress_data{base_id = 53056, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53056, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29561, 1}]}],
                        can_use = 1};
get_dress(53057) ->
    #fashion_dress_data{base_id = 53057, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53057, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29562, 1}]}],
                        can_use = 1};
get_dress(53060) ->
    #fashion_dress_data{base_id = 53060, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53060, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29556, 1}]}],
                        can_use = 1};
get_dress(53061) ->
    #fashion_dress_data{base_id = 53061, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53061, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29557, 1}]}],
                        can_use = 1};
get_dress(53062) ->
    #fashion_dress_data{base_id = 53062, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53062, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29580, 1}]}],
                        can_use = 1};
get_dress(53063) ->
    #fashion_dress_data{base_id = 53063, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53063, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29581, 1}]}],
                        can_use = 1};
get_dress(53064) ->
    #fashion_dress_data{base_id = 53064, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53064, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29586, 1}]}],
                        can_use = 1};
get_dress(53065) ->
    #fashion_dress_data{base_id = 53065, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53065, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29587, 1}]}],
                        can_use = 1};
get_dress(53066) ->
    #fashion_dress_data{base_id = 53066, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53066, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29588, 1}]}],
                        can_use = 1};
get_dress(53067) ->
    #fashion_dress_data{base_id = 53067, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53067, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29589, 1}]}],
                        can_use = 1};
get_dress(53070) ->
    #fashion_dress_data{base_id = 53070, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53070, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29651, 1}]}],
                        can_use = 1};
get_dress(53068) ->
    #fashion_dress_data{base_id = 53068, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53068, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29662, 1}]}],
                        can_use = 1};
get_dress(53069) ->
    #fashion_dress_data{base_id = 53069, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53069, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29663, 1}]}],
                        can_use = 1};
get_dress(53071) ->
    #fashion_dress_data{base_id = 53071, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53071, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29672, 1}]}],
                        can_use = 1};
get_dress(53072) ->
    #fashion_dress_data{base_id = 53072, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53072, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29679, 1}]}],
                        can_use = 1};
get_dress(53073) ->
    #fashion_dress_data{base_id = 53073, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53073, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29680, 1}]}],
                        can_use = 1};
get_dress(53076) ->
    #fashion_dress_data{base_id = 53076, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53076, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29690, 1}]}],
                        can_use = 1};
get_dress(53074) ->
    #fashion_dress_data{base_id = 53074, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53074, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29803, 1}]}],
                        can_use = 1};
get_dress(53075) ->
    #fashion_dress_data{base_id = 53075, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53075, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29806, 1}]}],
                        can_use = 1};
get_dress(53078) ->
    #fashion_dress_data{base_id = 53078, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53078, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29831, 1}]}],
                        can_use = 1};
get_dress(53077) ->
    #fashion_dress_data{base_id = 53077, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53077, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29834, 1}]}],
                        can_use = 1};
get_dress(53058) ->
    #fashion_dress_data{base_id = 53058, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53058, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29863, 1}]}],
                        can_use = 1};
get_dress(53059) ->
    #fashion_dress_data{base_id = 53059, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53059, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29866, 1}]}],
                        can_use = 1};
get_dress(53079) ->
    #fashion_dress_data{base_id = 53079, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53079, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29872, 1}]}],
                        can_use = 1};
get_dress(53080) ->
    #fashion_dress_data{base_id = 53080, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53080, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29875, 1}]}],
                        can_use = 1};
get_dress(53081) ->
    #fashion_dress_data{base_id = 53081, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53081, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29914, 1}]}],
                        can_use = 1};
get_dress(53082) ->
    #fashion_dress_data{base_id = 53082, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53082, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29908, 1}]}],
                        can_use = 1};
get_dress(53083) ->
    #fashion_dress_data{base_id = 53083, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53083, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29893, 1}]}],
                        can_use = 1};
get_dress(53084) ->
    #fashion_dress_data{base_id = 53084, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53084, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29896, 1}]}],
                        can_use = 1};
get_dress(53085) ->
    #fashion_dress_data{base_id = 53085, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53085, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29934, 1}]}],
                        can_use = 1};
get_dress(53086) ->
    #fashion_dress_data{base_id = 53086, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53086, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29946, 1}]}],
                        can_use = 1};
get_dress(53087) ->
    #fashion_dress_data{base_id = 53087, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53087, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{26009, 1}]}],
                        can_use = 1};
get_dress(53089) ->
    #fashion_dress_data{base_id = 53089, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53089, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29979, 1}]}],
                        can_use = 1};
get_dress(53088) ->
    #fashion_dress_data{base_id = 53088, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53088, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29980, 1}]}],
                        can_use = 1};
get_dress(53090) ->
    #fashion_dress_data{base_id = 53090, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53090, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70006, 1}]}],
                        can_use = 1};
get_dress(53091) ->
    #fashion_dress_data{base_id = 53091, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53091, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70009, 1}]}],
                        can_use = 1};
get_dress(53092) ->
    #fashion_dress_data{base_id = 53092, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53092, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70101, 1}]}],
                        can_use = 1};
get_dress(53093) ->
    #fashion_dress_data{base_id = 53093, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53093, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70104, 1}]}],
                        can_use = 1};
get_dress(53094) ->
    #fashion_dress_data{base_id = 53094, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53094, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70196, 1}]}],
                        can_use = 1};
get_dress(53095) ->
    #fashion_dress_data{base_id = 53095, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53095, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70199, 1}]}],
                        can_use = 1};
get_dress(53096) ->
    #fashion_dress_data{base_id = 53096, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53096, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70254, 1}]}],
                        can_use = 1};
get_dress(53097) ->
    #fashion_dress_data{base_id = 53097, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53097, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70257, 1}]}],
                        can_use = 1};
get_dress(53098) ->
    #fashion_dress_data{base_id = 53098, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53098, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70301, 1}]}],
                        can_use = 1};
get_dress(53099) ->
    #fashion_dress_data{base_id = 53099, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53099, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70305, 1}]}],
                        can_use = 1};
get_dress(53100) ->
    #fashion_dress_data{base_id = 53100, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53100, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70342, 1}]}],
                        can_use = 1};
get_dress(53101) ->
    #fashion_dress_data{base_id = 53101, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53101, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70346, 1}]}],
                        can_use = 1};
get_dress(53102) ->
    #fashion_dress_data{base_id = 53102, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53102, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70430, 1}]}],
                        can_use = 1};
get_dress(53103) ->
    #fashion_dress_data{base_id = 53103, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53103, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70434, 1}]}],
                        can_use = 1};
get_dress(53104) ->
    #fashion_dress_data{base_id = 53104, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53104, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70467, 1}]}],
                        can_use = 1};
get_dress(53105) ->
    #fashion_dress_data{base_id = 53105, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53105, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70471, 1}]}],
                        can_use = 1};
get_dress(53106) ->
    #fashion_dress_data{base_id = 53106, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53106, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70524, 1}]}],
                        can_use = 1};
get_dress(53107) ->
    #fashion_dress_data{base_id = 53107, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53107, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70528, 1}]}],
                        can_use = 1};
get_dress(53108) ->
    #fashion_dress_data{base_id = 53108, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53108, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70596, 1}]}],
                        can_use = 1};
get_dress(53110) ->
    #fashion_dress_data{base_id = 53110, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53110, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70664, 1}]}],
                        can_use = 1};
get_dress(53111) ->
    #fashion_dress_data{base_id = 53111, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53111, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70726, 1}]}],
                        can_use = 1};
get_dress(53112) ->
    #fashion_dress_data{base_id = 53112, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53112, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70730, 1}]}],
                        can_use = 1};
get_dress(53113) ->
    #fashion_dress_data{base_id = 53113, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53113, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70766, 1}]}],
                        can_use = 1};
get_dress(53114) ->
    #fashion_dress_data{base_id = 53114, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53114, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70770, 1}]}],
                        can_use = 1};
get_dress(53115) ->
    #fashion_dress_data{base_id = 53115, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53115, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70840, 1}]}],
                        can_use = 1};
get_dress(53116) ->
    #fashion_dress_data{base_id = 53116, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53116, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70844, 1}]}],
                        can_use = 1};
get_dress(53117) ->
    #fashion_dress_data{base_id = 53117, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53117, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70910, 1}]}],
                        can_use = 1};
get_dress(53118) ->
    #fashion_dress_data{base_id = 53118, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53118, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70914, 1}]}],
                        can_use = 1};
get_dress(53119) ->
    #fashion_dress_data{base_id = 53119, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53119, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70949, 1}]}],
                        can_use = 1};
get_dress(53120) ->
    #fashion_dress_data{base_id = 53120, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53120, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70953, 1}]}],
                        can_use = 1};
get_dress(53121) ->
    #fashion_dress_data{base_id = 53121, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53121, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71041, 1}]}],
                        can_use = 1};
get_dress(53122) ->
    #fashion_dress_data{base_id = 53122, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53122, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71045, 1}]}],
                        can_use = 1};
get_dress(53123) ->
    #fashion_dress_data{base_id = 53123, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53123, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71087, 1}]}],
                        can_use = 1};
get_dress(53125) ->
    #fashion_dress_data{base_id = 53125, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53125, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71113, 1}]}],
                        can_use = 1};
get_dress(53124) ->
    #fashion_dress_data{base_id = 53124, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53124, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71117, 1}]}],
                        can_use = 1};
get_dress(53126) ->
    #fashion_dress_data{base_id = 53126, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53126, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71179, 1}]}],
                        can_use = 1};
get_dress(53127) ->
    #fashion_dress_data{base_id = 53127, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53127, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71217, 1}]}],
                        can_use = 1};
get_dress(53128) ->
    #fashion_dress_data{base_id = 53128, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53128, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71221, 1}]}],
                        can_use = 1};
get_dress(53129) ->
    #fashion_dress_data{base_id = 53129, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53129, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71249, 1}]}],
                        can_use = 1};
get_dress(53130) ->
    #fashion_dress_data{base_id = 53130, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53130, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71311, 1}]}],
                        can_use = 1};
get_dress(53131) ->
    #fashion_dress_data{base_id = 53131, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53131, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71299, 1}]}],
                        can_use = 1};
get_dress(53133) ->
    #fashion_dress_data{base_id = 53133, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53133, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71356, 1}]}],
                        can_use = 1};
get_dress(53132) ->
    #fashion_dress_data{base_id = 53132, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53132, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71360, 1}]}],
                        can_use = 1};
get_dress(53134) ->
    #fashion_dress_data{base_id = 53134, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53134, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71430, 1}]}],
                        can_use = 1};
get_dress(53135) ->
    #fashion_dress_data{base_id = 53135, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53135, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71459, 1}]}],
                        can_use = 1};
get_dress(53136) ->
    #fashion_dress_data{base_id = 53136, type = 6,
                        quality = 3, classes = 0, sex = 1, lev = 1,
                        model_id = 53136, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71482, 1}]}],
                        can_use = 1};
get_dress(53137) ->
    #fashion_dress_data{base_id = 53137, type = 6,
                        quality = 3, classes = 0, sex = 0, lev = 1,
                        model_id = 53137, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71484, 1}]}],
                        can_use = 1};
get_dress(53138) ->
    #fashion_dress_data{base_id = 53138, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53138, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71521, 1}]}],
                        can_use = 1};
get_dress(53139) ->
    #fashion_dress_data{base_id = 53139, type = 6,
                        quality = 3, classes = 0, sex = 2, lev = 1,
                        model_id = 53139, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71557, 1}]}],
                        can_use = 1};
get_dress(10001) ->
    #fashion_dress_data{base_id = 10001, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10001, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10011) ->
    #fashion_dress_data{base_id = 10011, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10001, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10021) ->
    #fashion_dress_data{base_id = 10021, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10001, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10031) ->
    #fashion_dress_data{base_id = 10031, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10001, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10041) ->
    #fashion_dress_data{base_id = 10041, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10006, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10051) ->
    #fashion_dress_data{base_id = 10051, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10006, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10061) ->
    #fashion_dress_data{base_id = 10061, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10006, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10071) ->
    #fashion_dress_data{base_id = 10071, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10006, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10081) ->
    #fashion_dress_data{base_id = 10081, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10005, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10091) ->
    #fashion_dress_data{base_id = 10091, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10005, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10101) ->
    #fashion_dress_data{base_id = 10101, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10101, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10111) ->
    #fashion_dress_data{base_id = 10111, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10101, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10121) ->
    #fashion_dress_data{base_id = 10121, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10101, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10131) ->
    #fashion_dress_data{base_id = 10131, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10101, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10141) ->
    #fashion_dress_data{base_id = 10141, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10106, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10151) ->
    #fashion_dress_data{base_id = 10151, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10106, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10161) ->
    #fashion_dress_data{base_id = 10161, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10106, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10171) ->
    #fashion_dress_data{base_id = 10171, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10106, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10181) ->
    #fashion_dress_data{base_id = 10181, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10102, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10191) ->
    #fashion_dress_data{base_id = 10191, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10102, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10201) ->
    #fashion_dress_data{base_id = 10201, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10201, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10211) ->
    #fashion_dress_data{base_id = 10211, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10201, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10221) ->
    #fashion_dress_data{base_id = 10221, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10201, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10231) ->
    #fashion_dress_data{base_id = 10231, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10201, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10241) ->
    #fashion_dress_data{base_id = 10241, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10206, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10251) ->
    #fashion_dress_data{base_id = 10251, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10206, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10261) ->
    #fashion_dress_data{base_id = 10261, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10206, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10271) ->
    #fashion_dress_data{base_id = 10271, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10206, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10281) ->
    #fashion_dress_data{base_id = 10281, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10207, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10291) ->
    #fashion_dress_data{base_id = 10291, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10207, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10301) ->
    #fashion_dress_data{base_id = 10301, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10301, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10311) ->
    #fashion_dress_data{base_id = 10311, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10301, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10321) ->
    #fashion_dress_data{base_id = 10321, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10301, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10331) ->
    #fashion_dress_data{base_id = 10331, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10301, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10341) ->
    #fashion_dress_data{base_id = 10341, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10306, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10351) ->
    #fashion_dress_data{base_id = 10351, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10306, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10361) ->
    #fashion_dress_data{base_id = 10361, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10306, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10371) ->
    #fashion_dress_data{base_id = 10371, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10306, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10381) ->
    #fashion_dress_data{base_id = 10381, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10307, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10391) ->
    #fashion_dress_data{base_id = 10391, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10307, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10401) ->
    #fashion_dress_data{base_id = 10401, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10401, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10411) ->
    #fashion_dress_data{base_id = 10411, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10401, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10421) ->
    #fashion_dress_data{base_id = 10421, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10401, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10431) ->
    #fashion_dress_data{base_id = 10431, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10401, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10441) ->
    #fashion_dress_data{base_id = 10441, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10406, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10451) ->
    #fashion_dress_data{base_id = 10451, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10406, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10461) ->
    #fashion_dress_data{base_id = 10461, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10406, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10471) ->
    #fashion_dress_data{base_id = 10471, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10406, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10481) ->
    #fashion_dress_data{base_id = 10481, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10407, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10491) ->
    #fashion_dress_data{base_id = 10491, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10407, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10601) ->
    #fashion_dress_data{base_id = 10601, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10501, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10611) ->
    #fashion_dress_data{base_id = 10611, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10501, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10621) ->
    #fashion_dress_data{base_id = 10621, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10501, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10631) ->
    #fashion_dress_data{base_id = 10631, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10501, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10641) ->
    #fashion_dress_data{base_id = 10641, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10502, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10651) ->
    #fashion_dress_data{base_id = 10651, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10502, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10661) ->
    #fashion_dress_data{base_id = 10661, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10502, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10671) ->
    #fashion_dress_data{base_id = 10671, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10502, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10681) ->
    #fashion_dress_data{base_id = 10681, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10503, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10691) ->
    #fashion_dress_data{base_id = 10691, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10503, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12001) ->
    #fashion_dress_data{base_id = 12001, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10005, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12002) ->
    #fashion_dress_data{base_id = 12002, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10102, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12003) ->
    #fashion_dress_data{base_id = 12003, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10207, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12004) ->
    #fashion_dress_data{base_id = 12004, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10307, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12005) ->
    #fashion_dress_data{base_id = 12005, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10407, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12013) ->
    #fashion_dress_data{base_id = 12013, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10503, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12021) ->
    #fashion_dress_data{base_id = 12021, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10005, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12022) ->
    #fashion_dress_data{base_id = 12022, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10102, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12023) ->
    #fashion_dress_data{base_id = 12023, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10207, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12024) ->
    #fashion_dress_data{base_id = 12024, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10307, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12025) ->
    #fashion_dress_data{base_id = 12025, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10407, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12026) ->
    #fashion_dress_data{base_id = 12026, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10503, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11101) ->
    #fashion_dress_data{base_id = 11101, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10010, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11102) ->
    #fashion_dress_data{base_id = 11102, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10011, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11103) ->
    #fashion_dress_data{base_id = 11103, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10012, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11104) ->
    #fashion_dress_data{base_id = 11104, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10013, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11201) ->
    #fashion_dress_data{base_id = 11201, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10109, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11202) ->
    #fashion_dress_data{base_id = 11202, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10111, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11203) ->
    #fashion_dress_data{base_id = 11203, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10110, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11204) ->
    #fashion_dress_data{base_id = 11204, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10112, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11301) ->
    #fashion_dress_data{base_id = 11301, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10210, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11302) ->
    #fashion_dress_data{base_id = 11302, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10211, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11303) ->
    #fashion_dress_data{base_id = 11303, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10212, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11304) ->
    #fashion_dress_data{base_id = 11304, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10213, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11401) ->
    #fashion_dress_data{base_id = 11401, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10310, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11402) ->
    #fashion_dress_data{base_id = 11402, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10309, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11403) ->
    #fashion_dress_data{base_id = 11403, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10308, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11404) ->
    #fashion_dress_data{base_id = 11404, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10311, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11501) ->
    #fashion_dress_data{base_id = 11501, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10410, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11502) ->
    #fashion_dress_data{base_id = 11502, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10411, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11503) ->
    #fashion_dress_data{base_id = 11503, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10412, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11504) ->
    #fashion_dress_data{base_id = 11504, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10413, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11601) ->
    #fashion_dress_data{base_id = 11601, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10504, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11602) ->
    #fashion_dress_data{base_id = 11602, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10505, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11603) ->
    #fashion_dress_data{base_id = 11603, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10506, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11604) ->
    #fashion_dress_data{base_id = 11604, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10507, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12034) ->
    #fashion_dress_data{base_id = 12034, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10014, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29701, 1}]}],
                        attrs = [{4, 20}, {1, 50}], can_use = 1};
get_dress(12035) ->
    #fashion_dress_data{base_id = 12035, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10016, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29702, 1}]}],
                        attrs = [{4, 20}, {1, 50}], can_use = 1};
get_dress(12036) ->
    #fashion_dress_data{base_id = 12036, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10015, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29703, 1}]}],
                        attrs = [{1, 50}, {2, 100}], can_use = 1};
get_dress(12037) ->
    #fashion_dress_data{base_id = 12037, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10114, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29704, 1}]}],
                        attrs = [{5, 15}, {1, 50}], can_use = 1};
get_dress(12038) ->
    #fashion_dress_data{base_id = 12038, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10116, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29705, 1}]}],
                        attrs = [{5, 15}, {1, 50}], can_use = 1};
get_dress(12039) ->
    #fashion_dress_data{base_id = 12039, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10115, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29706, 1}]}],
                        attrs = [{1, 50}, {2, 100}], can_use = 1};
get_dress(12040) ->
    #fashion_dress_data{base_id = 12040, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10214, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29707, 1}]}],
                        attrs = [{4, 20}, {1, 50}], can_use = 1};
get_dress(12041) ->
    #fashion_dress_data{base_id = 12041, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10216, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29708, 1}]}],
                        attrs = [{4, 20}, {1, 50}], can_use = 1};
get_dress(12042) ->
    #fashion_dress_data{base_id = 12042, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10215, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29709, 1}]}],
                        attrs = [{1, 50}, {2, 100}], can_use = 1};
get_dress(12043) ->
    #fashion_dress_data{base_id = 12043, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10314, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29710, 1}]}],
                        attrs = [{7, 15}, {1, 50}], can_use = 1};
get_dress(12044) ->
    #fashion_dress_data{base_id = 12044, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10316, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29711, 1}]}],
                        attrs = [{7, 15}, {1, 50}], can_use = 1};
get_dress(12045) ->
    #fashion_dress_data{base_id = 12045, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10315, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29712, 1}]}],
                        attrs = [{1, 50}, {2, 100}], can_use = 1};
get_dress(12046) ->
    #fashion_dress_data{base_id = 12046, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10414, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29713, 1}]}],
                        attrs = [{7, 15}, {1, 50}], can_use = 1};
get_dress(12047) ->
    #fashion_dress_data{base_id = 12047, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10416, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29714, 1}]}],
                        attrs = [{7, 15}, {1, 50}], can_use = 1};
get_dress(12048) ->
    #fashion_dress_data{base_id = 12048, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10415, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29715, 1}]}],
                        attrs = [{1, 50}, {2, 100}], can_use = 1};
get_dress(12049) ->
    #fashion_dress_data{base_id = 12049, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10514, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29716, 1}]}],
                        attrs = [{5, 15}, {1, 50}], can_use = 1};
get_dress(12050) ->
    #fashion_dress_data{base_id = 12050, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10516, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29717, 1}]}],
                        attrs = [{5, 15}, {1, 50}], can_use = 1};
get_dress(12051) ->
    #fashion_dress_data{base_id = 12051, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10515, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29718, 1}]}],
                        attrs = [{1, 50}, {2, 100}], can_use = 1};
get_dress(12060) ->
    #fashion_dress_data{base_id = 12060, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10017, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29740, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12061) ->
    #fashion_dress_data{base_id = 12061, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10117, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29741, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12062) ->
    #fashion_dress_data{base_id = 12062, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10217, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29742, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12063) ->
    #fashion_dress_data{base_id = 12063, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10317, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29743, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12064) ->
    #fashion_dress_data{base_id = 12064, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10417, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29744, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12065) ->
    #fashion_dress_data{base_id = 12065, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10517, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29745, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12070) ->
    #fashion_dress_data{base_id = 12070, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10018, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29760, 1}]}],
                        attrs = [{6, 10}, {7, 8}], can_use = 1};
get_dress(12071) ->
    #fashion_dress_data{base_id = 12071, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10118, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29761, 1}]}],
                        attrs = [{6, 10}, {7, 8}], can_use = 1};
get_dress(12072) ->
    #fashion_dress_data{base_id = 12072, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10218, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29762, 1}]}],
                        attrs = [{6, 10}, {7, 8}], can_use = 1};
get_dress(12073) ->
    #fashion_dress_data{base_id = 12073, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10318, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29763, 1}]}],
                        attrs = [{6, 10}, {7, 8}], can_use = 1};
get_dress(12074) ->
    #fashion_dress_data{base_id = 12074, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10418, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29764, 1}]}],
                        attrs = [{6, 10}, {7, 8}], can_use = 1};
get_dress(12075) ->
    #fashion_dress_data{base_id = 12075, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10518, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29765, 1}]}],
                        attrs = [{6, 10}, {7, 8}], can_use = 1};
get_dress(10701) ->
    #fashion_dress_data{base_id = 10701, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10701, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10711) ->
    #fashion_dress_data{base_id = 10711, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10701, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10721) ->
    #fashion_dress_data{base_id = 10721, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10701, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10731) ->
    #fashion_dress_data{base_id = 10731, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10701, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10741) ->
    #fashion_dress_data{base_id = 10741, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10702, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10751) ->
    #fashion_dress_data{base_id = 10751, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10702, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10761) ->
    #fashion_dress_data{base_id = 10761, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10702, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10771) ->
    #fashion_dress_data{base_id = 10771, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10702, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10781) ->
    #fashion_dress_data{base_id = 10781, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10703, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(10791) ->
    #fashion_dress_data{base_id = 10791, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10703, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12014) ->
    #fashion_dress_data{base_id = 12014, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10703, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12020) ->
    #fashion_dress_data{base_id = 12020, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10703, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11701) ->
    #fashion_dress_data{base_id = 11701, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10704, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11702) ->
    #fashion_dress_data{base_id = 11702, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10705, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11703) ->
    #fashion_dress_data{base_id = 11703, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10707, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(11704) ->
    #fashion_dress_data{base_id = 11704, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10706, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12076) ->
    #fashion_dress_data{base_id = 12076, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10708, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29738, 1}]}],
                        attrs = [{4, 20}, {1, 50}], can_use = 1};
get_dress(12077) ->
    #fashion_dress_data{base_id = 12077, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10709, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29739, 1}]}],
                        attrs = [{4, 20}, {1, 50}], can_use = 1};
get_dress(12078) ->
    #fashion_dress_data{base_id = 12078, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10710, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29776, 1}]}],
                        attrs = [{1, 50}, {2, 100}], can_use = 1};
get_dress(12079) ->
    #fashion_dress_data{base_id = 12079, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10712, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29779, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12080) ->
    #fashion_dress_data{base_id = 12080, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10711, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29781, 1}]}],
                        attrs = [{6, 10}, {7, 8}], can_use = 1};
get_dress(12081) ->
    #fashion_dress_data{base_id = 12081, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10019, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29783, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12082) ->
    #fashion_dress_data{base_id = 12082, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10119, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29784, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12083) ->
    #fashion_dress_data{base_id = 12083, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10219, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29785, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12084) ->
    #fashion_dress_data{base_id = 12084, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10319, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29786, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12085) ->
    #fashion_dress_data{base_id = 12085, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10419, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29787, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12086) ->
    #fashion_dress_data{base_id = 12086, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10519, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29788, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12087) ->
    #fashion_dress_data{base_id = 12087, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10713, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{29789, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12088) ->
    #fashion_dress_data{base_id = 12088, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10020, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70113, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12089) ->
    #fashion_dress_data{base_id = 12089, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10120, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70114, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12090) ->
    #fashion_dress_data{base_id = 12090, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10220, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70115, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12091) ->
    #fashion_dress_data{base_id = 12091, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10320, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70116, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12092) ->
    #fashion_dress_data{base_id = 12092, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10420, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70117, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12093) ->
    #fashion_dress_data{base_id = 12093, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10520, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70118, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12094) ->
    #fashion_dress_data{base_id = 12094, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10714, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70119, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12114) ->
    #fashion_dress_data{base_id = 12114, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10021, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70310, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12115) ->
    #fashion_dress_data{base_id = 12115, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10121, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70311, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12116) ->
    #fashion_dress_data{base_id = 12116, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10221, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70312, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12117) ->
    #fashion_dress_data{base_id = 12117, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10321, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70313, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12118) ->
    #fashion_dress_data{base_id = 12118, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10421, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70314, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12119) ->
    #fashion_dress_data{base_id = 12119, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10521, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70315, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12120) ->
    #fashion_dress_data{base_id = 12120, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10715, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70316, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12121) ->
    #fashion_dress_data{base_id = 12121, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10022, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70379, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12122) ->
    #fashion_dress_data{base_id = 12122, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10122, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70380, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12123) ->
    #fashion_dress_data{base_id = 12123, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10222, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70381, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12124) ->
    #fashion_dress_data{base_id = 12124, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10322, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70382, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12125) ->
    #fashion_dress_data{base_id = 12125, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10422, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70383, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12126) ->
    #fashion_dress_data{base_id = 12126, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10522, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70384, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12127) ->
    #fashion_dress_data{base_id = 12127, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10716, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70385, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12128) ->
    #fashion_dress_data{base_id = 12128, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10023, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70537, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12129) ->
    #fashion_dress_data{base_id = 12129, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10123, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70538, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12130) ->
    #fashion_dress_data{base_id = 12130, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10223, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70539, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12131) ->
    #fashion_dress_data{base_id = 12131, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10323, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70540, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12132) ->
    #fashion_dress_data{base_id = 12132, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10423, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70541, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12133) ->
    #fashion_dress_data{base_id = 12133, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10523, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70542, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12134) ->
    #fashion_dress_data{base_id = 12134, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10717, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70543, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12135) ->
    #fashion_dress_data{base_id = 12135, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10024, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70675, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12136) ->
    #fashion_dress_data{base_id = 12136, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10124, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70676, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12137) ->
    #fashion_dress_data{base_id = 12137, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10224, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70677, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12138) ->
    #fashion_dress_data{base_id = 12138, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10324, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70678, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12139) ->
    #fashion_dress_data{base_id = 12139, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10424, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70679, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12140) ->
    #fashion_dress_data{base_id = 12140, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10524, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70680, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12141) ->
    #fashion_dress_data{base_id = 12141, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10718, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70681, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12142) ->
    #fashion_dress_data{base_id = 12142, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10026, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70780, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12143) ->
    #fashion_dress_data{base_id = 12143, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10125, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70781, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12144) ->
    #fashion_dress_data{base_id = 12144, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10225, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70782, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12145) ->
    #fashion_dress_data{base_id = 12145, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10325, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70783, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12146) ->
    #fashion_dress_data{base_id = 12146, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10425, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70784, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12147) ->
    #fashion_dress_data{base_id = 12147, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10525, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70785, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12148) ->
    #fashion_dress_data{base_id = 12148, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10719, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70786, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12149) ->
    #fashion_dress_data{base_id = 12149, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10027, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70854, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12150) ->
    #fashion_dress_data{base_id = 12150, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10126, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70855, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12151) ->
    #fashion_dress_data{base_id = 12151, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10226, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70856, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12152) ->
    #fashion_dress_data{base_id = 12152, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10326, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70857, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12153) ->
    #fashion_dress_data{base_id = 12153, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10426, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70858, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12154) ->
    #fashion_dress_data{base_id = 12154, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10526, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70859, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12155) ->
    #fashion_dress_data{base_id = 12155, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10720, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70860, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12156) ->
    #fashion_dress_data{base_id = 12156, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10028, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70969, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12157) ->
    #fashion_dress_data{base_id = 12157, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10127, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70970, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12158) ->
    #fashion_dress_data{base_id = 12158, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10227, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70971, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12159) ->
    #fashion_dress_data{base_id = 12159, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10327, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70972, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12160) ->
    #fashion_dress_data{base_id = 12160, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10427, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70973, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12161) ->
    #fashion_dress_data{base_id = 12161, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10527, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70974, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12162) ->
    #fashion_dress_data{base_id = 12162, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10721, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{70975, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12163) ->
    #fashion_dress_data{base_id = 12163, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10029, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71128, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12164) ->
    #fashion_dress_data{base_id = 12164, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10128, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71129, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12165) ->
    #fashion_dress_data{base_id = 12165, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10228, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71130, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12166) ->
    #fashion_dress_data{base_id = 12166, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10328, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71131, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12167) ->
    #fashion_dress_data{base_id = 12167, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10428, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71132, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12168) ->
    #fashion_dress_data{base_id = 12168, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10528, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71133, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12169) ->
    #fashion_dress_data{base_id = 12169, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10722, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71134, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12170) ->
    #fashion_dress_data{base_id = 12170, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10030, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71232, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12171) ->
    #fashion_dress_data{base_id = 12171, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10129, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71233, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12172) ->
    #fashion_dress_data{base_id = 12172, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10229, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71234, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12173) ->
    #fashion_dress_data{base_id = 12173, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10329, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71235, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12174) ->
    #fashion_dress_data{base_id = 12174, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10429, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71236, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12175) ->
    #fashion_dress_data{base_id = 12175, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10529, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71237, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12176) ->
    #fashion_dress_data{base_id = 12176, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10723, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71238, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12177) ->
    #fashion_dress_data{base_id = 12177, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10031, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71371, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12178) ->
    #fashion_dress_data{base_id = 12178, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10130, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71372, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12179) ->
    #fashion_dress_data{base_id = 12179, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10230, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71373, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12180) ->
    #fashion_dress_data{base_id = 12180, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10330, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71374, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12181) ->
    #fashion_dress_data{base_id = 12181, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10430, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71375, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12182) ->
    #fashion_dress_data{base_id = 12182, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10530, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71376, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12183) ->
    #fashion_dress_data{base_id = 12183, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10724, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71377, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12184) ->
    #fashion_dress_data{base_id = 12184, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10032, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71491, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12185) ->
    #fashion_dress_data{base_id = 12185, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10131, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71492, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12186) ->
    #fashion_dress_data{base_id = 12186, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10231, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71493, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12187) ->
    #fashion_dress_data{base_id = 12187, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10331, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71494, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12188) ->
    #fashion_dress_data{base_id = 12188, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10431, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71495, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12189) ->
    #fashion_dress_data{base_id = 12189, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10531, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71496, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12190) ->
    #fashion_dress_data{base_id = 12190, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10725, is_origin = 0,
                        loss =
                            [#loss{label = item_base_id, val = [{71497, 1}]}],
                        attrs = [{1, 20}, {2, 40}], can_use = 1};
get_dress(12100) ->
    #fashion_dress_data{base_id = 12100, type = 1,
                        quality = 3, classes = 1, sex = 2, lev = 1,
                        model_id = 10005, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12101) ->
    #fashion_dress_data{base_id = 12101, type = 1,
                        quality = 3, classes = 2, sex = 2, lev = 1,
                        model_id = 10102, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12102) ->
    #fashion_dress_data{base_id = 12102, type = 1,
                        quality = 3, classes = 3, sex = 2, lev = 1,
                        model_id = 10207, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12103) ->
    #fashion_dress_data{base_id = 12103, type = 1,
                        quality = 3, classes = 4, sex = 2, lev = 1,
                        model_id = 10307, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12104) ->
    #fashion_dress_data{base_id = 12104, type = 1,
                        quality = 3, classes = 5, sex = 2, lev = 1,
                        model_id = 10407, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12105) ->
    #fashion_dress_data{base_id = 12105, type = 1,
                        quality = 3, classes = 6, sex = 2, lev = 1,
                        model_id = 10503, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(12106) ->
    #fashion_dress_data{base_id = 12106, type = 1,
                        quality = 3, classes = 7, sex = 2, lev = 1,
                        model_id = 10703, is_origin = 0, loss = [],
                        can_use = 0};
get_dress(_BaseId) -> none.

get_time(1) ->
    #fashion_time_data{id = 1, expire_type = 5,
                       expire_time = 3};
get_time(2) ->
    #fashion_time_data{id = 2, expire_type = 5,
                       expire_time = 4};
get_time(3) ->
    #fashion_time_data{id = 3, expire_type = 5,
                       expire_time = 5};
get_time(4) ->
    #fashion_time_data{id = 4, expire_type = 5,
                       expire_time = 5184000};
get_time(5) ->
    #fashion_time_data{id = 5, expire_type = 5,
                       expire_time = 21600};
get_time(6) ->
    #fashion_time_data{id = 6, expire_type = 5,
                       expire_time = 4320};
get_time(7) ->
    #fashion_time_data{id = 7, expire_type = 5,
                       expire_time = 10080};
get_time(8) ->
    #fashion_time_data{id = 8, expire_type = 5,
                       expire_time = 259200};
get_time(9) ->
    #fashion_time_data{id = 9, expire_type = 5,
                       expire_time = 14400};
get_time(10) ->
    #fashion_time_data{id = 10, expire_type = 5,
                       expire_time = 129600};
get_time(11) ->
    #fashion_time_data{id = 11, expire_type = 5,
                       expire_time = 86400};
get_time(12) ->
    #fashion_time_data{id = 12, expire_type = 5,
                       expire_time = 43200};
get_time(13) ->
    #fashion_time_data{id = 13, expire_type = 0,
                       expire_time = 0};
get_time(14) ->
    #fashion_time_data{id = 14, expire_type = 5,
                       expire_time = 216000};
get_time(15) ->
    #fashion_time_data{id = 15, expire_type = 5,
                       expire_time = 2160};
get_time(16) ->
    #fashion_time_data{id = 16, expire_type = 5,
                       expire_time = 7200};
get_time(_Id) -> none.

get_dyeing({0, 1, 1, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 1,
      sex => 1, type => 2, model_id => 50001,
      skin_id => 5000101, loss => [], change_loss => []};
get_dyeing({1001, 1, 1, 2}) ->
    #{id => 1001, name => lang:get("魅力银"), classes => 1,
      sex => 1, type => 2, model_id => 50001,
      skin_id => 5000102,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1002, 1, 1, 2}) ->
    #{id => 1002, name => lang:get("神秘黑"), classes => 1,
      sex => 1, type => 2, model_id => 50001,
      skin_id => 5000103,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1003, 1, 1, 2}) ->
    #{id => 1003, name => lang:get("高贵金"), classes => 1,
      sex => 1, type => 2, model_id => 50001,
      skin_id => 5000104,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1004, 1, 1, 2}) ->
    #{id => 1004, name => lang:get("刺客红"), classes => 1,
      sex => 1, type => 2, model_id => 50001,
      skin_id => 5000105,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1005, 1, 1, 2}) ->
    #{id => 1005, name => lang:get("海洋紫"), classes => 1,
      sex => 1, type => 2, model_id => 50001,
      skin_id => 5000106,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 1, 0, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 1,
      sex => 0, type => 2, model_id => 50002,
      skin_id => 5000201, loss => [], change_loss => []};
get_dyeing({1007, 1, 0, 2}) ->
    #{id => 1007, name => lang:get("光耀金"), classes => 1,
      sex => 0, type => 2, model_id => 50002,
      skin_id => 5000202,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1008, 1, 0, 2}) ->
    #{id => 1008, name => lang:get("紫罗兰"), classes => 1,
      sex => 0, type => 2, model_id => 50002,
      skin_id => 5000203,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1009, 1, 0, 2}) ->
    #{id => 1009, name => lang:get("幻想红"), classes => 1,
      sex => 0, type => 2, model_id => 50002,
      skin_id => 5000204,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1010, 1, 0, 2}) ->
    #{id => 1010, name => lang:get("俏皮蓝"), classes => 1,
      sex => 0, type => 2, model_id => 50002,
      skin_id => 5000205,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1011, 1, 0, 2}) ->
    #{id => 1011, name => lang:get("典雅黑"), classes => 1,
      sex => 0, type => 2, model_id => 50002,
      skin_id => 5000206,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 2, 1, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 2,
      sex => 1, type => 2, model_id => 50003,
      skin_id => 5000301, loss => [], change_loss => []};
get_dyeing({1013, 2, 1, 2}) ->
    #{id => 1013, name => lang:get("神秘黑"), classes => 2,
      sex => 1, type => 2, model_id => 50003,
      skin_id => 5000302,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1014, 2, 1, 2}) ->
    #{id => 1014, name => lang:get("深空银"), classes => 2,
      sex => 1, type => 2, model_id => 50003,
      skin_id => 5000303,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1015, 2, 1, 2}) ->
    #{id => 1015, name => lang:get("幻想红"), classes => 2,
      sex => 1, type => 2, model_id => 50003,
      skin_id => 5000304,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1016, 2, 1, 2}) ->
    #{id => 1016, name => lang:get("高贵金"), classes => 2,
      sex => 1, type => 2, model_id => 50003,
      skin_id => 5000305,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1017, 2, 1, 2}) ->
    #{id => 1017, name => lang:get("儒雅紫"), classes => 2,
      sex => 1, type => 2, model_id => 50003,
      skin_id => 5000306,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 2, 0, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 2,
      sex => 0, type => 2, model_id => 50004,
      skin_id => 5000401, loss => [], change_loss => []};
get_dyeing({1019, 2, 0, 2}) ->
    #{id => 1019, name => lang:get("光耀金"), classes => 2,
      sex => 0, type => 2, model_id => 50004,
      skin_id => 5000402,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1020, 2, 0, 2}) ->
    #{id => 1020, name => lang:get("海洋蓝"), classes => 2,
      sex => 0, type => 2, model_id => 50004,
      skin_id => 5000403,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1021, 2, 0, 2}) ->
    #{id => 1021, name => lang:get("幻想红"), classes => 2,
      sex => 0, type => 2, model_id => 50004,
      skin_id => 5000404,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1022, 2, 0, 2}) ->
    #{id => 1022, name => lang:get("炫目银"), classes => 2,
      sex => 0, type => 2, model_id => 50004,
      skin_id => 5000405,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1023, 2, 0, 2}) ->
    #{id => 1023, name => lang:get("典雅黑"), classes => 2,
      sex => 0, type => 2, model_id => 50004,
      skin_id => 5000406,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 3, 1, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 3,
      sex => 1, type => 2, model_id => 50005,
      skin_id => 5000501, loss => [], change_loss => []};
get_dyeing({1025, 3, 1, 2}) ->
    #{id => 1025, name => lang:get("灵巧红"), classes => 3,
      sex => 1, type => 2, model_id => 50005,
      skin_id => 5000502,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1026, 3, 1, 2}) ->
    #{id => 1026, name => lang:get("神秘黑"), classes => 3,
      sex => 1, type => 2, model_id => 50005,
      skin_id => 5000503,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1027, 3, 1, 2}) ->
    #{id => 1027, name => lang:get("自由绿"), classes => 3,
      sex => 1, type => 2, model_id => 50005,
      skin_id => 5000504,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1028, 3, 1, 2}) ->
    #{id => 1028, name => lang:get("幻想橙"), classes => 3,
      sex => 1, type => 2, model_id => 50005,
      skin_id => 5000505,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1029, 3, 1, 2}) ->
    #{id => 1029, name => lang:get("儒雅紫"), classes => 3,
      sex => 1, type => 2, model_id => 50005,
      skin_id => 5000506,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 3, 0, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 3,
      sex => 0, type => 2, model_id => 50006,
      skin_id => 5000601, loss => [], change_loss => []};
get_dyeing({1031, 3, 0, 2}) ->
    #{id => 1031, name => lang:get("神秘黑"), classes => 3,
      sex => 0, type => 2, model_id => 50006,
      skin_id => 5000602,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1032, 3, 0, 2}) ->
    #{id => 1032, name => lang:get("光耀金"), classes => 3,
      sex => 0, type => 2, model_id => 50006,
      skin_id => 5000603,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1033, 3, 0, 2}) ->
    #{id => 1033, name => lang:get("娇俏粉"), classes => 3,
      sex => 0, type => 2, model_id => 50006,
      skin_id => 5000604,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1034, 3, 0, 2}) ->
    #{id => 1034, name => lang:get("紫罗兰"), classes => 3,
      sex => 0, type => 2, model_id => 50006,
      skin_id => 5000605,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1035, 3, 0, 2}) ->
    #{id => 1035, name => lang:get("活力橙"), classes => 3,
      sex => 0, type => 2, model_id => 50006,
      skin_id => 5000606,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 4, 1, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 4,
      sex => 1, type => 2, model_id => 50007,
      skin_id => 5000701, loss => [], change_loss => []};
get_dyeing({1037, 4, 1, 2}) ->
    #{id => 1037, name => lang:get("珍珠白"), classes => 4,
      sex => 1, type => 2, model_id => 50007,
      skin_id => 5000702,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1038, 4, 1, 2}) ->
    #{id => 1038, name => lang:get("活力绿"), classes => 4,
      sex => 1, type => 2, model_id => 50007,
      skin_id => 5000703,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1039, 4, 1, 2}) ->
    #{id => 1039, name => lang:get("自由橙"), classes => 4,
      sex => 1, type => 2, model_id => 50007,
      skin_id => 5000704,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1040, 4, 1, 2}) ->
    #{id => 1040, name => lang:get("星空蓝"), classes => 4,
      sex => 1, type => 2, model_id => 50007,
      skin_id => 5000705,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1041, 4, 1, 2}) ->
    #{id => 1041, name => lang:get("幻想粉"), classes => 4,
      sex => 1, type => 2, model_id => 50007,
      skin_id => 5000706,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 4, 0, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 4,
      sex => 0, type => 2, model_id => 50008,
      skin_id => 5000801, loss => [], change_loss => []};
get_dyeing({1043, 4, 0, 2}) ->
    #{id => 1043, name => lang:get("珍珠白"), classes => 4,
      sex => 0, type => 2, model_id => 50008,
      skin_id => 5000802,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1044, 4, 0, 2}) ->
    #{id => 1044, name => lang:get("活力绿"), classes => 4,
      sex => 0, type => 2, model_id => 50008,
      skin_id => 5000803,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1045, 4, 0, 2}) ->
    #{id => 1045, name => lang:get("自由橙"), classes => 4,
      sex => 0, type => 2, model_id => 50008,
      skin_id => 5000804,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1046, 4, 0, 2}) ->
    #{id => 1046, name => lang:get("幻想蓝"), classes => 4,
      sex => 0, type => 2, model_id => 50008,
      skin_id => 5000805,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1047, 4, 0, 2}) ->
    #{id => 1047, name => lang:get("娇俏粉"), classes => 4,
      sex => 0, type => 2, model_id => 50008,
      skin_id => 5000806,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 5, 1, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 5,
      sex => 1, type => 2, model_id => 50009,
      skin_id => 5000901, loss => [], change_loss => []};
get_dyeing({1049, 5, 1, 2}) ->
    #{id => 1049, name => lang:get("经典红"), classes => 5,
      sex => 1, type => 2, model_id => 50009,
      skin_id => 5000902,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1050, 5, 1, 2}) ->
    #{id => 1050, name => lang:get("儒雅紫"), classes => 5,
      sex => 1, type => 2, model_id => 50009,
      skin_id => 5000903,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1051, 5, 1, 2}) ->
    #{id => 1051, name => lang:get("活力金"), classes => 5,
      sex => 1, type => 2, model_id => 50009,
      skin_id => 5000904,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1052, 5, 1, 2}) ->
    #{id => 1052, name => lang:get("深空蓝"), classes => 5,
      sex => 1, type => 2, model_id => 50009,
      skin_id => 5000905,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1053, 5, 1, 2}) ->
    #{id => 1053, name => lang:get("高冷银"), classes => 5,
      sex => 1, type => 2, model_id => 50009,
      skin_id => 5000906,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 5, 0, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 5,
      sex => 0, type => 2, model_id => 50010,
      skin_id => 5001001, loss => [], change_loss => []};
get_dyeing({1055, 5, 0, 2}) ->
    #{id => 1055, name => lang:get("典雅紫"), classes => 5,
      sex => 0, type => 2, model_id => 50010,
      skin_id => 5001002,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1056, 5, 0, 2}) ->
    #{id => 1056, name => lang:get("娇俏粉"), classes => 5,
      sex => 0, type => 2, model_id => 50010,
      skin_id => 5001003,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 16}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1057, 5, 0, 2}) ->
    #{id => 1057, name => lang:get("幻想红"), classes => 5,
      sex => 0, type => 2, model_id => 50010,
      skin_id => 5001004,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1058, 5, 0, 2}) ->
    #{id => 1058, name => lang:get("自由金"), classes => 5,
      sex => 0, type => 2, model_id => 50010,
      skin_id => 5001005,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1059, 5, 0, 2}) ->
    #{id => 1059, name => lang:get("海洋蓝"), classes => 5,
      sex => 0, type => 2, model_id => 50010,
      skin_id => 5001006,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 6, 1, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 6,
      sex => 1, type => 2, model_id => 50071,
      skin_id => 5007101, loss => [], change_loss => []};
get_dyeing({1061, 6, 1, 2}) ->
    #{id => 1061, name => lang:get("高雅白"), classes => 6,
      sex => 1, type => 2, model_id => 50071,
      skin_id => 5007102,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1062, 6, 1, 2}) ->
    #{id => 1062, name => lang:get("冷酷紫"), classes => 6,
      sex => 1, type => 2, model_id => 50071,
      skin_id => 5007103,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 16}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1063, 6, 1, 2}) ->
    #{id => 1063, name => lang:get("幻想粉"), classes => 6,
      sex => 1, type => 2, model_id => 50071,
      skin_id => 5007104,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1064, 6, 1, 2}) ->
    #{id => 1064, name => lang:get("自由金"), classes => 6,
      sex => 1, type => 2, model_id => 50071,
      skin_id => 5007105,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1065, 6, 1, 2}) ->
    #{id => 1065, name => lang:get("胭脂红"), classes => 6,
      sex => 1, type => 2, model_id => 50071,
      skin_id => 5007106,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 6, 0, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 6,
      sex => 0, type => 2, model_id => 50070,
      skin_id => 5007001, loss => [], change_loss => []};
get_dyeing({1067, 6, 0, 2}) ->
    #{id => 1067, name => lang:get("经典红"), classes => 6,
      sex => 0, type => 2, model_id => 50070,
      skin_id => 5007002,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1068, 6, 0, 2}) ->
    #{id => 1068, name => lang:get("儒雅紫"), classes => 6,
      sex => 0, type => 2, model_id => 50070,
      skin_id => 5007003,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1069, 6, 0, 2}) ->
    #{id => 1069, name => lang:get("高冷银"), classes => 6,
      sex => 0, type => 2, model_id => 50070,
      skin_id => 5007004,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1070, 6, 0, 2}) ->
    #{id => 1070, name => lang:get("活力金"), classes => 6,
      sex => 0, type => 2, model_id => 50070,
      skin_id => 5007005,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1071, 6, 0, 2}) ->
    #{id => 1071, name => lang:get("深空蓝"), classes => 6,
      sex => 0, type => 2, model_id => 50070,
      skin_id => 5007006,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 7, 1, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 7,
      sex => 1, type => 2, model_id => 50013,
      skin_id => 5001301, loss => [], change_loss => []};
get_dyeing({1073, 7, 1, 2}) ->
    #{id => 1073, name => lang:get("神秘黑"), classes => 7,
      sex => 1, type => 2, model_id => 50013,
      skin_id => 5001302,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1074, 7, 1, 2}) ->
    #{id => 1074, name => lang:get("幻想红"), classes => 7,
      sex => 1, type => 2, model_id => 50013,
      skin_id => 5001303,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 16}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1075, 7, 1, 2}) ->
    #{id => 1075, name => lang:get("高雅白"), classes => 7,
      sex => 1, type => 2, model_id => 50013,
      skin_id => 5001304,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1076, 7, 1, 2}) ->
    #{id => 1076, name => lang:get("海洋蓝"), classes => 7,
      sex => 1, type => 2, model_id => 50013,
      skin_id => 5001305,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1077, 7, 1, 2}) ->
    #{id => 1077, name => lang:get("儒雅紫"), classes => 7,
      sex => 1, type => 2, model_id => 50013,
      skin_id => 5001306,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 7, 0, 2}) ->
    #{id => 0, name => lang:get("初始色"), classes => 7,
      sex => 0, type => 2, model_id => 50012,
      skin_id => 5001201, loss => [], change_loss => []};
get_dyeing({1079, 7, 0, 2}) ->
    #{id => 1079, name => lang:get("性感黑"), classes => 7,
      sex => 0, type => 2, model_id => 50012,
      skin_id => 5001202,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 15}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1080, 7, 0, 2}) ->
    #{id => 1080, name => lang:get("娇俏红"), classes => 7,
      sex => 0, type => 2, model_id => 50012,
      skin_id => 5001203,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1081, 7, 0, 2}) ->
    #{id => 1081, name => lang:get("珍珠白"), classes => 7,
      sex => 0, type => 2, model_id => 50012,
      skin_id => 5001204,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1082, 7, 0, 2}) ->
    #{id => 1082, name => lang:get("海洋蓝"), classes => 7,
      sex => 0, type => 2, model_id => 50012,
      skin_id => 5001205,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 5}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({1083, 7, 0, 2}) ->
    #{id => 1083, name => lang:get("典雅紫"), classes => 7,
      sex => 0, type => 2, model_id => 50012,
      skin_id => 5001206,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 1, 1, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 1,
      sex => 1, type => 3, model_id => 51001,
      skin_id => 5100101, loss => [], change_loss => []};
get_dyeing({2001, 1, 1, 3}) ->
    #{id => 2001, name => lang:get("神秘黑"), classes => 1,
      sex => 1, type => 3, model_id => 51001,
      skin_id => 5100102,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2002, 1, 1, 3}) ->
    #{id => 2002, name => lang:get("儒雅蓝"), classes => 1,
      sex => 1, type => 3, model_id => 51001,
      skin_id => 5100103,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2003, 1, 1, 3}) ->
    #{id => 2003, name => lang:get("陨石银"), classes => 1,
      sex => 1, type => 3, model_id => 51001,
      skin_id => 5100104,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2004, 1, 1, 3}) ->
    #{id => 2004, name => lang:get("高贵金"), classes => 1,
      sex => 1, type => 3, model_id => 51001,
      skin_id => 5100105,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2005, 1, 1, 3}) ->
    #{id => 2005, name => lang:get("刺客红"), classes => 1,
      sex => 1, type => 3, model_id => 51001,
      skin_id => 5100106,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 1, 0, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 1,
      sex => 0, type => 3, model_id => 51002,
      skin_id => 5100201, loss => [], change_loss => []};
get_dyeing({2007, 1, 0, 3}) ->
    #{id => 2007, name => lang:get("典雅白"), classes => 1,
      sex => 0, type => 3, model_id => 51002,
      skin_id => 5100202,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2008, 1, 0, 3}) ->
    #{id => 2008, name => lang:get("紫罗兰"), classes => 1,
      sex => 0, type => 3, model_id => 51002,
      skin_id => 5100203,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2009, 1, 0, 3}) ->
    #{id => 2009, name => lang:get("神秘黑"), classes => 1,
      sex => 0, type => 3, model_id => 51002,
      skin_id => 5100204,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2010, 1, 0, 3}) ->
    #{id => 2010, name => lang:get("高贵金"), classes => 1,
      sex => 0, type => 3, model_id => 51002,
      skin_id => 5100205,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2011, 1, 0, 3}) ->
    #{id => 2011, name => lang:get("幻想红"), classes => 1,
      sex => 0, type => 3, model_id => 51002,
      skin_id => 5100206,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 2, 1, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 2,
      sex => 1, type => 3, model_id => 51003,
      skin_id => 5100301, loss => [], change_loss => []};
get_dyeing({2013, 2, 1, 3}) ->
    #{id => 2013, name => lang:get("幻想红"), classes => 2,
      sex => 1, type => 3, model_id => 51003,
      skin_id => 5100302,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2014, 2, 1, 3}) ->
    #{id => 2014, name => lang:get("儒雅白"), classes => 2,
      sex => 1, type => 3, model_id => 51003,
      skin_id => 5100303,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2015, 2, 1, 3}) ->
    #{id => 2015, name => lang:get("高贵金"), classes => 2,
      sex => 1, type => 3, model_id => 51003,
      skin_id => 5100304,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2016, 2, 1, 3}) ->
    #{id => 2016, name => lang:get("海洋蓝"), classes => 2,
      sex => 1, type => 3, model_id => 51003,
      skin_id => 5100305,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2017, 2, 1, 3}) ->
    #{id => 2017, name => lang:get("神秘黑"), classes => 2,
      sex => 1, type => 3, model_id => 51003,
      skin_id => 5100306,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 2, 0, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 2,
      sex => 0, type => 3, model_id => 51004,
      skin_id => 5100401, loss => [], change_loss => []};
get_dyeing({2019, 2, 0, 3}) ->
    #{id => 2019, name => lang:get("赤霞红"), classes => 2,
      sex => 0, type => 3, model_id => 51004,
      skin_id => 5100402,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2020, 2, 0, 3}) ->
    #{id => 2020, name => lang:get("典雅白"), classes => 2,
      sex => 0, type => 3, model_id => 51004,
      skin_id => 5100403,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2021, 2, 0, 3}) ->
    #{id => 2021, name => lang:get("紫罗兰"), classes => 2,
      sex => 0, type => 3, model_id => 51004,
      skin_id => 5100404,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2022, 2, 0, 3}) ->
    #{id => 2022, name => lang:get("高贵金"), classes => 2,
      sex => 0, type => 3, model_id => 51004,
      skin_id => 5100405,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2023, 2, 0, 3}) ->
    #{id => 2023, name => lang:get("活力绿"), classes => 2,
      sex => 0, type => 3, model_id => 51004,
      skin_id => 5100406,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 3, 1, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 3,
      sex => 1, type => 3, model_id => 51005,
      skin_id => 5100501, loss => [], change_loss => []};
get_dyeing({2025, 3, 1, 3}) ->
    #{id => 2025, name => lang:get("神秘黑"), classes => 3,
      sex => 1, type => 3, model_id => 51005,
      skin_id => 5100502,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2026, 3, 1, 3}) ->
    #{id => 2026, name => lang:get("幻想橙"), classes => 3,
      sex => 1, type => 3, model_id => 51005,
      skin_id => 5100503,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2027, 3, 1, 3}) ->
    #{id => 2027, name => lang:get("深空银"), classes => 3,
      sex => 1, type => 3, model_id => 51005,
      skin_id => 5100504,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2028, 3, 1, 3}) ->
    #{id => 2028, name => lang:get("高贵金"), classes => 3,
      sex => 1, type => 3, model_id => 51005,
      skin_id => 5100505,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2029, 3, 1, 3}) ->
    #{id => 2029, name => lang:get("儒雅蓝"), classes => 3,
      sex => 1, type => 3, model_id => 51005,
      skin_id => 5100506,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 3, 0, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 3,
      sex => 0, type => 3, model_id => 51006,
      skin_id => 5100601, loss => [], change_loss => []};
get_dyeing({2031, 3, 0, 3}) ->
    #{id => 2031, name => lang:get("神秘黑"), classes => 3,
      sex => 0, type => 3, model_id => 51006,
      skin_id => 5100602,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2032, 3, 0, 3}) ->
    #{id => 2032, name => lang:get("紫罗兰"), classes => 3,
      sex => 0, type => 3, model_id => 51006,
      skin_id => 5100603,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2033, 3, 0, 3}) ->
    #{id => 2033, name => lang:get("幻想银"), classes => 3,
      sex => 0, type => 3, model_id => 51006,
      skin_id => 5100604,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2034, 3, 0, 3}) ->
    #{id => 2034, name => lang:get("活力青"), classes => 3,
      sex => 0, type => 3, model_id => 51006,
      skin_id => 5100605,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2035, 3, 0, 3}) ->
    #{id => 2035, name => lang:get("高贵金"), classes => 3,
      sex => 0, type => 3, model_id => 51006,
      skin_id => 5100606,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 4, 1, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 4,
      sex => 1, type => 3, model_id => 51007,
      skin_id => 5100701, loss => [], change_loss => []};
get_dyeing({2037, 4, 1, 3}) ->
    #{id => 2037, name => lang:get("王者白"), classes => 4,
      sex => 1, type => 3, model_id => 51007,
      skin_id => 5100702,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2038, 4, 1, 3}) ->
    #{id => 2038, name => lang:get("神秘黑"), classes => 4,
      sex => 1, type => 3, model_id => 51007,
      skin_id => 5100703,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2039, 4, 1, 3}) ->
    #{id => 2039, name => lang:get("自由橙"), classes => 4,
      sex => 1, type => 3, model_id => 51007,
      skin_id => 5100704,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2040, 4, 1, 3}) ->
    #{id => 2040, name => lang:get("幻想蓝"), classes => 4,
      sex => 1, type => 3, model_id => 51007,
      skin_id => 5100705,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2041, 4, 1, 3}) ->
    #{id => 2041, name => lang:get("紫罗兰"), classes => 4,
      sex => 1, type => 3, model_id => 51007,
      skin_id => 5100706,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 4, 0, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 4,
      sex => 0, type => 3, model_id => 51008,
      skin_id => 5100801, loss => [], change_loss => []};
get_dyeing({2043, 4, 0, 3}) ->
    #{id => 2043, name => lang:get("珍珠白"), classes => 4,
      sex => 0, type => 3, model_id => 51008,
      skin_id => 5100802,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2044, 4, 0, 3}) ->
    #{id => 2044, name => lang:get("神秘黑"), classes => 4,
      sex => 0, type => 3, model_id => 51008,
      skin_id => 5100803,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2045, 4, 0, 3}) ->
    #{id => 2045, name => lang:get("自由橙"), classes => 4,
      sex => 0, type => 3, model_id => 51008,
      skin_id => 5100804,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2046, 4, 0, 3}) ->
    #{id => 2046, name => lang:get("幻想蓝"), classes => 4,
      sex => 0, type => 3, model_id => 51008,
      skin_id => 5100805,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2047, 4, 0, 3}) ->
    #{id => 2047, name => lang:get("紫罗兰"), classes => 4,
      sex => 0, type => 3, model_id => 51008,
      skin_id => 5100806,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 5, 1, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 5,
      sex => 1, type => 3, model_id => 51009,
      skin_id => 5100901, loss => [], change_loss => []};
get_dyeing({2049, 5, 1, 3}) ->
    #{id => 2049, name => lang:get("神秘黑"), classes => 5,
      sex => 1, type => 3, model_id => 51009,
      skin_id => 5100902,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2050, 5, 1, 3}) ->
    #{id => 2050, name => lang:get("高贵金"), classes => 5,
      sex => 1, type => 3, model_id => 51009,
      skin_id => 5100903,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2051, 5, 1, 3}) ->
    #{id => 2051, name => lang:get("自由红"), classes => 5,
      sex => 1, type => 3, model_id => 51009,
      skin_id => 5100904,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2052, 5, 1, 3}) ->
    #{id => 2052, name => lang:get("海洋蓝"), classes => 5,
      sex => 1, type => 3, model_id => 51009,
      skin_id => 5100905,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2053, 5, 1, 3}) ->
    #{id => 2053, name => lang:get("儒雅白"), classes => 5,
      sex => 1, type => 3, model_id => 51009,
      skin_id => 5100906,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 5, 0, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 5,
      sex => 0, type => 3, model_id => 51010,
      skin_id => 5101001, loss => [], change_loss => []};
get_dyeing({2055, 5, 0, 3}) ->
    #{id => 2055, name => lang:get("温柔绿"), classes => 5,
      sex => 0, type => 3, model_id => 51010,
      skin_id => 5101002,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2056, 5, 0, 3}) ->
    #{id => 2056, name => lang:get("娇俏粉"), classes => 5,
      sex => 0, type => 3, model_id => 51010,
      skin_id => 5101003,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2057, 5, 0, 3}) ->
    #{id => 2057, name => lang:get("活力红"), classes => 5,
      sex => 0, type => 3, model_id => 51010,
      skin_id => 5101004,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2058, 5, 0, 3}) ->
    #{id => 2058, name => lang:get("倾城金"), classes => 5,
      sex => 0, type => 3, model_id => 51010,
      skin_id => 5101005,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2059, 5, 0, 3}) ->
    #{id => 2059, name => lang:get("星空蓝"), classes => 5,
      sex => 0, type => 3, model_id => 51010,
      skin_id => 5101006,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 6, 1, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 6,
      sex => 1, type => 3, model_id => 51071,
      skin_id => 5107101, loss => [], change_loss => []};
get_dyeing({2061, 6, 1, 3}) ->
    #{id => 2061, name => lang:get("高贵白"), classes => 6,
      sex => 1, type => 3, model_id => 51071,
      skin_id => 5107102,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2062, 6, 1, 3}) ->
    #{id => 2062, name => lang:get("冷俊黑"), classes => 6,
      sex => 1, type => 3, model_id => 51071,
      skin_id => 5107103,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2063, 6, 1, 3}) ->
    #{id => 2063, name => lang:get("典雅紫"), classes => 6,
      sex => 1, type => 3, model_id => 51071,
      skin_id => 5107104,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2064, 6, 1, 3}) ->
    #{id => 2064, name => lang:get("活力金"), classes => 6,
      sex => 1, type => 3, model_id => 51071,
      skin_id => 5107105,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2065, 6, 1, 3}) ->
    #{id => 2065, name => lang:get("清新绿"), classes => 6,
      sex => 1, type => 3, model_id => 51071,
      skin_id => 5107106,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 6, 0, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 6,
      sex => 0, type => 3, model_id => 51070,
      skin_id => 5107001, loss => [], change_loss => []};
get_dyeing({2067, 6, 0, 3}) ->
    #{id => 2067, name => lang:get("典雅紫"), classes => 6,
      sex => 0, type => 3, model_id => 51070,
      skin_id => 5107002,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2068, 6, 0, 3}) ->
    #{id => 2068, name => lang:get("性感黑"), classes => 6,
      sex => 0, type => 3, model_id => 51070,
      skin_id => 5107003,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2069, 6, 0, 3}) ->
    #{id => 2069, name => lang:get("可爱粉"), classes => 6,
      sex => 0, type => 3, model_id => 51070,
      skin_id => 5107004,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2070, 6, 0, 3}) ->
    #{id => 2070, name => lang:get("倾城金"), classes => 6,
      sex => 0, type => 3, model_id => 51070,
      skin_id => 5107005,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2071, 6, 0, 3}) ->
    #{id => 2071, name => lang:get("清新绿"), classes => 6,
      sex => 0, type => 3, model_id => 51070,
      skin_id => 5107006,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 7, 1, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 7,
      sex => 1, type => 3, model_id => 51013,
      skin_id => 5101301, loss => [], change_loss => []};
get_dyeing({2073, 7, 1, 3}) ->
    #{id => 2073, name => lang:get("神秘黑"), classes => 7,
      sex => 1, type => 3, model_id => 51013,
      skin_id => 5101302,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2074, 7, 1, 3}) ->
    #{id => 2074, name => lang:get("幻想红"), classes => 7,
      sex => 1, type => 3, model_id => 51013,
      skin_id => 5101303,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2075, 7, 1, 3}) ->
    #{id => 2075, name => lang:get("自由橙"), classes => 7,
      sex => 1, type => 3, model_id => 51013,
      skin_id => 5101304,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2076, 7, 1, 3}) ->
    #{id => 2076, name => lang:get("海洋蓝"), classes => 7,
      sex => 1, type => 3, model_id => 51013,
      skin_id => 5101305,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2077, 7, 1, 3}) ->
    #{id => 2077, name => lang:get("儒雅紫"), classes => 7,
      sex => 1, type => 3, model_id => 51013,
      skin_id => 5101306,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({0, 7, 0, 3}) ->
    #{id => 0, name => lang:get("初始色"), classes => 7,
      sex => 0, type => 3, model_id => 51012,
      skin_id => 5101201, loss => [], change_loss => []};
get_dyeing({2079, 7, 0, 3}) ->
    #{id => 2079, name => lang:get("性感黑"), classes => 7,
      sex => 0, type => 3, model_id => 51012,
      skin_id => 5101202,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2080, 7, 0, 3}) ->
    #{id => 2080, name => lang:get("娇俏红"), classes => 7,
      sex => 0, type => 3, model_id => 51012,
      skin_id => 5101203,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 12}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2081, 7, 0, 3}) ->
    #{id => 2081, name => lang:get("自由橙"), classes => 7,
      sex => 0, type => 3, model_id => 51012,
      skin_id => 5101204,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2082, 7, 0, 3}) ->
    #{id => 2082, name => lang:get("海洋蓝"), classes => 7,
      sex => 0, type => 3, model_id => 51012,
      skin_id => 5101205,
      loss =>
          [#loss{label = item_base_id, val = [{20046, 8}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing({2083, 7, 0, 3}) ->
    #{id => 2083, name => lang:get("典雅紫"), classes => 7,
      sex => 0, type => 3, model_id => 51012,
      skin_id => 5101206,
      loss =>
          [#loss{label = item_base_id, val = [{20045, 30}]}],
      change_loss =>
          [#loss{label = item_base_id, val = [{20045, 5}]}]};
get_dyeing(_) -> false.

get_compensate(50023) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50024) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50025) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50026) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50027) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50028) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50029) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50030) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50031) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50032) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50033) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(50034) ->
    [{20045, 0, 12}, {20046, 0, 6}];
get_compensate(51023) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51024) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51025) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51026) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51027) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51028) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51029) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51030) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51031) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51032) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51033) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(51034) ->
    [{20045, 0, 15}, {20046, 0, 8}];
get_compensate(_) -> false.

get_ornament_price({52001, 7}) -> 30;
get_ornament_price({52002, 7}) -> 40;
get_ornament_price({53003, 7}) -> 30;
get_ornament_price({53004, 7}) -> 40;
get_ornament_price({53005, 7}) -> 50;
get_ornament_price({53006, 7}) -> 40;
get_ornament_price({53007, 7}) -> 40;
get_ornament_price({53010, 7}) -> 50;
get_ornament_price(_) -> false.

get_dress_collect_val(51038) -> 60;
get_dress_collect_val(51039) -> 60;
get_dress_collect_val(51040) -> 60;
get_dress_collect_val(51041) -> 60;
get_dress_collect_val(51046) -> 0;
get_dress_collect_val(51047) -> 0;
get_dress_collect_val(51048) -> 50;
get_dress_collect_val(51049) -> 50;
get_dress_collect_val(51052) -> 40;
get_dress_collect_val(51053) -> 40;
get_dress_collect_val(51054) -> 40;
get_dress_collect_val(51055) -> 40;
get_dress_collect_val(51056) -> 40;
get_dress_collect_val(51057) -> 40;
get_dress_collect_val(51058) -> 50;
get_dress_collect_val(51059) -> 50;
get_dress_collect_val(51060) -> 50;
get_dress_collect_val(51061) -> 50;
get_dress_collect_val(51062) -> 50;
get_dress_collect_val(51063) -> 50;
get_dress_collect_val(51064) -> 50;
get_dress_collect_val(51065) -> 50;
get_dress_collect_val(51066) -> 50;
get_dress_collect_val(51067) -> 50;
get_dress_collect_val(51068) -> 50;
get_dress_collect_val(51069) -> 50;
get_dress_collect_val(51072) -> 50;
get_dress_collect_val(51073) -> 50;
get_dress_collect_val(51076) -> 50;
get_dress_collect_val(51077) -> 50;
get_dress_collect_val(51078) -> 50;
get_dress_collect_val(51079) -> 50;
get_dress_collect_val(51074) -> 50;
get_dress_collect_val(51075) -> 50;
get_dress_collect_val(51080) -> 50;
get_dress_collect_val(51081) -> 50;
get_dress_collect_val(51082) -> 100;
get_dress_collect_val(51083) -> 100;
get_dress_collect_val(51084) -> 100;
get_dress_collect_val(51085) -> 100;
get_dress_collect_val(51086) -> 80;
get_dress_collect_val(51087) -> 80;
get_dress_collect_val(51088) -> 100;
get_dress_collect_val(51089) -> 100;
get_dress_collect_val(51090) -> 80;
get_dress_collect_val(51091) -> 80;
get_dress_collect_val(51096) -> 80;
get_dress_collect_val(51097) -> 80;
get_dress_collect_val(51092) -> 80;
get_dress_collect_val(51093) -> 80;
get_dress_collect_val(51098) -> 80;
get_dress_collect_val(51099) -> 80;
get_dress_collect_val(51100) -> 80;
get_dress_collect_val(51101) -> 80;
get_dress_collect_val(51104) -> 80;
get_dress_collect_val(51105) -> 80;
get_dress_collect_val(51102) -> 120;
get_dress_collect_val(51103) -> 120;
get_dress_collect_val(51106) -> 80;
get_dress_collect_val(51107) -> 80;
get_dress_collect_val(51112) -> 80;
get_dress_collect_val(51113) -> 80;
get_dress_collect_val(51110) -> 80;
get_dress_collect_val(51111) -> 80;
get_dress_collect_val(51114) -> 80;
get_dress_collect_val(51115) -> 80;
get_dress_collect_val(51094) -> 80;
get_dress_collect_val(51095) -> 80;
get_dress_collect_val(51116) -> 80;
get_dress_collect_val(51117) -> 80;
get_dress_collect_val(51118) -> 80;
get_dress_collect_val(51119) -> 80;
get_dress_collect_val(51120) -> 80;
get_dress_collect_val(51121) -> 80;
get_dress_collect_val(51124) -> 80;
get_dress_collect_val(51125) -> 80;
get_dress_collect_val(51126) -> 80;
get_dress_collect_val(51127) -> 80;
get_dress_collect_val(51128) -> 80;
get_dress_collect_val(51129) -> 80;
get_dress_collect_val(51130) -> 80;
get_dress_collect_val(51131) -> 80;
get_dress_collect_val(51132) -> 80;
get_dress_collect_val(51133) -> 80;
get_dress_collect_val(51134) -> 80;
get_dress_collect_val(51135) -> 80;
get_dress_collect_val(51136) -> 80;
get_dress_collect_val(51137) -> 80;
get_dress_collect_val(51138) -> 80;
get_dress_collect_val(51139) -> 80;
get_dress_collect_val(51140) -> 80;
get_dress_collect_val(51141) -> 80;
get_dress_collect_val(51142) -> 80;
get_dress_collect_val(51143) -> 80;
get_dress_collect_val(51144) -> 80;
get_dress_collect_val(51145) -> 80;
get_dress_collect_val(51146) -> 80;
get_dress_collect_val(51147) -> 80;
get_dress_collect_val(51148) -> 80;
get_dress_collect_val(51149) -> 80;
get_dress_collect_val(51150) -> 80;
get_dress_collect_val(51151) -> 80;
get_dress_collect_val(51152) -> 80;
get_dress_collect_val(51153) -> 80;
get_dress_collect_val(51154) -> 80;
get_dress_collect_val(51155) -> 80;
get_dress_collect_val(51156) -> 80;
get_dress_collect_val(51157) -> 80;
get_dress_collect_val(51158) -> 80;
get_dress_collect_val(51159) -> 80;
get_dress_collect_val(51160) -> 80;
get_dress_collect_val(51161) -> 80;
get_dress_collect_val(51162) -> 80;
get_dress_collect_val(51163) -> 80;
get_dress_collect_val(51164) -> 80;
get_dress_collect_val(51165) -> 80;
get_dress_collect_val(51166) -> 80;
get_dress_collect_val(51167) -> 80;
get_dress_collect_val(51168) -> 80;
get_dress_collect_val(51169) -> 80;
get_dress_collect_val(52001) -> 30;
get_dress_collect_val(52002) -> 30;
get_dress_collect_val(52003) -> 30;
get_dress_collect_val(52004) -> 30;
get_dress_collect_val(52005) -> 30;
get_dress_collect_val(52007) -> 30;
get_dress_collect_val(52008) -> 30;
get_dress_collect_val(52009) -> 30;
get_dress_collect_val(52010) -> 30;
get_dress_collect_val(52011) -> 30;
get_dress_collect_val(52012) -> 30;
get_dress_collect_val(52013) -> 30;
get_dress_collect_val(52014) -> 30;
get_dress_collect_val(52015) -> 30;
get_dress_collect_val(52016) -> 30;
get_dress_collect_val(52017) -> 30;
get_dress_collect_val(52018) -> 30;
get_dress_collect_val(52019) -> 30;
get_dress_collect_val(52020) -> 30;
get_dress_collect_val(52021) -> 30;
get_dress_collect_val(52022) -> 30;
get_dress_collect_val(52023) -> 30;
get_dress_collect_val(52024) -> 30;
get_dress_collect_val(52025) -> 30;
get_dress_collect_val(52026) -> 30;
get_dress_collect_val(52027) -> 30;
get_dress_collect_val(52028) -> 30;
get_dress_collect_val(52029) -> 30;
get_dress_collect_val(52030) -> 50;
get_dress_collect_val(52031) -> 30;
get_dress_collect_val(52032) -> 30;
get_dress_collect_val(52033) -> 30;
get_dress_collect_val(52034) -> 30;
get_dress_collect_val(52035) -> 30;
get_dress_collect_val(52036) -> 30;
get_dress_collect_val(52037) -> 30;
get_dress_collect_val(52040) -> 30;
get_dress_collect_val(52041) -> 30;
get_dress_collect_val(52038) -> 30;
get_dress_collect_val(52042) -> 30;
get_dress_collect_val(52043) -> 30;
get_dress_collect_val(52045) -> 30;
get_dress_collect_val(52046) -> 30;
get_dress_collect_val(52047) -> 30;
get_dress_collect_val(52048) -> 30;
get_dress_collect_val(52050) -> 30;
get_dress_collect_val(52051) -> 30;
get_dress_collect_val(52049) -> 30;
get_dress_collect_val(52052) -> 30;
get_dress_collect_val(52053) -> 30;
get_dress_collect_val(52054) -> 30;
get_dress_collect_val(52056) -> 30;
get_dress_collect_val(52055) -> 30;
get_dress_collect_val(52057) -> 30;
get_dress_collect_val(52058) -> 30;
get_dress_collect_val(52059) -> 30;
get_dress_collect_val(52039) -> 30;
get_dress_collect_val(52060) -> 30;
get_dress_collect_val(52061) -> 30;
get_dress_collect_val(52062) -> 30;
get_dress_collect_val(52063) -> 30;
get_dress_collect_val(52064) -> 30;
get_dress_collect_val(52065) -> 30;
get_dress_collect_val(52066) -> 30;
get_dress_collect_val(52067) -> 30;
get_dress_collect_val(52068) -> 30;
get_dress_collect_val(52069) -> 30;
get_dress_collect_val(52071) -> 30;
get_dress_collect_val(52070) -> 30;
get_dress_collect_val(52072) -> 30;
get_dress_collect_val(52073) -> 30;
get_dress_collect_val(52074) -> 30;
get_dress_collect_val(52075) -> 30;
get_dress_collect_val(52076) -> 30;
get_dress_collect_val(52077) -> 30;
get_dress_collect_val(52078) -> 30;
get_dress_collect_val(52079) -> 30;
get_dress_collect_val(52080) -> 30;
get_dress_collect_val(52081) -> 30;
get_dress_collect_val(52082) -> 30;
get_dress_collect_val(52083) -> 30;
get_dress_collect_val(52084) -> 30;
get_dress_collect_val(52085) -> 30;
get_dress_collect_val(52086) -> 30;
get_dress_collect_val(52087) -> 30;
get_dress_collect_val(52088) -> 30;
get_dress_collect_val(52089) -> 30;
get_dress_collect_val(52090) -> 30;
get_dress_collect_val(52091) -> 30;
get_dress_collect_val(52092) -> 30;
get_dress_collect_val(52093) -> 30;
get_dress_collect_val(52094) -> 30;
get_dress_collect_val(52095) -> 30;
get_dress_collect_val(52096) -> 30;
get_dress_collect_val(53003) -> 20;
get_dress_collect_val(53004) -> 20;
get_dress_collect_val(53005) -> 20;
get_dress_collect_val(53006) -> 20;
get_dress_collect_val(53007) -> 20;
get_dress_collect_val(53010) -> 20;
get_dress_collect_val(53011) -> 20;
get_dress_collect_val(53012) -> 20;
get_dress_collect_val(53013) -> 20;
get_dress_collect_val(53015) -> 20;
get_dress_collect_val(53016) -> 20;
get_dress_collect_val(53019) -> 20;
get_dress_collect_val(53021) -> 20;
get_dress_collect_val(53022) -> 20;
get_dress_collect_val(53023) -> 20;
get_dress_collect_val(53024) -> 20;
get_dress_collect_val(53025) -> 20;
get_dress_collect_val(53026) -> 20;
get_dress_collect_val(53027) -> 20;
get_dress_collect_val(53028) -> 20;
get_dress_collect_val(53029) -> 20;
get_dress_collect_val(53030) -> 20;
get_dress_collect_val(53031) -> 20;
get_dress_collect_val(53032) -> 20;
get_dress_collect_val(53033) -> 20;
get_dress_collect_val(53034) -> 20;
get_dress_collect_val(53035) -> 20;
get_dress_collect_val(53036) -> 20;
get_dress_collect_val(53039) -> 20;
get_dress_collect_val(53040) -> 20;
get_dress_collect_val(53041) -> 20;
get_dress_collect_val(53042) -> 20;
get_dress_collect_val(53044) -> 20;
get_dress_collect_val(53037) -> 20;
get_dress_collect_val(53038) -> 20;
get_dress_collect_val(53046) -> 20;
get_dress_collect_val(53047) -> 20;
get_dress_collect_val(53048) -> 20;
get_dress_collect_val(53049) -> 20;
get_dress_collect_val(53050) -> 20;
get_dress_collect_val(53051) -> 20;
get_dress_collect_val(53052) -> 20;
get_dress_collect_val(53053) -> 20;
get_dress_collect_val(53054) -> 20;
get_dress_collect_val(53055) -> 20;
get_dress_collect_val(53060) -> 20;
get_dress_collect_val(53061) -> 20;
get_dress_collect_val(53056) -> 20;
get_dress_collect_val(53057) -> 20;
get_dress_collect_val(53062) -> 20;
get_dress_collect_val(53063) -> 20;
get_dress_collect_val(53064) -> 20;
get_dress_collect_val(53065) -> 20;
get_dress_collect_val(53066) -> 20;
get_dress_collect_val(53067) -> 20;
get_dress_collect_val(53070) -> 20;
get_dress_collect_val(53068) -> 30;
get_dress_collect_val(53069) -> 30;
get_dress_collect_val(53071) -> 30;
get_dress_collect_val(53072) -> 30;
get_dress_collect_val(53073) -> 30;
get_dress_collect_val(53076) -> 30;
get_dress_collect_val(53074) -> 30;
get_dress_collect_val(53075) -> 30;
get_dress_collect_val(53077) -> 30;
get_dress_collect_val(53078) -> 30;
get_dress_collect_val(53058) -> 30;
get_dress_collect_val(53059) -> 30;
get_dress_collect_val(53079) -> 30;
get_dress_collect_val(53080) -> 30;
get_dress_collect_val(53081) -> 30;
get_dress_collect_val(53082) -> 30;
get_dress_collect_val(53083) -> 30;
get_dress_collect_val(53084) -> 30;
get_dress_collect_val(53085) -> 30;
get_dress_collect_val(53086) -> 30;
get_dress_collect_val(53087) -> 30;
get_dress_collect_val(53089) -> 30;
get_dress_collect_val(53088) -> 30;
get_dress_collect_val(53090) -> 30;
get_dress_collect_val(53091) -> 30;
get_dress_collect_val(53092) -> 30;
get_dress_collect_val(53093) -> 30;
get_dress_collect_val(53094) -> 30;
get_dress_collect_val(53095) -> 30;
get_dress_collect_val(53096) -> 30;
get_dress_collect_val(53097) -> 30;
get_dress_collect_val(53098) -> 30;
get_dress_collect_val(53099) -> 30;
get_dress_collect_val(53100) -> 30;
get_dress_collect_val(53101) -> 30;
get_dress_collect_val(53102) -> 30;
get_dress_collect_val(53103) -> 30;
get_dress_collect_val(53104) -> 30;
get_dress_collect_val(53105) -> 30;
get_dress_collect_val(53106) -> 30;
get_dress_collect_val(53107) -> 30;
get_dress_collect_val(53108) -> 30;
get_dress_collect_val(53110) -> 30;
get_dress_collect_val(53111) -> 30;
get_dress_collect_val(53112) -> 30;
get_dress_collect_val(53113) -> 30;
get_dress_collect_val(53114) -> 30;
get_dress_collect_val(53115) -> 30;
get_dress_collect_val(53116) -> 30;
get_dress_collect_val(53117) -> 30;
get_dress_collect_val(53118) -> 30;
get_dress_collect_val(53119) -> 30;
get_dress_collect_val(53120) -> 30;
get_dress_collect_val(53121) -> 30;
get_dress_collect_val(53122) -> 30;
get_dress_collect_val(53123) -> 30;
get_dress_collect_val(53124) -> 30;
get_dress_collect_val(53125) -> 30;
get_dress_collect_val(53126) -> 30;
get_dress_collect_val(53127) -> 30;
get_dress_collect_val(53128) -> 30;
get_dress_collect_val(53129) -> 30;
get_dress_collect_val(53130) -> 30;
get_dress_collect_val(53131) -> 30;
get_dress_collect_val(53132) -> 30;
get_dress_collect_val(53133) -> 30;
get_dress_collect_val(53134) -> 30;
get_dress_collect_val(53135) -> 30;
get_dress_collect_val(53136) -> 30;
get_dress_collect_val(53137) -> 30;
get_dress_collect_val(53138) -> 30;
get_dress_collect_val(53139) -> 30;
get_dress_collect_val(51122) -> 80;
get_dress_collect_val(51123) -> 80;
get_dress_collect_val(_) -> 0.

get_dyeing_collect_val(0) -> 0;
get_dyeing_collect_val(1001) -> 58;
get_dyeing_collect_val(1002) -> 38;
get_dyeing_collect_val(1003) -> 38;
get_dyeing_collect_val(1004) -> 58;
get_dyeing_collect_val(1005) -> 11;
get_dyeing_collect_val(1007) -> 38;
get_dyeing_collect_val(1008) -> 58;
get_dyeing_collect_val(1009) -> 38;
get_dyeing_collect_val(1010) -> 11;
get_dyeing_collect_val(1011) -> 58;
get_dyeing_collect_val(1013) -> 38;
get_dyeing_collect_val(1014) -> 58;
get_dyeing_collect_val(1015) -> 11;
get_dyeing_collect_val(1016) -> 58;
get_dyeing_collect_val(1017) -> 38;
get_dyeing_collect_val(1019) -> 38;
get_dyeing_collect_val(1020) -> 58;
get_dyeing_collect_val(1021) -> 11;
get_dyeing_collect_val(1022) -> 58;
get_dyeing_collect_val(1023) -> 38;
get_dyeing_collect_val(1025) -> 58;
get_dyeing_collect_val(1026) -> 58;
get_dyeing_collect_val(1027) -> 11;
get_dyeing_collect_val(1028) -> 38;
get_dyeing_collect_val(1029) -> 38;
get_dyeing_collect_val(1031) -> 58;
get_dyeing_collect_val(1032) -> 38;
get_dyeing_collect_val(1033) -> 58;
get_dyeing_collect_val(1034) -> 38;
get_dyeing_collect_val(1035) -> 11;
get_dyeing_collect_val(1037) -> 11;
get_dyeing_collect_val(1038) -> 58;
get_dyeing_collect_val(1039) -> 58;
get_dyeing_collect_val(1040) -> 38;
get_dyeing_collect_val(1041) -> 38;
get_dyeing_collect_val(1043) -> 38;
get_dyeing_collect_val(1044) -> 38;
get_dyeing_collect_val(1045) -> 58;
get_dyeing_collect_val(1046) -> 11;
get_dyeing_collect_val(1047) -> 38;
get_dyeing_collect_val(1049) -> 11;
get_dyeing_collect_val(1050) -> 38;
get_dyeing_collect_val(1051) -> 58;
get_dyeing_collect_val(1052) -> 38;
get_dyeing_collect_val(1053) -> 58;
get_dyeing_collect_val(1055) -> 22;
get_dyeing_collect_val(1056) -> 77;
get_dyeing_collect_val(1057) -> 58;
get_dyeing_collect_val(1058) -> 58;
get_dyeing_collect_val(1059) -> 22;
get_dyeing_collect_val(1061) -> 22;
get_dyeing_collect_val(1062) -> 77;
get_dyeing_collect_val(1063) -> 58;
get_dyeing_collect_val(1064) -> 58;
get_dyeing_collect_val(1065) -> 22;
get_dyeing_collect_val(1067) -> 11;
get_dyeing_collect_val(1068) -> 38;
get_dyeing_collect_val(1069) -> 58;
get_dyeing_collect_val(1070) -> 38;
get_dyeing_collect_val(1071) -> 58;
get_dyeing_collect_val(1073) -> 22;
get_dyeing_collect_val(1074) -> 77;
get_dyeing_collect_val(1075) -> 58;
get_dyeing_collect_val(1076) -> 58;
get_dyeing_collect_val(1077) -> 22;
get_dyeing_collect_val(1079) -> 11;
get_dyeing_collect_val(1080) -> 38;
get_dyeing_collect_val(1081) -> 58;
get_dyeing_collect_val(1082) -> 38;
get_dyeing_collect_val(1083) -> 58;
get_dyeing_collect_val(2001) -> 77;
get_dyeing_collect_val(2002) -> 22;
get_dyeing_collect_val(2003) -> 77;
get_dyeing_collect_val(2004) -> 58;
get_dyeing_collect_val(2005) -> 58;
get_dyeing_collect_val(2007) -> 77;
get_dyeing_collect_val(2008) -> 58;
get_dyeing_collect_val(2009) -> 77;
get_dyeing_collect_val(2010) -> 22;
get_dyeing_collect_val(2011) -> 58;
get_dyeing_collect_val(2013) -> 58;
get_dyeing_collect_val(2014) -> 22;
get_dyeing_collect_val(2015) -> 77;
get_dyeing_collect_val(2016) -> 58;
get_dyeing_collect_val(2017) -> 77;
get_dyeing_collect_val(2019) -> 77;
get_dyeing_collect_val(2020) -> 22;
get_dyeing_collect_val(2021) -> 58;
get_dyeing_collect_val(2022) -> 58;
get_dyeing_collect_val(2023) -> 77;
get_dyeing_collect_val(2025) -> 77;
get_dyeing_collect_val(2026) -> 22;
get_dyeing_collect_val(2027) -> 77;
get_dyeing_collect_val(2028) -> 58;
get_dyeing_collect_val(2029) -> 58;
get_dyeing_collect_val(2031) -> 77;
get_dyeing_collect_val(2032) -> 22;
get_dyeing_collect_val(2033) -> 77;
get_dyeing_collect_val(2034) -> 58;
get_dyeing_collect_val(2035) -> 58;
get_dyeing_collect_val(2037) -> 77;
get_dyeing_collect_val(2038) -> 58;
get_dyeing_collect_val(2039) -> 77;
get_dyeing_collect_val(2040) -> 58;
get_dyeing_collect_val(2041) -> 22;
get_dyeing_collect_val(2043) -> 77;
get_dyeing_collect_val(2044) -> 77;
get_dyeing_collect_val(2045) -> 22;
get_dyeing_collect_val(2046) -> 58;
get_dyeing_collect_val(2047) -> 58;
get_dyeing_collect_val(2049) -> 22;
get_dyeing_collect_val(2050) -> 77;
get_dyeing_collect_val(2051) -> 58;
get_dyeing_collect_val(2052) -> 58;
get_dyeing_collect_val(2053) -> 77;
get_dyeing_collect_val(2055) -> 58;
get_dyeing_collect_val(2056) -> 77;
get_dyeing_collect_val(2057) -> 58;
get_dyeing_collect_val(2058) -> 58;
get_dyeing_collect_val(2059) -> 22;
get_dyeing_collect_val(2061) -> 22;
get_dyeing_collect_val(2062) -> 77;
get_dyeing_collect_val(2063) -> 58;
get_dyeing_collect_val(2064) -> 58;
get_dyeing_collect_val(2065) -> 77;
get_dyeing_collect_val(2067) -> 58;
get_dyeing_collect_val(2068) -> 77;
get_dyeing_collect_val(2069) -> 58;
get_dyeing_collect_val(2070) -> 58;
get_dyeing_collect_val(2071) -> 22;
get_dyeing_collect_val(2073) -> 22;
get_dyeing_collect_val(2074) -> 77;
get_dyeing_collect_val(2075) -> 58;
get_dyeing_collect_val(2076) -> 58;
get_dyeing_collect_val(2077) -> 77;
get_dyeing_collect_val(2079) -> 58;
get_dyeing_collect_val(2080) -> 77;
get_dyeing_collect_val(2081) -> 58;
get_dyeing_collect_val(2082) -> 58;
get_dyeing_collect_val(2083) -> 22;
get_dyeing_collect_val(_) -> 0.

get_collect({1, 1}) ->
    #{name => lang:get("潮流新手"), loss => [{20507, 1}],
      attrs => [{1, 70}, {4, 20}, {6, 10}, {7, 8}],
      loss_collect => 100, gain => [], fc => 30};
get_collect({2, 1}) ->
    #{name => lang:get("略识衣品"), loss => [{20507, 2}],
      attrs => [{1, 140}, {4, 40}, {6, 20}, {7, 16}],
      loss_collect => 200, gain => [], fc => 60};
get_collect({3, 1}) ->
    #{name => lang:get("落落大方"), loss => [{20507, 3}],
      attrs => [{1, 210}, {4, 60}, {6, 30}, {7, 24}],
      loss_collect => 320, gain => [{23640, 1}], fc => 90};
get_collect({4, 1}) ->
    #{name => lang:get("光彩照人"), loss => [{20507, 4}],
      attrs => [{1, 280}, {4, 80}, {6, 40}, {7, 32}],
      loss_collect => 450, gain => [], fc => 120};
get_collect({5, 1}) ->
    #{name => lang:get("卓尔不群"), loss => [{20507, 5}],
      attrs => [{1, 350}, {4, 100}, {6, 50}, {7, 40}],
      loss_collect => 600, gain => [{29493, 1}], fc => 150};
get_collect({6, 1}) ->
    #{name => lang:get("魅力四射"), loss => [{20507, 6}],
      attrs => [{1, 420}, {4, 120}, {6, 60}, {7, 48}],
      loss_collect => 800, gain => [], fc => 180};
get_collect({7, 1}) ->
    #{name => lang:get("时尚达人"), loss => [{20507, 7}],
      attrs => [{1, 490}, {4, 140}, {6, 70}, {7, 56}],
      loss_collect => 1000, gain => [{21750, 1}], fc => 210};
get_collect({8, 1}) ->
    #{name => lang:get("引领潮流"), loss => [{20507, 8}],
      attrs => [{1, 560}, {4, 160}, {6, 80}, {7, 64}],
      loss_collect => 1200, gain => [{23641, 1}], fc => 240};
get_collect({9, 1}) ->
    #{name => lang:get("大家风范"), loss => [{20507, 9}],
      attrs => [{1, 630}, {4, 180}, {6, 90}, {7, 72}],
      loss_collect => 1500, gain => [{29499, 1}], fc => 270};
get_collect({10, 1}) ->
    #{name => lang:get("无与伦比"), loss => [{20507, 10}],
      attrs => [{1, 700}, {4, 200}, {6, 100}, {7, 80}],
      loss_collect => 2000, gain => [], fc => 300};
get_collect({11, 1}) ->
    #{name => lang:get("超凡脱俗"), loss => [{20507, 11}],
      attrs => [{1, 770}, {4, 220}, {6, 110}, {7, 88}],
      loss_collect => 2500, gain => [], fc => 330};
get_collect({12, 1}) ->
    #{name => lang:get("举世无双"), loss => [{20507, 12}],
      attrs => [{1, 840}, {4, 240}, {6, 120}, {7, 96}],
      loss_collect => 3000, gain => [], fc => 360};
get_collect({1, 3}) ->
    #{name => lang:get("潮流新手"), loss => [{20507, 1}],
      attrs => [{1, 70}, {4, 20}, {6, 10}, {7, 8}],
      loss_collect => 100, gain => [], fc => 30};
get_collect({2, 3}) ->
    #{name => lang:get("略识衣品"), loss => [{20507, 2}],
      attrs => [{1, 140}, {4, 40}, {6, 20}, {7, 16}],
      loss_collect => 200, gain => [], fc => 60};
get_collect({3, 3}) ->
    #{name => lang:get("落落大方"), loss => [{20507, 3}],
      attrs => [{1, 210}, {4, 60}, {6, 30}, {7, 24}],
      loss_collect => 320, gain => [{23640, 1}], fc => 90};
get_collect({4, 3}) ->
    #{name => lang:get("光彩照人"), loss => [{20507, 4}],
      attrs => [{1, 280}, {4, 80}, {6, 40}, {7, 32}],
      loss_collect => 450, gain => [], fc => 120};
get_collect({5, 3}) ->
    #{name => lang:get("卓尔不群"), loss => [{20507, 5}],
      attrs => [{1, 350}, {4, 100}, {6, 50}, {7, 40}],
      loss_collect => 600, gain => [{29493, 1}], fc => 150};
get_collect({6, 3}) ->
    #{name => lang:get("魅力四射"), loss => [{20507, 6}],
      attrs => [{1, 420}, {4, 120}, {6, 60}, {7, 48}],
      loss_collect => 800, gain => [], fc => 180};
get_collect({7, 3}) ->
    #{name => lang:get("时尚达人"), loss => [{20507, 7}],
      attrs => [{1, 490}, {4, 140}, {6, 70}, {7, 56}],
      loss_collect => 1000, gain => [{21750, 1}], fc => 210};
get_collect({8, 3}) ->
    #{name => lang:get("引领潮流"), loss => [{20507, 8}],
      attrs => [{1, 560}, {4, 160}, {6, 80}, {7, 64}],
      loss_collect => 1200, gain => [{23641, 1}], fc => 240};
get_collect({9, 3}) ->
    #{name => lang:get("大家风范"), loss => [{20507, 9}],
      attrs => [{1, 630}, {4, 180}, {6, 90}, {7, 72}],
      loss_collect => 1500, gain => [{29499, 1}], fc => 270};
get_collect({10, 3}) ->
    #{name => lang:get("无与伦比"), loss => [{20507, 10}],
      attrs => [{1, 700}, {4, 200}, {6, 100}, {7, 80}],
      loss_collect => 2000, gain => [], fc => 300};
get_collect({11, 3}) ->
    #{name => lang:get("超凡脱俗"), loss => [{20507, 11}],
      attrs => [{1, 770}, {4, 220}, {6, 110}, {7, 88}],
      loss_collect => 2500, gain => [], fc => 330};
get_collect({12, 3}) ->
    #{name => lang:get("举世无双"), loss => [{20507, 12}],
      attrs => [{1, 840}, {4, 240}, {6, 120}, {7, 96}],
      loss_collect => 3000, gain => [], fc => 360};
get_collect({1, 2}) ->
    #{name => lang:get("潮流新手"), loss => [{20507, 1}],
      attrs => [{1, 70}, {5, 16}, {6, 10}, {7, 8}],
      loss_collect => 100, gain => [], fc => 30};
get_collect({2, 2}) ->
    #{name => lang:get("略识衣品"), loss => [{20507, 2}],
      attrs => [{1, 140}, {5, 32}, {6, 20}, {7, 16}],
      loss_collect => 200, gain => [], fc => 60};
get_collect({3, 2}) ->
    #{name => lang:get("落落大方"), loss => [{20507, 3}],
      attrs => [{1, 210}, {5, 48}, {6, 30}, {7, 24}],
      loss_collect => 320, gain => [{23640, 1}], fc => 90};
get_collect({4, 2}) ->
    #{name => lang:get("光彩照人"), loss => [{20507, 4}],
      attrs => [{1, 280}, {5, 64}, {6, 40}, {7, 32}],
      loss_collect => 450, gain => [], fc => 120};
get_collect({5, 2}) ->
    #{name => lang:get("卓尔不群"), loss => [{20507, 5}],
      attrs => [{1, 350}, {5, 80}, {6, 50}, {7, 40}],
      loss_collect => 600, gain => [{29493, 1}], fc => 150};
get_collect({6, 2}) ->
    #{name => lang:get("魅力四射"), loss => [{20507, 6}],
      attrs => [{1, 420}, {5, 96}, {6, 60}, {7, 48}],
      loss_collect => 800, gain => [], fc => 180};
get_collect({7, 2}) ->
    #{name => lang:get("时尚达人"), loss => [{20507, 7}],
      attrs => [{1, 490}, {5, 112}, {6, 70}, {7, 56}],
      loss_collect => 1000, gain => [{21750, 1}], fc => 210};
get_collect({8, 2}) ->
    #{name => lang:get("引领潮流"), loss => [{20507, 8}],
      attrs => [{1, 560}, {5, 128}, {6, 80}, {7, 64}],
      loss_collect => 1200, gain => [{23641, 1}], fc => 240};
get_collect({9, 2}) ->
    #{name => lang:get("大家风范"), loss => [{20507, 9}],
      attrs => [{1, 630}, {5, 144}, {6, 90}, {7, 72}],
      loss_collect => 1500, gain => [{29499, 1}], fc => 270};
get_collect({10, 2}) ->
    #{name => lang:get("无与伦比"), loss => [{20507, 10}],
      attrs => [{1, 700}, {5, 160}, {6, 100}, {7, 80}],
      loss_collect => 2000, gain => [], fc => 300};
get_collect({11, 2}) ->
    #{name => lang:get("超凡脱俗"), loss => [{20507, 11}],
      attrs => [{1, 770}, {5, 176}, {6, 110}, {7, 88}],
      loss_collect => 2500, gain => [], fc => 330};
get_collect({12, 2}) ->
    #{name => lang:get("举世无双"), loss => [{20507, 12}],
      attrs => [{1, 840}, {5, 192}, {6, 120}, {7, 96}],
      loss_collect => 3000, gain => [], fc => 360};
get_collect({1, 6}) ->
    #{name => lang:get("潮流新手"), loss => [{20507, 1}],
      attrs => [{1, 70}, {5, 16}, {6, 10}, {7, 8}],
      loss_collect => 100, gain => [], fc => 30};
get_collect({2, 6}) ->
    #{name => lang:get("略识衣品"), loss => [{20507, 2}],
      attrs => [{1, 140}, {5, 32}, {6, 20}, {7, 16}],
      loss_collect => 200, gain => [], fc => 60};
get_collect({3, 6}) ->
    #{name => lang:get("落落大方"), loss => [{20507, 3}],
      attrs => [{1, 210}, {5, 48}, {6, 30}, {7, 24}],
      loss_collect => 320, gain => [{23640, 1}], fc => 90};
get_collect({4, 6}) ->
    #{name => lang:get("光彩照人"), loss => [{20507, 4}],
      attrs => [{1, 280}, {5, 64}, {6, 40}, {7, 32}],
      loss_collect => 450, gain => [], fc => 120};
get_collect({5, 6}) ->
    #{name => lang:get("卓尔不群"), loss => [{20507, 5}],
      attrs => [{1, 350}, {5, 80}, {6, 50}, {7, 40}],
      loss_collect => 600, gain => [{29493, 1}], fc => 150};
get_collect({6, 6}) ->
    #{name => lang:get("魅力四射"), loss => [{20507, 6}],
      attrs => [{1, 420}, {5, 96}, {6, 60}, {7, 48}],
      loss_collect => 800, gain => [], fc => 180};
get_collect({7, 6}) ->
    #{name => lang:get("时尚达人"), loss => [{20507, 7}],
      attrs => [{1, 490}, {5, 112}, {6, 70}, {7, 56}],
      loss_collect => 1000, gain => [{21750, 1}], fc => 210};
get_collect({8, 6}) ->
    #{name => lang:get("引领潮流"), loss => [{20507, 8}],
      attrs => [{1, 560}, {5, 128}, {6, 80}, {7, 64}],
      loss_collect => 1200, gain => [{23641, 1}], fc => 240};
get_collect({9, 6}) ->
    #{name => lang:get("大家风范"), loss => [{20507, 9}],
      attrs => [{1, 630}, {5, 144}, {6, 90}, {7, 72}],
      loss_collect => 1500, gain => [{29499, 1}], fc => 270};
get_collect({10, 6}) ->
    #{name => lang:get("无与伦比"), loss => [{20507, 10}],
      attrs => [{1, 700}, {5, 160}, {6, 100}, {7, 80}],
      loss_collect => 2000, gain => [], fc => 300};
get_collect({11, 6}) ->
    #{name => lang:get("超凡脱俗"), loss => [{20507, 11}],
      attrs => [{1, 770}, {5, 176}, {6, 110}, {7, 88}],
      loss_collect => 2500, gain => [], fc => 330};
get_collect({12, 6}) ->
    #{name => lang:get("举世无双"), loss => [{20507, 12}],
      attrs => [{1, 840}, {5, 192}, {6, 120}, {7, 96}],
      loss_collect => 3000, gain => [], fc => 360};
get_collect({1, 5}) ->
    #{name => lang:get("潮流新手"), loss => [{20507, 1}],
      attrs => [{1, 70}, {43, 12}, {6, 10}, {7, 8}],
      loss_collect => 100, gain => [], fc => 30};
get_collect({2, 5}) ->
    #{name => lang:get("略识衣品"), loss => [{20507, 2}],
      attrs => [{1, 140}, {43, 24}, {6, 20}, {7, 16}],
      loss_collect => 200, gain => [], fc => 60};
get_collect({3, 5}) ->
    #{name => lang:get("落落大方"), loss => [{20507, 3}],
      attrs => [{1, 210}, {43, 36}, {6, 30}, {7, 24}],
      loss_collect => 320, gain => [{23640, 1}], fc => 90};
get_collect({4, 5}) ->
    #{name => lang:get("光彩照人"), loss => [{20507, 4}],
      attrs => [{1, 280}, {43, 48}, {6, 40}, {7, 32}],
      loss_collect => 450, gain => [], fc => 120};
get_collect({5, 5}) ->
    #{name => lang:get("卓尔不群"), loss => [{20507, 5}],
      attrs => [{1, 350}, {43, 60}, {6, 50}, {7, 40}],
      loss_collect => 600, gain => [{29493, 1}], fc => 150};
get_collect({6, 5}) ->
    #{name => lang:get("魅力四射"), loss => [{20507, 6}],
      attrs => [{1, 420}, {43, 72}, {6, 60}, {7, 48}],
      loss_collect => 800, gain => [], fc => 180};
get_collect({7, 5}) ->
    #{name => lang:get("时尚达人"), loss => [{20507, 7}],
      attrs => [{1, 490}, {43, 84}, {6, 70}, {7, 56}],
      loss_collect => 1000, gain => [{21750, 1}], fc => 210};
get_collect({8, 5}) ->
    #{name => lang:get("引领潮流"), loss => [{20507, 8}],
      attrs => [{1, 560}, {43, 96}, {6, 80}, {7, 64}],
      loss_collect => 1200, gain => [{23641, 1}], fc => 240};
get_collect({9, 5}) ->
    #{name => lang:get("大家风范"), loss => [{20507, 9}],
      attrs => [{1, 630}, {43, 108}, {6, 90}, {7, 72}],
      loss_collect => 1500, gain => [{29499, 1}], fc => 270};
get_collect({10, 5}) ->
    #{name => lang:get("无与伦比"), loss => [{20507, 10}],
      attrs => [{1, 700}, {43, 120}, {6, 100}, {7, 80}],
      loss_collect => 2000, gain => [], fc => 300};
get_collect({11, 5}) ->
    #{name => lang:get("超凡脱俗"), loss => [{20507, 11}],
      attrs => [{1, 770}, {43, 132}, {6, 110}, {7, 88}],
      loss_collect => 2500, gain => [], fc => 330};
get_collect({12, 5}) ->
    #{name => lang:get("举世无双"), loss => [{20507, 12}],
      attrs => [{1, 840}, {43, 144}, {6, 120}, {7, 96}],
      loss_collect => 3000, gain => [], fc => 360};
get_collect({1, 4}) ->
    #{name => lang:get("潮流新手"), loss => [{20507, 1}],
      attrs => [{1, 70}, {3, 2}, {6, 10}, {7, 8}],
      loss_collect => 100, gain => [], fc => 30};
get_collect({2, 4}) ->
    #{name => lang:get("略识衣品"), loss => [{20507, 2}],
      attrs => [{1, 140}, {3, 4}, {6, 20}, {7, 16}],
      loss_collect => 200, gain => [], fc => 60};
get_collect({3, 4}) ->
    #{name => lang:get("落落大方"), loss => [{20507, 3}],
      attrs => [{1, 210}, {3, 6}, {6, 30}, {7, 24}],
      loss_collect => 320, gain => [{23640, 1}], fc => 90};
get_collect({4, 4}) ->
    #{name => lang:get("光彩照人"), loss => [{20507, 4}],
      attrs => [{1, 280}, {3, 8}, {6, 40}, {7, 32}],
      loss_collect => 450, gain => [], fc => 120};
get_collect({5, 4}) ->
    #{name => lang:get("卓尔不群"), loss => [{20507, 5}],
      attrs => [{1, 350}, {3, 10}, {6, 50}, {7, 40}],
      loss_collect => 600, gain => [{29493, 1}], fc => 150};
get_collect({6, 4}) ->
    #{name => lang:get("魅力四射"), loss => [{20507, 6}],
      attrs => [{1, 420}, {3, 12}, {6, 60}, {7, 48}],
      loss_collect => 800, gain => [], fc => 180};
get_collect({7, 4}) ->
    #{name => lang:get("时尚达人"), loss => [{20507, 7}],
      attrs => [{1, 490}, {3, 14}, {6, 70}, {7, 56}],
      loss_collect => 1000, gain => [{21750, 1}], fc => 210};
get_collect({8, 4}) ->
    #{name => lang:get("引领潮流"), loss => [{20507, 8}],
      attrs => [{1, 560}, {3, 16}, {6, 80}, {7, 64}],
      loss_collect => 1200, gain => [{23641, 1}], fc => 240};
get_collect({9, 4}) ->
    #{name => lang:get("大家风范"), loss => [{20507, 9}],
      attrs => [{1, 630}, {3, 18}, {6, 90}, {7, 72}],
      loss_collect => 1500, gain => [{29499, 1}], fc => 270};
get_collect({10, 4}) ->
    #{name => lang:get("无与伦比"), loss => [{20507, 10}],
      attrs => [{1, 700}, {3, 20}, {6, 100}, {7, 80}],
      loss_collect => 2000, gain => [], fc => 300};
get_collect({11, 4}) ->
    #{name => lang:get("超凡脱俗"), loss => [{20507, 11}],
      attrs => [{1, 770}, {3, 22}, {6, 110}, {7, 88}],
      loss_collect => 2500, gain => [], fc => 330};
get_collect({12, 4}) ->
    #{name => lang:get("举世无双"), loss => [{20507, 12}],
      attrs => [{1, 840}, {3, 24}, {6, 120}, {7, 96}],
      loss_collect => 3000, gain => [], fc => 360};
get_collect({1, 7}) ->
    #{name => lang:get("潮流新手"), loss => [{20507, 1}],
      attrs => [{1, 70}, {4, 20}, {6, 10}, {7, 8}],
      loss_collect => 100, gain => [], fc => 30};
get_collect({2, 7}) ->
    #{name => lang:get("略识衣品"), loss => [{20507, 2}],
      attrs => [{1, 140}, {4, 40}, {6, 20}, {7, 16}],
      loss_collect => 200, gain => [], fc => 60};
get_collect({3, 7}) ->
    #{name => lang:get("落落大方"), loss => [{20507, 3}],
      attrs => [{1, 210}, {4, 60}, {6, 30}, {7, 24}],
      loss_collect => 320, gain => [{23640, 1}], fc => 90};
get_collect({4, 7}) ->
    #{name => lang:get("光彩照人"), loss => [{20507, 4}],
      attrs => [{1, 280}, {4, 80}, {6, 40}, {7, 32}],
      loss_collect => 450, gain => [], fc => 120};
get_collect({5, 7}) ->
    #{name => lang:get("卓尔不群"), loss => [{20507, 5}],
      attrs => [{1, 350}, {4, 100}, {6, 50}, {7, 40}],
      loss_collect => 600, gain => [{29493, 1}], fc => 150};
get_collect({6, 7}) ->
    #{name => lang:get("魅力四射"), loss => [{20507, 6}],
      attrs => [{1, 420}, {4, 120}, {6, 60}, {7, 48}],
      loss_collect => 800, gain => [], fc => 180};
get_collect({7, 7}) ->
    #{name => lang:get("时尚达人"), loss => [{20507, 7}],
      attrs => [{1, 490}, {4, 140}, {6, 70}, {7, 56}],
      loss_collect => 1000, gain => [{21750, 1}], fc => 210};
get_collect({8, 7}) ->
    #{name => lang:get("引领潮流"), loss => [{20507, 8}],
      attrs => [{1, 560}, {4, 160}, {6, 80}, {7, 64}],
      loss_collect => 1200, gain => [{23641, 1}], fc => 240};
get_collect({9, 7}) ->
    #{name => lang:get("大家风范"), loss => [{20507, 9}],
      attrs => [{1, 630}, {4, 180}, {6, 90}, {7, 72}],
      loss_collect => 1500, gain => [{29499, 1}], fc => 270};
get_collect({10, 7}) ->
    #{name => lang:get("无与伦比"), loss => [{20507, 10}],
      attrs => [{1, 700}, {4, 200}, {6, 100}, {7, 80}],
      loss_collect => 2000, gain => [], fc => 300};
get_collect({11, 7}) ->
    #{name => lang:get("超凡脱俗"), loss => [{20507, 11}],
      attrs => [{1, 770}, {4, 220}, {6, 110}, {7, 88}],
      loss_collect => 2500, gain => [], fc => 330};
get_collect({12, 7}) ->
    #{name => lang:get("举世无双"), loss => [{20507, 12}],
      attrs => [{1, 840}, {4, 240}, {6, 120}, {7, 96}],
      loss_collect => 3000, gain => [], fc => 360};
get_collect(_) -> false.

get_fashion_class_modify({2, 1, 1001}) -> 1014;
get_fashion_class_modify({3, 1, 1001}) -> 1025;
get_fashion_class_modify({4, 1, 1001}) -> 1038;
get_fashion_class_modify({5, 1, 1001}) -> 1051;
get_fashion_class_modify({6, 1, 1001}) -> 1062;
get_fashion_class_modify({2, 1, 1002}) -> 1013;
get_fashion_class_modify({3, 1, 1002}) -> 1028;
get_fashion_class_modify({4, 1, 1002}) -> 1040;
get_fashion_class_modify({5, 1, 1002}) -> 1050;
get_fashion_class_modify({6, 1, 1002}) -> 1063;
get_fashion_class_modify({2, 1, 1003}) -> 1017;
get_fashion_class_modify({3, 1, 1003}) -> 1029;
get_fashion_class_modify({4, 1, 1003}) -> 1041;
get_fashion_class_modify({5, 1, 1003}) -> 1052;
get_fashion_class_modify({6, 1, 1003}) -> 1061;
get_fashion_class_modify({2, 1, 1004}) -> 1016;
get_fashion_class_modify({3, 1, 1004}) -> 1026;
get_fashion_class_modify({4, 1, 1004}) -> 1039;
get_fashion_class_modify({5, 1, 1004}) -> 1053;
get_fashion_class_modify({6, 1, 1004}) -> 1064;
get_fashion_class_modify({2, 1, 1005}) -> 1015;
get_fashion_class_modify({3, 1, 1005}) -> 1027;
get_fashion_class_modify({4, 1, 1005}) -> 1037;
get_fashion_class_modify({5, 1, 1005}) -> 1049;
get_fashion_class_modify({6, 1, 1005}) -> 1065;
get_fashion_class_modify({2, 0, 1007}) -> 1019;
get_fashion_class_modify({3, 0, 1007}) -> 1032;
get_fashion_class_modify({4, 0, 1007}) -> 1043;
get_fashion_class_modify({5, 0, 1007}) -> 1057;
get_fashion_class_modify({6, 0, 1007}) -> 1068;
get_fashion_class_modify({2, 0, 1008}) -> 1020;
get_fashion_class_modify({3, 0, 1008}) -> 1031;
get_fashion_class_modify({4, 0, 1008}) -> 1045;
get_fashion_class_modify({5, 0, 1008}) -> 1056;
get_fashion_class_modify({6, 0, 1008}) -> 1069;
get_fashion_class_modify({2, 0, 1009}) -> 1023;
get_fashion_class_modify({3, 0, 1009}) -> 1034;
get_fashion_class_modify({4, 0, 1009}) -> 1044;
get_fashion_class_modify({5, 0, 1009}) -> 1059;
get_fashion_class_modify({6, 0, 1009}) -> 1070;
get_fashion_class_modify({2, 0, 1010}) -> 1021;
get_fashion_class_modify({3, 0, 1010}) -> 1035;
get_fashion_class_modify({4, 0, 1010}) -> 1046;
get_fashion_class_modify({5, 0, 1010}) -> 1055;
get_fashion_class_modify({6, 0, 1010}) -> 1067;
get_fashion_class_modify({2, 0, 1011}) -> 1022;
get_fashion_class_modify({3, 0, 1011}) -> 1033;
get_fashion_class_modify({4, 0, 1011}) -> 1047;
get_fashion_class_modify({5, 0, 1011}) -> 1058;
get_fashion_class_modify({6, 0, 1011}) -> 1071;
get_fashion_class_modify({1, 1, 1013}) -> 1002;
get_fashion_class_modify({3, 1, 1013}) -> 1028;
get_fashion_class_modify({4, 1, 1013}) -> 1040;
get_fashion_class_modify({5, 1, 1013}) -> 1050;
get_fashion_class_modify({6, 1, 1013}) -> 1063;
get_fashion_class_modify({1, 1, 1014}) -> 1001;
get_fashion_class_modify({3, 1, 1014}) -> 1025;
get_fashion_class_modify({4, 1, 1014}) -> 1038;
get_fashion_class_modify({5, 1, 1014}) -> 1051;
get_fashion_class_modify({6, 1, 1014}) -> 1062;
get_fashion_class_modify({1, 1, 1015}) -> 1005;
get_fashion_class_modify({3, 1, 1015}) -> 1027;
get_fashion_class_modify({4, 1, 1015}) -> 1037;
get_fashion_class_modify({5, 1, 1015}) -> 1049;
get_fashion_class_modify({6, 1, 1015}) -> 1065;
get_fashion_class_modify({1, 1, 1016}) -> 1004;
get_fashion_class_modify({3, 1, 1016}) -> 1026;
get_fashion_class_modify({4, 1, 1016}) -> 1039;
get_fashion_class_modify({5, 1, 1016}) -> 1053;
get_fashion_class_modify({6, 1, 1016}) -> 1064;
get_fashion_class_modify({1, 1, 1017}) -> 1003;
get_fashion_class_modify({3, 1, 1017}) -> 1029;
get_fashion_class_modify({4, 1, 1017}) -> 1041;
get_fashion_class_modify({5, 1, 1017}) -> 1052;
get_fashion_class_modify({6, 1, 1017}) -> 1061;
get_fashion_class_modify({1, 0, 1019}) -> 1007;
get_fashion_class_modify({3, 0, 1019}) -> 1032;
get_fashion_class_modify({4, 0, 1019}) -> 1043;
get_fashion_class_modify({5, 0, 1019}) -> 1057;
get_fashion_class_modify({6, 0, 1019}) -> 1068;
get_fashion_class_modify({1, 0, 1020}) -> 1008;
get_fashion_class_modify({3, 0, 1020}) -> 1031;
get_fashion_class_modify({4, 0, 1020}) -> 1045;
get_fashion_class_modify({5, 0, 1020}) -> 1056;
get_fashion_class_modify({6, 0, 1020}) -> 1069;
get_fashion_class_modify({1, 0, 1021}) -> 1010;
get_fashion_class_modify({3, 0, 1021}) -> 1035;
get_fashion_class_modify({4, 0, 1021}) -> 1046;
get_fashion_class_modify({5, 0, 1021}) -> 1055;
get_fashion_class_modify({6, 0, 1021}) -> 1067;
get_fashion_class_modify({1, 0, 1022}) -> 1011;
get_fashion_class_modify({3, 0, 1022}) -> 1033;
get_fashion_class_modify({4, 0, 1022}) -> 1047;
get_fashion_class_modify({5, 0, 1022}) -> 1058;
get_fashion_class_modify({6, 0, 1022}) -> 1071;
get_fashion_class_modify({1, 0, 1023}) -> 1009;
get_fashion_class_modify({3, 0, 1023}) -> 1034;
get_fashion_class_modify({4, 0, 1023}) -> 1044;
get_fashion_class_modify({5, 0, 1023}) -> 1059;
get_fashion_class_modify({6, 0, 1023}) -> 1070;
get_fashion_class_modify({1, 1, 1025}) -> 1001;
get_fashion_class_modify({2, 1, 1025}) -> 1014;
get_fashion_class_modify({4, 1, 1025}) -> 1038;
get_fashion_class_modify({5, 1, 1025}) -> 1051;
get_fashion_class_modify({6, 1, 1025}) -> 1062;
get_fashion_class_modify({1, 1, 1026}) -> 1004;
get_fashion_class_modify({2, 1, 1026}) -> 1016;
get_fashion_class_modify({4, 1, 1026}) -> 1039;
get_fashion_class_modify({5, 1, 1026}) -> 1053;
get_fashion_class_modify({6, 1, 1026}) -> 1064;
get_fashion_class_modify({1, 1, 1027}) -> 1005;
get_fashion_class_modify({2, 1, 1027}) -> 1015;
get_fashion_class_modify({4, 1, 1027}) -> 1037;
get_fashion_class_modify({5, 1, 1027}) -> 1049;
get_fashion_class_modify({6, 1, 1027}) -> 1065;
get_fashion_class_modify({1, 1, 1028}) -> 1002;
get_fashion_class_modify({2, 1, 1028}) -> 1013;
get_fashion_class_modify({4, 1, 1028}) -> 1040;
get_fashion_class_modify({5, 1, 1028}) -> 1050;
get_fashion_class_modify({6, 1, 1028}) -> 1063;
get_fashion_class_modify({1, 1, 1029}) -> 1003;
get_fashion_class_modify({2, 1, 1029}) -> 1017;
get_fashion_class_modify({4, 1, 1029}) -> 1041;
get_fashion_class_modify({5, 1, 1029}) -> 1052;
get_fashion_class_modify({6, 1, 1029}) -> 1061;
get_fashion_class_modify({1, 0, 1031}) -> 1008;
get_fashion_class_modify({2, 0, 1031}) -> 1020;
get_fashion_class_modify({4, 0, 1031}) -> 1045;
get_fashion_class_modify({5, 0, 1031}) -> 1056;
get_fashion_class_modify({6, 0, 1031}) -> 1069;
get_fashion_class_modify({1, 0, 1032}) -> 1007;
get_fashion_class_modify({2, 0, 1032}) -> 1019;
get_fashion_class_modify({4, 0, 1032}) -> 1043;
get_fashion_class_modify({5, 0, 1032}) -> 1057;
get_fashion_class_modify({6, 0, 1032}) -> 1068;
get_fashion_class_modify({1, 0, 1033}) -> 1011;
get_fashion_class_modify({2, 0, 1033}) -> 1022;
get_fashion_class_modify({4, 0, 1033}) -> 1047;
get_fashion_class_modify({5, 0, 1033}) -> 1058;
get_fashion_class_modify({6, 0, 1033}) -> 1071;
get_fashion_class_modify({1, 0, 1034}) -> 1009;
get_fashion_class_modify({2, 0, 1034}) -> 1023;
get_fashion_class_modify({4, 0, 1034}) -> 1044;
get_fashion_class_modify({5, 0, 1034}) -> 1059;
get_fashion_class_modify({6, 0, 1034}) -> 1070;
get_fashion_class_modify({1, 0, 1035}) -> 1010;
get_fashion_class_modify({2, 0, 1035}) -> 1035;
get_fashion_class_modify({4, 0, 1035}) -> 1046;
get_fashion_class_modify({5, 0, 1035}) -> 1055;
get_fashion_class_modify({6, 0, 1035}) -> 1067;
get_fashion_class_modify({1, 1, 1037}) -> 1005;
get_fashion_class_modify({2, 1, 1037}) -> 1015;
get_fashion_class_modify({3, 1, 1037}) -> 1027;
get_fashion_class_modify({5, 1, 1037}) -> 1049;
get_fashion_class_modify({6, 1, 1037}) -> 1065;
get_fashion_class_modify({1, 1, 1038}) -> 1001;
get_fashion_class_modify({2, 1, 1038}) -> 1014;
get_fashion_class_modify({3, 1, 1038}) -> 1025;
get_fashion_class_modify({5, 1, 1038}) -> 1051;
get_fashion_class_modify({6, 1, 1038}) -> 1062;
get_fashion_class_modify({1, 1, 1039}) -> 1004;
get_fashion_class_modify({2, 1, 1039}) -> 1016;
get_fashion_class_modify({3, 1, 1039}) -> 1026;
get_fashion_class_modify({5, 1, 1039}) -> 1053;
get_fashion_class_modify({6, 1, 1039}) -> 1064;
get_fashion_class_modify({1, 1, 1040}) -> 1002;
get_fashion_class_modify({2, 1, 1040}) -> 1013;
get_fashion_class_modify({3, 1, 1040}) -> 1028;
get_fashion_class_modify({5, 1, 1040}) -> 1050;
get_fashion_class_modify({6, 1, 1040}) -> 1063;
get_fashion_class_modify({1, 1, 1041}) -> 1003;
get_fashion_class_modify({2, 1, 1041}) -> 1017;
get_fashion_class_modify({3, 1, 1041}) -> 1029;
get_fashion_class_modify({5, 1, 1041}) -> 1052;
get_fashion_class_modify({6, 1, 1041}) -> 1061;
get_fashion_class_modify({1, 0, 1043}) -> 1007;
get_fashion_class_modify({2, 0, 1043}) -> 1019;
get_fashion_class_modify({3, 0, 1043}) -> 1032;
get_fashion_class_modify({5, 0, 1043}) -> 1057;
get_fashion_class_modify({6, 0, 1043}) -> 1068;
get_fashion_class_modify({1, 0, 1044}) -> 1009;
get_fashion_class_modify({2, 0, 1044}) -> 1023;
get_fashion_class_modify({3, 0, 1044}) -> 1034;
get_fashion_class_modify({5, 0, 1044}) -> 1059;
get_fashion_class_modify({6, 0, 1044}) -> 1070;
get_fashion_class_modify({1, 0, 1045}) -> 1008;
get_fashion_class_modify({2, 0, 1045}) -> 1020;
get_fashion_class_modify({3, 0, 1045}) -> 1031;
get_fashion_class_modify({5, 0, 1045}) -> 1056;
get_fashion_class_modify({6, 0, 1045}) -> 1069;
get_fashion_class_modify({1, 0, 1046}) -> 1010;
get_fashion_class_modify({2, 0, 1046}) -> 1035;
get_fashion_class_modify({3, 0, 1046}) -> 1035;
get_fashion_class_modify({5, 0, 1046}) -> 1055;
get_fashion_class_modify({6, 0, 1046}) -> 1067;
get_fashion_class_modify({1, 0, 1047}) -> 1011;
get_fashion_class_modify({2, 0, 1047}) -> 1022;
get_fashion_class_modify({3, 0, 1047}) -> 1033;
get_fashion_class_modify({5, 0, 1047}) -> 1058;
get_fashion_class_modify({6, 0, 1047}) -> 1071;
get_fashion_class_modify({1, 1, 1049}) -> 1005;
get_fashion_class_modify({2, 1, 1049}) -> 1015;
get_fashion_class_modify({3, 1, 1049}) -> 1027;
get_fashion_class_modify({4, 1, 1049}) -> 1037;
get_fashion_class_modify({6, 1, 1049}) -> 1065;
get_fashion_class_modify({1, 1, 1050}) -> 1002;
get_fashion_class_modify({2, 1, 1050}) -> 1013;
get_fashion_class_modify({3, 1, 1050}) -> 1028;
get_fashion_class_modify({4, 1, 1050}) -> 1040;
get_fashion_class_modify({6, 1, 1050}) -> 1063;
get_fashion_class_modify({1, 1, 1051}) -> 1001;
get_fashion_class_modify({2, 1, 1051}) -> 1014;
get_fashion_class_modify({3, 1, 1051}) -> 1025;
get_fashion_class_modify({4, 1, 1051}) -> 1038;
get_fashion_class_modify({6, 1, 1051}) -> 1062;
get_fashion_class_modify({1, 1, 1052}) -> 1003;
get_fashion_class_modify({2, 1, 1052}) -> 1017;
get_fashion_class_modify({3, 1, 1052}) -> 1029;
get_fashion_class_modify({4, 1, 1052}) -> 1041;
get_fashion_class_modify({6, 1, 1052}) -> 1061;
get_fashion_class_modify({1, 1, 1053}) -> 1004;
get_fashion_class_modify({2, 1, 1053}) -> 1016;
get_fashion_class_modify({3, 1, 1053}) -> 1026;
get_fashion_class_modify({4, 1, 1053}) -> 1039;
get_fashion_class_modify({6, 1, 1053}) -> 1064;
get_fashion_class_modify({1, 0, 1055}) -> 1010;
get_fashion_class_modify({2, 0, 1055}) -> 1035;
get_fashion_class_modify({3, 0, 1055}) -> 1035;
get_fashion_class_modify({4, 0, 1055}) -> 1046;
get_fashion_class_modify({6, 0, 1055}) -> 1067;
get_fashion_class_modify({1, 0, 1056}) -> 1008;
get_fashion_class_modify({2, 0, 1056}) -> 1020;
get_fashion_class_modify({3, 0, 1056}) -> 1031;
get_fashion_class_modify({4, 0, 1056}) -> 1045;
get_fashion_class_modify({6, 0, 1056}) -> 1069;
get_fashion_class_modify({1, 0, 1057}) -> 1007;
get_fashion_class_modify({2, 0, 1057}) -> 1019;
get_fashion_class_modify({3, 0, 1057}) -> 1032;
get_fashion_class_modify({4, 0, 1057}) -> 1043;
get_fashion_class_modify({6, 0, 1057}) -> 1068;
get_fashion_class_modify({1, 0, 1058}) -> 1011;
get_fashion_class_modify({2, 0, 1058}) -> 1022;
get_fashion_class_modify({3, 0, 1058}) -> 1033;
get_fashion_class_modify({4, 0, 1058}) -> 1047;
get_fashion_class_modify({6, 0, 1058}) -> 1071;
get_fashion_class_modify({1, 0, 1059}) -> 1009;
get_fashion_class_modify({2, 0, 1059}) -> 1023;
get_fashion_class_modify({3, 0, 1059}) -> 1034;
get_fashion_class_modify({4, 0, 1059}) -> 1044;
get_fashion_class_modify({6, 0, 1059}) -> 1070;
get_fashion_class_modify({1, 1, 1061}) -> 1003;
get_fashion_class_modify({2, 1, 1061}) -> 1017;
get_fashion_class_modify({3, 1, 1061}) -> 1029;
get_fashion_class_modify({4, 1, 1061}) -> 1041;
get_fashion_class_modify({5, 1, 1061}) -> 1052;
get_fashion_class_modify({1, 1, 1062}) -> 1001;
get_fashion_class_modify({2, 1, 1062}) -> 1014;
get_fashion_class_modify({3, 1, 1062}) -> 1025;
get_fashion_class_modify({4, 1, 1062}) -> 1039;
get_fashion_class_modify({5, 1, 1062}) -> 1051;
get_fashion_class_modify({1, 1, 1063}) -> 1002;
get_fashion_class_modify({2, 1, 1063}) -> 1013;
get_fashion_class_modify({3, 1, 1063}) -> 1028;
get_fashion_class_modify({4, 1, 1063}) -> 1040;
get_fashion_class_modify({5, 1, 1063}) -> 1050;
get_fashion_class_modify({1, 1, 1064}) -> 1004;
get_fashion_class_modify({2, 1, 1064}) -> 1016;
get_fashion_class_modify({3, 1, 1064}) -> 1026;
get_fashion_class_modify({4, 1, 1064}) -> 1039;
get_fashion_class_modify({5, 1, 1064}) -> 1053;
get_fashion_class_modify({1, 1, 1065}) -> 1005;
get_fashion_class_modify({2, 1, 1065}) -> 1015;
get_fashion_class_modify({3, 1, 1065}) -> 1027;
get_fashion_class_modify({4, 1, 1065}) -> 1037;
get_fashion_class_modify({5, 1, 1065}) -> 1049;
get_fashion_class_modify({1, 0, 1067}) -> 1010;
get_fashion_class_modify({2, 0, 1067}) -> 1035;
get_fashion_class_modify({3, 0, 1067}) -> 1035;
get_fashion_class_modify({4, 0, 1067}) -> 1046;
get_fashion_class_modify({5, 0, 1067}) -> 1055;
get_fashion_class_modify({1, 0, 1068}) -> 1007;
get_fashion_class_modify({2, 0, 1068}) -> 1019;
get_fashion_class_modify({3, 0, 1068}) -> 1032;
get_fashion_class_modify({4, 0, 1068}) -> 1043;
get_fashion_class_modify({5, 0, 1068}) -> 1057;
get_fashion_class_modify({1, 0, 1069}) -> 1008;
get_fashion_class_modify({2, 0, 1069}) -> 1020;
get_fashion_class_modify({3, 0, 1069}) -> 1031;
get_fashion_class_modify({4, 0, 1069}) -> 1045;
get_fashion_class_modify({5, 0, 1069}) -> 1056;
get_fashion_class_modify({1, 0, 1070}) -> 1009;
get_fashion_class_modify({2, 0, 1070}) -> 1023;
get_fashion_class_modify({3, 0, 1070}) -> 1034;
get_fashion_class_modify({4, 0, 1070}) -> 1044;
get_fashion_class_modify({5, 0, 1070}) -> 1059;
get_fashion_class_modify({1, 0, 1071}) -> 1011;
get_fashion_class_modify({2, 0, 1071}) -> 1022;
get_fashion_class_modify({3, 0, 1071}) -> 1033;
get_fashion_class_modify({4, 0, 1071}) -> 1047;
get_fashion_class_modify({5, 0, 1071}) -> 1058;
get_fashion_class_modify({2, 1, 2001}) -> 2015;
get_fashion_class_modify({3, 1, 2001}) -> 2025;
get_fashion_class_modify({4, 1, 2001}) -> 2037;
get_fashion_class_modify({5, 1, 2001}) -> 2050;
get_fashion_class_modify({6, 1, 2001}) -> 2062;
get_fashion_class_modify({2, 1, 2002}) -> 2014;
get_fashion_class_modify({3, 1, 2002}) -> 2026;
get_fashion_class_modify({4, 1, 2002}) -> 2041;
get_fashion_class_modify({5, 1, 2002}) -> 2049;
get_fashion_class_modify({6, 1, 2002}) -> 2061;
get_fashion_class_modify({2, 1, 2003}) -> 2017;
get_fashion_class_modify({3, 1, 2003}) -> 2027;
get_fashion_class_modify({4, 1, 2003}) -> 2039;
get_fashion_class_modify({5, 1, 2003}) -> 2053;
get_fashion_class_modify({6, 1, 2003}) -> 2065;
get_fashion_class_modify({2, 1, 2004}) -> 2013;
get_fashion_class_modify({3, 1, 2004}) -> 2028;
get_fashion_class_modify({4, 1, 2004}) -> 2038;
get_fashion_class_modify({5, 1, 2004}) -> 2051;
get_fashion_class_modify({6, 1, 2004}) -> 2063;
get_fashion_class_modify({2, 1, 2005}) -> 2016;
get_fashion_class_modify({3, 1, 2005}) -> 2029;
get_fashion_class_modify({4, 1, 2005}) -> 2040;
get_fashion_class_modify({5, 1, 2005}) -> 2052;
get_fashion_class_modify({6, 1, 2005}) -> 2064;
get_fashion_class_modify({2, 0, 2007}) -> 2019;
get_fashion_class_modify({3, 0, 2007}) -> 2031;
get_fashion_class_modify({4, 0, 2007}) -> 2043;
get_fashion_class_modify({5, 0, 2007}) -> 2056;
get_fashion_class_modify({6, 0, 2007}) -> 2068;
get_fashion_class_modify({2, 0, 2008}) -> 2021;
get_fashion_class_modify({3, 0, 2008}) -> 2034;
get_fashion_class_modify({4, 0, 2008}) -> 2046;
get_fashion_class_modify({5, 0, 2008}) -> 2055;
get_fashion_class_modify({6, 0, 2008}) -> 2067;
get_fashion_class_modify({2, 0, 2009}) -> 2023;
get_fashion_class_modify({3, 0, 2009}) -> 2033;
get_fashion_class_modify({4, 0, 2009}) -> 2044;
get_fashion_class_modify({5, 0, 2009}) -> 2057;
get_fashion_class_modify({6, 0, 2009}) -> 2069;
get_fashion_class_modify({2, 0, 2010}) -> 2020;
get_fashion_class_modify({3, 0, 2010}) -> 2032;
get_fashion_class_modify({4, 0, 2010}) -> 2045;
get_fashion_class_modify({5, 0, 2010}) -> 2059;
get_fashion_class_modify({6, 0, 2010}) -> 2071;
get_fashion_class_modify({2, 0, 2011}) -> 2022;
get_fashion_class_modify({3, 0, 2011}) -> 2035;
get_fashion_class_modify({4, 0, 2011}) -> 2047;
get_fashion_class_modify({5, 0, 2011}) -> 2058;
get_fashion_class_modify({6, 0, 2011}) -> 2070;
get_fashion_class_modify({1, 1, 2013}) -> 2004;
get_fashion_class_modify({3, 1, 2013}) -> 2028;
get_fashion_class_modify({4, 1, 2013}) -> 2038;
get_fashion_class_modify({5, 1, 2013}) -> 2051;
get_fashion_class_modify({6, 1, 2013}) -> 2063;
get_fashion_class_modify({1, 1, 2014}) -> 2002;
get_fashion_class_modify({3, 1, 2014}) -> 2026;
get_fashion_class_modify({4, 1, 2014}) -> 2041;
get_fashion_class_modify({5, 1, 2014}) -> 2049;
get_fashion_class_modify({6, 1, 2014}) -> 2061;
get_fashion_class_modify({1, 1, 2015}) -> 2001;
get_fashion_class_modify({3, 1, 2015}) -> 2025;
get_fashion_class_modify({4, 1, 2015}) -> 2037;
get_fashion_class_modify({5, 1, 2015}) -> 2050;
get_fashion_class_modify({6, 1, 2015}) -> 2062;
get_fashion_class_modify({1, 1, 2016}) -> 2005;
get_fashion_class_modify({3, 1, 2016}) -> 2029;
get_fashion_class_modify({4, 1, 2016}) -> 2040;
get_fashion_class_modify({5, 1, 2016}) -> 2052;
get_fashion_class_modify({6, 1, 2016}) -> 2064;
get_fashion_class_modify({1, 1, 2017}) -> 2003;
get_fashion_class_modify({3, 1, 2017}) -> 2027;
get_fashion_class_modify({4, 1, 2017}) -> 2039;
get_fashion_class_modify({5, 1, 2017}) -> 2053;
get_fashion_class_modify({6, 1, 2017}) -> 2065;
get_fashion_class_modify({1, 0, 2019}) -> 2007;
get_fashion_class_modify({3, 0, 2019}) -> 2031;
get_fashion_class_modify({4, 0, 2019}) -> 2043;
get_fashion_class_modify({5, 0, 2019}) -> 2056;
get_fashion_class_modify({6, 0, 2019}) -> 2068;
get_fashion_class_modify({1, 0, 2020}) -> 2010;
get_fashion_class_modify({3, 0, 2020}) -> 2032;
get_fashion_class_modify({4, 0, 2020}) -> 2045;
get_fashion_class_modify({5, 0, 2020}) -> 2059;
get_fashion_class_modify({6, 0, 2020}) -> 2071;
get_fashion_class_modify({1, 0, 2021}) -> 2008;
get_fashion_class_modify({3, 0, 2021}) -> 2034;
get_fashion_class_modify({4, 0, 2021}) -> 2046;
get_fashion_class_modify({5, 0, 2021}) -> 2055;
get_fashion_class_modify({6, 0, 2021}) -> 2067;
get_fashion_class_modify({1, 0, 2022}) -> 2011;
get_fashion_class_modify({3, 0, 2022}) -> 2035;
get_fashion_class_modify({4, 0, 2022}) -> 2047;
get_fashion_class_modify({5, 0, 2022}) -> 2058;
get_fashion_class_modify({6, 0, 2022}) -> 2070;
get_fashion_class_modify({1, 0, 2023}) -> 2009;
get_fashion_class_modify({3, 0, 2023}) -> 2033;
get_fashion_class_modify({4, 0, 2023}) -> 2044;
get_fashion_class_modify({5, 0, 2023}) -> 2057;
get_fashion_class_modify({6, 0, 2023}) -> 2069;
get_fashion_class_modify({1, 1, 2025}) -> 2001;
get_fashion_class_modify({2, 1, 2025}) -> 2015;
get_fashion_class_modify({4, 1, 2025}) -> 2037;
get_fashion_class_modify({5, 1, 2025}) -> 2050;
get_fashion_class_modify({6, 1, 2025}) -> 2062;
get_fashion_class_modify({1, 1, 2026}) -> 2002;
get_fashion_class_modify({2, 1, 2026}) -> 2014;
get_fashion_class_modify({4, 1, 2026}) -> 2041;
get_fashion_class_modify({5, 1, 2026}) -> 2049;
get_fashion_class_modify({6, 1, 2026}) -> 2061;
get_fashion_class_modify({1, 1, 2027}) -> 2003;
get_fashion_class_modify({2, 1, 2027}) -> 2017;
get_fashion_class_modify({4, 1, 2027}) -> 2039;
get_fashion_class_modify({5, 1, 2027}) -> 2053;
get_fashion_class_modify({6, 1, 2027}) -> 2065;
get_fashion_class_modify({1, 1, 2028}) -> 2004;
get_fashion_class_modify({2, 1, 2028}) -> 2013;
get_fashion_class_modify({4, 1, 2028}) -> 2038;
get_fashion_class_modify({5, 1, 2028}) -> 2051;
get_fashion_class_modify({6, 1, 2028}) -> 2063;
get_fashion_class_modify({1, 1, 2029}) -> 2005;
get_fashion_class_modify({2, 1, 2029}) -> 2016;
get_fashion_class_modify({4, 1, 2029}) -> 2040;
get_fashion_class_modify({5, 1, 2029}) -> 2052;
get_fashion_class_modify({6, 1, 2029}) -> 2064;
get_fashion_class_modify({1, 0, 2031}) -> 2007;
get_fashion_class_modify({2, 0, 2031}) -> 2019;
get_fashion_class_modify({4, 0, 2031}) -> 2043;
get_fashion_class_modify({5, 0, 2031}) -> 2056;
get_fashion_class_modify({6, 0, 2031}) -> 2068;
get_fashion_class_modify({1, 0, 2032}) -> 2010;
get_fashion_class_modify({2, 0, 2032}) -> 2020;
get_fashion_class_modify({4, 0, 2032}) -> 2045;
get_fashion_class_modify({5, 0, 2032}) -> 2059;
get_fashion_class_modify({6, 0, 2032}) -> 2071;
get_fashion_class_modify({1, 0, 2033}) -> 2009;
get_fashion_class_modify({2, 0, 2033}) -> 2023;
get_fashion_class_modify({4, 0, 2033}) -> 2044;
get_fashion_class_modify({5, 0, 2033}) -> 2057;
get_fashion_class_modify({6, 0, 2033}) -> 2069;
get_fashion_class_modify({1, 0, 2034}) -> 2008;
get_fashion_class_modify({2, 0, 2034}) -> 2021;
get_fashion_class_modify({4, 0, 2034}) -> 2046;
get_fashion_class_modify({5, 0, 2034}) -> 2055;
get_fashion_class_modify({6, 0, 2034}) -> 2067;
get_fashion_class_modify({1, 0, 2035}) -> 2011;
get_fashion_class_modify({2, 0, 2035}) -> 2022;
get_fashion_class_modify({4, 0, 2035}) -> 2047;
get_fashion_class_modify({5, 0, 2035}) -> 2058;
get_fashion_class_modify({6, 0, 2035}) -> 2070;
get_fashion_class_modify({1, 1, 2037}) -> 2001;
get_fashion_class_modify({2, 1, 2037}) -> 2015;
get_fashion_class_modify({3, 1, 2037}) -> 2025;
get_fashion_class_modify({5, 1, 2037}) -> 2050;
get_fashion_class_modify({6, 1, 2037}) -> 2062;
get_fashion_class_modify({1, 1, 2038}) -> 2004;
get_fashion_class_modify({2, 1, 2038}) -> 2013;
get_fashion_class_modify({3, 1, 2038}) -> 2028;
get_fashion_class_modify({5, 1, 2038}) -> 2051;
get_fashion_class_modify({6, 1, 2038}) -> 2063;
get_fashion_class_modify({1, 1, 2039}) -> 2003;
get_fashion_class_modify({2, 1, 2039}) -> 2017;
get_fashion_class_modify({3, 1, 2039}) -> 2027;
get_fashion_class_modify({5, 1, 2039}) -> 2053;
get_fashion_class_modify({6, 1, 2039}) -> 2065;
get_fashion_class_modify({1, 1, 2040}) -> 2005;
get_fashion_class_modify({2, 1, 2040}) -> 2016;
get_fashion_class_modify({3, 1, 2040}) -> 2029;
get_fashion_class_modify({5, 1, 2040}) -> 2052;
get_fashion_class_modify({6, 1, 2040}) -> 2064;
get_fashion_class_modify({1, 1, 2041}) -> 2002;
get_fashion_class_modify({2, 1, 2041}) -> 2014;
get_fashion_class_modify({3, 1, 2041}) -> 2026;
get_fashion_class_modify({5, 1, 2041}) -> 2049;
get_fashion_class_modify({6, 1, 2041}) -> 2061;
get_fashion_class_modify({1, 0, 2043}) -> 2007;
get_fashion_class_modify({2, 0, 2043}) -> 2019;
get_fashion_class_modify({3, 0, 2043}) -> 2031;
get_fashion_class_modify({5, 0, 2043}) -> 2056;
get_fashion_class_modify({6, 0, 2043}) -> 2068;
get_fashion_class_modify({1, 0, 2044}) -> 2009;
get_fashion_class_modify({2, 0, 2044}) -> 2023;
get_fashion_class_modify({3, 0, 2044}) -> 2033;
get_fashion_class_modify({5, 0, 2044}) -> 2057;
get_fashion_class_modify({6, 0, 2044}) -> 2069;
get_fashion_class_modify({1, 0, 2045}) -> 2010;
get_fashion_class_modify({2, 0, 2045}) -> 2020;
get_fashion_class_modify({3, 0, 2045}) -> 2032;
get_fashion_class_modify({5, 0, 2045}) -> 2059;
get_fashion_class_modify({6, 0, 2045}) -> 2071;
get_fashion_class_modify({1, 0, 2046}) -> 2008;
get_fashion_class_modify({2, 0, 2046}) -> 2021;
get_fashion_class_modify({3, 0, 2046}) -> 2034;
get_fashion_class_modify({5, 0, 2046}) -> 2055;
get_fashion_class_modify({6, 0, 2046}) -> 2067;
get_fashion_class_modify({1, 0, 2047}) -> 2011;
get_fashion_class_modify({2, 0, 2047}) -> 2022;
get_fashion_class_modify({3, 0, 2047}) -> 2035;
get_fashion_class_modify({5, 0, 2047}) -> 2058;
get_fashion_class_modify({6, 0, 2047}) -> 2070;
get_fashion_class_modify({1, 1, 2049}) -> 2002;
get_fashion_class_modify({2, 1, 2049}) -> 2014;
get_fashion_class_modify({3, 1, 2049}) -> 2026;
get_fashion_class_modify({4, 1, 2049}) -> 2041;
get_fashion_class_modify({6, 1, 2049}) -> 2061;
get_fashion_class_modify({1, 1, 2050}) -> 2001;
get_fashion_class_modify({2, 1, 2050}) -> 2015;
get_fashion_class_modify({3, 1, 2050}) -> 2025;
get_fashion_class_modify({4, 1, 2050}) -> 2037;
get_fashion_class_modify({6, 1, 2050}) -> 2062;
get_fashion_class_modify({1, 1, 2051}) -> 2004;
get_fashion_class_modify({2, 1, 2051}) -> 2013;
get_fashion_class_modify({3, 1, 2051}) -> 2028;
get_fashion_class_modify({4, 1, 2051}) -> 2038;
get_fashion_class_modify({6, 1, 2051}) -> 2063;
get_fashion_class_modify({1, 1, 2052}) -> 2005;
get_fashion_class_modify({2, 1, 2052}) -> 2016;
get_fashion_class_modify({3, 1, 2052}) -> 2029;
get_fashion_class_modify({4, 1, 2052}) -> 2040;
get_fashion_class_modify({6, 1, 2052}) -> 2064;
get_fashion_class_modify({1, 1, 2053}) -> 2003;
get_fashion_class_modify({2, 1, 2053}) -> 2017;
get_fashion_class_modify({3, 1, 2053}) -> 2027;
get_fashion_class_modify({4, 1, 2053}) -> 2039;
get_fashion_class_modify({6, 1, 2053}) -> 2065;
get_fashion_class_modify({1, 0, 2055}) -> 2008;
get_fashion_class_modify({2, 0, 2055}) -> 2021;
get_fashion_class_modify({3, 0, 2055}) -> 2034;
get_fashion_class_modify({4, 0, 2055}) -> 2046;
get_fashion_class_modify({6, 0, 2055}) -> 2067;
get_fashion_class_modify({1, 0, 2056}) -> 2007;
get_fashion_class_modify({2, 0, 2056}) -> 2019;
get_fashion_class_modify({3, 0, 2056}) -> 2031;
get_fashion_class_modify({4, 0, 2056}) -> 2043;
get_fashion_class_modify({6, 0, 2056}) -> 2068;
get_fashion_class_modify({1, 0, 2057}) -> 2009;
get_fashion_class_modify({2, 0, 2057}) -> 2023;
get_fashion_class_modify({3, 0, 2057}) -> 2033;
get_fashion_class_modify({4, 0, 2057}) -> 2044;
get_fashion_class_modify({6, 0, 2057}) -> 2069;
get_fashion_class_modify({1, 0, 2058}) -> 2011;
get_fashion_class_modify({2, 0, 2058}) -> 2022;
get_fashion_class_modify({3, 0, 2058}) -> 2035;
get_fashion_class_modify({4, 0, 2058}) -> 2047;
get_fashion_class_modify({6, 0, 2058}) -> 2070;
get_fashion_class_modify({1, 0, 2059}) -> 2010;
get_fashion_class_modify({2, 0, 2059}) -> 2020;
get_fashion_class_modify({3, 0, 2059}) -> 2032;
get_fashion_class_modify({4, 0, 2059}) -> 2045;
get_fashion_class_modify({6, 0, 2059}) -> 2071;
get_fashion_class_modify({1, 1, 2061}) -> 2002;
get_fashion_class_modify({2, 1, 2061}) -> 2014;
get_fashion_class_modify({3, 1, 2061}) -> 2026;
get_fashion_class_modify({4, 1, 2061}) -> 2041;
get_fashion_class_modify({5, 1, 2061}) -> 2049;
get_fashion_class_modify({1, 1, 2062}) -> 2001;
get_fashion_class_modify({2, 1, 2062}) -> 2015;
get_fashion_class_modify({3, 1, 2062}) -> 2025;
get_fashion_class_modify({4, 1, 2062}) -> 2037;
get_fashion_class_modify({5, 1, 2062}) -> 2050;
get_fashion_class_modify({1, 1, 2063}) -> 2004;
get_fashion_class_modify({2, 1, 2063}) -> 2013;
get_fashion_class_modify({3, 1, 2063}) -> 2028;
get_fashion_class_modify({4, 1, 2063}) -> 2038;
get_fashion_class_modify({5, 1, 2063}) -> 2051;
get_fashion_class_modify({1, 1, 2064}) -> 2005;
get_fashion_class_modify({2, 1, 2064}) -> 2016;
get_fashion_class_modify({3, 1, 2064}) -> 2029;
get_fashion_class_modify({4, 1, 2064}) -> 2040;
get_fashion_class_modify({5, 1, 2064}) -> 2052;
get_fashion_class_modify({1, 1, 2065}) -> 2003;
get_fashion_class_modify({2, 1, 2065}) -> 2017;
get_fashion_class_modify({3, 1, 2065}) -> 2027;
get_fashion_class_modify({4, 1, 2065}) -> 2039;
get_fashion_class_modify({5, 1, 2065}) -> 2053;
get_fashion_class_modify({1, 0, 2067}) -> 2008;
get_fashion_class_modify({2, 0, 2067}) -> 2021;
get_fashion_class_modify({3, 0, 2067}) -> 2034;
get_fashion_class_modify({4, 0, 2067}) -> 2046;
get_fashion_class_modify({5, 0, 2067}) -> 2055;
get_fashion_class_modify({1, 0, 2068}) -> 2007;
get_fashion_class_modify({2, 0, 2068}) -> 2019;
get_fashion_class_modify({3, 0, 2068}) -> 2031;
get_fashion_class_modify({4, 0, 2068}) -> 2043;
get_fashion_class_modify({5, 0, 2068}) -> 2056;
get_fashion_class_modify({1, 0, 2069}) -> 2009;
get_fashion_class_modify({2, 0, 2069}) -> 2023;
get_fashion_class_modify({3, 0, 2069}) -> 2033;
get_fashion_class_modify({4, 0, 2069}) -> 2044;
get_fashion_class_modify({5, 0, 2069}) -> 2057;
get_fashion_class_modify({1, 0, 2070}) -> 2011;
get_fashion_class_modify({2, 0, 2070}) -> 2022;
get_fashion_class_modify({3, 0, 2070}) -> 2035;
get_fashion_class_modify({4, 0, 2070}) -> 2047;
get_fashion_class_modify({5, 0, 2070}) -> 2058;
get_fashion_class_modify({1, 0, 2071}) -> 2010;
get_fashion_class_modify({2, 0, 2071}) -> 2020;
get_fashion_class_modify({3, 0, 2071}) -> 2032;
get_fashion_class_modify({4, 0, 2071}) -> 2045;
get_fashion_class_modify({5, 0, 2071}) -> 2059;
get_fashion_class_modify({2, 2, 12034}) -> 12037;
get_fashion_class_modify({3, 2, 12034}) -> 12040;
get_fashion_class_modify({4, 2, 12034}) -> 12043;
get_fashion_class_modify({5, 2, 12034}) -> 12046;
get_fashion_class_modify({6, 2, 12034}) -> 12049;
get_fashion_class_modify({2, 2, 12035}) -> 12038;
get_fashion_class_modify({3, 2, 12035}) -> 12041;
get_fashion_class_modify({4, 2, 12035}) -> 12044;
get_fashion_class_modify({5, 2, 12035}) -> 12047;
get_fashion_class_modify({6, 2, 12035}) -> 12050;
get_fashion_class_modify({2, 2, 12036}) -> 12039;
get_fashion_class_modify({3, 2, 12036}) -> 12042;
get_fashion_class_modify({4, 2, 12036}) -> 12045;
get_fashion_class_modify({5, 2, 12036}) -> 12048;
get_fashion_class_modify({6, 2, 12036}) -> 12051;
get_fashion_class_modify({1, 2, 12037}) -> 12034;
get_fashion_class_modify({3, 2, 12037}) -> 12040;
get_fashion_class_modify({4, 2, 12037}) -> 12043;
get_fashion_class_modify({5, 2, 12037}) -> 12046;
get_fashion_class_modify({6, 2, 12037}) -> 12049;
get_fashion_class_modify({1, 2, 12038}) -> 12035;
get_fashion_class_modify({3, 2, 12038}) -> 12041;
get_fashion_class_modify({4, 2, 12038}) -> 12044;
get_fashion_class_modify({5, 2, 12038}) -> 12047;
get_fashion_class_modify({6, 2, 12038}) -> 12050;
get_fashion_class_modify({1, 2, 12039}) -> 12036;
get_fashion_class_modify({3, 2, 12039}) -> 12042;
get_fashion_class_modify({4, 2, 12039}) -> 12045;
get_fashion_class_modify({5, 2, 12039}) -> 12048;
get_fashion_class_modify({6, 2, 12039}) -> 12051;
get_fashion_class_modify({1, 2, 12040}) -> 12034;
get_fashion_class_modify({2, 2, 12040}) -> 12037;
get_fashion_class_modify({4, 2, 12040}) -> 12043;
get_fashion_class_modify({5, 2, 12040}) -> 12046;
get_fashion_class_modify({6, 2, 12040}) -> 12049;
get_fashion_class_modify({1, 2, 12041}) -> 12035;
get_fashion_class_modify({2, 2, 12041}) -> 12038;
get_fashion_class_modify({4, 2, 12041}) -> 12044;
get_fashion_class_modify({5, 2, 12041}) -> 12047;
get_fashion_class_modify({6, 2, 12041}) -> 12050;
get_fashion_class_modify({1, 2, 12042}) -> 12036;
get_fashion_class_modify({2, 2, 12042}) -> 12039;
get_fashion_class_modify({4, 2, 12042}) -> 12045;
get_fashion_class_modify({5, 2, 12042}) -> 12048;
get_fashion_class_modify({6, 2, 12042}) -> 12051;
get_fashion_class_modify({1, 2, 12043}) -> 12034;
get_fashion_class_modify({2, 2, 12043}) -> 12037;
get_fashion_class_modify({3, 2, 12043}) -> 12040;
get_fashion_class_modify({5, 2, 12043}) -> 12046;
get_fashion_class_modify({6, 2, 12043}) -> 12049;
get_fashion_class_modify({1, 2, 12044}) -> 12035;
get_fashion_class_modify({2, 2, 12044}) -> 12038;
get_fashion_class_modify({3, 2, 12044}) -> 12041;
get_fashion_class_modify({5, 2, 12044}) -> 12047;
get_fashion_class_modify({6, 2, 12044}) -> 12050;
get_fashion_class_modify({1, 2, 12045}) -> 12036;
get_fashion_class_modify({2, 2, 12045}) -> 12039;
get_fashion_class_modify({3, 2, 12045}) -> 12042;
get_fashion_class_modify({5, 2, 12045}) -> 12048;
get_fashion_class_modify({6, 2, 12045}) -> 12051;
get_fashion_class_modify({1, 2, 12046}) -> 12034;
get_fashion_class_modify({2, 2, 12046}) -> 12037;
get_fashion_class_modify({3, 2, 12046}) -> 12040;
get_fashion_class_modify({4, 2, 12046}) -> 12043;
get_fashion_class_modify({6, 2, 12046}) -> 12049;
get_fashion_class_modify({1, 2, 12047}) -> 12035;
get_fashion_class_modify({2, 2, 12047}) -> 12038;
get_fashion_class_modify({3, 2, 12047}) -> 12041;
get_fashion_class_modify({4, 2, 12047}) -> 12044;
get_fashion_class_modify({6, 2, 12047}) -> 12050;
get_fashion_class_modify({1, 2, 12048}) -> 12036;
get_fashion_class_modify({2, 2, 12048}) -> 12039;
get_fashion_class_modify({3, 2, 12048}) -> 12042;
get_fashion_class_modify({4, 2, 12048}) -> 12045;
get_fashion_class_modify({6, 2, 12048}) -> 12051;
get_fashion_class_modify({1, 2, 12049}) -> 12034;
get_fashion_class_modify({2, 2, 12049}) -> 12037;
get_fashion_class_modify({3, 2, 12049}) -> 12040;
get_fashion_class_modify({4, 2, 12049}) -> 12043;
get_fashion_class_modify({5, 2, 12049}) -> 12046;
get_fashion_class_modify({1, 2, 12050}) -> 12035;
get_fashion_class_modify({2, 2, 12050}) -> 12038;
get_fashion_class_modify({3, 2, 12050}) -> 12041;
get_fashion_class_modify({4, 2, 12050}) -> 12044;
get_fashion_class_modify({5, 2, 12050}) -> 12047;
get_fashion_class_modify({1, 2, 12051}) -> 12036;
get_fashion_class_modify({2, 2, 12051}) -> 12039;
get_fashion_class_modify({3, 2, 12051}) -> 12042;
get_fashion_class_modify({4, 2, 12051}) -> 12045;
get_fashion_class_modify({5, 2, 12051}) -> 12048;
get_fashion_class_modify({2, 2, 12060}) -> 12061;
get_fashion_class_modify({3, 2, 12060}) -> 12062;
get_fashion_class_modify({4, 2, 12060}) -> 12063;
get_fashion_class_modify({5, 2, 12060}) -> 12064;
get_fashion_class_modify({6, 2, 12060}) -> 12065;
get_fashion_class_modify({1, 2, 12061}) -> 12060;
get_fashion_class_modify({3, 2, 12061}) -> 12062;
get_fashion_class_modify({4, 2, 12061}) -> 12063;
get_fashion_class_modify({5, 2, 12061}) -> 12064;
get_fashion_class_modify({6, 2, 12061}) -> 12065;
get_fashion_class_modify({1, 2, 12062}) -> 12060;
get_fashion_class_modify({2, 2, 12062}) -> 12061;
get_fashion_class_modify({4, 2, 12062}) -> 12063;
get_fashion_class_modify({5, 2, 12062}) -> 12064;
get_fashion_class_modify({6, 2, 12062}) -> 12065;
get_fashion_class_modify({1, 2, 12063}) -> 12060;
get_fashion_class_modify({2, 2, 12063}) -> 12061;
get_fashion_class_modify({3, 2, 12063}) -> 12062;
get_fashion_class_modify({5, 2, 12063}) -> 12064;
get_fashion_class_modify({6, 2, 12063}) -> 12065;
get_fashion_class_modify({1, 2, 12064}) -> 12060;
get_fashion_class_modify({2, 2, 12064}) -> 12061;
get_fashion_class_modify({3, 2, 12064}) -> 12062;
get_fashion_class_modify({4, 2, 12064}) -> 12063;
get_fashion_class_modify({6, 2, 12064}) -> 12065;
get_fashion_class_modify({1, 2, 12065}) -> 12060;
get_fashion_class_modify({2, 2, 12065}) -> 12061;
get_fashion_class_modify({3, 2, 12065}) -> 12062;
get_fashion_class_modify({4, 2, 12065}) -> 12063;
get_fashion_class_modify({5, 2, 12065}) -> 12064;
get_fashion_class_modify({2, 2, 12070}) -> 12071;
get_fashion_class_modify({3, 2, 12070}) -> 12072;
get_fashion_class_modify({4, 2, 12070}) -> 12073;
get_fashion_class_modify({5, 2, 12070}) -> 12074;
get_fashion_class_modify({6, 2, 12070}) -> 12075;
get_fashion_class_modify({1, 2, 12071}) -> 12070;
get_fashion_class_modify({3, 2, 12071}) -> 12072;
get_fashion_class_modify({4, 2, 12071}) -> 12073;
get_fashion_class_modify({5, 2, 12071}) -> 12074;
get_fashion_class_modify({6, 2, 12071}) -> 12075;
get_fashion_class_modify({1, 2, 12072}) -> 12070;
get_fashion_class_modify({2, 2, 12072}) -> 12071;
get_fashion_class_modify({4, 2, 12072}) -> 12073;
get_fashion_class_modify({5, 2, 12072}) -> 12074;
get_fashion_class_modify({6, 2, 12072}) -> 12075;
get_fashion_class_modify({1, 2, 12073}) -> 12070;
get_fashion_class_modify({2, 2, 12073}) -> 12071;
get_fashion_class_modify({3, 2, 12073}) -> 12072;
get_fashion_class_modify({5, 2, 12073}) -> 12074;
get_fashion_class_modify({6, 2, 12073}) -> 12075;
get_fashion_class_modify({1, 2, 12074}) -> 12070;
get_fashion_class_modify({2, 2, 12074}) -> 12071;
get_fashion_class_modify({3, 2, 12074}) -> 12072;
get_fashion_class_modify({4, 2, 12074}) -> 12073;
get_fashion_class_modify({6, 2, 12074}) -> 12075;
get_fashion_class_modify({1, 2, 12075}) -> 12070;
get_fashion_class_modify({2, 2, 12075}) -> 12071;
get_fashion_class_modify({3, 2, 12075}) -> 12072;
get_fashion_class_modify({4, 2, 12075}) -> 12073;
get_fashion_class_modify({5, 2, 12075}) -> 12074;
get_fashion_class_modify({1, 1, 1073}) -> 1002;
get_fashion_class_modify({1, 1, 1074}) -> 1004;
get_fashion_class_modify({1, 1, 1075}) -> 1001;
get_fashion_class_modify({1, 1, 1076}) -> 1003;
get_fashion_class_modify({1, 1, 1077}) -> 1005;
get_fashion_class_modify({1, 0, 1079}) -> 1011;
get_fashion_class_modify({1, 0, 1080}) -> 1009;
get_fashion_class_modify({1, 0, 1081}) -> 1007;
get_fashion_class_modify({1, 0, 1082}) -> 1010;
get_fashion_class_modify({1, 0, 1083}) -> 1008;
get_fashion_class_modify({2, 1, 1073}) -> 1013;
get_fashion_class_modify({2, 1, 1074}) -> 1015;
get_fashion_class_modify({2, 1, 1075}) -> 1014;
get_fashion_class_modify({2, 1, 1076}) -> 1016;
get_fashion_class_modify({2, 1, 1077}) -> 1017;
get_fashion_class_modify({2, 0, 1079}) -> 1023;
get_fashion_class_modify({2, 0, 1080}) -> 1021;
get_fashion_class_modify({2, 0, 1081}) -> 1022;
get_fashion_class_modify({2, 0, 1082}) -> 1020;
get_fashion_class_modify({2, 0, 1083}) -> 1019;
get_fashion_class_modify({3, 1, 1073}) -> 1026;
get_fashion_class_modify({3, 1, 1074}) -> 1025;
get_fashion_class_modify({3, 1, 1075}) -> 1027;
get_fashion_class_modify({3, 1, 1076}) -> 1028;
get_fashion_class_modify({3, 1, 1077}) -> 1029;
get_fashion_class_modify({3, 0, 1079}) -> 1031;
get_fashion_class_modify({3, 0, 1080}) -> 1033;
get_fashion_class_modify({3, 0, 1081}) -> 1035;
get_fashion_class_modify({3, 0, 1082}) -> 1032;
get_fashion_class_modify({3, 0, 1083}) -> 1034;
get_fashion_class_modify({4, 1, 1073}) -> 1039;
get_fashion_class_modify({4, 1, 1074}) -> 1041;
get_fashion_class_modify({4, 1, 1075}) -> 1037;
get_fashion_class_modify({4, 1, 1076}) -> 1040;
get_fashion_class_modify({4, 1, 1077}) -> 1038;
get_fashion_class_modify({4, 0, 1079}) -> 1045;
get_fashion_class_modify({4, 0, 1080}) -> 1047;
get_fashion_class_modify({4, 0, 1081}) -> 1043;
get_fashion_class_modify({4, 0, 1082}) -> 1046;
get_fashion_class_modify({4, 0, 1083}) -> 1044;
get_fashion_class_modify({5, 1, 1073}) -> 1051;
get_fashion_class_modify({5, 1, 1074}) -> 1049;
get_fashion_class_modify({5, 1, 1075}) -> 1053;
get_fashion_class_modify({5, 1, 1076}) -> 1052;
get_fashion_class_modify({5, 1, 1077}) -> 1050;
get_fashion_class_modify({5, 0, 1079}) -> 1058;
get_fashion_class_modify({5, 0, 1080}) -> 1057;
get_fashion_class_modify({5, 0, 1081}) -> 1056;
get_fashion_class_modify({5, 0, 1082}) -> 1059;
get_fashion_class_modify({5, 0, 1083}) -> 1055;
get_fashion_class_modify({6, 1, 1073}) -> 1064;
get_fashion_class_modify({6, 1, 1074}) -> 1065;
get_fashion_class_modify({6, 1, 1075}) -> 1061;
get_fashion_class_modify({6, 1, 1076}) -> 1063;
get_fashion_class_modify({6, 1, 1077}) -> 1062;
get_fashion_class_modify({6, 0, 1079}) -> 1070;
get_fashion_class_modify({6, 0, 1080}) -> 1067;
get_fashion_class_modify({6, 0, 1081}) -> 1069;
get_fashion_class_modify({6, 0, 1082}) -> 1071;
get_fashion_class_modify({6, 0, 1083}) -> 1068;
get_fashion_class_modify({7, 1, 1002}) -> 1073;
get_fashion_class_modify({7, 1, 1004}) -> 1074;
get_fashion_class_modify({7, 1, 1001}) -> 1075;
get_fashion_class_modify({7, 1, 1003}) -> 1076;
get_fashion_class_modify({7, 1, 1005}) -> 1077;
get_fashion_class_modify({7, 0, 1011}) -> 1079;
get_fashion_class_modify({7, 0, 1009}) -> 1080;
get_fashion_class_modify({7, 0, 1007}) -> 1081;
get_fashion_class_modify({7, 0, 1010}) -> 1082;
get_fashion_class_modify({7, 0, 1008}) -> 1083;
get_fashion_class_modify({7, 1, 1013}) -> 1073;
get_fashion_class_modify({7, 1, 1015}) -> 1074;
get_fashion_class_modify({7, 1, 1014}) -> 1075;
get_fashion_class_modify({7, 1, 1016}) -> 1076;
get_fashion_class_modify({7, 1, 1017}) -> 1077;
get_fashion_class_modify({7, 0, 1023}) -> 1079;
get_fashion_class_modify({7, 0, 1021}) -> 1080;
get_fashion_class_modify({7, 0, 1022}) -> 1081;
get_fashion_class_modify({7, 0, 1020}) -> 1082;
get_fashion_class_modify({7, 0, 1019}) -> 1083;
get_fashion_class_modify({7, 1, 1026}) -> 1073;
get_fashion_class_modify({7, 1, 1025}) -> 1074;
get_fashion_class_modify({7, 1, 1027}) -> 1075;
get_fashion_class_modify({7, 1, 1028}) -> 1076;
get_fashion_class_modify({7, 1, 1029}) -> 1077;
get_fashion_class_modify({7, 0, 1031}) -> 1079;
get_fashion_class_modify({7, 0, 1033}) -> 1080;
get_fashion_class_modify({7, 0, 1035}) -> 1081;
get_fashion_class_modify({7, 0, 1032}) -> 1082;
get_fashion_class_modify({7, 0, 1034}) -> 1083;
get_fashion_class_modify({7, 1, 1039}) -> 1073;
get_fashion_class_modify({7, 1, 1041}) -> 1074;
get_fashion_class_modify({7, 1, 1037}) -> 1075;
get_fashion_class_modify({7, 1, 1040}) -> 1076;
get_fashion_class_modify({7, 1, 1038}) -> 1077;
get_fashion_class_modify({7, 0, 1045}) -> 1079;
get_fashion_class_modify({7, 0, 1047}) -> 1080;
get_fashion_class_modify({7, 0, 1043}) -> 1081;
get_fashion_class_modify({7, 0, 1046}) -> 1082;
get_fashion_class_modify({7, 0, 1044}) -> 1083;
get_fashion_class_modify({7, 1, 1051}) -> 1073;
get_fashion_class_modify({7, 1, 1049}) -> 1074;
get_fashion_class_modify({7, 1, 1053}) -> 1075;
get_fashion_class_modify({7, 1, 1052}) -> 1076;
get_fashion_class_modify({7, 1, 1050}) -> 1077;
get_fashion_class_modify({7, 0, 1058}) -> 1079;
get_fashion_class_modify({7, 0, 1057}) -> 1080;
get_fashion_class_modify({7, 0, 1056}) -> 1081;
get_fashion_class_modify({7, 0, 1059}) -> 1082;
get_fashion_class_modify({7, 0, 1055}) -> 1083;
get_fashion_class_modify({7, 1, 1064}) -> 1073;
get_fashion_class_modify({7, 1, 1065}) -> 1074;
get_fashion_class_modify({7, 1, 1061}) -> 1075;
get_fashion_class_modify({7, 1, 1063}) -> 1076;
get_fashion_class_modify({7, 1, 1062}) -> 1077;
get_fashion_class_modify({7, 0, 1070}) -> 1079;
get_fashion_class_modify({7, 0, 1067}) -> 1080;
get_fashion_class_modify({7, 0, 1069}) -> 1081;
get_fashion_class_modify({7, 0, 1071}) -> 1082;
get_fashion_class_modify({7, 0, 1068}) -> 1083;
get_fashion_class_modify({1, 1, 2073}) -> 2001;
get_fashion_class_modify({1, 1, 2074}) -> 2002;
get_fashion_class_modify({1, 1, 2075}) -> 2003;
get_fashion_class_modify({1, 1, 2076}) -> 2004;
get_fashion_class_modify({1, 1, 2077}) -> 2005;
get_fashion_class_modify({1, 0, 2079}) -> 2007;
get_fashion_class_modify({1, 0, 2080}) -> 2008;
get_fashion_class_modify({1, 0, 2081}) -> 2009;
get_fashion_class_modify({1, 0, 2082}) -> 2010;
get_fashion_class_modify({1, 0, 2083}) -> 2011;
get_fashion_class_modify({2, 1, 2073}) -> 2013;
get_fashion_class_modify({2, 1, 2074}) -> 2014;
get_fashion_class_modify({2, 1, 2075}) -> 2015;
get_fashion_class_modify({2, 1, 2076}) -> 2016;
get_fashion_class_modify({2, 1, 2077}) -> 2017;
get_fashion_class_modify({2, 0, 2079}) -> 2019;
get_fashion_class_modify({2, 0, 2080}) -> 2020;
get_fashion_class_modify({2, 0, 2081}) -> 2021;
get_fashion_class_modify({2, 0, 2082}) -> 2022;
get_fashion_class_modify({2, 0, 2083}) -> 2023;
get_fashion_class_modify({3, 1, 2073}) -> 2025;
get_fashion_class_modify({3, 1, 2074}) -> 2026;
get_fashion_class_modify({3, 1, 2075}) -> 2027;
get_fashion_class_modify({3, 1, 2076}) -> 2028;
get_fashion_class_modify({3, 1, 2077}) -> 2029;
get_fashion_class_modify({3, 0, 2079}) -> 2031;
get_fashion_class_modify({3, 0, 2080}) -> 2032;
get_fashion_class_modify({3, 0, 2081}) -> 2033;
get_fashion_class_modify({3, 0, 2082}) -> 2034;
get_fashion_class_modify({3, 0, 2083}) -> 2035;
get_fashion_class_modify({4, 1, 2073}) -> 2037;
get_fashion_class_modify({4, 1, 2074}) -> 2038;
get_fashion_class_modify({4, 1, 2075}) -> 2039;
get_fashion_class_modify({4, 1, 2076}) -> 2040;
get_fashion_class_modify({4, 1, 2077}) -> 2041;
get_fashion_class_modify({4, 0, 2079}) -> 2043;
get_fashion_class_modify({4, 0, 2080}) -> 2044;
get_fashion_class_modify({4, 0, 2081}) -> 2045;
get_fashion_class_modify({4, 0, 2082}) -> 2046;
get_fashion_class_modify({4, 0, 2083}) -> 2047;
get_fashion_class_modify({5, 1, 2073}) -> 2049;
get_fashion_class_modify({5, 1, 2074}) -> 2050;
get_fashion_class_modify({5, 1, 2075}) -> 2051;
get_fashion_class_modify({5, 1, 2076}) -> 2052;
get_fashion_class_modify({5, 1, 2077}) -> 2053;
get_fashion_class_modify({5, 0, 2079}) -> 2055;
get_fashion_class_modify({5, 0, 2080}) -> 2056;
get_fashion_class_modify({5, 0, 2081}) -> 2057;
get_fashion_class_modify({5, 0, 2082}) -> 2058;
get_fashion_class_modify({5, 0, 2083}) -> 2059;
get_fashion_class_modify({6, 1, 2073}) -> 2061;
get_fashion_class_modify({6, 1, 2074}) -> 2062;
get_fashion_class_modify({6, 1, 2075}) -> 2063;
get_fashion_class_modify({6, 1, 2076}) -> 2064;
get_fashion_class_modify({6, 1, 2077}) -> 2065;
get_fashion_class_modify({6, 0, 2079}) -> 2067;
get_fashion_class_modify({6, 0, 2080}) -> 2068;
get_fashion_class_modify({6, 0, 2081}) -> 2069;
get_fashion_class_modify({6, 0, 2082}) -> 2070;
get_fashion_class_modify({6, 0, 2083}) -> 2071;
get_fashion_class_modify({7, 1, 2001}) -> 2073;
get_fashion_class_modify({7, 1, 2002}) -> 2074;
get_fashion_class_modify({7, 1, 2003}) -> 2075;
get_fashion_class_modify({7, 1, 2004}) -> 2076;
get_fashion_class_modify({7, 1, 2005}) -> 2077;
get_fashion_class_modify({7, 0, 2007}) -> 2079;
get_fashion_class_modify({7, 0, 2008}) -> 2080;
get_fashion_class_modify({7, 0, 2009}) -> 2081;
get_fashion_class_modify({7, 0, 2010}) -> 2082;
get_fashion_class_modify({7, 0, 2011}) -> 2083;
get_fashion_class_modify({7, 1, 2013}) -> 2073;
get_fashion_class_modify({7, 1, 2014}) -> 2074;
get_fashion_class_modify({7, 1, 2015}) -> 2075;
get_fashion_class_modify({7, 1, 2016}) -> 2076;
get_fashion_class_modify({7, 1, 2017}) -> 2077;
get_fashion_class_modify({7, 0, 2019}) -> 2079;
get_fashion_class_modify({7, 0, 2020}) -> 2080;
get_fashion_class_modify({7, 0, 2021}) -> 2081;
get_fashion_class_modify({7, 0, 2022}) -> 2082;
get_fashion_class_modify({7, 0, 2023}) -> 2083;
get_fashion_class_modify({7, 1, 2025}) -> 2073;
get_fashion_class_modify({7, 1, 2026}) -> 2074;
get_fashion_class_modify({7, 1, 2027}) -> 2075;
get_fashion_class_modify({7, 1, 2028}) -> 2076;
get_fashion_class_modify({7, 1, 2029}) -> 2077;
get_fashion_class_modify({7, 0, 2031}) -> 2079;
get_fashion_class_modify({7, 0, 2032}) -> 2080;
get_fashion_class_modify({7, 0, 2033}) -> 2081;
get_fashion_class_modify({7, 0, 2034}) -> 2082;
get_fashion_class_modify({7, 0, 2035}) -> 2083;
get_fashion_class_modify({7, 1, 2037}) -> 2073;
get_fashion_class_modify({7, 1, 2038}) -> 2074;
get_fashion_class_modify({7, 1, 2039}) -> 2075;
get_fashion_class_modify({7, 1, 2040}) -> 2076;
get_fashion_class_modify({7, 1, 2041}) -> 2077;
get_fashion_class_modify({7, 0, 2043}) -> 2079;
get_fashion_class_modify({7, 0, 2044}) -> 2080;
get_fashion_class_modify({7, 0, 2045}) -> 2081;
get_fashion_class_modify({7, 0, 2046}) -> 2082;
get_fashion_class_modify({7, 0, 2047}) -> 2083;
get_fashion_class_modify({7, 1, 2049}) -> 2073;
get_fashion_class_modify({7, 1, 2050}) -> 2074;
get_fashion_class_modify({7, 1, 2051}) -> 2075;
get_fashion_class_modify({7, 1, 2052}) -> 2076;
get_fashion_class_modify({7, 1, 2053}) -> 2077;
get_fashion_class_modify({7, 0, 2055}) -> 2079;
get_fashion_class_modify({7, 0, 2056}) -> 2080;
get_fashion_class_modify({7, 0, 2057}) -> 2081;
get_fashion_class_modify({7, 0, 2058}) -> 2082;
get_fashion_class_modify({7, 0, 2059}) -> 2083;
get_fashion_class_modify({7, 1, 2061}) -> 2073;
get_fashion_class_modify({7, 1, 2062}) -> 2074;
get_fashion_class_modify({7, 1, 2063}) -> 2075;
get_fashion_class_modify({7, 1, 2064}) -> 2076;
get_fashion_class_modify({7, 1, 2065}) -> 2077;
get_fashion_class_modify({7, 0, 2067}) -> 2079;
get_fashion_class_modify({7, 0, 2068}) -> 2080;
get_fashion_class_modify({7, 0, 2069}) -> 2081;
get_fashion_class_modify({7, 0, 2070}) -> 2082;
get_fashion_class_modify({7, 0, 2071}) -> 2083;
get_fashion_class_modify({7, 2, 12034}) -> 12076;
get_fashion_class_modify({7, 2, 12035}) -> 12077;
get_fashion_class_modify({7, 2, 12036}) -> 12078;
get_fashion_class_modify({7, 2, 12037}) -> 12076;
get_fashion_class_modify({7, 2, 12038}) -> 12077;
get_fashion_class_modify({7, 2, 12039}) -> 12078;
get_fashion_class_modify({7, 2, 12040}) -> 12076;
get_fashion_class_modify({7, 2, 12041}) -> 12077;
get_fashion_class_modify({7, 2, 12042}) -> 12078;
get_fashion_class_modify({7, 2, 12043}) -> 12076;
get_fashion_class_modify({7, 2, 12044}) -> 12077;
get_fashion_class_modify({7, 2, 12045}) -> 12078;
get_fashion_class_modify({7, 2, 12046}) -> 12076;
get_fashion_class_modify({7, 2, 12047}) -> 12077;
get_fashion_class_modify({7, 2, 12048}) -> 12078;
get_fashion_class_modify({7, 2, 12049}) -> 12076;
get_fashion_class_modify({7, 2, 12050}) -> 12077;
get_fashion_class_modify({7, 2, 12051}) -> 12078;
get_fashion_class_modify({7, 2, 12060}) -> 12079;
get_fashion_class_modify({7, 2, 12061}) -> 12079;
get_fashion_class_modify({7, 2, 12062}) -> 12079;
get_fashion_class_modify({7, 2, 12063}) -> 12079;
get_fashion_class_modify({7, 2, 12064}) -> 12079;
get_fashion_class_modify({7, 2, 12065}) -> 12079;
get_fashion_class_modify({7, 2, 12070}) -> 12080;
get_fashion_class_modify({7, 2, 12071}) -> 12080;
get_fashion_class_modify({7, 2, 12072}) -> 12080;
get_fashion_class_modify({7, 2, 12073}) -> 12080;
get_fashion_class_modify({7, 2, 12074}) -> 12080;
get_fashion_class_modify({7, 2, 12075}) -> 12080;
get_fashion_class_modify({1, 2, 12076}) -> 12034;
get_fashion_class_modify({1, 2, 12077}) -> 12035;
get_fashion_class_modify({1, 2, 12078}) -> 12036;
get_fashion_class_modify({2, 2, 12076}) -> 12037;
get_fashion_class_modify({2, 2, 12077}) -> 12038;
get_fashion_class_modify({2, 2, 12078}) -> 12039;
get_fashion_class_modify({3, 2, 12076}) -> 12040;
get_fashion_class_modify({3, 2, 12077}) -> 12041;
get_fashion_class_modify({3, 2, 12078}) -> 12042;
get_fashion_class_modify({4, 2, 12076}) -> 12043;
get_fashion_class_modify({4, 2, 12077}) -> 12044;
get_fashion_class_modify({4, 2, 12078}) -> 12045;
get_fashion_class_modify({5, 2, 12076}) -> 12046;
get_fashion_class_modify({5, 2, 12077}) -> 12047;
get_fashion_class_modify({5, 2, 12078}) -> 12048;
get_fashion_class_modify({6, 2, 12076}) -> 12049;
get_fashion_class_modify({6, 2, 12077}) -> 12050;
get_fashion_class_modify({6, 2, 12078}) -> 12051;
get_fashion_class_modify({1, 2, 12079}) -> 12060;
get_fashion_class_modify({2, 2, 12079}) -> 12061;
get_fashion_class_modify({3, 2, 12079}) -> 12062;
get_fashion_class_modify({4, 2, 12079}) -> 12063;
get_fashion_class_modify({5, 2, 12079}) -> 12064;
get_fashion_class_modify({6, 2, 12079}) -> 12065;
get_fashion_class_modify({1, 2, 12080}) -> 12070;
get_fashion_class_modify({2, 2, 12080}) -> 12071;
get_fashion_class_modify({3, 2, 12080}) -> 12072;
get_fashion_class_modify({4, 2, 12080}) -> 12073;
get_fashion_class_modify({5, 2, 12080}) -> 12074;
get_fashion_class_modify({6, 2, 12080}) -> 12075;
get_fashion_class_modify({2, 2, 12081}) -> 12082;
get_fashion_class_modify({3, 2, 12081}) -> 12083;
get_fashion_class_modify({4, 2, 12081}) -> 12084;
get_fashion_class_modify({5, 2, 12081}) -> 12085;
get_fashion_class_modify({6, 2, 12081}) -> 12086;
get_fashion_class_modify({1, 2, 12082}) -> 12081;
get_fashion_class_modify({3, 2, 12082}) -> 12083;
get_fashion_class_modify({4, 2, 12082}) -> 12084;
get_fashion_class_modify({5, 2, 12082}) -> 12085;
get_fashion_class_modify({6, 2, 12082}) -> 12086;
get_fashion_class_modify({1, 2, 12083}) -> 12081;
get_fashion_class_modify({2, 2, 12083}) -> 12082;
get_fashion_class_modify({4, 2, 12083}) -> 12084;
get_fashion_class_modify({5, 2, 12083}) -> 12085;
get_fashion_class_modify({6, 2, 12083}) -> 12086;
get_fashion_class_modify({1, 2, 12084}) -> 12081;
get_fashion_class_modify({2, 2, 12084}) -> 12082;
get_fashion_class_modify({3, 2, 12084}) -> 12083;
get_fashion_class_modify({5, 2, 12084}) -> 12085;
get_fashion_class_modify({6, 2, 12084}) -> 12086;
get_fashion_class_modify({1, 2, 12085}) -> 12081;
get_fashion_class_modify({2, 2, 12085}) -> 12082;
get_fashion_class_modify({3, 2, 12085}) -> 12083;
get_fashion_class_modify({4, 2, 12085}) -> 12084;
get_fashion_class_modify({6, 2, 12085}) -> 12086;
get_fashion_class_modify({1, 2, 12086}) -> 12081;
get_fashion_class_modify({2, 2, 12086}) -> 12082;
get_fashion_class_modify({3, 2, 12086}) -> 12083;
get_fashion_class_modify({4, 2, 12086}) -> 12084;
get_fashion_class_modify({5, 2, 12086}) -> 12085;
get_fashion_class_modify({1, 2, 12087}) -> 12081;
get_fashion_class_modify({2, 2, 12087}) -> 12082;
get_fashion_class_modify({3, 2, 12087}) -> 12083;
get_fashion_class_modify({4, 2, 12087}) -> 12084;
get_fashion_class_modify({5, 2, 12087}) -> 12085;
get_fashion_class_modify({6, 2, 12087}) -> 12086;
get_fashion_class_modify({7, 2, 12081}) -> 12087;
get_fashion_class_modify({7, 2, 12082}) -> 12087;
get_fashion_class_modify({7, 2, 12083}) -> 12087;
get_fashion_class_modify({7, 2, 12084}) -> 12087;
get_fashion_class_modify({7, 2, 12085}) -> 12087;
get_fashion_class_modify({7, 2, 12086}) -> 12087;
get_fashion_class_modify({2, 2, 12088}) -> 12089;
get_fashion_class_modify({3, 2, 12088}) -> 12090;
get_fashion_class_modify({4, 2, 12088}) -> 12091;
get_fashion_class_modify({5, 2, 12088}) -> 12092;
get_fashion_class_modify({6, 2, 12088}) -> 12093;
get_fashion_class_modify({7, 2, 12088}) -> 12094;
get_fashion_class_modify({1, 2, 12089}) -> 12088;
get_fashion_class_modify({3, 2, 12089}) -> 12090;
get_fashion_class_modify({4, 2, 12089}) -> 12091;
get_fashion_class_modify({5, 2, 12089}) -> 12092;
get_fashion_class_modify({6, 2, 12089}) -> 12093;
get_fashion_class_modify({7, 2, 12089}) -> 12094;
get_fashion_class_modify({1, 2, 12090}) -> 12088;
get_fashion_class_modify({2, 2, 12090}) -> 12089;
get_fashion_class_modify({4, 2, 12090}) -> 12091;
get_fashion_class_modify({5, 2, 12090}) -> 12092;
get_fashion_class_modify({6, 2, 12090}) -> 12093;
get_fashion_class_modify({7, 2, 12090}) -> 12094;
get_fashion_class_modify({1, 2, 12091}) -> 12088;
get_fashion_class_modify({2, 2, 12091}) -> 12089;
get_fashion_class_modify({3, 2, 12091}) -> 12090;
get_fashion_class_modify({5, 2, 12091}) -> 12092;
get_fashion_class_modify({6, 2, 12091}) -> 12093;
get_fashion_class_modify({7, 2, 12091}) -> 12094;
get_fashion_class_modify({1, 2, 12092}) -> 12088;
get_fashion_class_modify({2, 2, 12092}) -> 12089;
get_fashion_class_modify({3, 2, 12092}) -> 12090;
get_fashion_class_modify({4, 2, 12092}) -> 12091;
get_fashion_class_modify({6, 2, 12092}) -> 12093;
get_fashion_class_modify({7, 2, 12092}) -> 12094;
get_fashion_class_modify({1, 2, 12093}) -> 12088;
get_fashion_class_modify({2, 2, 12093}) -> 12089;
get_fashion_class_modify({3, 2, 12093}) -> 12090;
get_fashion_class_modify({4, 2, 12093}) -> 12091;
get_fashion_class_modify({5, 2, 12093}) -> 12092;
get_fashion_class_modify({7, 2, 12093}) -> 12094;
get_fashion_class_modify({1, 2, 12094}) -> 12088;
get_fashion_class_modify({2, 2, 12094}) -> 12089;
get_fashion_class_modify({3, 2, 12094}) -> 12090;
get_fashion_class_modify({4, 2, 12094}) -> 12091;
get_fashion_class_modify({5, 2, 12094}) -> 12092;
get_fashion_class_modify({6, 2, 12094}) -> 12093;
get_fashion_class_modify({2, 2, 12114}) -> 12115;
get_fashion_class_modify({3, 2, 12114}) -> 12116;
get_fashion_class_modify({4, 2, 12114}) -> 12117;
get_fashion_class_modify({5, 2, 12114}) -> 12118;
get_fashion_class_modify({6, 2, 12114}) -> 12119;
get_fashion_class_modify({7, 2, 12114}) -> 12120;
get_fashion_class_modify({1, 2, 12115}) -> 12114;
get_fashion_class_modify({3, 2, 12115}) -> 12116;
get_fashion_class_modify({4, 2, 12115}) -> 12117;
get_fashion_class_modify({5, 2, 12115}) -> 12118;
get_fashion_class_modify({6, 2, 12115}) -> 12119;
get_fashion_class_modify({7, 2, 12115}) -> 12120;
get_fashion_class_modify({1, 2, 12116}) -> 12114;
get_fashion_class_modify({2, 2, 12116}) -> 12115;
get_fashion_class_modify({4, 2, 12116}) -> 12117;
get_fashion_class_modify({5, 2, 12116}) -> 12118;
get_fashion_class_modify({6, 2, 12116}) -> 12119;
get_fashion_class_modify({7, 2, 12116}) -> 12120;
get_fashion_class_modify({1, 2, 12117}) -> 12114;
get_fashion_class_modify({2, 2, 12117}) -> 12115;
get_fashion_class_modify({3, 2, 12117}) -> 12116;
get_fashion_class_modify({5, 2, 12117}) -> 12118;
get_fashion_class_modify({6, 2, 12117}) -> 12119;
get_fashion_class_modify({7, 2, 12117}) -> 12120;
get_fashion_class_modify({1, 2, 12118}) -> 12114;
get_fashion_class_modify({2, 2, 12118}) -> 12115;
get_fashion_class_modify({3, 2, 12118}) -> 12116;
get_fashion_class_modify({4, 2, 12118}) -> 12117;
get_fashion_class_modify({6, 2, 12118}) -> 12119;
get_fashion_class_modify({7, 2, 12118}) -> 12120;
get_fashion_class_modify({1, 2, 12119}) -> 12114;
get_fashion_class_modify({2, 2, 12119}) -> 12115;
get_fashion_class_modify({3, 2, 12119}) -> 12116;
get_fashion_class_modify({4, 2, 12119}) -> 12117;
get_fashion_class_modify({5, 2, 12119}) -> 12118;
get_fashion_class_modify({7, 2, 12119}) -> 12120;
get_fashion_class_modify({1, 2, 12120}) -> 12114;
get_fashion_class_modify({2, 2, 12120}) -> 12115;
get_fashion_class_modify({3, 2, 12120}) -> 12116;
get_fashion_class_modify({4, 2, 12120}) -> 12117;
get_fashion_class_modify({5, 2, 12120}) -> 12118;
get_fashion_class_modify({6, 2, 12120}) -> 12119;
get_fashion_class_modify({2, 2, 12121}) -> 12122;
get_fashion_class_modify({3, 2, 12121}) -> 12123;
get_fashion_class_modify({4, 2, 12121}) -> 12124;
get_fashion_class_modify({5, 2, 12121}) -> 12125;
get_fashion_class_modify({6, 2, 12121}) -> 12126;
get_fashion_class_modify({7, 2, 12121}) -> 12127;
get_fashion_class_modify({1, 2, 12122}) -> 12121;
get_fashion_class_modify({3, 2, 12122}) -> 12123;
get_fashion_class_modify({4, 2, 12122}) -> 12124;
get_fashion_class_modify({5, 2, 12122}) -> 12125;
get_fashion_class_modify({6, 2, 12122}) -> 12126;
get_fashion_class_modify({7, 2, 12122}) -> 12127;
get_fashion_class_modify({1, 2, 12123}) -> 12121;
get_fashion_class_modify({2, 2, 12123}) -> 12122;
get_fashion_class_modify({4, 2, 12123}) -> 12124;
get_fashion_class_modify({5, 2, 12123}) -> 12125;
get_fashion_class_modify({6, 2, 12123}) -> 12126;
get_fashion_class_modify({7, 2, 12123}) -> 12127;
get_fashion_class_modify({1, 2, 12124}) -> 12121;
get_fashion_class_modify({2, 2, 12124}) -> 12122;
get_fashion_class_modify({3, 2, 12124}) -> 12123;
get_fashion_class_modify({5, 2, 12124}) -> 12125;
get_fashion_class_modify({6, 2, 12124}) -> 12126;
get_fashion_class_modify({7, 2, 12124}) -> 12127;
get_fashion_class_modify({1, 2, 12125}) -> 12121;
get_fashion_class_modify({2, 2, 12125}) -> 12122;
get_fashion_class_modify({3, 2, 12125}) -> 12123;
get_fashion_class_modify({4, 2, 12125}) -> 12124;
get_fashion_class_modify({6, 2, 12125}) -> 12126;
get_fashion_class_modify({7, 2, 12125}) -> 12127;
get_fashion_class_modify({1, 2, 12126}) -> 12121;
get_fashion_class_modify({2, 2, 12126}) -> 12122;
get_fashion_class_modify({3, 2, 12126}) -> 12123;
get_fashion_class_modify({4, 2, 12126}) -> 12124;
get_fashion_class_modify({5, 2, 12126}) -> 12125;
get_fashion_class_modify({7, 2, 12126}) -> 12127;
get_fashion_class_modify({1, 2, 12127}) -> 12121;
get_fashion_class_modify({2, 2, 12127}) -> 12122;
get_fashion_class_modify({3, 2, 12127}) -> 12123;
get_fashion_class_modify({4, 2, 12127}) -> 12124;
get_fashion_class_modify({5, 2, 12127}) -> 12125;
get_fashion_class_modify({6, 2, 12127}) -> 12126;
get_fashion_class_modify({2, 2, 12128}) -> 12129;
get_fashion_class_modify({3, 2, 12128}) -> 12130;
get_fashion_class_modify({4, 2, 12128}) -> 12131;
get_fashion_class_modify({5, 2, 12128}) -> 12132;
get_fashion_class_modify({6, 2, 12128}) -> 12133;
get_fashion_class_modify({7, 2, 12128}) -> 12134;
get_fashion_class_modify({1, 2, 12129}) -> 12128;
get_fashion_class_modify({3, 2, 12129}) -> 12130;
get_fashion_class_modify({4, 2, 12129}) -> 12131;
get_fashion_class_modify({5, 2, 12129}) -> 12132;
get_fashion_class_modify({6, 2, 12129}) -> 12133;
get_fashion_class_modify({7, 2, 12129}) -> 12134;
get_fashion_class_modify({1, 2, 12130}) -> 12128;
get_fashion_class_modify({2, 2, 12130}) -> 12129;
get_fashion_class_modify({4, 2, 12130}) -> 12131;
get_fashion_class_modify({5, 2, 12130}) -> 12132;
get_fashion_class_modify({6, 2, 12130}) -> 12133;
get_fashion_class_modify({7, 2, 12130}) -> 12134;
get_fashion_class_modify({1, 2, 12131}) -> 12128;
get_fashion_class_modify({2, 2, 12131}) -> 12129;
get_fashion_class_modify({3, 2, 12131}) -> 12130;
get_fashion_class_modify({5, 2, 12131}) -> 12132;
get_fashion_class_modify({6, 2, 12131}) -> 12133;
get_fashion_class_modify({7, 2, 12131}) -> 12134;
get_fashion_class_modify({1, 2, 12132}) -> 12128;
get_fashion_class_modify({2, 2, 12132}) -> 12129;
get_fashion_class_modify({3, 2, 12132}) -> 12130;
get_fashion_class_modify({4, 2, 12132}) -> 12131;
get_fashion_class_modify({6, 2, 12132}) -> 12133;
get_fashion_class_modify({7, 2, 12132}) -> 12134;
get_fashion_class_modify({1, 2, 12133}) -> 12128;
get_fashion_class_modify({2, 2, 12133}) -> 12129;
get_fashion_class_modify({3, 2, 12133}) -> 12130;
get_fashion_class_modify({4, 2, 12133}) -> 12131;
get_fashion_class_modify({5, 2, 12133}) -> 12132;
get_fashion_class_modify({7, 2, 12133}) -> 12134;
get_fashion_class_modify({1, 2, 12134}) -> 12128;
get_fashion_class_modify({2, 2, 12134}) -> 12129;
get_fashion_class_modify({3, 2, 12134}) -> 12130;
get_fashion_class_modify({4, 2, 12134}) -> 12131;
get_fashion_class_modify({5, 2, 12134}) -> 12132;
get_fashion_class_modify({6, 2, 12134}) -> 12133;
get_fashion_class_modify({2, 2, 12135}) -> 12136;
get_fashion_class_modify({3, 2, 12135}) -> 12137;
get_fashion_class_modify({4, 2, 12135}) -> 12138;
get_fashion_class_modify({5, 2, 12135}) -> 12139;
get_fashion_class_modify({6, 2, 12135}) -> 12140;
get_fashion_class_modify({7, 2, 12135}) -> 12141;
get_fashion_class_modify({1, 2, 12136}) -> 12135;
get_fashion_class_modify({3, 2, 12136}) -> 12137;
get_fashion_class_modify({4, 2, 12136}) -> 12138;
get_fashion_class_modify({5, 2, 12136}) -> 12139;
get_fashion_class_modify({6, 2, 12136}) -> 12140;
get_fashion_class_modify({7, 2, 12136}) -> 12141;
get_fashion_class_modify({1, 2, 12137}) -> 12135;
get_fashion_class_modify({2, 2, 12137}) -> 12136;
get_fashion_class_modify({4, 2, 12137}) -> 12138;
get_fashion_class_modify({5, 2, 12137}) -> 12139;
get_fashion_class_modify({6, 2, 12137}) -> 12140;
get_fashion_class_modify({7, 2, 12137}) -> 12141;
get_fashion_class_modify({1, 2, 12138}) -> 12135;
get_fashion_class_modify({2, 2, 12138}) -> 12136;
get_fashion_class_modify({3, 2, 12138}) -> 12137;
get_fashion_class_modify({5, 2, 12138}) -> 12139;
get_fashion_class_modify({6, 2, 12138}) -> 12140;
get_fashion_class_modify({7, 2, 12138}) -> 12141;
get_fashion_class_modify({1, 2, 12139}) -> 12135;
get_fashion_class_modify({2, 2, 12139}) -> 12136;
get_fashion_class_modify({3, 2, 12139}) -> 12137;
get_fashion_class_modify({4, 2, 12139}) -> 12138;
get_fashion_class_modify({6, 2, 12139}) -> 12140;
get_fashion_class_modify({7, 2, 12139}) -> 12141;
get_fashion_class_modify({1, 2, 12140}) -> 12135;
get_fashion_class_modify({2, 2, 12140}) -> 12136;
get_fashion_class_modify({3, 2, 12140}) -> 12137;
get_fashion_class_modify({4, 2, 12140}) -> 12138;
get_fashion_class_modify({5, 2, 12140}) -> 12139;
get_fashion_class_modify({7, 2, 12140}) -> 12141;
get_fashion_class_modify({1, 2, 12141}) -> 12135;
get_fashion_class_modify({2, 2, 12141}) -> 12136;
get_fashion_class_modify({3, 2, 12141}) -> 12137;
get_fashion_class_modify({4, 2, 12141}) -> 12138;
get_fashion_class_modify({5, 2, 12141}) -> 12139;
get_fashion_class_modify({6, 2, 12141}) -> 12140;
get_fashion_class_modify({2, 2, 12142}) -> 12143;
get_fashion_class_modify({3, 2, 12142}) -> 12144;
get_fashion_class_modify({4, 2, 12142}) -> 12145;
get_fashion_class_modify({5, 2, 12142}) -> 12146;
get_fashion_class_modify({6, 2, 12142}) -> 12147;
get_fashion_class_modify({7, 2, 12142}) -> 12148;
get_fashion_class_modify({1, 2, 12143}) -> 12142;
get_fashion_class_modify({3, 2, 12143}) -> 12144;
get_fashion_class_modify({4, 2, 12143}) -> 12145;
get_fashion_class_modify({5, 2, 12143}) -> 12146;
get_fashion_class_modify({6, 2, 12143}) -> 12147;
get_fashion_class_modify({7, 2, 12143}) -> 12148;
get_fashion_class_modify({1, 2, 12144}) -> 12142;
get_fashion_class_modify({2, 2, 12144}) -> 12143;
get_fashion_class_modify({4, 2, 12144}) -> 12145;
get_fashion_class_modify({5, 2, 12144}) -> 12146;
get_fashion_class_modify({6, 2, 12144}) -> 12147;
get_fashion_class_modify({7, 2, 12144}) -> 12148;
get_fashion_class_modify({1, 2, 12145}) -> 12142;
get_fashion_class_modify({2, 2, 12145}) -> 12143;
get_fashion_class_modify({3, 2, 12145}) -> 12144;
get_fashion_class_modify({5, 2, 12145}) -> 12146;
get_fashion_class_modify({6, 2, 12145}) -> 12147;
get_fashion_class_modify({7, 2, 12145}) -> 12148;
get_fashion_class_modify({1, 2, 12146}) -> 12142;
get_fashion_class_modify({2, 2, 12146}) -> 12143;
get_fashion_class_modify({3, 2, 12146}) -> 12144;
get_fashion_class_modify({4, 2, 12146}) -> 12145;
get_fashion_class_modify({6, 2, 12146}) -> 12147;
get_fashion_class_modify({7, 2, 12146}) -> 12148;
get_fashion_class_modify({1, 2, 12147}) -> 12142;
get_fashion_class_modify({2, 2, 12147}) -> 12143;
get_fashion_class_modify({3, 2, 12147}) -> 12144;
get_fashion_class_modify({4, 2, 12147}) -> 12145;
get_fashion_class_modify({5, 2, 12147}) -> 12146;
get_fashion_class_modify({7, 2, 12147}) -> 12148;
get_fashion_class_modify({1, 2, 12148}) -> 12142;
get_fashion_class_modify({2, 2, 12148}) -> 12143;
get_fashion_class_modify({3, 2, 12148}) -> 12144;
get_fashion_class_modify({4, 2, 12148}) -> 12145;
get_fashion_class_modify({5, 2, 12148}) -> 12146;
get_fashion_class_modify({6, 2, 12148}) -> 12147;
get_fashion_class_modify({2, 2, 12149}) -> 12150;
get_fashion_class_modify({3, 2, 12149}) -> 12151;
get_fashion_class_modify({4, 2, 12149}) -> 12152;
get_fashion_class_modify({5, 2, 12149}) -> 12153;
get_fashion_class_modify({6, 2, 12149}) -> 12154;
get_fashion_class_modify({7, 2, 12149}) -> 12155;
get_fashion_class_modify({1, 2, 12150}) -> 12149;
get_fashion_class_modify({3, 2, 12150}) -> 12151;
get_fashion_class_modify({4, 2, 12150}) -> 12152;
get_fashion_class_modify({5, 2, 12150}) -> 12153;
get_fashion_class_modify({6, 2, 12150}) -> 12154;
get_fashion_class_modify({7, 2, 12150}) -> 12155;
get_fashion_class_modify({1, 2, 12151}) -> 12149;
get_fashion_class_modify({2, 2, 12151}) -> 12150;
get_fashion_class_modify({4, 2, 12151}) -> 12152;
get_fashion_class_modify({5, 2, 12151}) -> 12153;
get_fashion_class_modify({6, 2, 12151}) -> 12154;
get_fashion_class_modify({7, 2, 12151}) -> 12155;
get_fashion_class_modify({1, 2, 12152}) -> 12149;
get_fashion_class_modify({2, 2, 12152}) -> 12150;
get_fashion_class_modify({3, 2, 12152}) -> 12151;
get_fashion_class_modify({5, 2, 12152}) -> 12153;
get_fashion_class_modify({6, 2, 12152}) -> 12154;
get_fashion_class_modify({7, 2, 12152}) -> 12155;
get_fashion_class_modify({1, 2, 12153}) -> 12149;
get_fashion_class_modify({2, 2, 12153}) -> 12150;
get_fashion_class_modify({3, 2, 12153}) -> 12151;
get_fashion_class_modify({4, 2, 12153}) -> 12152;
get_fashion_class_modify({6, 2, 12153}) -> 12154;
get_fashion_class_modify({7, 2, 12153}) -> 12155;
get_fashion_class_modify({1, 2, 12154}) -> 12149;
get_fashion_class_modify({2, 2, 12154}) -> 12150;
get_fashion_class_modify({3, 2, 12154}) -> 12151;
get_fashion_class_modify({4, 2, 12154}) -> 12152;
get_fashion_class_modify({5, 2, 12154}) -> 12153;
get_fashion_class_modify({7, 2, 12154}) -> 12155;
get_fashion_class_modify({1, 2, 12155}) -> 12149;
get_fashion_class_modify({2, 2, 12155}) -> 12150;
get_fashion_class_modify({3, 2, 12155}) -> 12151;
get_fashion_class_modify({4, 2, 12155}) -> 12152;
get_fashion_class_modify({5, 2, 12155}) -> 12153;
get_fashion_class_modify({6, 2, 12155}) -> 12154;
get_fashion_class_modify({2, 2, 12156}) -> 12157;
get_fashion_class_modify({3, 2, 12156}) -> 12158;
get_fashion_class_modify({4, 2, 12156}) -> 12159;
get_fashion_class_modify({5, 2, 12156}) -> 12160;
get_fashion_class_modify({6, 2, 12156}) -> 12161;
get_fashion_class_modify({7, 2, 12156}) -> 12162;
get_fashion_class_modify({1, 2, 12157}) -> 12156;
get_fashion_class_modify({3, 2, 12157}) -> 12158;
get_fashion_class_modify({4, 2, 12157}) -> 12159;
get_fashion_class_modify({5, 2, 12157}) -> 12160;
get_fashion_class_modify({6, 2, 12157}) -> 12161;
get_fashion_class_modify({7, 2, 12157}) -> 12162;
get_fashion_class_modify({1, 2, 12158}) -> 12156;
get_fashion_class_modify({2, 2, 12158}) -> 12157;
get_fashion_class_modify({4, 2, 12158}) -> 12159;
get_fashion_class_modify({5, 2, 12158}) -> 12160;
get_fashion_class_modify({6, 2, 12158}) -> 12161;
get_fashion_class_modify({7, 2, 12158}) -> 12162;
get_fashion_class_modify({1, 2, 12159}) -> 12156;
get_fashion_class_modify({2, 2, 12159}) -> 12157;
get_fashion_class_modify({3, 2, 12159}) -> 12158;
get_fashion_class_modify({5, 2, 12159}) -> 12160;
get_fashion_class_modify({6, 2, 12159}) -> 12161;
get_fashion_class_modify({7, 2, 12159}) -> 12162;
get_fashion_class_modify({1, 2, 12160}) -> 12156;
get_fashion_class_modify({2, 2, 12160}) -> 12157;
get_fashion_class_modify({3, 2, 12160}) -> 12158;
get_fashion_class_modify({4, 2, 12160}) -> 12159;
get_fashion_class_modify({6, 2, 12160}) -> 12161;
get_fashion_class_modify({7, 2, 12160}) -> 12162;
get_fashion_class_modify({1, 2, 12161}) -> 12156;
get_fashion_class_modify({2, 2, 12161}) -> 12157;
get_fashion_class_modify({3, 2, 12161}) -> 12158;
get_fashion_class_modify({4, 2, 12161}) -> 12159;
get_fashion_class_modify({5, 2, 12161}) -> 12160;
get_fashion_class_modify({7, 2, 12161}) -> 12162;
get_fashion_class_modify({1, 2, 12162}) -> 12156;
get_fashion_class_modify({2, 2, 12162}) -> 12157;
get_fashion_class_modify({3, 2, 12162}) -> 12158;
get_fashion_class_modify({4, 2, 12162}) -> 12159;
get_fashion_class_modify({5, 2, 12162}) -> 12160;
get_fashion_class_modify({6, 2, 12162}) -> 12161;
get_fashion_class_modify({2, 2, 12163}) -> 12164;
get_fashion_class_modify({3, 2, 12163}) -> 12165;
get_fashion_class_modify({4, 2, 12163}) -> 12166;
get_fashion_class_modify({5, 2, 12163}) -> 12167;
get_fashion_class_modify({6, 2, 12163}) -> 12168;
get_fashion_class_modify({7, 2, 12163}) -> 12169;
get_fashion_class_modify({1, 2, 12164}) -> 12163;
get_fashion_class_modify({3, 2, 12164}) -> 12165;
get_fashion_class_modify({4, 2, 12164}) -> 12166;
get_fashion_class_modify({5, 2, 12164}) -> 12167;
get_fashion_class_modify({6, 2, 12164}) -> 12168;
get_fashion_class_modify({7, 2, 12164}) -> 12169;
get_fashion_class_modify({1, 2, 12165}) -> 12163;
get_fashion_class_modify({2, 2, 12165}) -> 12164;
get_fashion_class_modify({4, 2, 12165}) -> 12166;
get_fashion_class_modify({5, 2, 12165}) -> 12167;
get_fashion_class_modify({6, 2, 12165}) -> 12168;
get_fashion_class_modify({7, 2, 12165}) -> 12169;
get_fashion_class_modify({1, 2, 12166}) -> 12163;
get_fashion_class_modify({2, 2, 12166}) -> 12164;
get_fashion_class_modify({3, 2, 12166}) -> 12165;
get_fashion_class_modify({5, 2, 12166}) -> 12167;
get_fashion_class_modify({6, 2, 12166}) -> 12168;
get_fashion_class_modify({7, 2, 12166}) -> 12169;
get_fashion_class_modify({1, 2, 12167}) -> 12163;
get_fashion_class_modify({2, 2, 12167}) -> 12164;
get_fashion_class_modify({3, 2, 12167}) -> 12165;
get_fashion_class_modify({4, 2, 12167}) -> 12166;
get_fashion_class_modify({6, 2, 12167}) -> 12168;
get_fashion_class_modify({7, 2, 12167}) -> 12169;
get_fashion_class_modify({1, 2, 12168}) -> 12163;
get_fashion_class_modify({2, 2, 12168}) -> 12164;
get_fashion_class_modify({3, 2, 12168}) -> 12165;
get_fashion_class_modify({4, 2, 12168}) -> 12166;
get_fashion_class_modify({5, 2, 12168}) -> 12167;
get_fashion_class_modify({7, 2, 12168}) -> 12169;
get_fashion_class_modify({1, 2, 12169}) -> 12163;
get_fashion_class_modify({2, 2, 12169}) -> 12164;
get_fashion_class_modify({3, 2, 12169}) -> 12165;
get_fashion_class_modify({4, 2, 12169}) -> 12166;
get_fashion_class_modify({5, 2, 12169}) -> 12167;
get_fashion_class_modify({6, 2, 12169}) -> 12168;
get_fashion_class_modify({2, 2, 12170}) -> 12171;
get_fashion_class_modify({3, 2, 12170}) -> 12172;
get_fashion_class_modify({4, 2, 12170}) -> 12173;
get_fashion_class_modify({5, 2, 12170}) -> 12174;
get_fashion_class_modify({6, 2, 12170}) -> 12175;
get_fashion_class_modify({7, 2, 12170}) -> 12176;
get_fashion_class_modify({1, 2, 12171}) -> 12170;
get_fashion_class_modify({3, 2, 12171}) -> 12172;
get_fashion_class_modify({4, 2, 12171}) -> 12173;
get_fashion_class_modify({5, 2, 12171}) -> 12174;
get_fashion_class_modify({6, 2, 12171}) -> 12175;
get_fashion_class_modify({7, 2, 12171}) -> 12176;
get_fashion_class_modify({1, 2, 12172}) -> 12170;
get_fashion_class_modify({2, 2, 12172}) -> 12171;
get_fashion_class_modify({4, 2, 12172}) -> 12173;
get_fashion_class_modify({5, 2, 12172}) -> 12174;
get_fashion_class_modify({6, 2, 12172}) -> 12175;
get_fashion_class_modify({7, 2, 12172}) -> 12176;
get_fashion_class_modify({1, 2, 12173}) -> 12170;
get_fashion_class_modify({2, 2, 12173}) -> 12171;
get_fashion_class_modify({3, 2, 12173}) -> 12172;
get_fashion_class_modify({5, 2, 12173}) -> 12174;
get_fashion_class_modify({6, 2, 12173}) -> 12175;
get_fashion_class_modify({7, 2, 12173}) -> 12176;
get_fashion_class_modify({1, 2, 12174}) -> 12170;
get_fashion_class_modify({2, 2, 12174}) -> 12171;
get_fashion_class_modify({3, 2, 12174}) -> 12172;
get_fashion_class_modify({4, 2, 12174}) -> 12173;
get_fashion_class_modify({6, 2, 12174}) -> 12175;
get_fashion_class_modify({7, 2, 12174}) -> 12176;
get_fashion_class_modify({1, 2, 12175}) -> 12170;
get_fashion_class_modify({2, 2, 12175}) -> 12171;
get_fashion_class_modify({3, 2, 12175}) -> 12172;
get_fashion_class_modify({4, 2, 12175}) -> 12173;
get_fashion_class_modify({5, 2, 12175}) -> 12174;
get_fashion_class_modify({7, 2, 12175}) -> 12176;
get_fashion_class_modify({1, 2, 12176}) -> 12170;
get_fashion_class_modify({2, 2, 12176}) -> 12171;
get_fashion_class_modify({3, 2, 12176}) -> 12172;
get_fashion_class_modify({4, 2, 12176}) -> 12173;
get_fashion_class_modify({5, 2, 12176}) -> 12174;
get_fashion_class_modify({6, 2, 12176}) -> 12175;
get_fashion_class_modify({2, 2, 12177}) -> 12178;
get_fashion_class_modify({3, 2, 12177}) -> 12179;
get_fashion_class_modify({4, 2, 12177}) -> 12180;
get_fashion_class_modify({5, 2, 12177}) -> 12181;
get_fashion_class_modify({6, 2, 12177}) -> 12182;
get_fashion_class_modify({7, 2, 12177}) -> 12183;
get_fashion_class_modify({1, 2, 12178}) -> 12177;
get_fashion_class_modify({3, 2, 12178}) -> 12179;
get_fashion_class_modify({4, 2, 12178}) -> 12180;
get_fashion_class_modify({5, 2, 12178}) -> 12181;
get_fashion_class_modify({6, 2, 12178}) -> 12182;
get_fashion_class_modify({7, 2, 12178}) -> 12183;
get_fashion_class_modify({1, 2, 12179}) -> 12177;
get_fashion_class_modify({2, 2, 12179}) -> 12178;
get_fashion_class_modify({4, 2, 12179}) -> 12180;
get_fashion_class_modify({5, 2, 12179}) -> 12181;
get_fashion_class_modify({6, 2, 12179}) -> 12182;
get_fashion_class_modify({7, 2, 12179}) -> 12183;
get_fashion_class_modify({1, 2, 12180}) -> 12177;
get_fashion_class_modify({2, 2, 12180}) -> 12178;
get_fashion_class_modify({3, 2, 12180}) -> 12179;
get_fashion_class_modify({5, 2, 12180}) -> 12181;
get_fashion_class_modify({6, 2, 12180}) -> 12182;
get_fashion_class_modify({7, 2, 12180}) -> 12183;
get_fashion_class_modify({1, 2, 12181}) -> 12177;
get_fashion_class_modify({2, 2, 12181}) -> 12178;
get_fashion_class_modify({3, 2, 12181}) -> 12179;
get_fashion_class_modify({4, 2, 12181}) -> 12180;
get_fashion_class_modify({6, 2, 12181}) -> 12182;
get_fashion_class_modify({7, 2, 12181}) -> 12183;
get_fashion_class_modify({1, 2, 12182}) -> 12177;
get_fashion_class_modify({2, 2, 12182}) -> 12178;
get_fashion_class_modify({3, 2, 12182}) -> 12179;
get_fashion_class_modify({4, 2, 12182}) -> 12180;
get_fashion_class_modify({5, 2, 12182}) -> 12181;
get_fashion_class_modify({7, 2, 12182}) -> 12183;
get_fashion_class_modify({1, 2, 12183}) -> 12177;
get_fashion_class_modify({2, 2, 12183}) -> 12178;
get_fashion_class_modify({3, 2, 12183}) -> 12179;
get_fashion_class_modify({4, 2, 12183}) -> 12180;
get_fashion_class_modify({5, 2, 12183}) -> 12181;
get_fashion_class_modify({6, 2, 12183}) -> 12182;
get_fashion_class_modify({2, 2, 12184}) -> 12185;
get_fashion_class_modify({3, 2, 12184}) -> 12186;
get_fashion_class_modify({4, 2, 12184}) -> 12187;
get_fashion_class_modify({5, 2, 12184}) -> 12188;
get_fashion_class_modify({6, 2, 12184}) -> 12189;
get_fashion_class_modify({7, 2, 12184}) -> 12190;
get_fashion_class_modify({1, 2, 12185}) -> 12184;
get_fashion_class_modify({3, 2, 12185}) -> 12186;
get_fashion_class_modify({4, 2, 12185}) -> 12187;
get_fashion_class_modify({5, 2, 12185}) -> 12188;
get_fashion_class_modify({6, 2, 12185}) -> 12189;
get_fashion_class_modify({7, 2, 12185}) -> 12190;
get_fashion_class_modify({1, 2, 12186}) -> 12184;
get_fashion_class_modify({2, 2, 12186}) -> 12185;
get_fashion_class_modify({4, 2, 12186}) -> 12187;
get_fashion_class_modify({5, 2, 12186}) -> 12188;
get_fashion_class_modify({6, 2, 12186}) -> 12189;
get_fashion_class_modify({7, 2, 12186}) -> 12190;
get_fashion_class_modify({1, 2, 12187}) -> 12184;
get_fashion_class_modify({2, 2, 12187}) -> 12185;
get_fashion_class_modify({3, 2, 12187}) -> 12186;
get_fashion_class_modify({5, 2, 12187}) -> 12188;
get_fashion_class_modify({6, 2, 12187}) -> 12189;
get_fashion_class_modify({7, 2, 12187}) -> 12190;
get_fashion_class_modify({1, 2, 12188}) -> 12184;
get_fashion_class_modify({2, 2, 12188}) -> 12185;
get_fashion_class_modify({3, 2, 12188}) -> 12186;
get_fashion_class_modify({4, 2, 12188}) -> 12187;
get_fashion_class_modify({6, 2, 12188}) -> 12189;
get_fashion_class_modify({7, 2, 12188}) -> 12190;
get_fashion_class_modify({1, 2, 12189}) -> 12184;
get_fashion_class_modify({2, 2, 12189}) -> 12185;
get_fashion_class_modify({3, 2, 12189}) -> 12186;
get_fashion_class_modify({4, 2, 12189}) -> 12187;
get_fashion_class_modify({5, 2, 12189}) -> 12188;
get_fashion_class_modify({7, 2, 12189}) -> 12190;
get_fashion_class_modify({1, 2, 12190}) -> 12184;
get_fashion_class_modify({2, 2, 12190}) -> 12185;
get_fashion_class_modify({3, 2, 12190}) -> 12186;
get_fashion_class_modify({4, 2, 12190}) -> 12187;
get_fashion_class_modify({5, 2, 12190}) -> 12188;
get_fashion_class_modify({6, 2, 12190}) -> 12189;
get_fashion_class_modify(_) -> false.

get_fashion_forever_time(12060) -> 365;
get_fashion_forever_time(12061) -> 365;
get_fashion_forever_time(12062) -> 365;
get_fashion_forever_time(12063) -> 365;
get_fashion_forever_time(12064) -> 365;
get_fashion_forever_time(12065) -> 365;
get_fashion_forever_time(12070) -> 365;
get_fashion_forever_time(12071) -> 365;
get_fashion_forever_time(12072) -> 365;
get_fashion_forever_time(12073) -> 365;
get_fashion_forever_time(12074) -> 365;
get_fashion_forever_time(12075) -> 365;
get_fashion_forever_time(12081) -> 365;
get_fashion_forever_time(12082) -> 365;
get_fashion_forever_time(12083) -> 365;
get_fashion_forever_time(12084) -> 365;
get_fashion_forever_time(12085) -> 365;
get_fashion_forever_time(12086) -> 365;
get_fashion_forever_time(12087) -> 365;
get_fashion_forever_time(12079) -> 365;
get_fashion_forever_time(12080) -> 365;
get_fashion_forever_time(12088) -> 365;
get_fashion_forever_time(12089) -> 365;
get_fashion_forever_time(12090) -> 365;
get_fashion_forever_time(12091) -> 365;
get_fashion_forever_time(12092) -> 365;
get_fashion_forever_time(12093) -> 365;
get_fashion_forever_time(12094) -> 365;
get_fashion_forever_time(12114) -> 365;
get_fashion_forever_time(12115) -> 365;
get_fashion_forever_time(12116) -> 365;
get_fashion_forever_time(12117) -> 365;
get_fashion_forever_time(12118) -> 365;
get_fashion_forever_time(12119) -> 365;
get_fashion_forever_time(12120) -> 365;
get_fashion_forever_time(12121) -> 365;
get_fashion_forever_time(12122) -> 365;
get_fashion_forever_time(12123) -> 365;
get_fashion_forever_time(12124) -> 365;
get_fashion_forever_time(12125) -> 365;
get_fashion_forever_time(12126) -> 365;
get_fashion_forever_time(12127) -> 365;
get_fashion_forever_time(12128) -> 365;
get_fashion_forever_time(12129) -> 365;
get_fashion_forever_time(12130) -> 365;
get_fashion_forever_time(12131) -> 365;
get_fashion_forever_time(12132) -> 365;
get_fashion_forever_time(12133) -> 365;
get_fashion_forever_time(12134) -> 365;
get_fashion_forever_time(12135) -> 365;
get_fashion_forever_time(12136) -> 365;
get_fashion_forever_time(12137) -> 365;
get_fashion_forever_time(12138) -> 365;
get_fashion_forever_time(12139) -> 365;
get_fashion_forever_time(12140) -> 365;
get_fashion_forever_time(12141) -> 365;
get_fashion_forever_time(12142) -> 365;
get_fashion_forever_time(12143) -> 365;
get_fashion_forever_time(12144) -> 365;
get_fashion_forever_time(12145) -> 365;
get_fashion_forever_time(12146) -> 365;
get_fashion_forever_time(12147) -> 365;
get_fashion_forever_time(12148) -> 365;
get_fashion_forever_time(12149) -> 365;
get_fashion_forever_time(12150) -> 365;
get_fashion_forever_time(12151) -> 365;
get_fashion_forever_time(12152) -> 365;
get_fashion_forever_time(12153) -> 365;
get_fashion_forever_time(12154) -> 365;
get_fashion_forever_time(12155) -> 365;
get_fashion_forever_time(12156) -> 365;
get_fashion_forever_time(12157) -> 365;
get_fashion_forever_time(12158) -> 365;
get_fashion_forever_time(12159) -> 365;
get_fashion_forever_time(12160) -> 365;
get_fashion_forever_time(12161) -> 365;
get_fashion_forever_time(12162) -> 365;
get_fashion_forever_time(12163) -> 365;
get_fashion_forever_time(12164) -> 365;
get_fashion_forever_time(12165) -> 365;
get_fashion_forever_time(12166) -> 365;
get_fashion_forever_time(12167) -> 365;
get_fashion_forever_time(12168) -> 365;
get_fashion_forever_time(12169) -> 365;
get_fashion_forever_time(12170) -> 365;
get_fashion_forever_time(12171) -> 365;
get_fashion_forever_time(12172) -> 365;
get_fashion_forever_time(12173) -> 365;
get_fashion_forever_time(12174) -> 365;
get_fashion_forever_time(12175) -> 365;
get_fashion_forever_time(12176) -> 365;
get_fashion_forever_time(12177) -> 365;
get_fashion_forever_time(12178) -> 365;
get_fashion_forever_time(12179) -> 365;
get_fashion_forever_time(12180) -> 365;
get_fashion_forever_time(12181) -> 365;
get_fashion_forever_time(12182) -> 365;
get_fashion_forever_time(12183) -> 365;
get_fashion_forever_time(12184) -> 365;
get_fashion_forever_time(12185) -> 365;
get_fashion_forever_time(12186) -> 365;
get_fashion_forever_time(12187) -> 365;
get_fashion_forever_time(12188) -> 365;
get_fashion_forever_time(12189) -> 365;
get_fashion_forever_time(12190) -> 365;
get_fashion_forever_time(_) -> false.

