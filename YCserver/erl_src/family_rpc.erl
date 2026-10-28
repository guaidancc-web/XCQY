-file("src/mod/family/family_rpc.erl", 1).

-module(family_rpc).

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

-file("src/mod/family/family_rpc.erl", 11).

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

-file("src/mod/family/family_rpc.erl", 12).

-file("inc/family.hrl", 1).

-record(beans_reward,
        {id = 0,
         giver_id = {0, "", 0},
         giver_name = "",
         belong_id = {0, "", 0},
         pos = {0, 0},
         give_time = 0}).

-record(magic_beans,
        {ver = 2,
         growth = 0 :: non_neg_integer(),
         flower_num = 0 :: non_neg_integer(),
         wake_time = 0 :: non_neg_integer(),
         event_record = [],
         fosters = [],
         inviters = [],
         beans_rewards = [],
         next_beanrw_id = 0}).

-record(family_info,
        {ver = 5 :: pos_integer(),
         id = {0, "", 0},
         master_id = {0, "", 0},
         master_name = "",
         master_classes = 0 :: pos_integer(),
         master_lev = 1 :: pos_integer(),
         master_sex = 0 :: 0..2,
         lover_id = {0, "", 0},
         lover_name = "",
         pid :: undefined | pid(),
         house_info = undefined,
         yard_info = undefined,
         visitor = [],
         last_visit_time = 0,
         visit_lock = 1,
         last_rf_time = 0,
         magic_beans = #magic_beans{},
         battle_id}).

-record(furnishing,
        {id = 0 :: non_neg_integer(),
         base_id = 0,
         num = 1,
         status = 1,
         belong = {0, "", 0},
         pos = {1, 1, 1, 1} :: tuple(),
         dir = 0 :: 0..1}).

-record(house_info,
        {ver = 3 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         env_val = 0,
         lev = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer(),
         bdg_info = [] :: list(),
         furishing_max_lev_info = [] :: list(),
         next_fur_id = 1,
         cleanness = 100,
         last_clean_time = 0,
         housekeeper_action_times = 0,
         is_upgrade_bdg = []}).

-record(building_info, {type = 1, lev = 0, exp = 0}).

-record(yard_info,
        {ver = 1 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         levl = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer()}).

-record(family_store,
        {ver = 1,
         next_time = 0 :: non_neg_integer(),
         goods_list = []}).

-record(m_family,
        {ver = 1,
         cur_id = {0, "", 0},
         pid :: undefined | pid(),
         idle_family = {0, "", 0},
         family_store = #family_store{},
         family_effect = [],
         effect_use_info = []}).

-record(family_pet_train_info,
        {id = 1, pet_id = 0, end_time = 0}).

-record(fshop_item,
        {id = 0,
         store_type = 1,
         base_id = 0,
         type = 90000,
         val = 0,
         count = 1}).

-record(family_child,
        {id = {0, "", 0},
         name = "",
         classes = 0 :: pos_integer(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         stage = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         unit_id = {0, 0},
         unit_base_id = 0}).

-file("src/mod/family/family_rpc.erl", 13).

-export([handle/3]).

handle(11200, {}, Role) ->
    family_logic:push_11200(Role),
    ok;
handle(11201, {}, Role) ->
    role:send_buff_begin(),
    case family_logic:create(Role) of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("您的家园建造成功")}, NewRole}
    end;
handle(11202, FamilyId, Role) ->
    logger:debug("FamilyId:~w", [FamilyId], family_rpc, 36),
    case family_logic:enter(Role, FamilyId) of
        {false, Reason} -> {reply, {0, Reason}};
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        ok -> ok
    end;
handle(11203, {}, Role) ->
    case family_logic:leave(Role) of
        {false, Reason} -> {reply, {0, Reason}};
        ok -> ok;
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole}
    end;
handle(11204, {FurnishingId, X, Y, Gx, Gy, Dir},
       Role) ->
    logger:debug("进行摆放家具:~w",
                 [{FurnishingId, {X, Y, Gx, Gy}, Dir}],
                 family_rpc,
                 56),
    Pos = {X, Y, Gx, Gy},
    case family_logic:set_out_furnishing(Role,
                                         FurnishingId,
                                         Pos,
                                         Dir)
        of
        {false, Reason} -> {reply, {0, Reason, FurnishingId}};
        ok -> {reply, {1, lang:get(""), FurnishingId}}
    end;
handle(11207, {FurnishingId}, Role) ->
    logger:debug("收回家具:~w", [FurnishingId], family_rpc, 66),
    case family_logic:get_back_furnishing(Role,
                                          FurnishingId)
        of
        {false, Reason} -> {reply, {0, Reason}};
        ok -> {reply, {1, lang:get("")}}
    end;
handle(11209, {BadType}, Role) ->
    logger:debug("升级建筑:~w", [BadType], family_rpc, 84),
    role:send_buff_begin(),
    case family_logic:upgrade_bdg(Role, BadType) of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("升级成功")}, NewRole};
        ok ->
            role:send_buff_clean(),
            ok
    end;
handle(11210, {BdgType}, Role) ->
    logger:debug("拆除建筑:~w", [BdgType], family_rpc, 100),
    case family_logic:destory_building(Role, BdgType) of
        {false, Reason} ->
            logger:debug("拆除建筑失败:~w", [Reason], family_rpc, 103),
            {reply, {0, Reason}};
        ok -> {reply, {1, lang:get("拆除成功")}}
    end;
handle(11211, {}, Role) ->
    logger:debug("获取家具商店商品", [], family_rpc, 111),
    family_shop:push_11211(Role);
handle(11212, {Id, Num}, Role) ->
    logger:debug("购买家具", [], family_rpc, 116),
    role:send_buff_begin(),
    case family_shop:buy(Role, Id, Num) of
        {false, Reason} ->
            logger:debug("购买家具错误:~w", [Reason], family_rpc, 120),
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("购买成功")}, NewRole}
    end;
handle(11213, {}, Role) ->
    family_logic:push_11213(Role),
    ok;
handle(11214, {PetId, TrainId}, Role) ->
    logger:debug("训练宠物：~w", [PetId], family_rpc, 135),
    role:send_buff_begin(),
    case family_logic:train_pet(Role, PetId, TrainId) of
        {false, Reason} ->
            logger:debug("训练宠物错误:~w", [Reason], family_rpc, 139),
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("")}, NewRole}
    end;
handle(11215, {}, Role) ->
    logger:debug("进行休息", [], family_rpc, 149),
    role:send_buff_begin(),
    case family_logic:family_sleep(Role) of
        {false, Reason} ->
            logger:debug("进行休息错误:~w", [Reason], family_rpc, 153),
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("")}, NewRole}
    end;
handle(11216, {}, Role) ->
    logger:debug("进行进餐", [], family_rpc, 163),
    role:send_buff_begin(),
    case family_logic:family_eat(Role) of
        {false, Reason} ->
            logger:debug("进行进餐错误:~w", [Reason], family_rpc, 167),
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("")}, NewRole}
    end;
handle(11217, {}, Role) ->
    family_logic:push_11217(Role),
    ok;
handle(11219, {Id}, Role) ->
    logger:debug("对家具[~w]进行编辑", [Id], family_rpc, 183),
    family_logic:edit_furnishing(Role, Id),
    ok;
handle(11220, {}, Role) ->
    family_logic:push_11220(Role),
    ok;
handle(11221, {}, Role) ->
    family_logic:push_11221(Role),
    ok;
handle(11222, {LockLev}, Role) ->
    case family_logic:set_family_lock(Role, LockLev) of
        {false, Reason} ->
            logger:debug("设置家园访问权限出错:~w",
                         [Reason],
                         family_rpc,
                         201),
            {reply, {0, Reason}};
        ok -> {reply, {1, lang:get("设置访问权限成功")}}
    end;
handle(11223, {Type}, Role) ->
    family_logic:query_family_info(Role, Type),
    ok;
handle(11224, {}, Role) ->
    case family_logic:house_keeper_clean(Role) of
        {ok, AddCleanness} ->
            Msg =
                notice:format(lang:get("报告主人，房屋打扫干净，清洁度提升了~ts点{face_1,3}"),
                              [{string_2, 1, AddCleanness}]),
            {reply, {1, Msg}};
        {false, Reason} ->
            logger:debug("打扫出错:~w", [Reason], family_rpc, 219),
            {reply, {0, Reason}}
    end;
handle(11225, {}, Role) ->
    family_logic:push_11225(Role),
    ok;
handle(11226, FamilyId, Role) ->
    case family_logic:foster_magic_bean(Role, FamilyId) of
        {ok, NewRole} ->
            Msg = notice:format(lang:get("快快长大吧,成长值+~ts"),
                                [{string_2, 5, 1}]),
            {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            logger:debug("培育出错:~w", [Reason], family_rpc, 235),
            {reply, {0, Reason}}
    end;
handle(11227, {}, Role) ->
    case family_logic:get_magic_beans_reward(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("领取成功")}, NewRole};
        {false, Reason} ->
            logger:debug("领取出错:~w", [Reason], family_rpc, 246),
            {reply, {0, Reason}}
    end;
handle(11228, {FriendList}, Role) ->
    case family_logic:invite_beans_reward(Role, FriendList)
        of
        ok -> {reply, {1, lang:get("")}};
        {false, Reason} ->
            logger:debug("邀请出错:~w", [Reason], family_rpc, 256),
            {reply, {0, Reason}}
    end;
handle(11229, {Id}, Role) ->
    case family_logic:get_beans_invite_reward(Role, Id) of
        {ok, NewRole} ->
            {reply, {1, lang:get("领取成功")}, NewRole};
        {false, Reason} ->
            logger:debug("领取出错:~w", [Reason], family_rpc, 267),
            {reply, {0, Reason}}
    end;
handle(11230, {}, Role) ->
    case family_logic:house_keeper_foster(Role) of
        {ok, NewRole} ->
            Msg = notice:format(lang:get("快快长大吧,成长值+~ts"),
                                [{string_2, 5, 1}]),
            {reply, {1, Msg}, NewRole};
        ok ->
            Msg = notice:format(lang:get("快快长大吧,成长值+~ts"),
                                [{string_2, 5, 1}]),
            {reply, {1, Msg}};
        {false, Reason} ->
            logger:debug("领取出错:~w", [Reason], family_rpc, 282),
            {reply, {0, Reason}}
    end;
handle(11231, {}, Role) ->
    case family_logic:up_lev_house(Role) of
        ok -> {reply, {1, lang:get("")}};
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("升级家园出错:~w", [Reason], family_rpc, 294),
            {reply, {0, Reason}}
    end;
handle(11232, {}, Role) ->
    case family_logic:go_home(Role) of
        ok -> ok;
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(11233, VisitRoleId, Role) ->
    case family_logic:visit_role_family(Role, VisitRoleId)
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(11234, {TrainId}, Role) ->
    logger:debug("清除训练cd：~w", [TrainId], family_rpc, 316),
    role:send_buff_begin(),
    case family_logic:clean_train_cd(Role, TrainId) of
        {false, Reason} ->
            logger:debug("训练宠物错误:~w", [Reason], family_rpc, 320),
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("")}, NewRole}
    end;
handle(11235, {ID}, Role) ->
    role:send_buff_begin(),
    case family_logic:sell_furnishing(Role, ID, 1) of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("")}, NewRole}
    end;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [family_rpc, _Cmd, _Data],
                 family_rpc,
                 343),
    {error, unknow_command}.

