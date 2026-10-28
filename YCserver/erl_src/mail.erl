-file("src/mod/mail/mail.erl", 1).

-module(mail).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         init/2,
         send/1,
         send/2,
         send/3,
         send/4,
         local_send/1,
         local_send/2,
         local_send/3,
         delay_login/1,
         clear/1,
         to_gain/1,
         to_items/1,
         t/1,
         mark/2,
         recv_rewards/2,
         del/2,
         new_arrive/2]).

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

-file("src/mod/mail/mail.erl", 32).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/mod/mail/mail.erl", 33).

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

-file("src/mod/mail/mail.erl", 34).

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

-file("src/mod/mail/mail.erl", 35).

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

-file("src/mod/mail/mail.erl", 36).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/mail/mail.erl", 37).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/mail/mail.erl", 38).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/mail/mail.erl", 39).

-file("inc/log.hrl", 1).

-file("src/mod/mail/mail.erl", 40).

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

-file("src/mod/mail/mail.erl", 41).

-record(state, {}).

init(_To, create) -> [].

-spec clear(#role{}) -> {ok, #role{}}.

clear(Role) -> {ok, Role#role{m_mail = []}}.

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, mail}, mail, [], []).

-spec send(#mail{}) -> ok | {error, term()}.

send([]) -> ok;
send([Mail | T]) ->
    send(Mail),
    send(T);
send(Mail = #mail{to = {_, Platform, ZoneId}}) ->
    cross:call(Platform, ZoneId, mail, local_send, [Mail]).

-spec send(#role{} | role_id(), Title :: bitstring(),
           Content :: bitstring()) -> ok | {error, term()}.

send(Role, Title, Content) ->
    send(Role,
         #{title => Title, content => Content, items => [],
           source => 0}).

send(Role, Title, Content, Items) ->
    send(Role,
         #{title => Title, content => Content, items => Items,
           source => 0}).

send([], _Info) -> ok;
send([RoleInfo | T], Info) ->
    send(RoleInfo, Info),
    send(T, Info);
send(#role{id = Id}, Info) -> send(Id, Info);
send(RoleId = {_, Platform, ZoneId}, Info) ->
    cross:call(Platform,
               ZoneId,
               mail,
               local_send,
               [RoleId, Info]).

-spec local_send(#mail{}) -> ok | {error, term()}.

local_send([]) -> ok;
local_send([Mail | T]) ->
    local_send(Mail),
    local_send(T);
local_send(Mail) ->
    mail ! {send, Mail},
    ok.

-spec local_send(#role{} | role_id(),
                 Title :: bitstring(), Content :: bitstring()) -> ok |
                                                                  {error,
                                                                   term()}.

local_send(Role, Title, Content) ->
    local_send(Role,
               #{title => Title, content => Content, items => [],
                 source => 0}).

local_send(_To, #{title := ""}) -> ok;
local_send([], _Info) -> ok;
local_send([RoleInfo | T], Info) ->
    local_send(RoleInfo, Info),
    local_send(T, Info);
local_send(#role{id = Id}, Info) ->
    local_send(Id, Info);
local_send({RoleName, Platform, ZoneId}, Info)
    when is_list(RoleName) ->
    case role_query:index(by_name,
                          RoleName,
                          Platform,
                          ZoneId)
        of
        {ok, #name_index{id = Rid}} ->
            local_send({Rid, Platform, ZoneId}, Info);
        {error, not_found} ->
            case role_data:info(by_name, RoleName, Platform, ZoneId)
                of
                {ok, #role_info{id = Rid}} ->
                    local_send({Rid, Platform, ZoneId}, Info);
                _Err -> {false, error}
            end;
        _Err -> {false, error}
    end;
local_send(To = {Rid, Platform, ZoneId},
           Info = #{title := Title, content := Content,
                    items := Items})
    when is_integer(Rid) ->
    Len = length(Items),
    Source = case Info of
                 #{source := S} -> S;
                 _ -> 0
             end,
    DelType = case Info of
                  #{del_type := D} -> D;
                  _ -> 0
              end,
    Mail = #mail{sess =
                     {env:update_counter(mail_sess_id, 1), Platform, ZoneId},
                 type = 1, to = To, from = {0, Platform, ZoneId},
                 from_name = "",
                 title = unicode:characters_to_binary(Title),
                 content = unicode:characters_to_binary(Content),
                 source = Source, del_type = DelType,
                 ts = date:unixtime()},
    case Len > 15 of
        true ->
            ToItems = lists:sublist(Items, 15),
            NewMail = Mail#mail{item_list = to_items(ToItems, [])},
            local_send(NewMail),
            OtherItems = lists:sublist(Items, 15 + 1, Len),
            local_send(To = {Rid, Platform, ZoneId},
                       Info#{items := OtherItems});
        _ ->
            NewMail = Mail#mail{item_list = to_items(Items, [])},
            local_send(NewMail)
    end.

delay_login(#role{pid = Pid}) ->
    role:apply(async, Pid, {fun mail_arrive/2, [login]}),
    ok.

mark(Role = #role{m_mail = Mailbox}, Sess) ->
    {ok, Role#role{m_mail = mark(Role, Mailbox, Sess, [])}}.

mark(_, [], _, L) -> L;
mark(Role,
     [H = #mail{sess = Sess, del_type = 0, item_list = []}
      | T],
     Sess, L) ->
    log:mail(mark, Role, H),
    mark(Role, T, Sess, L);
mark(Role, [H = #mail{sess = Sess} | T], Sess, L) ->
    log:mail(mark, Role, H),
    mark(Role,
         T,
         Sess,
         [H#mail{status = 1, read_ts = date:unixtime()} | L]);
mark(Role, [H | T], Sess, L) ->
    mark(Role, T, Sess, [H | L]).

recv_rewards(Role = #role{m_mail = Mailbox}, Sess) ->
    recv_rewards(Mailbox, Sess, Role, []).

recv_rewards([], _Sess, Role, L) ->
    {ok, Role#role{m_mail = L}};
recv_rewards([M = #mail{del_type = DelType, sess = Sess,
                        item_list = ItemList, title = _Title, source = Source,
                        content = _Content}
              | T],
             Sess, Role = #role{pid = Pid}, L) ->
    GL = mail:to_gain(ItemList),
    NewGL = [Gain#gain{source = Source} || Gain <- GL],
    case do_gl(NewGL, Role, lang:get("领取信件")) of
        {false, _Gain} -> {error, lang:get("你的背包空间不足，无法收取附件")};
        {ok, NRole} ->
            notice:gain_item(Pid, 1, GL),
            log:mail(recv_rewards, Role, M),
            case DelType of
                0 -> recv_rewards(T, Sess, NRole, L);
                _ ->
                    recv_rewards(T,
                                 Sess,
                                 NRole,
                                 [M#mail{item_list = []} | L])
            end
    end;
recv_rewards([H | T], Sess, Role, L) ->
    recv_rewards(T, Sess, Role, [H | L]).

do_gl([], Role, _) -> {ok, Role};
do_gl([H | T], Role, Prefix) ->
    case role_gain:do_notice([H], Role, Prefix) of
        {ok, NewRole} -> do_gl(T, NewRole, Prefix);
        {false, #gain{label = prac_exp, msg = Msg}} ->
            notice:return(Msg),
            do_gl(T, Role, Prefix);
        Else -> Else
    end.

del(Role = #role{m_mail = Mailbox}, Sess) ->
    case del(Mailbox, Sess, []) of
        {ok, List} -> {ok, Role#role{m_mail = List}};
        Else -> Else
    end.

del([], _, L) -> {ok, L};
del([#mail{sess = Sess, item_list = []} | T], Sess,
    L) ->
    del(T, Sess, L);
del([#mail{sess = Sess} | _], Sess, _) ->
    {false, lang:get("您无法删除，请及时提取附件！")};
del([H | T], Sess, L) -> del(T, Sess, [H | L]).

-spec to_items([tuple()]) -> [#item{}].

to_items(Items) -> to_items(Items, []).

-spec to_gain([#item{}]) -> [#gain{}].

to_gain(Items) -> to_gain(Items, [], []).

new_arrive(#role{}, Mails) ->
    sys_conn:pack_send(13404, {Mails}),
    ok.

init([]) ->
    logger:info("[~w] 正在启动...", [mail], mail, 253),
    process_flag(trap_exit, true),
    case env:get(mail_sess_id) of
        SessId when is_integer(SessId) -> ignore;
        _ -> env:set(mail_sess_id, 1)
    end,
    dets:open_file(mailbox,
                   [{file, "./dets/mailbox.dets"},
                    {keypos, #mail.to},
                    {type, duplicate_bag}]),
    do_init(),
    self() ! loop,
    State = #state{},
    logger:info("[~w] 启动完成", [mail], mail, 265),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({send, Mail = #mail{to = {Rid, P, Z}}},
            State) ->
    dets:insert(mailbox, Mail),
    log:mail(new, Mail),
    case role_query:pid(by_id, Rid, P, Z) of
        {ok, Pid} ->
            role:apply(async, Pid, {fun mail_arrive/2, [new_mail]});
        _ -> ignore
    end,
    {noreply, State};
handle_info(loop, State) ->
    env:save_counter(mail_sess_id, 0),
    erlang:send_after(10000, self(), loop),
    {noreply, State};
handle_info(check_error_mail, State) ->
    Fun = fun (#mail{title = Title,
                     to = {Rid, Platform, ZoneId},
                     item_list = ItemList = [_ | _]}) ->
                  case lists:keyfind(90002, 1, ItemList) of
                      {_, Val} when Val >= 20000 ->
                          logger:info("角色[~w:~ts:~w]标题[~ts]邮件异常,items:~w",
                                      [Rid, Platform, ZoneId, Title, ItemList],
                                      mail,
                                      295);
                      _ -> ok
                  end,
                  continue;
              (_) -> continue
          end,
    dets:traverse(mailbox, Fun),
    {noreply, State};
handle_info(Info, State) ->
    logger:error("收到未知消息: ~w", [Info], mail, 306),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [mail], mail, 310),
    util:close_dets(mailbox),
    logger:info("[~w] 关闭完成", [mail], mail, 312),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

mail_arrive(Role = #role{id = RoleId, m_mail = Mailbox},
            Flag) ->
    Now = date:unixtime(),
    case recv(RoleId) of
        {ok, L} when Flag =:= login ->
            NewL = [M#mail{rev_ts = Now} || #mail{} = M <- L],
            NewMailbox = Mailbox ++ NewL,
            Mbox = clean(NewMailbox, Now, []),
            sys_conn:pack_send(13404, {NewL}),
            {ok, Role#role{m_mail = Mbox}};
        _ when Flag =:= login ->
            Mbox = clean(Mailbox, Now, []),
            {ok, Role#role{m_mail = Mbox}};
        {error, _} -> ok;
        ok -> ok;
        {ok, L} ->
            NewL = [M#mail{rev_ts = Now} || #mail{} = M <- L],
            NewMailbox = Mailbox ++ NewL,
            Len = length(NewMailbox),
            case Len >= 300 - 50 of
                true ->
                    Msg =
                        notice:format(lang:get("当前~ts，超出上限后最早的邮件将被删除，请及时领取邮件奖励哟"),
                                      [{string_2, 5, lang:get("邮件数量已接近上限")}]),
                    notice:send(Role, 2, Msg);
                _ -> ok
            end,
            Mbox = clean(NewMailbox, Now, []),
            sys_conn:pack_send(13404, {NewL}),
            {ok, Role#role{m_mail = Mbox}}
    end.

-spec recv(role_id()) -> ok |
                         {ok, [#mail{}]} |
                         {error, term()}.

recv(RoleId) ->
    case catch dets:lookup(mailbox, RoleId) of
        MailList = [#mail{} | _] ->
            [dets:delete_object(mailbox, Mail) || Mail <- MailList],
            {ok, MailList};
        [] -> ok;
        Err ->
            logger:error("收取邮件时发生异常: ~w", [Err], mail, 365),
            {error, lang:get("邮件系统暂时不可用，请稍后再试")}
    end.

clean([], _Now, L) ->
    SortL = lists:reverse(lists:keysort(#mail.ts, L)),
    lists:sublist(SortL, 300);
clean([M = #mail{rev_ts = 0} | T], Now, L) ->
    clean(T, Now, [M#mail{rev_ts = Now} | L]);
clean([#mail{status = 1, read_ts = Ts, item_list = [],
             del_type = 1}
       | T],
      Now, L)
    when Now - Ts > 86400 ->
    clean(T, Now, L);
clean([#mail{status = 1, read_ts = Ts, item_list = [],
             del_type = 0}
       | T],
      Now, L)
    when Ts > 0 ->
    clean(T, Now, L);
clean([#mail{status = 1, read_ts = Ts, item_list = [],
             del_type = 2}
       | T],
      Now, L)
    when Now - Ts > 86400 * 9 ->
    clean(T, Now, L);
clean([#mail{status = 1, item_list = [], del_type = 3}
       | T],
      Now, L) ->
    clean(T, Now, L);
clean([#mail{status = 0, rev_ts = Ts, del_type = 3}
       | T],
      Now, L)
    when Now - Ts > 86400 * 2 ->
    clean(T, Now, L);
clean([M = #mail{rev_ts = Ts} | T], Now, L)
    when Now - Ts < 2592000 ->
    clean(T, Now, [M | L]);
clean([_H | T], Now, L) -> clean(T, Now, L).

to_gain([], GL, Items) ->
    [#gain{label = items, val = Items} | GL];
to_gain([#item{base_id = 90000, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = coin, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90002, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = gold, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90003, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = gold_bind, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90010, quantity = Num} | T],
        GL, Items) ->
    to_gain(T, [#gain{label = exp, val = Num} | GL], Items);
to_gain([#item{base_id = 90005, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = pet_exp, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90011, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = guild, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90015, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = guild_assets, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90012, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = stars_score, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90007, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = character, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90018, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = love, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90019, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = teacher_score, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90020, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = tournament, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90024, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = handbook_point, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90026, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = star_gold, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90021, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = mount_spirit, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90023, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = endless_challenge, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90022, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = lottery_luck, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90025, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = autumn_score, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90013, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = prac_exp, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90027, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = halloween, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90028, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = thanksgiving, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90034, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = glue_pudding, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90041, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = father, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90029, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = new_year, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90033, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = firecracker, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90036, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = brother, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90037, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = ticket, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90038, quantity = Num} | T],
        GL, Items) ->
    to_gain(T, [#gain{label = egg, val = Num} | GL], Items);
to_gain([#item{base_id = 90040, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = turn, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90039, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = exchange, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90035, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = crystal, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90042, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = lucky_ticket, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90044, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = dollar, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90045, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = naughty, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90046, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = concentric, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90047, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = qixiIntegral, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90048, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = sunshine, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90049, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = cut_price, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90050, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = single_dog, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90051, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = panda_score, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90052, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = joyful_egg, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90056, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = godswar, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90055, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = skl_unique_exp, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90057, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = happy_score, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90061, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = slot_machine, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90062, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = reserve_gold, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90063, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = zillionaire_sc, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90066, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = score_exchange, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90067, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = new_open_turn, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90068, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = long_active, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90069, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = long_score, val = Num} | GL],
            Items);
to_gain([#item{base_id = 90071, quantity = Num} | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = camp_pray_sc, val = Num} | GL],
            Items);
to_gain([#item{base_id = BaseId, quantity = Num,
               type = 147}
         | T],
        GL, Items) ->
    BaseId0 = item_type:special_id(BaseId),
    to_gain(T,
            [#gain{label = talisman, val = [{BaseId0, Num}]} | GL],
            Items);
to_gain([#item{base_id = BaseId, quantity = Num,
               type = 148}
         | T],
        GL, Items) ->
    BaseId0 = item_type:special_id(BaseId),
    to_gain(T,
            [#gain{label = talisman, val = [{BaseId0, Num}]} | GL],
            Items);
to_gain([#item{base_id = BaseId, quantity = Num,
               type = 149}
         | T],
        GL, Items) ->
    BaseId0 = item_type:special_id(BaseId),
    to_gain(T,
            [#gain{label = talisman, val = [{BaseId0, Num}]} | GL],
            Items);
to_gain([#item{base_id = BaseId, quantity = Num,
               type = 150}
         | T],
        GL, Items) ->
    BaseId0 = item_type:special_id(BaseId),
    to_gain(T,
            [#gain{label = talisman, val = [{BaseId0, Num}]} | GL],
            Items);
to_gain([#item{base_id = BaseId, quantity = Num,
               type = 156}
         | T],
        GL, Items) ->
    to_gain(T,
            [#gain{label = flower_says, val = [{BaseId, Num}]}
             | GL],
            Items);
to_gain([#item{base_id = BaseId, quantity = Num} | T],
        GL, Items)
    when BaseId >= 90000 ->
    logger:error("邮件非法数值数据：BaseId:~w quantity:~w",
                 [BaseId, Num],
                 mail,
                 512),
    to_gain(T, GL, Items);
to_gain([Item | T], GL, Items) ->
    to_gain(T, GL, [Item | Items]).

to_items([], L) -> L;
to_items([{BaseId, Num} | T], L)
    when is_integer(Num) andalso
             is_integer(BaseId) andalso BaseId >= 90000 ->
    case format:check_val(BaseId, Num) of
        true ->
            to_items(T,
                     [#item{base_id = BaseId, quantity = Num} | L]);
        _ ->
            logger:error("非法数值： BaseId:~w Num:~w",
                         [BaseId, Num],
                         mail,
                         525),
            to_items(T, L)
    end;
to_items([{BaseId, _, Num} | T], L)
    when is_integer(Num) andalso
             is_integer(BaseId) andalso BaseId >= 90000 ->
    case format:check_val(BaseId, Num) of
        true ->
            to_items(T,
                     [#item{base_id = BaseId, quantity = Num} | L]);
        _ ->
            logger:error("非法数值： BaseId:~w Num:~w",
                         [BaseId, Num],
                         mail,
                         533),
            to_items(T, L)
    end;
to_items([{BaseId, Num} | T], L)
    when is_integer(BaseId) andalso is_integer(Num) ->
    BaseId0 = item_type:special_id(BaseId),
    case item_data:get(BaseId0) of
        #item_base{overlap = Overlap}
            when Num div Overlap > 200 ->
            logger:error("非法物品数量：BaseId:~w, Num:~w",
                         [BaseId, Num],
                         mail,
                         540),
            to_items(T, L);
        #item_base{type = Type} ->
            case lists:member(Type, [147, 148, 149, 150]) of
                true ->
                    to_items(T,
                             [#item{base_id = BaseId0, quantity = Num,
                                    type = Type}
                              | L]);
                _ ->
                    case item:make(BaseId0, 1, Num) of
                        {ok, Items} -> to_items(T, L ++ Items);
                        _ ->
                            logger:error("非法物品数据：BaseId:~w, Num:~w",
                                         [BaseId, Num],
                                         mail,
                                         551),
                            to_items(T, L)
                    end
            end;
        _ ->
            logger:error("非法物品数据：BaseId:~w, Num:~w",
                         [BaseId, Num],
                         mail,
                         556),
            to_items(T, L)
    end;
to_items([{BaseId, Bind, Num} | T], L)
    when is_integer(BaseId) andalso
             is_integer(Num) andalso
                 (Bind =:= 1 orelse Bind =:= 0) ->
    BaseId0 = item_type:special_id(BaseId),
    case item_data:get(BaseId0) of
        #item_base{overlap = Overlap}
            when Num div Overlap > 200 ->
            logger:error("非法物品数量：BaseId:~w, Num:~w",
                         [BaseId, Num],
                         mail,
                         563),
            to_items(T, L);
        #item_base{type = Type} ->
            case lists:member(Type, [147, 148, 149, 150]) of
                true ->
                    to_items(T,
                             [#item{base_id = BaseId, quantity = Num,
                                    type = Type}
                              | L]);
                _ ->
                    case item:make(BaseId0, Bind, Num) of
                        {ok, Items} -> to_items(T, L ++ Items);
                        _ ->
                            logger:error("非法物品数据：BaseId:~w, Num:~w",
                                         [BaseId, Num],
                                         mail,
                                         574),
                            to_items(T, L)
                    end
            end;
        _ ->
            logger:error("非法物品数据：BaseId:~w, Num:~w",
                         [BaseId, Num],
                         mail,
                         579),
            to_items(T, L)
    end;
to_items([Item = #item{} | T], L) ->
    to_items(T, L ++ [Item]);
to_items([I | T], L) ->
    logger:error("非法物品数据：~w", [I], mail, 588),
    to_items(T, L).

do_init() ->
    case dets:info(mailbox, size) of
        Num when is_integer(Num) andalso Num > 1000 ->
            Now = date:unixtime(),
            TimeOutT = if Num > 10000 -> Now - 86400 * 30;
                          true -> Now - 86400 * 90
                       end,
            Fun = fun (Mail = #mail{ts = Ts}) when Ts < TimeOutT ->
                          dets:delete_object(mailbox, Mail),
                          continue;
                      (_) -> continue
                  end,
            logger:debug("信件清除：~w -> ~w",
                         [Num, dets:info(mailbox, size)],
                         mail,
                         606),
            dets:traverse(mailbox, Fun);
        _ -> skip
    end,
    ok.

t(N) ->
    M = #mail{sess = env:update_counter(mail_sess_id, 1),
              title = "邮件标题邮件标题邮件标题邮件标题邮件标题邮件标题邮件标题邮件标题邮件标题",
              content =
                  "邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮"
                  "件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件"
                  "内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内"
                  "容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容"
                  "邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮"
                  "件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件"
                  "内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容"},
    F1 = fun (I) ->
                 Rid = I rem 1000 + 1,
                 send(M#mail{to = {Rid, "dev", 0}})
         end,
    F2 = fun (I) ->
                 Rid = I rem 1000 + 1,
                 recv({Rid, "dev", 0})
         end,
    ptester:run(N, [{"send", F1}, {"recv", F2}]).

