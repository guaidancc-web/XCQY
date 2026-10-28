-file("src/mod/role/role_query.erl", 1).

-module(role_query).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         pid/2,
         pid/4,
         index/2,
         index/4,
         cache/2,
         cache/4,
         rec/3,
         rec/5,
         attr/3,
         attr/5,
         conn_pid/2,
         conn_pid/4,
         local_pid/2,
         local_pid/4,
         local_conn_pid/2,
         local_conn_pid/4,
         local_index/2,
         local_index/4,
         local_cache/2,
         local_cache/4,
         local_rec/3,
         local_rec/5,
         local_attr/3,
         local_attr/5,
         sync_cache/1,
         sync_index/1,
         clean/1,
         all_cached_roles/0,
         request_name/2]).

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

-file("src/mod/role/role_query.erl", 46).

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

-file("src/mod/role/role_query.erl", 47).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/role/role_query.erl", 48).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/role/role_query.erl", 49).

-record(state, {}).

start_link() ->
    gen_server:start_link({local, role_query},
                          role_query,
                          [],
                          []).

-spec pid(Type, Id, Platform, ZoneId) -> {ok, pid()} |
                                         {error, not_found} |
                                         {error, term()} when Type :: by_id |
                                                                      by_acc |
                                                                      by_name,
                                                              Id ::
                                                                  non_neg_integer() |
                                                                  bitstring(),
                                                              Platform :: p(),
                                                              ZoneId :: z().

pid(by_id, {Id, Platform, ZoneId}) ->
    pid(by_id, Id, Platform, ZoneId).

pid(by_id, Id, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_pid,
               [by_id, Id, Platform, ZoneId]);
pid(by_acc, Acc, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_pid,
               [by_acc, Acc, Platform, ZoneId]);
pid(by_name, Name, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_pid,
               [by_name, Name, Platform, ZoneId]).

-spec conn_pid(Type, Id, Platform, ZoneId) -> {ok,
                                               pid()} |
                                              {error, not_found} |
                                              {error, term()} when Type ::
                                                                       by_id |
                                                                       by_acc |
                                                                       by_name,
                                                                   Id ::
                                                                       non_neg_integer() |
                                                                       bitstring(),
                                                                   Platform ::
                                                                       p(),
                                                                   ZoneId ::
                                                                       z().

conn_pid(by_id, {Id, Platform, ZoneId}) ->
    conn_pid(by_id, Id, Platform, ZoneId).

conn_pid(by_id, Id, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_conn_pid,
               [by_id, Id, Platform, ZoneId]);
conn_pid(by_acc, Acc, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_conn_pid,
               [by_acc, Acc, Platform, ZoneId]);
conn_pid(by_name, Name, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_conn_pid,
               [by_name, Name, Platform, ZoneId]).

-spec index(Type, Id, Platform, ZoneId) -> {ok, Rtn} |
                                           {error, not_found} |
                                           {error, term()} when Type :: by_id |
                                                                        by_acc |
                                                                        by_name,
                                                                Id ::
                                                                    non_neg_integer() |
                                                                    bitstring(),
                                                                Platform :: p(),
                                                                ZoneId :: z(),
                                                                Rtn ::
                                                                    #id_index{} |
                                                                    #name_index{}.

index(by_id, {Id, Platform, ZoneId}) ->
    index(by_id, Id, Platform, ZoneId).

index(by_id, Id, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_index,
               [by_id, Id, Platform, ZoneId]);
index(by_acc, Acc, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_index,
               [by_acc, Acc, Platform, ZoneId]);
index(by_name, Name, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_index,
               [by_name, Name, Platform, ZoneId]).

-spec cache(Type, Id, Platform, ZoneId) -> {ok,
                                            #role_cache{}} |
                                           {error, not_found} |
                                           {error, term()} when Type :: by_id |
                                                                        by_acc |
                                                                        by_name,
                                                                Id ::
                                                                    non_neg_integer() |
                                                                    bitstring(),
                                                                Platform :: p(),
                                                                ZoneId :: z().

cache(by_id, {Id, Platform, ZoneId}) ->
    cache(by_id, Id, Platform, ZoneId).

cache(by_id, Id, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_cache,
               [by_id, Id, Platform, ZoneId]);
cache(by_acc, Acc, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_cache,
               [by_acc, Acc, Platform, ZoneId]);
cache(by_name, Name, Platform, ZoneId) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_cache,
               [by_name, Name, Platform, ZoneId]).

-spec rec(Type, Id, Platform, ZoneId, RecName) -> {ok,
                                                   tuple()} |
                                                  {error, not_found} |
                                                  {error, term()} when Type ::
                                                                           by_id |
                                                                           by_acc |
                                                                           by_name,
                                                                       Id ::
                                                                           non_neg_integer() |
                                                                           bitstring(),
                                                                       Platform ::
                                                                           p(),
                                                                       ZoneId ::
                                                                           z(),
                                                                       RecName ::
                                                                           atom().

rec(by_id, {Id, Platform, ZoneId}, RecName) ->
    rec(by_id, Id, Platform, ZoneId, RecName).

rec(by_id, Id, Platform, ZoneId, RecName) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_rec,
               [by_id, Id, Platform, ZoneId, RecName]);
rec(by_acc, Acc, Platform, ZoneId, RecName) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_rec,
               [by_acc, Acc, Platform, ZoneId, RecName]);
rec(by_name, Name, Platform, ZoneId, RecName) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_rec,
               [by_name, Name, Platform, ZoneId, RecName]).

-spec attr(Type, Id, Platform, ZoneId, Pos) -> {ok,
                                                [term()]} |
                                               {error, not_found} |
                                               {error, term()} when Type ::
                                                                        by_id |
                                                                        by_acc |
                                                                        by_name,
                                                                    Id ::
                                                                        non_neg_integer() |
                                                                        bitstring(),
                                                                    Platform ::
                                                                        p(),
                                                                    ZoneId ::
                                                                        z(),
                                                                    Pos ::
                                                                        [pos_integer()].

attr(by_id, {Id, Platform, ZoneId}, Pos) ->
    attr(by_id, Id, Platform, ZoneId, Pos).

attr(by_id, Id, Platform, ZoneId, Pos) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_attr,
               [by_id, Id, Platform, ZoneId, Pos]);
attr(by_acc, Acc, Platform, ZoneId, Pos) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_attr,
               [by_acc, Acc, Platform, ZoneId, Pos]);
attr(by_name, Name, Platform, ZoneId, Pos) ->
    cross:call(Platform,
               ZoneId,
               role_query,
               local_attr,
               [by_name, Name, Platform, ZoneId, Pos]).

-spec local_pid(Type, Id, Platform, ZoneId) -> {ok,
                                                pid()} |
                                               {error, not_found} |
                                               {error, term()} when Type ::
                                                                        by_id |
                                                                        by_acc |
                                                                        by_name,
                                                                    Id ::
                                                                        non_neg_integer() |
                                                                        bitstring(),
                                                                    Platform ::
                                                                        p(),
                                                                    ZoneId ::
                                                                        z().

local_pid(by_id, {Id, Platform, ZoneId}) ->
    local_pid(by_id, Id, Platform, ZoneId).

local_pid(by_id, Id, Platform, ZoneId) ->
    case local_index(by_id, Id, Platform, ZoneId) of
        {ok, #id_index{pid = Pid}} -> {ok, Pid};
        {error, Reason} -> {error, Reason}
    end;
local_pid(by_acc, Acc, Platform, ZoneId) ->
    case local_index(by_acc, Acc, Platform, ZoneId) of
        {ok, #acc_index{pid = Pid}} -> {ok, Pid};
        {error, Reason} -> {error, Reason}
    end;
local_pid(by_name, Name, Platform, ZoneId) ->
    case local_index(by_name, Name, Platform, ZoneId) of
        {ok, #name_index{pid = Pid}} -> {ok, Pid};
        {error, Reason} -> {error, Reason}
    end.

-spec local_conn_pid(Type, Id, Platform, ZoneId) -> {ok,
                                                     pid()} |
                                                    {error, not_found} |
                                                    {error, term()} when Type ::
                                                                             by_id |
                                                                             by_acc |
                                                                             by_name,
                                                                         Id ::
                                                                             non_neg_integer() |
                                                                             bitstring(),
                                                                         Platform ::
                                                                             p(),
                                                                         ZoneId ::
                                                                             z().

local_conn_pid(by_id, {Id, Platform, ZoneId}) ->
    local_conn_pid(by_id, Id, Platform, ZoneId).

local_conn_pid(by_id, Id, Platform, ZoneId) ->
    case local_index(by_id, Id, Platform, ZoneId) of
        {ok, #id_index{conn_pid = Pid}} -> {ok, Pid};
        {error, Reason} -> {error, Reason}
    end;
local_conn_pid(by_acc, Acc, Platform, ZoneId) ->
    case local_index(by_acc, Acc, Platform, ZoneId) of
        {ok, #acc_index{conn_pid = Pid}} -> {ok, Pid};
        {error, Reason} -> {error, Reason}
    end;
local_conn_pid(by_name, Name, Platform, ZoneId) ->
    case local_index(by_name, Name, Platform, ZoneId) of
        {ok, #name_index{conn_pid = Pid}} -> {ok, Pid};
        {error, Reason} -> {error, Reason}
    end.

-spec local_index(Type, Id, Platform, ZoneId) -> {ok,
                                                  Rtn} |
                                                 {error, not_found} |
                                                 {error, term()} when Type ::
                                                                          by_id |
                                                                          by_acc |
                                                                          by_name,
                                                                      Id ::
                                                                          non_neg_integer() |
                                                                          bitstring(),
                                                                      Platform ::
                                                                          p(),
                                                                      ZoneId ::
                                                                          z(),
                                                                      Rtn ::
                                                                          #id_index{} |
                                                                          #name_index{}.

local_index(by_id, {Id, Platform, ZoneId}) ->
    local_index(by_id, Id, Platform, ZoneId).

local_index(by_id, Id, Platform, ZoneId) ->
    case catch ets:lookup(role_id_index,
                          {Id, Platform, ZoneId})
        of
        [Idx] -> {ok, Idx};
        [] -> {error, not_found};
        Err -> {error, Err}
    end;
local_index(by_acc, Acc, Platform, ZoneId) ->
    case catch ets:lookup(role_acc_index,
                          {Acc, Platform, ZoneId})
        of
        [Idx] -> {ok, Idx};
        [] -> {error, not_found};
        Err -> {error, Err}
    end;
local_index(by_name, Name, _Platform, _ZoneId) ->
    case catch ets:lookup(role_name_index, Name) of
        [Idx] -> {ok, Idx};
        [] -> {error, not_found};
        Err -> {error, Err}
    end.

-spec local_cache(Type, Id, Platform, ZoneId) -> {ok,
                                                  #role_cache{}} |
                                                 {error, not_found} |
                                                 {error, term()} when Type ::
                                                                          by_id |
                                                                          by_acc |
                                                                          by_name,
                                                                      Id ::
                                                                          non_neg_integer() |
                                                                          bitstring(),
                                                                      Platform ::
                                                                          p(),
                                                                      ZoneId ::
                                                                          z().

local_cache(by_id, {Id, Platform, ZoneId}) ->
    local_cache(by_id, Id, Platform, ZoneId).

local_cache(by_id, Id, Platform, ZoneId) ->
    case catch ets:lookup(role_cache,
                          {Id, Platform, ZoneId})
        of
        [R] -> {ok, R};
        [] -> {error, not_found};
        Err -> {error, Err}
    end;
local_cache(by_acc, Acc, Platform, ZoneId) ->
    case local_index(by_acc, Acc, Platform, ZoneId) of
        {error, Reason} -> {error, Reason};
        {ok, #acc_index{id = Id}} ->
            local_cache(by_id, Id, Platform, ZoneId)
    end;
local_cache(by_name, Name, Platform, ZoneId) ->
    case local_index(by_name, Name, Platform, ZoneId) of
        {error, Reason} -> {error, Reason};
        {ok, #name_index{id = Id}} ->
            local_cache(by_id, Id, Platform, ZoneId)
    end.

-spec local_rec(Type, Id, Platform, ZoneId,
                RecName) -> {ok, tuple()} |
                            {error, not_found} |
                            {error, term()} when Type :: by_id |
                                                         by_acc |
                                                         by_name,
                                                 Id :: non_neg_integer() |
                                                       bitstring(),
                                                 Platform :: p(), ZoneId :: z(),
                                                 RecName :: atom().

local_rec(by_id, {Id, Platform, ZoneId}, RecName) ->
    local_rec(by_id, Id, Platform, ZoneId, RecName).

local_rec(by_id, Id, Platform, ZoneId, RecName) ->
    case local_pid(by_id, Id, Platform, ZoneId) of
        {error, Reason} -> {error, Reason};
        {ok, Pid} -> role:convert(Pid, RecName)
    end;
local_rec(by_acc, Acc, Platform, ZoneId, RecName) ->
    case local_pid(by_acc, Acc, Platform, ZoneId) of
        {error, Reason} -> {error, Reason};
        {ok, Pid} -> role:convert(Pid, RecName)
    end;
local_rec(by_name, Name, Platform, ZoneId, RecName) ->
    case local_pid(by_name, Name, Platform, ZoneId) of
        {error, Reason} -> {error, Reason};
        {ok, Pid} -> role:convert(Pid, RecName)
    end.

-spec local_attr(Type, Id, Platform, ZoneId,
                 Pos) -> {ok, [term()]} | {error, term()} when Type ::
                                                                   by_id |
                                                                   by_acc |
                                                                   by_name,
                                                               Id ::
                                                                   non_neg_integer() |
                                                                   bitstring(),
                                                               Platform :: p(),
                                                               ZoneId :: z(),
                                                               Pos ::
                                                                   [pos_integer()].

local_attr(by_id, {Id, Platform, ZoneId}, Pos) ->
    local_attr(by_id, Id, Platform, ZoneId, Pos).

local_attr(by_id, Id, Platform, ZoneId, Pos) ->
    case local_pid(by_id, Id, Platform, ZoneId) of
        {error, Reason} -> {error, Reason};
        {ok, Pid} -> role:element(Pid, Pos)
    end;
local_attr(by_acc, Acc, Platform, ZoneId, Pos) ->
    case local_pid(by_acc, Acc, Platform, ZoneId) of
        {error, Reason} -> {error, Reason};
        {ok, Pid} -> role:element(Pid, Pos)
    end;
local_attr(by_name, Name, Platform, ZoneId, Pos) ->
    case local_pid(by_name, Name, Platform, ZoneId) of
        {error, Reason} -> {error, Reason};
        {ok, Pid} -> role:element(Pid, Pos)
    end.

-spec sync_cache(#role{}) -> ok.

sync_cache(Role = #role{id = Id, pid = Pid,
                        account = Account, name = Name, label = Label,
                        face = Face, sex = Sex, classes = Classes, lev = Lev,
                        hp = Hp, mp = Mp, hp_max = HpMax, mp_max = MpMax,
                        status = Status, s_action = Action, s_event = Event,
                        pos = Pos, channel_reg = ChannelReg, link = Link}) ->
    ets:insert(role_cache,
               #role_cache{id = Id, pid = Pid, account = Account,
                           name = Name, label = Label, face = Face, sex = Sex,
                           classes = Classes, lev = Lev, hp = Hp, mp = Mp,
                           hp_max = HpMax, mp_max = MpMax, status = Status,
                           s_action = Action, s_event = Event, pos = Pos,
                           channel_reg = ChannelReg, link = Link}),
    {ok, Profile} = role_convert:to(role_profile, Role),
    ets:insert(role_profile, Profile),
    ok.

-spec sync_index(#role{}) -> ok.

sync_index(#role{id = {Rid, Platform, ZoneId},
                 pid = Pid, name = Name, account = Acc,
                 link = #link{conn_pid = ConnPid}}) ->
    ets:insert(role_name_index,
               #name_index{id = Rid, acc = Acc, pid = Pid,
                           conn_pid = ConnPid, name = Name}),
    ets:insert(role_id_index,
               #id_index{id = {Rid, Platform, ZoneId}, acc = Acc,
                         name = Name, pid = Pid, conn_pid = ConnPid}),
    ets:insert(role_acc_index,
               #acc_index{acc = {Acc, Platform, ZoneId}, id = Rid,
                          name = Name, pid = Pid, conn_pid = ConnPid}),
    ok.

-spec clean(#role{}) -> ok.

clean(#role{id = Id = {_, Platform, ZoneId},
            account = Acc, name = Name}) ->
    ets:delete(role_cache, Id),
    ets:delete(role_acc_index, {Acc, Platform, ZoneId}),
    ets:delete(role_name_index, Name),
    ets:delete(role_id_index, Id),
    ok.

-spec all_cached_roles() -> [#role{}].

all_cached_roles() -> ets:tab2list(role_cache).

request_name(Name, Info) ->
    case catch gen_server:call(role_query,
                               {request_name, Name, Info},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

init([]) ->
    logger:info("[~w] 正在启动...",
                [role_query],
                role_query,
                351),
    process_flag(trap_exit, true),
    ets:new(role_cache,
            [set, named_table, public, {keypos, #role_cache.id}]),
    ets:new(role_name_index,
            [set, named_table, public, {keypos, #name_index.name}]),
    ets:new(role_id_index,
            [set, named_table, public, {keypos, #id_index.id}]),
    ets:new(role_acc_index,
            [set, named_table, public, {keypos, #acc_index.acc}]),
    ets:new(role_profile,
            [set, named_table, public, {keypos, #role_profile.id}]),
    State = #state{},
    logger:info("[~w] 启动完成", [role_query], role_query, 360),
    {ok, State}.

handle_call({request_name, Name, {Acc, ConnPid}}, _From,
            State) ->
    Reply = case
                db:get_one("select count(*) from role_info where "
                           "name = ?",
                           [Name])
                of
                {error, _Err} -> {false, lang:get("系统繁忙, 请稍后尝试")};
                {ok, Num} when Num >= 1 -> {false, lang:get("角色名已有")};
                {ok, _} ->
                    case catch ets:match_object(role_name_index,
                                                #name_index{name = Name,
                                                            _ = '_'})
                        of
                        [] ->
                            ets:insert(role_name_index,
                                       #name_index{acc = Acc,
                                                   conn_pid = ConnPid,
                                                   name = Name}),
                            ok;
                        [#name_index{}] -> {false, lang:get("角色名已经存在")};
                        _ -> {false, lang:get("系统繁忙，请稍后再试!")}
                    end
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(restart, State) ->
    catch ets:delete(role_cache),
    case catch ets:new(role_cache,
                       [set, named_table, public, {keypos, #role_cache.id}])
        of
        role_cache ->
            logger:info("重新加载ets成功", [], role_query, 393);
        _Result ->
            logger:info("重新加载ets失败:~w", [_Result], role_query, 395)
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [role_query],
                role_query,
                402),
    logger:info("[~w] 关闭完成", [role_query], role_query, 403),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

