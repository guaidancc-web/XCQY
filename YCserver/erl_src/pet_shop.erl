-file("src/mod/pet/pet_shop.erl", 1).

-module(pet_shop).

-behaviour(gen_server).

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

-file("src/mod/pet/pet_shop.erl", 20).

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

-file("src/mod/pet/pet_shop.erl", 21).

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

-file("src/mod/pet/pet_shop.erl", 22).

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

-file("src/mod/pet/pet_shop.erl", 23).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/pet/pet_shop.erl", 24).

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

-file("src/mod/pet/pet_shop.erl", 25).

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

-file("src/mod/pet/pet_shop.erl", 26).

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

-file("src/mod/pet/pet_shop.erl", 27).

-export([start_link/0]).

-export([get_lev_tabs/1, purchs_pet/2]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {lack_of = [], is_auto = 0}).

start_link() ->
    gen_server:start_link({local, pet_shop},
                          pet_shop,
                          [],
                          []).

get_lev_tabs(#role{lev = Lev}) ->
    MinTab = pet_shop_data:get_min_lev_tab(),
    MaxTab = pet_shop_data:get_max_lev_tab(),
    [LevTab
     || LevTab <- lists:seq(MinTab, MaxTab, 10),
        (LevTab =< Lev) =:= true].

purchs_pet(Role, BaseId) ->
    Args = #{pet_base_id => BaseId},
    purchs_pet_flow([check, final], Role, Args).

purchs_pet_flow([], _, _) -> false;
purchs_pet_flow([check | RestSteps],
                Role = #role{lev = Lev},
                Args = #{pet_base_id := BaseId}) ->
    case pet_shop_data:get_pet_cfg(BaseId) of
        Data = #pet_shop_data{actv_lev = ActvLev}
            when Lev >= ActvLev ->
            case pet:check_nums(Role) of
                true ->
                    purchs_pet_flow(RestSteps,
                                    Role,
                                    Args#{pet_shop_data => Data});
                Rtn = {false, _Msg} -> Rtn;
                _Other -> false
            end;
        _False -> {false, lang:get("请先提升等级，再购买该宠物")}
    end;
purchs_pet_flow([final], Role,
                #{pet_shop_data := Data}) ->
    do_purchs_pet(Data, Role);
purchs_pet_flow(Steps, _, _) ->
    logger:error("宠物商店购买宠物流程出错:[Stpes:~w]",
                 [Steps],
                 pet_shop,
                 150),
    false.

do_purchs_pet(#pet_shop_data{base_id = BaseId,
                             def_buy_price = BuyPrice},
              Role) ->
    Loss = [#loss{label = coin, val = BuyPrice}],
    case role_gain:do(Loss, Role) of
        {ok, LossRole} ->
            PetArgs = #{base_id => BaseId, genre => 3,
                        from => "购买宠物"},
            case pet:create(LossRole, PetArgs) of
                {ok, PetRole} ->
                    VarType = 11,
                    NewRole = var:add_var(PetRole, day, VarType, 1),
                    Msg = notice:format(lang:get("获得~ts，消耗~ts"),
                                        [{pet_2, BaseId},
                                         {assets_1, 90000, BuyPrice}]),
                    notice:send(NewRole, 1, Msg),
                    {ok, NewRole};
                _ -> false
            end;
        _ -> {false, lang:get("购买失败，银币不足")}
    end.

init([]) ->
    logger:info("宠物商店正在启动:[~w]", [pet_shop], pet_shop, 273),
    process_flag(trap_exit, true),
    case catch load_data() of
        ok ->
            logger:info("宠物商店启动完成:[~w]", [pet_shop], pet_shop, 277),
            AllPetCfg = pet_shop_data:get_all_pet_cfg(),
            LackOf = check_pet_duplicate(AllPetCfg, []),
            IsAuto = check_produce(LackOf, 0),
            {ok, #state{lack_of = LackOf, is_auto = IsAuto}};
        {error, LoadErr} ->
            logger:error("宠物商店启动失败:[~w][Err:~w]",
                         [pet_shop, LoadErr],
                         pet_shop,
                         283),
            {stop, abnormal};
        Exit ->
            logger:error("宠物商店启动失败:[~w][Err:~w]",
                         [pet_shop, Exit],
                         pet_shop,
                         286),
            {stop, abnormal}
    end.

handle_call({reduce_pet_stock, BaseId}, _From,
            State = #state{lack_of = LackOf, is_auto = IsAuto}) ->
    case reduce_pet_stock_flow(BaseId) of
        {ok, NewStock} ->
            NewLackOf = check_stock(LackOf, NewStock, BaseId),
            NewIsAuto = check_produce(NewLackOf, IsAuto),
            NewState = State#state{lack_of = NewLackOf,
                                   is_auto = NewIsAuto},
            {reply, ok, NewState};
        false -> {reply, false, State}
    end;
handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

handle_cast({increase_pet_stock, Pid, BaseId, Name},
            State = #state{lack_of = LackOf, is_auto = IsAuto}) ->
    NewState = case increase_pet_stock_flow(Pid,
                                            BaseId,
                                            Name)
                   of
                   NewStock when is_integer(NewStock) ->
                       NewLackOf = check_stock(LackOf, NewStock, BaseId),
                       NewIsAuto = check_produce(NewLackOf, IsAuto),
                       State#state{lack_of = NewLackOf, is_auto = NewIsAuto};
                   false -> State
               end,
    {noreply, NewState};
handle_cast(reload, State = #state{is_auto = IsAuto}) ->
    AllPetCfg = pet_shop_data:get_all_pet_cfg(),
    LackOf = check_pet_duplicate(AllPetCfg, []),
    NewIsAuto = check_produce(LackOf, IsAuto),
    {noreply,
     State#state{lack_of = LackOf, is_auto = NewIsAuto}};
handle_cast(Msg, State) ->
    logger:error("[~w]收到错误的消息:[~w]",
                 [pet_shop, Msg],
                 pet_shop,
                 345),
    {noreply, State}.

handle_info(produce,
            State = #state{lack_of = LackOf}) ->
    NewState = case auto_produce(LackOf, []) of
                   [] -> State#state{lack_of = [], is_auto = 0};
                   NewLackOf ->
                       erlang:send_after(60000, self(), produce),
                       State#state{lack_of = NewLackOf, is_auto = 1}
               end,
    {noreply, NewState};
handle_info(Info, State) ->
    logger:error("[~w]收到错误的消息:[~w]",
                 [pet_shop, Info],
                 pet_shop,
                 369),
    {noreply, State}.

terminate(normal, _State) ->
    logger:info("[~w] 正常退出", [pet_shop], pet_shop, 384),
    ok;
terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

increase_pet_stock_flow(Pid, BaseId, Name) ->
    case catch ets:lookup(pet_shop_tab, BaseId) of
        [Cfg] = [#pet_goods{stock = Stock}] ->
            NewStock = Stock + 1,
            NewCfg = Cfg#pet_goods{stock = NewStock},
            role:apply(async,
                       Pid,
                       {pet_shop,
                        callback_sold_out_pet,
                        [BaseId, Name, Stock]}),
            catch ets:insert(pet_shop_tab, NewCfg),
            catch dets:insert(pet_shop_tab, NewCfg),
            NewStock;
        _ ->
            logger:error("该宠物未在宠物商店中配置", [], pet_shop, 419),
            false
    end.

reduce_pet_stock_flow(BaseId) ->
    case catch ets:lookup(pet_shop_tab, BaseId) of
        [#pet_goods{stock = 0}] -> false;
        [Cfg] = [#pet_goods{stock = Stock}] ->
            NewStock = erlang:max(0, Stock - 1),
            NewCfg = Cfg#pet_goods{stock = NewStock},
            ets:insert(pet_shop_tab, NewCfg),
            dets:insert(pet_shop_tab, NewCfg),
            {ok, NewStock};
        false -> false
    end.

load_data() ->
    pet_shop_tab = ets:new(pet_shop_tab,
                           [set,
                            named_table,
                            public,
                            {keypos, #pet_shop_data.base_id}]),
    {ok, pet_shop_tab} = dets:open_file(pet_shop_tab,
                                        [{file, "dets/pet_shop.dets"},
                                         {keypos, #pet_shop_data.base_id},
                                         {type, set}]),
    dets:to_ets(pet_shop_tab, pet_shop_tab),
    ok.

check_pet_duplicate([], Acc) -> Acc;
check_pet_duplicate([#pet_shop_data{base_id = BaseId,
                                    stock = Stock, actv_lev = ActvLev}
                     | RestCfg],
                    Acc) ->
    case catch ets:lookup(pet_shop_tab, BaseId) of
        [Cfg] ->
            NewCfg = Cfg#pet_goods{actv_lev = ActvLev},
            catch ets:insert(pet_shop_tab, NewCfg),
            catch dets:insert(pet_shop_tab, NewCfg),
            NewAcc = check_stock(Acc, Stock, BaseId),
            check_pet_duplicate(RestCfg, NewAcc);
        [] ->
            Cfg = #pet_goods{base_id = BaseId, stock = Stock,
                             actv_lev = ActvLev},
            catch ets:insert(pet_shop_tab, Cfg),
            catch dets:insert(pet_shop_tab, Cfg),
            NewAcc = check_stock(Acc, Stock, BaseId),
            check_pet_duplicate(RestCfg, NewAcc);
        _ -> check_pet_duplicate(RestCfg, Acc)
    end.

check_produce([], IsAuto) -> IsAuto;
check_produce(_, IsAuto) ->
    case IsAuto of
        1 -> 1;
        0 ->
            erlang:send_after(60000, self(), produce),
            1
    end.

check_stock([], Stock, _)
    when 20 =< Stock andalso Stock =< 100 ->
    [];
check_stock(LackOf, Stock, BaseId) ->
    case Stock < 20 of
        true ->
            case lists:member({add, BaseId}, LackOf) of
                false -> [{add, BaseId} | LackOf];
                true -> LackOf
            end;
        false ->
            case lists:member({sub, BaseId}, LackOf) of
                false -> [{sub, BaseId} | LackOf];
                true -> LackOf
            end
    end.

auto_produce([], Acc) -> Acc;
auto_produce([{add, BaseId} | Rest], Acc) ->
    case catch ets:lookup(pet_shop_tab, BaseId) of
        [Obj = #pet_goods{stock = Stock}] ->
            if 20 =< Stock -> auto_produce(Rest, Acc);
               true ->
                   Add = util:rand(0, 2),
                   NewStock = Stock + Add,
                   catch ets:insert(pet_shop_tab,
                                    Obj#pet_goods{stock = NewStock}),
                   catch dets:insert(pet_shop_tab,
                                     Obj#pet_goods{stock = NewStock}),
                   case 20 =< NewStock of
                       true -> auto_produce(Rest, Acc);
                       false -> auto_produce(Rest, [{add, BaseId} | Acc])
                   end
            end;
        _ -> auto_produce(Rest, Acc)
    end;
auto_produce([{sub, BaseId} | Rest], Acc) ->
    case catch ets:lookup(pet_shop_tab, BaseId) of
        [Obj = #pet_goods{stock = Stock}] ->
            if Stock =< 100 -> auto_produce(Rest, Acc);
               true ->
                   Sub = util:rand(0, 2),
                   NewStock = Stock - Sub,
                   catch ets:insert(pet_shop_tab,
                                    Obj#pet_goods{stock = NewStock}),
                   catch dets:insert(pet_shop_tab,
                                     Obj#pet_goods{stock = NewStock}),
                   case NewStock =< 100 of
                       true -> auto_produce(Rest, Acc);
                       false -> auto_produce(Rest, [{sub, BaseId} | Acc])
                   end
            end;
        _ -> auto_produce(Rest, Acc)
    end.

