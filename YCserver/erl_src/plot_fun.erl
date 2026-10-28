-file("src/mod/plot/plot_fun.erl", 1).

-module(plot_fun).

-export([act_args/1,
         get_var/1,
         modify_var/3,
         set_var/2,
         act_to_type/1]).

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

-file("src/mod/plot/plot_fun.erl", 16).

-spec act_args(term()) -> term().

act_args(Act) when is_tuple(Act) ->
    list_to_tuple(act_args(tuple_to_list(Act)));
act_args(Act) when is_list(Act) ->
    [act_args(A) || A <- Act];
act_args(Act) when is_function(Act) ->
    erlang:apply(Act, []);
act_args(Act) -> Act.

-spec get_var(Key :: tuple()) -> any().

get_var(Key) -> get(Key).

-spec modify_var(Key :: tuple(), Flag :: atom(),
                 Or :: number()) -> any().

modify_var(Key, Flag, Or) ->
    case get(Key) of
        Val when is_integer(Val) ->
            NewVal = case Flag of
                         add -> Val + Or;
                         sub -> Val - Or;
                         mul -> Val * Or;
                         'div' when Or =/= 0 -> Val div Or;
                         _ -> Val
                     end,
            put(Key, NewVal);
        _ -> ignore
    end.

-spec set_var(Key :: tuple(), Val :: any()) -> any().

set_var(Key, Val) -> put(Key, Val).

-spec act_to_type(Label :: atom()) -> non_neg_integer().

act_to_type(open_sys) -> 1;
act_to_type(end_plot) -> 2;
act_to_type(camera_reset) -> 100;
act_to_type(camera_move_to) -> 101;
act_to_type(camera_follow) -> 102;
act_to_type(camera_zoom) -> 103;
act_to_type(camera_shake) -> 104;
act_to_type(camera_filter) -> 105;
act_to_type(press_screen) -> 106;
act_to_type(animation_play) -> 200;
act_to_type(animation_play_on_role) -> 201;
act_to_type(animation_play_on_unit) -> 202;
act_to_type(animation_play_point) -> 203;
act_to_type(play_plot) -> 204;
act_to_type(prelude) -> 205;
act_to_type(open_panel) -> 206;
act_to_type(close_panel) -> 207;
act_to_type(play_guide) -> 208;
act_to_type(close_guide) -> 209;
act_to_type(hide) -> 210;
act_to_type(unlock_panel) -> 211;
act_to_type(get_use_item) -> 212;
act_to_type(act_role) -> 213;
act_to_type(act_unit) -> 214;
act_to_type(unit_dir) -> 215;
act_to_type(play_effect) -> 216;
act_to_type(get_use_items) -> 217;
act_to_type(study_skill) -> 219;
act_to_type(play_talk) -> 220;
act_to_type(action) -> 221;
act_to_type(inter_monologue) -> 222;
act_to_type(first_pet) -> 223;
act_to_type(pet_item_skill_guide) -> 224;
act_to_type(sound_play) -> 300;
act_to_type(res_cache) -> 400;
act_to_type(unit_talk) -> 401;
act_to_type(unit_talk_bubble) -> 402;
act_to_type(role_talk) -> 403;
act_to_type(role_talk_bubble) -> 404;
act_to_type(plot_unit_create) -> 405;
act_to_type(plot_unit_move) -> 406;
act_to_type(plot_unit_move_role) -> 407;
act_to_type(plot_unit_del) -> 408;
act_to_type(plot_unit_set_looks) -> 409;
act_to_type(mod_cache) -> 410;
act_to_type(select) -> 411;
act_to_type(unit_select) -> 412;
act_to_type(unit_talk_head) -> 413;
act_to_type(role_talk_head) -> 414;
act_to_type(unit_talk_face) -> 415;
act_to_type(role_talk_face) -> 416;
act_to_type(role_jump) -> 417;
act_to_type(way_finding_point) -> 500;
act_to_type(way_finding) -> 501;
act_to_type(role_dir) -> 502;
act_to_type(transmit) -> 503;
act_to_type(world_map) -> 504;
act_to_type(use_item) -> 505;
act_to_type(quest_trace) -> 506;
act_to_type(wait_client) -> 601;
act_to_type(_Label) ->
    logger:error("非法类型[Label:~w]", [_Label], plot_fun, 117),
    0.

