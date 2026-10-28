-file("src/mod/role/role_login.erl", 1).

-module(role_login).

-export([do/1, delay_do/1, login/1, delay_login/1]).

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

-file("src/mod/role/role_login.erl", 15).

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

-file("src/mod/role/role_login.erl", 16).

-file("inc/env.hrl", 1).

-author("Lith").

-file("src/mod/role/role_login.erl", 17).

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

-file("src/mod/role/role_login.erl", 18).

-spec do(Role :: #role{}) -> {ok, NewRole :: #role{}} |
                             {error, Reason :: term()}.

do(Role) ->
    put(role_bak, Role),
    do_do([{attr, calc_reg},
           {item, login},
           {role_login, login},
           {world_lev, login},
           {limit_return, login},
           {charge_gift, login},
           {var, login},
           {camp_halloween_mgr, login},
           {dungeon_mgr, login},
           {handbook_store, login},
           {handbook_attr, login},
           {skill, login},
           {pet, login},
           {child, login},
           {quest, login},
           {skill_life, login},
           {glory_new, login},
           {combat, login},
           {plot, login},
           {guild_role, login},
           {guard, login},
           {team_mgr, login},
           {friend, login},
           {friend_zone, login},
           {role_fly, login},
           {market_silver, login},
           {agenda, login},
           {buff, login},
           {parade, login},
           {qualifying_util, login},
           {treasure, login},
           {shipping, login},
           {checkin, login},
           {fairyland, login},
           {fashion, login},
           {examination, login},
           {charge, login},
           {warrior_mgr, login},
           {classes_challenge, login},
           {store, login},
           {achievement, login},
           {wedding, login},
           {top_compete_util, login},
           {investment, login},
           {guild_war, login},
           {privilege, login},
           {meet_pet, login},
           {quest_couple, login},
           {quest_plant, login},
           {teacher, login},
           {quest_teacher, login},
           {hero_mgr, login},
           {quest_offer, login},
           {quest_king, login},
           {guild_hero, login},
           {achieve_shop, login},
           {campaign_bags, login},
           {dungeon, login},
           {camp_dragon_boat, login},
           {merge_gift, login},
           {tournament_role, login},
           {tournament_attr, login},
           {elf_mgr, login},
           {goal, login},
           {camp_login, login},
           {month_card, login},
           {family_shop, login},
           {family_logic, login},
           {camp_fruit, login},
           {camp_hide_seek, login},
           {quest_hide_seek, login},
           {mount, login},
           {camp_turn, login},
           {campaign, login},
           {goodvoice, login},
           {endless_challenge, login},
           {wedding_memory, login},
           {camp_web_rank_mgr, login},
           {camp_mid_autumn, login},
           {lev_break, login},
           {head, login},
           {camp_cake, login},
           {guild_league_role, login},
           {role_classes_statistics, login},
           {brave_trial, login},
           {campaign_guild, login},
           {camp_login_roll, login},
           {camp_series_recharge, login},
           {constellation, login},
           {gods_duel_role, login},
           {sworn, login},
           {regression_login, login},
           {friend_recall, login},
           {spectral_box, login},
           {preparation_role, login},
           {quest_child, login},
           {dungeon_team, login},
           {maze, login},
           {friend_group, login},
           {rencounter_role, login},
           {quest_acquaintance, login},
           {guild_dungeon, login},
           {talisman, login},
           {fc_update, login},
           {gold_league_mgr, login},
           {camp_animal_chess_mgr, login},
           {campaign_rank_mgr, login},
           {wing, login},
           {question_match_role, login},
           {spirit_treasure_role, login},
           {quest_summer, login},
           {adm, login},
           {adm, login2},
           {camp_exchange, login},
           {camp_7_7th_mgr, login},
           {exquisite_shelf_role, login},
           {camp_recharge, login},
           {campaign_collection, login},
           {camp_cut_price, login},
           {camp_doll, login},
           {campaign_inquiry_role, login},
           {guild_dragon_role, login},
           {camp_pet_egg, login},
           {camp_sales_promotion, login},
           {camp_wish_flower, login},
           {camp_fashion_vote, login},
           {skill_unique, login},
           {camp_lucky_draw, login},
           {camp_rushing_top, login},
           {levup, login},
           {camp_sign_draw, login},
           {gods_place_role, login},
           {quest_exp_bottle, login},
           {agenda_week, login},
           {provocation_role, login},
           {camp_consume_rebate, login},
           {camp_black_white_chess_mgr, login},
           {gods_challenge_role, login},
           {canyon_summit_role, login},
           {guild_truth_dare_role, login},
           {camp_score_exchange, login},
           {camp_new_discount, login},
           {camp_scratch_card, login},
           {camp_zillionaire, login},
           {camp_bring_up_open, login},
           {camp_lucky_tree, login},
           {camp_long_active, login},
           {camp_gift_custom, login},
           {camp_pray, login},
           {c_trip_mgr, login},
           {honor, login},
           {looks, login},
           {attr, login}],
          Role).

-spec login(Role :: #role{}) -> NewRole :: #role{}.

login(Role = #role{time_info = {LoginTime, LogoutTime},
                   name_used = NameUsed, id = Id}) ->
    Now = date:unixtime(),
    Role2 = do_return_back(Role, LoginTime, Now),
    NameUsed1 = case NameUsed of
                    "" ->
                        case ets:lookup(role_name_used_list, Id) of
                            [#role_name_used{name = OldName} | _] -> OldName;
                            _ -> NameUsed
                        end;
                    _ -> NameUsed
                end,
    {ok,
     Role2#role{time_info = {Now, LogoutTime},
                name_used = NameUsed1}}.

delay_login(Role = #role{name = RoleName}) ->
    NewRole = case util:word_is_sensitive_kernel(RoleName)
                  of
                  true ->
                      NewName = role:get_new_role_name(RoleName),
                      case role_misc:rename(Role, NewName) of
                          {ok, Role2} ->
                              Title = lang:get("角色名变更"),
                              Content =
                                  lang:get("亲爱的玩家朋友：\n由于您的角色名称包含敏感词汇，现根据相关政策法规，系统已进行强制改名，"
                                           "角色名中的敏感词汇已删除。文明和谐的网络环境需要共同创造，感谢您的谅解与支持"),
                              Items = [{23799, 1}],
                              mail:send(Role, Title, Content, Items),
                              Role2;
                          _ -> Role
                      end;
                  _ -> Role
              end,
    {ok, NewRole}.

delay_do(Role = #role{device_id = DeviceId, id = Id}) ->
    gen_server:cast(adm_mgr,
                    {handle_device_check, DeviceId, Id}),
    do_do([{qualifying_util, delay_login},
           {rank_listener, delay_login},
           {mail, delay_login},
           {arena_mgr, login},
           {family_logic, delay_login},
           {extension, delay_login},
           {agenda, delay_login},
           {role_misc, delay_login},
           {spirit_treasure_role, delay_login},
           {mount, delay_login},
           {pet, delay_login},
           {levup, delay_login},
           {campaign_group_purchase, delay_login},
           {repaire, delay_login},
           {role_login, delay_login}],
          Role).

do_return_back(Role, 0, _Now) -> Role;
do_return_back(Role, LogoutTime, Now) ->
    case check_return_back_condition(Role, LogoutTime, Now)
        of
        true ->
            mail:send(Role, "回归礼包", "感谢您回归星辰奇缘", [{20006, 10}]),
            var:set_var(Role, acc, 1020, 1);
        false -> Role
    end.

check_return_back_condition(Role, LogoutTime, Now) ->
    case env:get(return_back) of
        true ->
            DiffDate = date:day_diff(LogoutTime, Now),
            case DiffDate > 1 of
                true ->
                    GetTimes = var:get_var(Role, acc, 1020, 0),
                    GetTimes =< 0;
                false -> false
            end;
        _ -> false
    end.

do_do([], Role) -> {ok, Role};
do_do([{M, F} | T], Role = #role{name = Name}) ->
    case catch erlang:apply(M, F, [Role]) of
        ok -> do_do(T, Role);
        {ok, NewRole} when is_record(NewRole, role) ->
            do_do(T, NewRole);
        {false, Reason} ->
            logger:error("角色[~ts]执行登录调用[~w:~w]时发生异常: ~w",
                         [Name, M, F, Reason],
                         role_login,
                         305),
            {error, Reason};
        Err ->
            logger:error("角色[~ts]执行登录调用[~w:~w]时发生异常: ~w",
                         [Name, M, F, Err],
                         role_login,
                         308),
            {error, lang:get("登录出错")}
    end.

