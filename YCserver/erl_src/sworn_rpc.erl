-file("src/mod/sworn/sworn_rpc.erl", 1).

-module(sworn_rpc).

-export([handle/3]).

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

-file("src/mod/sworn/sworn_rpc.erl", 14).

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

-file("src/mod/sworn/sworn_rpc.erl", 15).

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

-file("src/mod/sworn/sworn_rpc.erl", 16).

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

-file("src/mod/sworn/sworn_rpc.erl", 17).

-file("inc/sworn.hrl", 1).

-record(m_sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         time = 0 :: list()}).

-record(sworn_role,
        {ver = 0 :: pos_integer(),
         role_id = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         status = 0 :: non_neg_integer()}).

-record(sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         time = 0 :: non_neg_integer(),
         sworn_val = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         head = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         members = [] :: list(),
         votes = [] :: list(),
         trends = [] :: list(),
         lists = [] :: list()}).

-record(sworn_member,
        {ver = 0 :: pos_integer(),
         pos = 0 :: non_neg_integer(),
         role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         name_defined = "" :: string(),
         lev = 0 :: pos_integer(),
         classes = 0 :: pos_integer(),
         sex = 0 :: pos_integer(),
         times = 0 :: pos_integer(),
         free = 0 :: pos_integer()}).

-record(sworn_trend,
        {type = 0 :: non_neg_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         r_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         r_name = "" :: string(),
         r_lev = 0 :: non_neg_integer(),
         r_sex = 0 :: non_neg_integer(),
         r_classes = 0 :: non_neg_integer(),
         rename = "" :: string(),
         timeout = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         reason_id = 0 :: non_neg_integer(),
         reason_msg = "" :: string(),
         votes = [] :: list(),
         agree = 0 :: non_neg_integer(),
         lists = [] :: list()}).

-record(sworn_evt,
        {role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         finish = 0 :: non_neg_integer(),
         skill = 0 :: non_neg_integer(),
         invite = 0 :: non_neg_integer(),
         prefix = 0 :: non_neg_integer(),
         personal = 0 :: non_neg_integer()}).

-file("src/mod/sworn/sworn_rpc.erl", 18).

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

-file("src/mod/sworn/sworn_rpc.erl", 19).

handle(17700, {}, Role) ->
    sworn:push(Role),
    ok;
handle(17701, {RoleId, Platform, ZoneId, Pos}, Role) ->
    logger:debug("长幼有序开始投票 ~w",
                 [{RoleId, Platform, ZoneId, Pos}],
                 sworn_rpc,
                 27),
    case sworn:vote(Role, {RoleId, Platform, ZoneId}, Pos)
        of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17702, {NameHead, NameTail}, Role) ->
    logger:debug("前缀称号 ~ts ~ts",
                 [NameHead, NameTail],
                 sworn_rpc,
                 36),
    case sworn:name_first(Role, {NameHead, NameTail}) of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17703, {Name}, Role) ->
    case sworn:name_second(Role, Name) of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17704, {}, Role) ->
    case sworn:agreement(Role, 1) of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17705, {NameHead, NameTail}, Role) ->
    logger:debug("修改成好 发起投票 ~ts ~ts",
                 [NameHead, NameTail],
                 sworn_rpc,
                 61),
    role:send_buff_begin(),
    case sworn:name_first_update(Role, {NameHead, NameTail})
        of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(17706, {Flag}, Role) ->
    logger:debug("修改称号投票", [], sworn_rpc, 74),
    case sworn:name_first_vote(Role, Flag) of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17707, {Name}, Role) ->
    role:send_buff_begin(),
    case sworn:name_second_update(Role, Name) of
        {ok, Msg, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(17708, {}, Role) ->
    case sworn:combat_start(Role) of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17709, {Id, Platform, ZoneId, Name}, Role) ->
    logger:debug("邀请加入~w",
                 [{Id, Platform, ZoneId, Name}],
                 sworn_rpc,
                 102),
    case sworn:invite(Role, {Id, Platform, ZoneId}, Name) of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17710,
       {Id, Platform, ZoneId, ReasonId, ReasonMsg}, Role) ->
    case sworn:please_leave(Role,
                            {Id, Platform, ZoneId},
                            ReasonId,
                            ReasonMsg)
        of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17712, {}, Role) ->
    sworn:push_17712(Role),
    ok;
handle(17713, {}, Role) ->
    logger:debug("队长打开NPC界面", [], sworn_rpc, 136),
    sworn:npc(Role),
    ok;
handle(17714, {}, Role) ->
    logger:debug("队长发起结拜", [], sworn_rpc, 142),
    case sworn:start(Role) of
        {ok, NewRole} ->
            notice:send(Role, 1, lang:get("发起结拜成功,请耐心等待其他玩家确认加入")),
            {ok, NewRole};
        {false, Msg} -> notice:send(Role, 1, Msg)
    end;
handle(17715, {Flag}, Role) ->
    logger:debug("队员确认结拜 ~w", [Flag], sworn_rpc, 153),
    role:send_buff_begin(),
    case sworn:start_confirm(Role, Flag) of
        {ok, Msg, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {ok, Msg} ->
            role:send_buff_clean(),
            {reply, {0, Msg}};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(17716, {Type, Id, Platform, ZoneId, Flag},
       Role) ->
    logger:debug("邀请加入投票  ~w",
                 [{Type, Id, Platform, ZoneId, Flag}],
                 sworn_rpc,
                 170),
    case sworn:vote_type(Role,
                         Type,
                         {Id, Platform, ZoneId},
                         Flag)
        of
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17718, {Id, Platform, ZoneId, Flag}, Role) ->
    logger:debug(" 被邀请人回应邀请 ~w",
                 [{Id, Platform, ZoneId, Flag}],
                 sworn_rpc,
                 180),
    role:send_buff_begin(),
    case sworn:invite_reply(Role,
                            {Id, Platform, ZoneId},
                            Flag)
        of
        {ok, Msg, NewRole} ->
            role:send_buff_flush(),
            notice:send(Role, 1, Msg),
            {ok, NewRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], sworn_rpc, 188),
            role:send_buff_clean(),
            notice:send(Role, 1, Reason),
            ok
    end;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [sworn_rpc, _Cmd, _Data],
                 sworn_rpc,
                 196),
    {error, unknow_command}.

