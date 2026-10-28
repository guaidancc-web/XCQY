-file("src/mod/adm/adm_api.erl", 1).

-module(adm_api).

-export([login_check/1,
         check_role_silent/1,
         modify_lev/1]).

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

-file("src/mod/adm/adm_api.erl", 14).

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

-file("src/mod/adm/adm_api.erl", 15).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/mod/adm/adm_api.erl", 16).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
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
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/adm/adm_api.erl", 17).

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

-file("src/mod/adm/adm_api.erl", 18).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/adm/adm_api.erl", 19).

modify_lev(Role = #role{id = RoleId,
                        assets = Assets}) ->
    NewAssets = Assets#assets{exp = 0},
    NewRole = Role#role{lev = 40, assets = NewAssets},
    rank_listener:exit_rank(1, RoleId),
    {ok, NewRole}.

login_check(Role = #role{id = {Rid, Platform, ZoneId},
                         lock_status = 4}) ->
    Sql = "select silent_type, silent_ctime, silent_time"
          "out from lock_role where id = ? and "
          "platform = ? and zone_id = ?",
    Time = date:unixtime(),
    case db:get_row(Sql, [Rid, Platform, ZoneId]) of
        {ok, [0, _, _]} -> {ok, Role#role{lock_status = 0}};
        {ok, [1, _, _]} -> {ok, Role};
        {ok, [2, _Ctime, TimeOut]} when Time >= TimeOut ->
            Sql1 = "update lock_role set silent_type = ?, "
                   "silent_ctime = ?, silent_timeout = ?, "
                   "silent_hide = ?, silent_info = ? where "
                   "id = ? and platform = ? and zone_id "
                   "= ?",
            case db:exec(Sql1,
                         [0, 0, 0, 0, "", Rid, Platform, ZoneId])
                of
                ok -> ok;
                _Err ->
                    logger:error("禁言上线修复失败:~w", [_Err], adm_api, 39),
                    false
            end,
            {ok, Role#role{lock_status = 0}};
        {ok, [2, _, _]} -> {ok, Role};
        {ok, undefined} -> {ok, Role#role{lock_status = 0}};
        _ -> {false, lang:get("角色状态异常, 无法登陆")}
    end;
login_check(Role = #role{lock_status = 0}) ->
    {ok, Role};
login_check(Role = #role{id = {Rid, Platform, ZoneId},
                         lock_status = 2}) ->
    Sql = "select lock_type, lock_ctime, lock_timeout "
          "from lock_role where id = ? and platform "
          "= ? and zone_id = ?",
    Time = date:unixtime(),
    case db:get_row(Sql, [Rid, Platform, ZoneId]) of
        {ok, [0, _, _]} -> {ok, Role#role{lock_status = 0}};
        {ok, [1, _, _]} ->
            {false, lang:get("您的账号登陆出现异常，请联系GM")};
        {ok, [2, _Ctime, TimeOut]} when Time >= TimeOut ->
            Sql1 = "update lock_role set lock_type = ?, "
                   "lock_ctime = ?, lock_timeout = ?, lock_info "
                   "= ? where id = ? and platform = ? and "
                   "zone_id = ?",
            case db:exec(Sql1, [0, 0, 0, "", Rid, Platform, ZoneId])
                of
                ok -> ok;
                _Err ->
                    logger:error("封号上线修复失败:~w", [_Err], adm_api, 62),
                    false
            end,
            {ok, Role#role{lock_status = 0}};
        {ok, [2, _, _TimeOut]} ->
            {false, lang:get("您的账号登陆出现异常，请联系GM")};
        {ok, undefined} -> {ok, Role#role{lock_status = 0}};
        _ -> {false, lang:get("角色状态异常, 无法登陆")}
    end;
login_check(Role = #role{id = {Rid, Platform, ZoneId},
                         lock_status = 1}) ->
    Sql = "select silent_type, silent_ctime, silent_time"
          "out from lock_role where id = ? and "
          "platform = ? and zone_id = ?",
    Time = date:unixtime(),
    case db:get_row(Sql, [Rid, Platform, ZoneId]) of
        {ok, [0, _, _]} -> {ok, Role#role{lock_status = 0}};
        {ok, [1, _, _]} -> {ok, Role};
        {ok, [2, _Ctime, TimeOut]} when Time >= TimeOut ->
            Sql1 = "update lock_role set silent_type = ?, "
                   "silent_ctime = ?, silent_timeout = ?, "
                   "silent_hide = ?, silent_info = ? where "
                   "id = ? and platform = ? and zone_id "
                   "= ?",
            case db:exec(Sql1,
                         [0, 0, 0, 0, "", Rid, Platform, ZoneId])
                of
                ok -> ok;
                _Err ->
                    logger:error("禁言上线修复失败:~w", [_Err], adm_api, 82),
                    false
            end,
            {ok, Role#role{lock_status = 0}};
        {ok, [2, _, _]} -> {ok, Role};
        {ok, undefined} -> {ok, Role#role{lock_status = 0}};
        _ -> {false, lang:get("角色状态异常, 无法登陆")}
    end;
login_check(Role = #role{id = {Rid, Platform, ZoneId},
                         lock_status = 3}) ->
    Sql = "select lock_type, lock_ctime, lock_timeout, "
          "lock_info, silent_type, silent_ctime, "
          "silent_timeout, silent_hide, silent_info "
          "from lock_role where id = ? and platform "
          "= ? and zone_id = ?",
    Time = date:unixtime(),
    case db:get_row(Sql, [Rid, Platform, ZoneId]) of
        {ok, [1, _, _, _, _SilentType, _, _, _, _]} ->
            {false, lang:get("您的账号登陆出现异常，请联系GM")};
        {ok,
         [0, _, _, _, SilentType, Ctime, TimeOut, Hide, Msg]} ->
            {SsilentType, Stime, Stimeout, Shide, Smsg, NewRole} =
                case SilentType of
                    0 -> {0, 0, 0, 0, "", Role#role{lock_status = 0}};
                    2 when Time >= TimeOut ->
                        {0, 0, 0, 0, "", Role#role{lock_status = 0}};
                    2 ->
                        {1,
                         Ctime,
                         TimeOut,
                         Hide,
                         Msg,
                         Role#role{lock_status = 1}};
                    1 ->
                        {1,
                         Ctime,
                         TimeOut,
                         Hide,
                         Msg,
                         Role#role{lock_status = 1}}
                end,
            Sql1 = "update lock_role set lock_type = ?, "
                   "lock_ctime = ?, lock_timeout = ?, lock_info "
                   "= ?, silent_type = ?, silent_ctime = "
                   "?, silent_timeout = ?, silent_hide = "
                   "?, silent_info = ? where id = ? and "
                   "platform = ? and zone_id = ?",
            case db:exec(Sql1,
                         [0,
                          0,
                          0,
                          "",
                          SsilentType,
                          Stime,
                          Stimeout,
                          Shide,
                          Smsg,
                          Rid,
                          Platform,
                          ZoneId])
                of
                ok -> ok;
                _Err ->
                    logger:error("禁言上线修复失败:~w", [_Err], adm_api, 111),
                    false
            end,
            {ok, NewRole};
        {ok,
         [2,
          _,
          Ltimeout,
          _,
          SilentType,
          Ctime,
          TimeOut,
          Hide,
          Msg]}
            when Time >= Ltimeout ->
            {SsilentType, Stime, Stimeout, Shide, Smsg, NewRole} =
                case SilentType of
                    0 -> {0, 0, 0, 0, "", Role#role{lock_status = 0}};
                    2 when Time >= TimeOut ->
                        {0, 0, 0, 0, "", Role#role{lock_status = 0}};
                    2 ->
                        {1,
                         Ctime,
                         TimeOut,
                         Hide,
                         Msg,
                         Role#role{lock_status = 1}};
                    1 ->
                        {1,
                         Ctime,
                         TimeOut,
                         Hide,
                         Msg,
                         Role#role{lock_status = 1}}
                end,
            Sql1 = "update lock_role set lock_type = ?, "
                   "lock_ctime = ?, lock_timeout = ?, lock_info "
                   "= ?, silent_type = ?, silent_ctime = "
                   "?, silent_timeout = ?, silent_hide = "
                   "?, silent_info = ? where id = ? and "
                   "platform = ? and zone_id = ?",
            case db:exec(Sql1,
                         [0,
                          0,
                          0,
                          "",
                          SsilentType,
                          Stime,
                          Stimeout,
                          Shide,
                          Smsg,
                          Rid,
                          Platform,
                          ZoneId])
                of
                ok -> ok;
                _Err ->
                    logger:error("禁言上线修复失败:~w", [_Err], adm_api, 130),
                    false
            end,
            {ok, NewRole};
        {ok, [2, _, _Ltimeout | _]} ->
            {false, lang:get("您的账号登陆出现异常，请联系GM")};
        {ok, undefined} -> {ok, Role#role{lock_status = 0}};
        _ -> {false, lang:get("系统繁忙,请稍后尝试")}
    end.

check_role_silent(#role{lock_status = 0}) -> ok;
check_role_silent(#role{lock_status = 4}) -> callback;
check_role_silent(Role = #role{lock_status = 1,
                               id = {Rid, Platform, ZoneId}}) ->
    Sql = "select silent_type, silent_ctime, silent_time"
          "out, silent_hide from lock_role where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    Time = date:unixtime(),
    case db:get_row(Sql, [Rid, Platform, ZoneId]) of
        {ok, [0, _Ctime, _TimeOut, _Hide]} -> ok;
        {ok, [1, _, _, 0]} -> false;
        {ok, [1, _, _, 1]} -> callback;
        {ok, [2, _, TimeOut, _]} when Time >= TimeOut ->
            Sql1 = "update lock_role set silent_type = ?, "
                   "silent_ctime = ?, silent_timeout = ?, "
                   "silent_hide = ?, silent_info = ? where "
                   "id = ? and platform = ? and zone_id "
                   "= ?",
            case db:exec(Sql1,
                         [0, 0, 0, 0, "", Rid, Platform, ZoneId])
                of
                ok -> ok;
                _Err ->
                    logger:error("禁言上线修复失败:~w", [_Err], adm_api, 154),
                    false
            end,
            {ok, Role#role{lock_status = 0}};
        {ok, [2, _, TimeOut, 0]} ->
            {false, util:ceil((TimeOut - Time) / 60)};
        {ok, [2, _, TimeOut, 1]} ->
            {callback, util:ceil((TimeOut - Time) / 60)};
        {ok, undefined} -> false;
        _ -> false
    end.

