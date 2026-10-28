-file("src/mod/strategy/strategy.erl", 1).

-module(strategy).

-export([get_my_title/5,
         upload/4,
         get_title/4,
         get_content/3,
         update_state/2,
         update_all/0,
         collect/2,
         answer/2,
         question/2,
         edit/5,
         title_gm_list_get/0,
         title_gm_id_get/1,
         title_gm_id_get/2,
         answer_get/1,
         test1/0]).

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

-file("src/mod/strategy/strategy.erl", 31).

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

-file("src/mod/strategy/strategy.erl", 32).

-file("inc/strategy.hrl", 1).

-record(title,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         content = "" :: list(),
         type = 1 :: non_neg_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         role_name = "" :: list(),
         account = "" :: list(),
         gm = 0 :: 0..1,
         state = 0 :: non_neg_integer(),
         comment_num = 0 :: non_neg_integer(),
         like_num = 0 :: non_neg_integer(),
         time = 0 :: term(),
         answer = 0 :: 0..1,
         order = 0 :: non_neg_integer(),
         question = [] :: list(),
         reward = [] :: list()}).

-record(collect,
        {role_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         list = [] :: list()}).

-record(answer,
        {id = 0 :: pos_integer(),
         name = "" :: list(),
         list = [] :: [{num, content}],
         correct = 0 :: pos_integer()}).

-file("src/mod/strategy/strategy.erl", 33).

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

-file("src/mod/strategy/strategy.erl", 34).

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

-file("src/mod/strategy/strategy.erl", 35).

get_my_title(#role{id = RoleId}, Type, Order, Page,
             Count)
    when Type =:= 0 ->
    logger:debug("============~w~n", [Type], strategy, 38),
    Ms = [{#title{role_id = RoleId, _ = '_'}, [], ['$_']}],
    List = strategy_mgr:list_title_select(Ms, local),
    get_title_order(List, Order, Page, Count);
get_my_title(Role, _Type, Order, Page, Count) ->
    logger:debug("============~w~n", [_Type], strategy, 45),
    case var:get_var(Role, other, 2020) of
        Ids = [_ | _] ->
            logger:debug("============~w~n", [Ids], strategy, 47),
            TitleList = strategy_mgr:list_title_ids(Ids, all),
            get_title_order(TitleList, Order, Page, Count);
        _ ->
            logger:debug("============~w~n", [_Type], strategy, 50),
            {[], 0}
    end.

upload(#role{lev = Lev} = Role, Type, Title, Content)
    when Lev >= 50 ->
    case upload_check(length(Title), length(Content)) of
        ok ->
            strategy_mgr:upload_cast(Role, Type, Title, Content);
        Msg -> {0, Msg}
    end;
upload(_Role, _Type, _Title, _Content) ->
    {0, lang:get("只有达到50级方可上传攻略哦")}.

upload_check(Title, _Content) when Title < 2 ->
    notice:format(lang:get("标题不能少于~ts个字喔{face_1,26}"),
                  [{string_2, 5, 2}]);
upload_check(Title, _Content) when Title > 30 ->
    notice:format(lang:get("标题不能超过~ts个字喔{face_1,26}"),
                  [{string_2, 5, 30}]);
upload_check(_Title, Content) when Content < 15 ->
    notice:format(lang:get("高手的攻略都会大于~ts个字呢{face_1,25}"),
                  [{string_2, 5, 15}]);
upload_check(_Title, Content) when Content > 5000 ->
    notice:format(lang:get("高手的攻略不会超过~ts个字{face_1,25}"),
                  [{string_2, 5, 5000}]);
upload_check(_Title, _Content) ->
    case role_misc:check_cd(rpc_16602) of
        false ->
            Cd = role_misc:get_cd(rpc_16602),
            CdMs = case get(rpc_16602) of
                       Last when is_integer(Last) ->
                           Now = date:unixtime(ms),
                           erlang:max(Cd - (Now - Last), 0);
                       _False -> Cd
                   end,
            RestCd = util:ceil(CdMs / (1000 * 60)),
            notice:format(lang:get("上传过于频繁，请~ts分钟后再来上传，注意保存{face_1,3}"),
                          [{string_2, 5, RestCd}]);
        _ -> ok
    end.

update_state(TitleId, State) ->
    strategy_mgr:update_cast(TitleId, State).

update_all() -> strategy_mgr:update_all_cast().

get_title(Type, Order, Page, Len) ->
    MatchSpec = [{'$1',
                  [{'=:=', {element, #title.type, '$1'}, {const, Type}}],
                  ['$1']}],
    List = strategy_mgr:list_title_select(MatchSpec, all),
    ListGm = title_gm_list_get(Type),
    get_title_order(ListGm ++ List, Order, Page, Len).

get_title_order(List, Order, Page, Len) ->
    List1 = case Order of
                1 -> lists:keysort(#title.order, List);
                2 -> lists:reverse(lists:keysort(#title.time, List));
                _ -> lists:keysort(#title.time, List)
            end,
    get_title_page(List1, Page, Len).

get_title_page(List, Page, Num) ->
    LenTotal = length(List),
    PageTotal = util:ceil(LenTotal / Num),
    {Flag, NowPage} = if Page < 1 orelse PageTotal =:= 0 ->
                             {false, 1};
                         Page > PageTotal -> {false, PageTotal};
                         true -> {true, Page}
                      end,
    case Flag of
        true ->
            StartIdx = (NowPage - 1) * Num + 1,
            {lists:sublist(List, StartIdx, Num), PageTotal};
        false -> {[], PageTotal}
    end.

collect(Role, TitleId) ->
    case strategy_mgr:list_title_id(TitleId, all) of
        {ok, #title{state = State}} when State =:= 1 ->
            case key_state(Role, TitleId, 2020) of
                {0, List} ->
                    NewRole = var:set_var(Role,
                                          other,
                                          2020,
                                          [TitleId | List]),
                    {ok, 1, lang:get("已收藏该攻略"), NewRole};
                {_, List} ->
                    NewRole = var:set_var(Role,
                                          other,
                                          2020,
                                          lists:delete(TitleId, List)),
                    {ok, 0, lang:get("已取消收藏该攻略"), NewRole}
            end;
        _ ->
            case strategy_mgr:list_title_id(TitleId, local) of
                {ok, _Title} -> {0, lang:get("该攻略未通过审核,不能收藏")};
                _ -> {0, lang:get("该攻略不存在")}
            end
    end.

question(#role{lev = Lev} = Role, TitleId)
    when Lev < 50 ->
    case strategy_mgr:list_title_id(TitleId, all) of
        {ok,
         #title{question = [_ | _] = Question, gm = Gm,
                answer = Answer}}
            when Gm =:= 1 andalso Answer =:= 1 ->
            case key_state(Role, TitleId, 2021) of
                {0, _RewardList} -> {ok, Question};
                _ -> {0, lang:get("已回答该题,不能重复答题")}
            end;
        _ -> {0, lang:get("该攻略没有题目")}
    end;
question(_, _) -> {0, lang:get("玩家等级超过50级")}.

get_content(Role, TitleId, Type) ->
    case strategy_mgr:list_title_id(TitleId, Type) of
        {ok, #title{gm = Gm, answer = Answer} = Title} ->
            {Like, _LikeList} = key_state(Role, TitleId, 2020),
            case Gm =:= 1 andalso Answer =:= 1 of
                true ->
                    {Reward, _RewardList} = key_state(Role, TitleId, 2021),
                    {ok, Title, Reward, Like};
                _ -> {ok, Title, 0, Like}
            end;
        Return -> Return
    end.

answer(Role, TitleId) ->
    case strategy_mgr:list_title_id(TitleId, all) of
        {ok, #title{gm = Gm, reward = Reward}} when Gm =:= 1 ->
            case key_state(Role, TitleId, 2021) of
                {0, RewardList} ->
                    Role1 = var:set_var(Role,
                                        other,
                                        2021,
                                        [TitleId | RewardList]),
                    GL = format:val_to_gain(Reward),
                    case role_gain:do_notice(GL, Role1) of
                        {false, G} -> {0, G#gain.msg};
                        {ok, NewRole} -> {ok, NewRole}
                    end;
                _ -> {0, lang:get("已回答该题,不能重复答题")}
            end;
        _ -> {0, lang:get("该攻略没有题目")}
    end.

edit(Role, TitleId, Type, Title, Content) ->
    case strategy_mgr:list_title_id(TitleId, local) of
        {ok, #title{state = State}} when State =:= 2 ->
            case upload_check(length(Title), length(Content)) of
                ok ->
                    strategy_mgr:edit_cast(Role,
                                           TitleId,
                                           Type,
                                           Title,
                                           Content);
                Msg -> {0, Msg}
            end;
        _ -> {0, lang:get("该攻略不可编辑")}
    end.

key_state(Role, TitleId, Key) ->
    case var:get_var(Role, other, Key, []) of
        RewardList = [_ | _] ->
            case lists:member(TitleId, RewardList) of
                true -> {1, RewardList};
                _ -> {0, RewardList}
            end;
        _R -> {0, []}
    end.

test1() ->
    [ets:insert(strategy_title,
                #title{id = Id, name = "aaaa", type = 1,
                       role_id = {1, "22", 22}, role_name = "aa",
                       question =
                           [#answer{id = 1, name = "第一题",
                                    list =
                                        [{1, "第一个答案"},
                                         {2, "第二个答案"},
                                         {3, "第三个答案"},
                                         {4, "第四个答案"}],
                                    correct = 1}],
                       reward = [{8001, 10}], answer = 1, gm = 1})
     || Id <- lists:seq(100, 200)],
    ets:insert(strategy_title_local,
               #title{id = 1, name = "aaaa", type = 1,
                      role_id = {1, "22", 22}, role_name = "aa"}),
    ets:insert(strategy_title_local,
               #title{id = 2, name = "bbbb", type = 1,
                      role_id = {1, "22", 22}, role_name = "bb"}),
    ets:insert(strategy_title_local,
               #title{id = 3, name = "cccc", type = 2,
                      role_id = {1, "22", 22}, role_name = "cc"}),
    ets:insert(strategy_title,
               #title{id = 10, name = "aaaa", type = 1,
                      role_id = {1, "22", 22}, role_name = "aa",
                      question =
                          [#answer{id = 1, name = "第一题",
                                   list =
                                       [{1, "第一个答案"},
                                        {2, "第二个答案"},
                                        {3, "第三个答案"},
                                        {4, "第四个答案"}],
                                   correct = 1}],
                      reward = [{8001, 10}], answer = 1, gm = 1}),
    ets:insert(strategy_title,
               #title{id = 2, name = "bbbb", type = 1,
                      role_id = {1, "22", 22}, role_name = "bb"}),
    ets:insert(strategy_title,
               #title{id = 3, name = "cccc", type = 2,
                      role_id = {1, "22", 22}, role_name = "cc"}).

title_gm_list_get() ->
    title_gm_add(strategy_data:list(), []).

title_gm_list_get(Type) ->
    List = title_gm_list_get(),
    title_gm_list_get(List, Type, []).

title_gm_list_get([], _Type, Acc) -> Acc;
title_gm_list_get([#title{type = Type} = Title | List],
                  Type, Acc) ->
    title_gm_list_get(List, Type, [Title | Acc]);
title_gm_list_get([_ | List], Type, Acc) ->
    title_gm_list_get(List, Type, Acc).

title_gm_add([], Acc) -> Acc;
title_gm_add([Id | List], Acc) ->
    case title_gm_id_get(Id) of
        {ok, Title} -> title_gm_add(List, [Title | Acc]);
        _ -> title_gm_add(List, Acc)
    end.

title_gm_id_get(TitleId) ->
    case strategy_data:get_data({TitleId}) of
        #{name := Name, content := Content,
          question := Question, reward := Reward, time := Time,
          type := Type, order := Order} ->
            Answer = answer_get(Question),
            Question1 = [#answer{id = Num, name = QuestionName,
                                 list = QuestionList, correct = Correct}
                         || {Num, QuestionName, QuestionList, Correct}
                                <- Question],
            {ok,
             #title{id = TitleId, name = Name, content = Content,
                    question = Question1, type = Type, time = Time, gm = 1,
                    reward = Reward, answer = Answer, state = 1,
                    order = Order}};
        _ -> false
    end.

title_gm_id_get(Id, Type)
    when Type =:= all orelse Type =:= 1 ->
    title_gm_id_get(Id);
title_gm_id_get(_Id, _Type) -> false.

answer_get([_ | _]) -> 1;
answer_get(_) -> 0.

