-file("src/mod/pet/pet_rune.erl", 1).

-module(pet_rune).

-author("liyufei").

-export([login/1,
         make_rune/1,
         make_rune/2,
         do_break/1,
         update_rune/4,
         rune_grasp/4,
         rune_unload/3,
         rune_resonance/3,
         push/1,
         push/2,
         do_combat_grasp/3,
         rune_name/1,
         rune_skill/1]).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/pet/pet_rune.erl", 30).

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

-file("src/mod/pet/pet_rune.erl", 31).

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

-file("src/mod/pet/pet_rune.erl", 32).

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

-file("src/mod/pet/pet_rune.erl", 33).

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

-file("src/mod/pet/pet_rune.erl", 34).

login(Role = #role{m_pet =
                       _MPet = #m_pet{pets = _Pets1},
                   m_pet_store =
                       _MPetStore = #m_pet_store{pets = _Pets2}}) ->
    Role.

make_rune(BaseId) ->
    case pet_data:get_base(BaseId) of
        #pet_base{genre = Genre, has_break_skill = HasBreak,
                  manual_level = ManualLev} ->
            case rune_data:get_pet_rune({ManualLev,
                                         convert_genre(Genre),
                                         HasBreak})
                of
                {PRuneNum, GRuneNum} ->
                    do_make_rune(PRuneNum, GRuneNum);
                _ -> []
            end;
        _ -> []
    end.

make_rune(BaseId, 0) -> make_rune(BaseId);
make_rune(BaseId, BreakTimes) when BreakTimes >= 1 ->
    case pet_data:get_base(BaseId) of
        #pet_base{genre = Genre, has_break_skill = HasBreak,
                  manual_level = ManualLev} ->
            case rune_data:get_pet_rune({ManualLev,
                                         convert_genre(Genre),
                                         HasBreak})
                of
                {PRuneNum, GRuneNum} ->
                    do_make_rune(PRuneNum, GRuneNum + 1);
                _ -> []
            end;
        _ -> []
    end.

do_break(Pet = #pet{pet_rune = PetRune}) ->
    L = [Index || #pet_rune{rune_index = Index} <- PetRune],
    case L =/= [] of
        true ->
            NextIndex = lists:max(L) + 1,
            NPetRune = [#pet_rune{rune_index = NextIndex,
                                  rune_type = 1}
                        | PetRune],
            Pet#pet{pet_rune = NPetRune};
        _ -> Pet
    end.

do_combat_grasp(Role, CombatType,
                Pet = #pet{name = Name, pet_rune = Runes}) ->
    case var:get_var(Role, day, 630, 0) of
        0 ->
            case lists:keyfind(1, #pet_rune.rune_status, Runes) of
                PetRune = #pet_rune{rune_index = RuneIndex,
                                    rune_id = RuneId} ->
                    case rune_data:get_combat(CombatType) of
                        Rate when is_integer(Rate) ->
                            case util:rand(1, 1000) =< Rate of
                                true ->
                                    NPetRune = PetRune#pet_rune{rune_status =
                                                                    2},
                                    NRunes = lists:keyreplace(RuneIndex,
                                                              #pet_rune.rune_index,
                                                              Runes,
                                                              NPetRune),
                                    NPet = Pet#pet{pet_rune = NRunes},
                                    RuneName = rune_name(RuneId),
                                    Msg =
                                        notice:format(lang:get("您的宠物：~ts在刚刚的战斗中，灵光乍现，领悟了内丹技能：~ts"),
                                                      [{string_2, 5, Name},
                                                       {string_2,
                                                        5,
                                                        RuneName}]),
                                    notice:pop(Role, 1, Msg),
                                    log:pet(Role, "宠物内丹领悟(战斗)", Pet, NPet),
                                    NRole = var:add_var(Role, day, 630, 1),
                                    push(NRole, NPet),
                                    {ok, NRole, NPet};
                                _ -> false
                            end;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

rune_name(#pet_rune{rune_id = RuneId}) ->
    rune_name(RuneId);
rune_name(RuneId) ->
    case rune_data:get_base({RuneId, 1}) of
        #{name := RuneName} -> RuneName;
        _ -> lang:get("无")
    end.

rune_skill(#pet_rune{rune_id = RuneId,
                     rune_lev = RuneLev}) ->
    rune_skill(RuneId, RuneLev).

rune_skill(RuneId, RuneLev) ->
    case rune_data:get_base({RuneId, RuneLev}) of
        #{skill_id := SkillId} -> SkillId;
        _ -> false
    end.

push(Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    [push(Role, Pet) || Pet <- Pets].

push(Role, #pet{id = PetId, pet_rune = Runes}) ->
    logger:debug("==============", [], pet_rune, 153),
    role:link_send(Role, 10579, {PetId, Runes}),
    ok.

update_rune(#role{lev = Lev}, _, _, _) when Lev < 85 ->
    {false, lang:get("85级才开启内丹功能")};
update_rune(Role = #role{m_pet = #m_pet{pets = Pets}},
            PetId, RuneIndex, RuneId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{genre = 3} ->
            Msg = notice:format(lang:get("野生宠物不能学习内丹, 可先将其~ts成宝宝"),
                                [{string_2, 5, lang:get("洗髓")}]),
            {false, Msg};
        #pet{genre = 6} -> {false, lang:get("宠物无法学习内丹")};
        #pet{lock = 1} -> {false, lang:get("宠物处于锁定状态，请先解除锁定")};
        Pet = #pet{pet_rune = RuneList} ->
            case lists:keytake(RuneIndex,
                               #pet_rune.rune_index,
                               RuneList)
                of
                {value, #pet_rune{rune_status = 1}, _} ->
                    {false, lang:get("请先领悟后再升级内丹")};
                {value, #pet_rune{rune_status = 3}, _} ->
                    {false, lang:get("已经升到满级了，不能再升了")};
                {value, PetRune = #pet_rune{rune_status = 0}, Rest} ->
                    case lists:keyfind(RuneId, #pet_rune.rune_id, RuneList)
                        of
                        #pet_rune{} -> {false, lang:get("宠物已学习相同的内丹技能")};
                        _ ->
                            role:send_buff_begin(),
                            case do_study_rune(Role, PetRune, RuneId) of
                                {ok, Role1, NPetRune} ->
                                    role:send_buff_flush(),
                                    NPet = Pet#pet{pet_rune =
                                                       [NPetRune | Rest]},
                                    {ok, NewPet, Role2} = pet_attr:calc(NPet,
                                                                        Role1),
                                    Mpet = Role2#role.m_pet,
                                    Pets1 = Mpet#m_pet.pets,
                                    NPets = lists:keyreplace(PetId,
                                                             #pet.id,
                                                             Pets1,
                                                             NewPet),
                                    Role3 = Role2#role{m_pet =
                                                           Mpet#m_pet{pets =
                                                                          NPets}},
                                    push(Role3, NewPet),
                                    pet:push_10503(Role3, NewPet),
                                    log:pet(Role3, "宠物内丹镶嵌", Pet, NewPet),
                                    {ok, Role3};
                                {false, Reason} ->
                                    role:send_buff_clean(),
                                    {false, Reason}
                            end
                    end;
                {value, PetRune = #pet_rune{rune_status = 2}, Rest} ->
                    role:send_buff_begin(),
                    case do_update_rune(Role, PetRune, Rest) of
                        {ok, Role1, NPetRunes} ->
                            role:send_buff_flush(),
                            NPet = Pet#pet{pet_rune = NPetRunes},
                            {ok, NewPet, Role2} = pet_attr:calc(NPet, Role1),
                            Mpet = Role2#role.m_pet,
                            Pets1 = Mpet#m_pet.pets,
                            NPets = lists:keyreplace(PetId,
                                                     #pet.id,
                                                     Pets1,
                                                     NewPet),
                            Role3 = Role2#role{m_pet =
                                                   Mpet#m_pet{pets = NPets}},
                            push(Role3, NewPet),
                            pet:push_10503(Role3, NewPet),
                            log:pet(Role3, "宠物内丹升级", Pet, NewPet),
                            {ok, Role3};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                _ ->
                    logger:error("这个内丹槽~w异常", [RuneIndex], pet_rune, 223),
                    {false, lang:get("内丹状态异常，请联系gm反馈")}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

rune_grasp(Role = #role{m_pet =
                            Mpet = #m_pet{pets = Pets}},
           PetId, RuneIndex, Type) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{pet_rune = RuneList} ->
            case lists:keytake(RuneIndex,
                               #pet_rune.rune_index,
                               RuneList)
                of
                {value, #pet_rune{rune_status = 3}, _} ->
                    {false, lang:get("已经升到满级了，不用领悟了")};
                {value, #pet_rune{rune_status = 0}, _} ->
                    {false, lang:get("请先学习内丹再领悟")};
                {value, #pet_rune{rune_status = 2}, _} ->
                    {false, lang:get("已经领悟，可以升级了")};
                {value, PetRune = #pet_rune{rune_status = 1}, Rest} ->
                    role:send_buff_begin(),
                    case do_grasp_rune(Role, Type, PetRune) of
                        {ok, Role1, NPetRune} ->
                            role:send_buff_flush(),
                            NPet = Pet#pet{pet_rune = [NPetRune | Rest]},
                            NPets = lists:keyreplace(PetId,
                                                     #pet.id,
                                                     Pets,
                                                     NPet),
                            Role2 = Role1#role{m_pet =
                                                   Mpet#m_pet{pets = NPets}},
                            push(Role2, NPet),
                            log:pet(Role2, "宠物内丹领悟", Pet, NPet),
                            {ok, Role2};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                _ ->
                    logger:error("这个内丹槽~w异常", [RuneIndex], pet_rune, 257),
                    {false, lang:get("内丹状态异常，请联系gm反馈")}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

rune_unload(Role = #role{m_pet = #m_pet{pets = Pets}},
            PetId, RuneIndex) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{pet_rune = RuneList} ->
            case lists:keytake(RuneIndex,
                               #pet_rune.rune_index,
                               RuneList)
                of
                {value, #pet_rune{rune_status = 0}, _} ->
                    {false, lang:get("还没有学习，怎么遗忘呢？")};
                {value, PetRune = #pet_rune{}, Rest} ->
                    role:send_buff_begin(),
                    case do_unload_rune(Role, PetRune, Rest) of
                        {ok, Role1, NPetRunes} ->
                            role:send_buff_flush(),
                            NPet = Pet#pet{pet_rune = NPetRunes},
                            {ok, NewPet, Role2} = pet_attr:calc(NPet, Role1),
                            Mpet = Role2#role.m_pet,
                            Pets1 = Mpet#m_pet.pets,
                            NPets = lists:keyreplace(PetId,
                                                     #pet.id,
                                                     Pets1,
                                                     NewPet),
                            Role3 = Role2#role{m_pet =
                                                   Mpet#m_pet{pets = NPets}},
                            push(Role3, NewPet),
                            pet:push_10503(Role3, NewPet),
                            log:pet(Role3, "宠物内丹遗忘", Pet, NewPet),
                            {ok, Role3};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                _ ->
                    logger:error("这个内丹槽~w异常", [RuneIndex], pet_rune, 291),
                    {false, lang:get("内丹状态异常，请联系gm反馈")}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

rune_resonance(Role = #role{m_pet =
                                #m_pet{pets = Pets}},
               PetId, ResonanceIndex) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{pet_rune = RuneList} ->
            case lists:keytake(2, #pet_rune.rune_type, RuneList) of
                {value, #pet_rune{rune_status = 0}, _} ->
                    {false, lang:get("还没有高级内丹，不能学习共鸣技能")};
                {value, PetRune = #pet_rune{rune_status = 3}, Rest} ->
                    role:send_buff_begin(),
                    case do_resonance_rune(Role,
                                           PetRune,
                                           ResonanceIndex,
                                           Rest)
                        of
                        {ok, Role1, NPetRunes} ->
                            role:send_buff_flush(),
                            NPet = Pet#pet{pet_rune = NPetRunes},
                            {ok, NewPet, Role2} = pet_attr:calc(NPet, Role1),
                            Mpet = Role2#role.m_pet,
                            Pets1 = Mpet#m_pet.pets,
                            NPets = lists:keyreplace(PetId,
                                                     #pet.id,
                                                     Pets1,
                                                     NewPet),
                            Role3 = Role2#role{m_pet =
                                                   Mpet#m_pet{pets = NPets}},
                            push(Role3, NewPet),
                            pet:push_10503(Role3, NewPet),
                            log:pet(Role3, "宠物内丹共鸣激活/重置", Pet, NewPet),
                            {ok, Role3};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                _ -> {false, lang:get("内丹没升到满级，不能学习共鸣技能")}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

do_resonance_rune(Role,
                  PetRune = #pet_rune{rune_id = RuneId,
                                      resonances = ResonanceL},
                  ResonanceIndex, RestRuneL) ->
    {OpenCost, ResetCost} = case
                                rune_data:get_resonate(ResonanceIndex)
                                of
                                false -> {false, lang:get("不能学习共鸣技能")};
                                {_A, _B} -> {_A, _B}
                            end,
    HadReson = [ResonanceId
                || #pet_resonance{resonance_id = ResonanceId}
                       <- ResonanceL,
                   ResonanceId =/= 0],
    case lists:keytake(ResonanceIndex,
                       #pet_resonance.resonance_index,
                       ResonanceL)
        of
        {value,
         PetResonance = #pet_resonance{resonance_id = OldId,
                                       rune_index = ORuneIndex},
         RestResonL} ->
            CostNum = case OldId of
                          0 -> OpenCost;
                          _ -> ResetCost
                      end,
            Loss = format:val_to_loss([{RuneId, CostNum}],
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("符文共鸣激活/重置")}),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    RandRuneId = get_rand_rune(HadReson),
                    {NPetRune, NRestRuneL} = case lists:keytake(RandRuneId,
                                                                #pet_rune.rune_id,
                                                                RestRuneL)
                                                 of
                                                 {value,
                                                  PetRune2 =
                                                      #pet_rune{rune_index =
                                                                    RuneIndex,
                                                                rune_status =
                                                                    3},
                                                  Rest2} ->
                                                     NPetRune2 =
                                                         PetRune2#pet_rune{is_resonance
                                                                               =
                                                                               1,
                                                                           rune_lev
                                                                               =
                                                                               6},
                                                     NPetResonance =
                                                         [PetResonance#pet_resonance{resonance_id
                                                                                         =
                                                                                         RandRuneId,
                                                                                     rune_index
                                                                                         =
                                                                                         RuneIndex}
                                                          | RestResonL],
                                                     {PetRune#pet_rune{resonances
                                                                           =
                                                                           NPetResonance},
                                                      [NPetRune2 | Rest2]};
                                                 _ ->
                                                     NPetResonance =
                                                         [PetResonance#pet_resonance{resonance_id
                                                                                         =
                                                                                         RandRuneId,
                                                                                     rune_index
                                                                                         =
                                                                                         0}
                                                          | RestResonL],
                                                     {PetRune#pet_rune{resonances
                                                                           =
                                                                           NPetResonance},
                                                      RestRuneL}
                                             end,
                    NewRestRuneL = case lists:keytake(ORuneIndex,
                                                      #pet_rune.rune_index,
                                                      NRestRuneL)
                                       of
                                       {value,
                                        PetRune3 = #pet_rune{rune_index =
                                                                 ORuneIndex,
                                                             is_resonance = 1},
                                        Rest3}
                                           when ORuneIndex =/= 0 ->
                                           NPetRune3 =
                                               PetRune3#pet_rune{is_resonance =
                                                                     0,
                                                                 rune_lev = 5},
                                           [NPetRune3 | Rest3];
                                       _ -> NRestRuneL
                                   end,
                    {ok, LossRole, [NPetRune | NewRestRuneL]};
                _ -> {false, lang:get("道具不足，不可以操作")}
            end;
        _ -> {false, lang:get("当前位置不可以学习共鸣技能")}
    end.

do_unload_rune(Role,
               PetRune = #pet_rune{rune_index = RuneIndex,
                                   rune_id = RuneId, rune_type = RuneType,
                                   rune_lev = RuneLev,
                                   is_resonance = IsResonance},
               Rest) ->
    NRuneLev = min(RuneLev, 5),
    GainNum = rune_data:get_unload({RuneType, NRuneLev}),
    Gain = format:val_to_gain([{RuneId, 0, GainNum}]),
    case role_gain:do_notice(Gain, Role) of
        {ok, GainRole} ->
            NPetRune = PetRune#pet_rune{rune_status = 0,
                                        rune_id = 0, rune_lev = 0,
                                        is_resonance = 0},
            NPetRunes = case NRuneLev of
                            5 ->
                                case RuneType of
                                    2 ->
                                        NRest = [Rune#pet_rune{rune_lev =
                                                                   min(OLev, 5),
                                                               is_resonance = 0}
                                                 || Rune = #pet_rune{rune_lev =
                                                                         OLev}
                                                        <- Rest],
                                        [NPetRune#pet_rune{resonances = []}
                                         | NRest];
                                    _ ->
                                        case IsResonance of
                                            1 ->
                                                case lists:keytake(2,
                                                                   #pet_rune.rune_type,
                                                                   Rest)
                                                    of
                                                    {value,
                                                     PreciousRune =
                                                         #pet_rune{rune_status =
                                                                       3,
                                                                   resonances =
                                                                       ResonanceL},
                                                     Rest2} ->
                                                        case
                                                            lists:keytake(RuneId,
                                                                          #pet_resonance.resonance_id,
                                                                          ResonanceL)
                                                            of
                                                            {value,
                                                             PetResonance =
                                                                 #pet_resonance{rune_index
                                                                                    =
                                                                                    RuneIndex},
                                                             Rest3} ->
                                                                NResonanceL =
                                                                    [PetResonance#pet_resonance{rune_index
                                                                                                    =
                                                                                                    0}
                                                                     | Rest3],
                                                                NPreciousRune =
                                                                    PreciousRune#pet_rune{resonances
                                                                                              =
                                                                                              NResonanceL},
                                                                NRest =
                                                                    [NPreciousRune
                                                                     | Rest2],
                                                                [NPetRune
                                                                 | NRest];
                                                            _ ->
                                                                [NPetRune
                                                                 | Rest]
                                                        end;
                                                    _ -> [NPetRune | Rest]
                                                end;
                                            _ -> [NPetRune | Rest]
                                        end
                                end;
                            _ -> [NPetRune | Rest]
                        end,
            {ok, GainRole, NPetRunes};
        _ -> {false, lang:get("背包已满，请清理后再来")}
    end.

do_grasp_rune(Role, Type, PetRune) ->
    case rune_data:get_understand(Type) of
        false -> {false, lang:get("领悟方式不对")};
        Cost ->
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    NPetRune = PetRune#pet_rune{rune_status = 2},
                    {ok, LossRole, NPetRune};
                _ -> {false, lang:get("道具不足，不可以领悟该内丹技能")}
            end
    end.

do_study_rune(Role,
              PetRune = #pet_rune{rune_type = RuneType}, RunId) ->
    case rune_data:get_base({RunId, 1}) of
        #{quality := RuneType} ->
            Loss = format:val_to_loss([{RunId, 1}],
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("镶嵌/升级符文")}),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    NPetRune = PetRune#pet_rune{rune_status = 1,
                                                rune_id = RunId, rune_lev = 1},
                    {ok, LossRole, NPetRune};
                _ -> {false, lang:get("道具不足，不可以学习该内丹技能")}
            end;
        _ -> {false, lang:get("该位置不能学习该内丹技能")}
    end.

do_update_rune(Role,
               PetRune = #pet_rune{rune_index = RuneIndex,
                                   rune_id = RuneId, rune_type = RuneType,
                                   rune_lev = RuneLev},
               Rest) ->
    CostNum = rune_data:get_update({RuneType, RuneLev}),
    Loss = format:val_to_loss([{RuneId, CostNum}],
                              #{item_base_id_auto_buy => 1,
                                auto_scene => lang:get("镶嵌/升级符文")}),
    case role_gain:do_notice(Loss, Role) of
        {ok, LossRole} ->
            NLev = min(RuneLev + 1, 5),
            NPetRunes = case NLev of
                            5 ->
                                case RuneType of
                                    2 ->
                                        ResonanceL = do_make_resonance(5),
                                        NPetRune = PetRune#pet_rune{rune_status
                                                                        = 3,
                                                                    rune_lev =
                                                                        NLev,
                                                                    resonances =
                                                                        ResonanceL},
                                        do_set_resonance(1, [NPetRune | Rest]);
                                    _ ->
                                        NPetRune = PetRune#pet_rune{rune_status
                                                                        = 3,
                                                                    rune_lev =
                                                                        NLev},
                                        case lists:keytake(2,
                                                           #pet_rune.rune_type,
                                                           Rest)
                                            of
                                            {value,
                                             PreciousRune =
                                                 #pet_rune{rune_status = 3,
                                                           resonances =
                                                               ResonanceL},
                                             Rest2} ->
                                                case lists:keytake(RuneId,
                                                                   #pet_resonance.resonance_id,
                                                                   ResonanceL)
                                                    of
                                                    {value,
                                                     PetResonance =
                                                         #pet_resonance{rune_index
                                                                            =
                                                                            0},
                                                     Rest3} ->
                                                        NResonanceL =
                                                            [PetResonance#pet_resonance{rune_index
                                                                                            =
                                                                                            RuneIndex}
                                                             | Rest3],
                                                        NPreciousRune =
                                                            PreciousRune#pet_rune{resonances
                                                                                      =
                                                                                      NResonanceL},
                                                        NRest = [NPreciousRune
                                                                 | Rest2],
                                                        [NPetRune#pet_rune{rune_lev
                                                                               =
                                                                               NLev
                                                                                   +
                                                                                   1,
                                                                           is_resonance
                                                                               =
                                                                               1}
                                                         | NRest];
                                                    _ -> [NPetRune | Rest]
                                                end;
                                            _ -> [NPetRune | Rest]
                                        end
                                end;
                            _ ->
                                [PetRune#pet_rune{rune_status = 1,
                                                  rune_lev = NLev}
                                 | Rest]
                        end,
            {ok, LossRole, NPetRunes};
        _ -> {false, lang:get("道具不足，不可以学习该内丹技能")}
    end.

get_rand_rune() ->
    L = rune_data:get_all_rune(),
    NL = [RuneId || {1, RuneId} <- L],
    util:rand_list(lists:usort(NL)).

get_rand_rune(HadL) ->
    L1 = rune_data:get_all_rune(),
    L2 = [RuneId || {1, RuneId} <- L1],
    L3 = lists:usort(L2),
    L4 = L3 -- HadL,
    util:rand_list(L4).

convert_genre(Genre) ->
    case Genre of
        2 -> 1;
        4 -> 1;
        _ -> 0
    end.

do_make_rune(PRuneNum, GRuneNum) ->
    do_make_rune(PRuneNum, GRuneNum, 1, []).

do_make_rune(N1, N2, _Index, List)
    when (N1 =< 0) and (N2 =< 0) ->
    List;
do_make_rune(N1, N2, Index, List) when N1 =< 0 ->
    NList = [#pet_rune{rune_index = Index, rune_type = 1}
             | List],
    do_make_rune(N1, N2 - 1, Index + 1, NList);
do_make_rune(N1, N2, Index, List) ->
    NList = [#pet_rune{rune_index = Index, rune_type = 2}
             | List],
    do_make_rune(N1 - 1, N2, Index + 1, NList).

do_make_resonance(N) -> do_make_resonance(N, []).

do_make_resonance(N, List) when N =< 0 -> List;
do_make_resonance(N, List) ->
    NList = [#pet_resonance{resonance_index = N} | List],
    do_make_resonance(N - 1, NList).

do_set_resonance(Index, RuneList) ->
    case lists:keytake(2, #pet_rune.rune_type, RuneList) of
        {value,
         PetRune = #pet_rune{resonances = ResonanceL},
         Rest1} ->
            {NResonanceL, NRest1} = case lists:keytake(Index,
                                                       #pet_resonance.resonance_index,
                                                       ResonanceL)
                                        of
                                        {value, PetResonance, Rest2} ->
                                            RandRuneId = get_rand_rune(),
                                            case lists:keytake(RandRuneId,
                                                               #pet_rune.rune_id,
                                                               Rest1)
                                                of
                                                {value,
                                                 PetRune2 = #pet_rune{rune_lev =
                                                                          Lev,
                                                                      rune_index
                                                                          =
                                                                          RuneIndex},
                                                 Rest3}
                                                    when Lev >= 5 ->
                                                    NPetRune2 =
                                                        PetRune2#pet_rune{is_resonance
                                                                              =
                                                                              1,
                                                                          rune_lev
                                                                              =
                                                                              6},
                                                    {[PetResonance#pet_resonance{resonance_id
                                                                                     =
                                                                                     RandRuneId,
                                                                                 rune_index
                                                                                     =
                                                                                     RuneIndex}
                                                      | Rest2],
                                                     [NPetRune2 | Rest3]};
                                                _ ->
                                                    {[PetResonance#pet_resonance{resonance_id
                                                                                     =
                                                                                     RandRuneId}
                                                      | Rest2],
                                                     Rest1}
                                            end;
                                        _ ->
                                            logger:error("没有这个共鸣槽~w",
                                                         [Index],
                                                         pet_rune,
                                                         543),
                                            {ResonanceL, Rest1}
                                    end,
            NPetRune = PetRune#pet_rune{resonances = NResonanceL},
            [NPetRune | NRest1];
        _ -> RuneList
    end.

