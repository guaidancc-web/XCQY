-file("src/mod/handbook/handbook.erl", 1).

-module(handbook).

-export([init/0,
         collect/3,
         upgrade/3,
         use_item/2,
         transform/2,
         get_fc/1,
         set_need/3,
         push_17111/1,
         push_17100/1,
         change_handbook_speed/3,
         fuse/5,
         make_attr/3,
         use_item/3]).

-file("inc/handbook.hrl", 1).

-record(m_handbook,
        {ver = 4,
         book_list = [],
         set_list = [],
         auto_book_id = 0,
         store_items = [],
         next_time = 0,
         need_list = [],
         ban_speed_set_list = []}).

-record(handbook_item,
        {idx = 0, id = 0, num = 1, val = 0, flag = 0}).

-record(handbook,
        {ver = 4,
         id = 0,
         status = 0,
         active_step = 0,
         star_step = 0,
         star_val = 0,
         transform_point = 0,
         active_effect_type = 3,
         active_attr = [],
         star_effect_type = 1,
         star_effect_list = [],
         star_attr = [],
         add_point = 0}).

-record(handbook_base,
        {id,
         name = "",
         level_limit = 0,
         lev = 0,
         grade_lev = 1,
         grade_type = 1,
         effect_type = 1,
         active_reward = [],
         set_id = [],
         allow_item = [],
         active_loss = [],
         star_loss = [],
         transform_point = 1,
         max_active_step = 2,
         max_star_step = 2,
         fc = 0,
         fc1 = 0,
         fc2 = 0,
         fuse_flag = 0,
         fuse_id = 0,
         times = 0,
         illusion_id = 0,
         fuse_num1 = 0,
         lev_num1 = 0,
         fuse_num2 = 0,
         lev_num2 = 0,
         fuse_num3 = 0,
         lev_num3 = 0,
         target_id = 0,
         universal = 0,
         bind = 1}).

-file("src/mod/handbook/handbook.erl", 27).

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

-file("src/mod/handbook/handbook.erl", 28).

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

-file("src/mod/handbook/handbook.erl", 29).

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

-file("src/mod/handbook/handbook.erl", 30).

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

-file("src/mod/handbook/handbook.erl", 31).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/handbook/handbook.erl", 32).

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

-file("src/mod/handbook/handbook.erl", 33).

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

-file("src/mod/handbook/handbook.erl", 34).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/mod/handbook/handbook.erl", 35).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/handbook/handbook.erl", 36).

init() -> #m_handbook{}.

change_handbook_speed(Role = #role{m_handbook =
                                       MHandbook =
                                           #m_handbook{ban_speed_set_list =
                                                           BanList}},
                      SetId, Flag) ->
    case Flag of
        _ when Flag =:= 0 orelse Flag =:= 1 ->
            case lists:keyfind(SetId, 1, BanList) of
                false ->
                    NewBanList = lists:append(BanList, [{SetId, Flag}]),
                    NewHandbook = MHandbook#m_handbook{ban_speed_set_list =
                                                           NewBanList},
                    NewRole = Role#role{m_handbook = NewHandbook},
                    {ok, NewRole};
                _ ->
                    NewBanList = lists:keyreplace(SetId,
                                                  1,
                                                  BanList,
                                                  {SetId, Flag}),
                    NewHandbook = MHandbook#m_handbook{ban_speed_set_list =
                                                           NewBanList},
                    NewRole = Role#role{m_handbook = NewHandbook},
                    {ok, NewRole}
            end;
        _ -> {false, lang:get("传入的参数有误")}
    end.

get_fc(#role{m_handbook =
                 #m_handbook{book_list = BookList}}) ->
    SetFc = handbook_attr:calc_set_fc(BookList),
    do_get_fc(BookList, 0) + SetFc.

do_get_fc([], Fc) -> Fc;
do_get_fc([#handbook{status = 1, id = BookId,
                     star_step = StarStep}
           | T],
          Fc) ->
    case handbook_data:get(BookId) of
        #handbook_base{fc = AddFc, fc1 = AddFc1,
                       fc2 = AddFc2} ->
            Afc = case StarStep of
                      1 -> AddFc1;
                      2 -> AddFc2;
                      _ -> AddFc
                  end,
            do_get_fc(T, Afc + Fc);
        _ -> do_get_fc(T, Fc)
    end;
do_get_fc([_ | T], Fc) -> do_get_fc(T, Fc).

push_17102(Role, Book) ->
    role:link_send(Role, 17102, {Book}),
    ok.

push_17111(Role = #role{m_handbook =
                            #m_handbook{need_list = NeedList}}) ->
    role:link_send(Role, 17111, {NeedList}),
    ok.

push_17100(Role = #role{m_handbook =
                            #m_handbook{book_list = BookList,
                                        ban_speed_set_list = BanList}}) ->
    NewBanList = [SetId
                  || {SetId, Flag} <- BanList, Flag =:= 1],
    role:link_send(Role, 17100, {BookList, NewBanList}),
    ok.

use_item(BookId, Role) ->
    case transform(BookId, Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end.

use_item(BookId, #item{extra = Extra}, Role) ->
    Lev = case lists:keyfind(32, 1, Extra) of
              {_, Levs, ""} when Levs >= 1 -> Levs;
              _ -> 0
          end,
    case transform(BookId, Lev, Extra, Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end.

transform(BookId,
          Role = #role{m_handbook =
                           #m_handbook{book_list = BookList}}) ->
    case check_transform(BookId, BookList) of
        {true,
         #handbook{star_step = StarStep, status = Status}} ->
            case do_transform(BookId, StarStep, Status, 0, Role) of
                {ok,
                 NewBuff = #buff_base{name = BuffName},
                 IsVarition} ->
                    case buff:add(Role, NewBuff) of
                        {false, Reason} -> {false, Reason};
                        {ok, NewRole} ->
                            NewRole1 = attr:calc_and_push(NewRole),
                            NewRole2 = looks:calc(NewRole1),
                            looks:update_looks(Role, NewRole2),
                            case IsVarition of
                                1 ->
                                    Msg =
                                        notice:format(lang:get("恭喜您幸运的获得了~ts，属性获得了极大提升"),
                                                      [{string_2,
                                                        1,
                                                        BuffName}]),
                                    notice:pop(NewRole2, 2, Msg);
                                _ -> skip
                            end,
                            {ok, NewRole2}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

transform(BookId, Lev, Extra,
          Role = #role{m_handbook =
                           #m_handbook{book_list = BookList}}) ->
    case check_transform(BookId, BookList) of
        {true,
         #handbook{star_step = StarStep, status = Status}} ->
            case do_transform(BookId, StarStep, Status, Lev, Role)
                of
                {ok,
                 NewBuff = #buff_base{name = BuffName},
                 IsVarition} ->
                    case add_lev_buff(Lev, Extra, BookId, NewBuff) of
                        {ok, NBuff} ->
                            case buff:add(Role, NBuff) of
                                {false, Reason} -> {false, Reason};
                                {ok, NewRole} ->
                                    NewRole1 = attr:calc_and_push(NewRole),
                                    NewRole2 = looks:calc(NewRole1),
                                    looks:update_looks(Role, NewRole2),
                                    case IsVarition of
                                        1 ->
                                            Msg =
                                                notice:format(lang:get("恭喜您幸运的获得了~ts，属性获得了极大提升"),
                                                              [{string_2,
                                                                1,
                                                                BuffName}]),
                                            notice:pop(NewRole2, 2, Msg);
                                        _ -> skip
                                    end,
                                    {ok, NewRole2}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

set_need(Role = #role{m_handbook =
                          MhandBook = #m_handbook{need_list = NeedList}},
         BookId, IsNeed) ->
    case IsNeed of
        1 ->
            case lists:member(BookId, NeedList) of
                true -> ok;
                _ ->
                    NewNeedList = [BookId | NeedList],
                    NewRole = Role#role{m_handbook =
                                            MhandBook#m_handbook{need_list =
                                                                     NewNeedList}},
                    push_17111(NewRole),
                    BookName = case item_data:get(BookId) of
                                   #item_base{name = _Name} -> _Name;
                                   _Err -> []
                               end,
                    logger:debug("", [], handbook, 216),
                    Msg = notice:format(lang:get("标记成功，~ts中的~ts将增加~ts标记"),
                                        [{string_2, 5, lang:get("市场、背包")},
                                         {string_2, 2, BookName},
                                         {string_2, 1, lang:get("需求")}]),
                    {ok, NewRole, Msg}
            end;
        0 ->
            NewNeedList = lists:delete(BookId, NeedList),
            NewRole = Role#role{m_handbook =
                                    MhandBook#m_handbook{need_list =
                                                             NewNeedList}},
            push_17111(NewRole),
            {ok, NewRole, lang:get("取消成功")}
    end.

do_transform(BookId, StarStep, Status, Lev, Role) ->
    case handbook_data:get_attr({BookId, StarStep}) of
        #{ratio := Ratio, buff := Buff,
          varition_buff := VaritionBuff,
          senior_buff := SeniorBuff,
          sen_vari_buff := SenVariBuff} ->
            {IsVarition, AddBuff} = case {Status, Lev} of
                                        {0, 0} -> {0, Buff};
                                        {0, _} -> {0, SeniorBuff};
                                        {_, 0} ->
                                            case util:rand(1, 1000) =< Ratio of
                                                true -> {1, VaritionBuff};
                                                _ -> {0, Buff}
                                            end;
                                        {_, _} ->
                                            case util:rand(1, 1000) =< Ratio of
                                                true -> {1, SenVariBuff};
                                                _ -> {0, SeniorBuff}
                                            end
                                    end,
            case calc_transform_buff(AddBuff, Role) of
                {ok, NewBuff} -> {ok, NewBuff, IsVarition};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到对应幻化数据")}
    end.

calc_transform_buff(BuffId, Role) ->
    case buff_data:get(BuffId) of
        BuffBase = #buff_base{duration = Duration} ->
            Slv = skill_life:get_look_skill_lev(Role),
            FurnishingAdd = case Role of
                                #role{m_family =
                                          #m_family{family_effect =
                                                        EffectInfo}} ->
                                    case lists:keyfind(9, 1, EffectInfo) of
                                        {_, AddSenond} -> AddSenond;
                                        _ -> 0
                                    end;
                                _ -> 0
                            end,
            NewDuration = Duration + Slv * 900 + FurnishingAdd * 60,
            NewBuff = BuffBase#buff_base{duration = NewDuration},
            {ok, NewBuff};
        _ -> {false, lang:get("该图鉴无法幻化")}
    end.

check_transform(BookId, BookList) ->
    case handbook_data:get(BookId) of
        #handbook_base{} ->
            case lists:keyfind(BookId, #handbook.id, BookList) of
                Book = #handbook{} -> {true, Book};
                _ -> {true, #handbook{id = BookId}}
            end;
        _ -> {false, lang:get("不存在的幻化果，无法幻化")}
    end.

collect(Id, BaseIdList,
        Role = #role{m_handbook =
                         MhandBook = #m_handbook{book_list = BookList}}) ->
    case check_collect([base_data, has_book, calc_loss],
                       Id,
                       BaseIdList,
                       BookList,
                       #{})
        of
        {true,
         Loss,
         NewBook = #handbook{active_step = ActiveStep,
                             status = Status},
         BookName,
         MaxActiveStep,
         SetList} ->
            LossList = format:val_to_loss(Loss),
            case role_gain:do(LossList, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, NewRole} ->
                    NewBook1 = handbook_attr:calc_book(NewBook, NewRole),
                    NewBookList = lists:keystore(Id,
                                                 #handbook.id,
                                                 BookList,
                                                 NewBook1),
                    NewMhandBook = MhandBook#m_handbook{book_list =
                                                            NewBookList},
                    NewRole1 = attr:calc_and_push(NewRole#role{m_handbook =
                                                                   NewMhandBook}),
                    NewRole2 = handbook_attr:update_book(NewBook1,
                                                         NewRole1),
                    {CalcFlag, NewRole3} =
                        handbook_attr:calc_point(NewRole2),
                    NewRole4 = case CalcFlag of
                                   1 -> attr:calc_and_push(NewRole3);
                                   _ -> NewRole3
                               end,
                    push_17102(NewRole4, NewBook1),
                    ReturnMsg = case Status =:= 1 of
                                    true ->
                                        collect_mail(Role, NewBook1),
                                        collect_msg(NewRole4,
                                                    NewBookList,
                                                    NewBook1,
                                                    BookName,
                                                    SetList),
                                        "";
                                    _ ->
                                        notice:format(lang:get("收集~ts，~ts收藏进度~ts/~ts，继续加油{face_1,3}"),
                                                      [{item_2, BaseIdList},
                                                       {string_2, 1, BookName},
                                                       {string_2,
                                                        1,
                                                        ActiveStep},
                                                       {string_2,
                                                        1,
                                                        MaxActiveStep}])
                                end,
                    {ok, NewRole4, ReturnMsg}
            end;
        {false, Reason} -> {false, Reason}
    end.

collect_mail(Role, #handbook{id = BookId}) ->
    case handbook_data:get(BookId) of
        #handbook_base{active_reward = ActiveReward = [_ | _],
                       name = BookName} ->
            Title = lang:get("图鉴收藏奖励"),
            Content =
                notice:format(lang:get("恭喜成功收集图鉴:~ts，在你收集图鉴时，我看到从图鉴碎片中掉落了一个~ts，现邮回给你，"
                                       "继续加油收集哦\n--神秘人"),
                              [{string_2, 1, BookName},
                               {item_2, ActiveReward}]),
            mail:send(Role,
                      #{title => Title, content => Content,
                        items => ActiveReward}),
            ok;
        _ -> ok
    end.

collect_msg(Role, BookList,
            #handbook{id = BookId, star_step = StarStep}, BookName,
            SetList) ->
    case handbook_data:get_attr({BookId, StarStep}) of
        #{active_desc := ActiveDesc} ->
            Msg1 =
                notice:format(lang:get("恭喜成功收藏图鉴:~ts，获得以下奖励:~ts"),
                              [{string_2, 1, BookName},
                               {string_2, 1, ActiveDesc}]),
            notice:send(Role, 7, Msg1);
        _ -> ok
    end,
    Fun = fun (SetId, NowSetList) ->
                  case handbook_data:get_set(SetId) of
                      #{max_num := MaxNum, book_list := AllowBookList,
                        name := Name, attr := Attr} ->
                          SetCastMsg = format:attr_text(Attr),
                          Len = length([1
                                        || #handbook{status = 1, id = ActId}
                                               <- BookList,
                                           lists:member(ActId, AllowBookList)
                                               =:= true]),
                          case Len >= MaxNum of
                              true -> [{Name, SetCastMsg} | NowSetList];
                              _ -> NowSetList
                          end;
                      _ -> NowSetList
                  end
          end,
    Data = lists:foldl(Fun, [], SetList),
    lists:foreach(fun ({SetName1, SetCastMsg1}) ->
                          Msg2 =
                              notice:format(lang:get("恭喜收藏图鉴组合:~ts，获得以下奖励:~ts"),
                                            [{string_2, 1, SetName1},
                                             {string_1, SetCastMsg1}]),
                          notice:send(Role, 7, Msg2)
                  end,
                  Data),
    ok.

check_collect([], _Id, _BaseIdList, _BookList, _Args) ->
    {false, lang:get("流程错误")};
check_collect([base_data | T], Id, BaseIdList, BookList,
              Args) ->
    case handbook_data:get(Id) of
        BookBase = #handbook_base{} ->
            check_collect(T,
                          Id,
                          BaseIdList,
                          BookList,
                          Args#{base_data => BookBase});
        _ -> {false, lang:get("不存在的图鉴无法收藏")}
    end;
check_collect([has_book | T], Id, BaseIdList, BookList,
              Args = #{base_data := #handbook_base{id = BookId}}) ->
    case lists:keyfind(Id, #handbook.id, BookList) of
        false ->
            Book = #handbook{id = BookId},
            check_collect(T,
                          Id,
                          BaseIdList,
                          BookList,
                          Args#{book => Book});
        #handbook{status = 1} ->
            {false, lang:get("当前图鉴已经激活，无需收藏")};
        Book = #handbook{status = 0} ->
            check_collect(T,
                          Id,
                          BaseIdList,
                          BookList,
                          Args#{book => Book})
    end;
check_collect([calc_loss | _T], _Id, BaseIdList,
              _BookList,
              #{base_data :=
                    #handbook_base{active_loss = ActiveLoss,
                                   allow_item = AllowItem,
                                   max_active_step = MaxActiveStep,
                                   name = BookName, set_id = SetId},
                book := Book = #handbook{active_step = ActiveStep}}) ->
    case lists:keyfind(ActiveStep, 1, ActiveLoss) of
        {_, NeedNum} ->
            case calc_loss_collect(NeedNum,
                                   BaseIdList,
                                   AllowItem,
                                   [],
                                   0)
                of
                {true, LossItem} ->
                    NewActiveStep = ActiveStep + 1,
                    NewBook = case NewActiveStep >= MaxActiveStep of
                                  true ->
                                      Book#handbook{active_step = NewActiveStep,
                                                    status = 1};
                                  false ->
                                      Book#handbook{active_step = NewActiveStep}
                              end,
                    {true,
                     LossItem,
                     NewBook,
                     BookName,
                     MaxActiveStep,
                     SetId};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到当前收藏阶段消耗")}
    end.

calc_loss_collect(NeedNum, [], _AllowItem, _LossItem,
                  Num)
    when Num < NeedNum ->
    {false, lang:get("道具不足，无法收藏")};
calc_loss_collect(NeedNum, _BaseIdList, _AllowItem,
                  LossItem, Num)
    when Num >= NeedNum ->
    {true, LossItem};
calc_loss_collect(NeedNum, [{BaseId, N} | T], AllowItem,
                  LossItem, Num)
    when N > 0 ->
    case lists:member(BaseId, AllowItem) of
        true ->
            Last = NeedNum - Num,
            case N > Last of
                true ->
                    calc_loss_collect(NeedNum,
                                      [{BaseId, N - Last} | T],
                                      AllowItem,
                                      [{BaseId, Last} | LossItem],
                                      Num + Last);
                false ->
                    calc_loss_collect(NeedNum,
                                      T,
                                      AllowItem,
                                      [{BaseId, N} | LossItem],
                                      Num + N)
            end;
        false -> {false, lang:get("该碎片不能用于收藏该图鉴")}
    end;
calc_loss_collect(NeedNum, [_ | T], AllowItem, LossItem,
                  Num) ->
    calc_loss_collect(NeedNum, T, AllowItem, LossItem, Num).

upgrade(Id, BaseIdList,
        Role = #role{m_handbook =
                         MhandBook = #m_handbook{book_list = BookList}}) ->
    case check_upgrade([base_data, has_book, calc_loss],
                       Id,
                       BaseIdList,
                       BookList,
                       #{})
        of
        {true, Loss, NewBook, BookName, UpFlag} ->
            LossList = format:val_to_loss(Loss),
            case role_gain:do(LossList, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, NewRole} ->
                    NewBook1 = handbook_attr:calc_book(NewBook, NewRole),
                    NewBookList = lists:keystore(Id,
                                                 #handbook.id,
                                                 BookList,
                                                 NewBook1),
                    NewMhandBook = MhandBook#m_handbook{book_list =
                                                            NewBookList},
                    NewRole1 = attr:calc_and_push(NewRole#role{m_handbook =
                                                                   NewMhandBook}),
                    NewRole2 = handbook_attr:update_book(NewBook1,
                                                         NewRole1),
                    {CalcFlag, NewRole3} =
                        handbook_attr:calc_point(NewRole2),
                    Msg = upgrade_msg(Role, NewBook1, BookName, UpFlag),
                    NewRole4 = case CalcFlag of
                                   1 -> attr:calc_and_push(NewRole3);
                                   _ -> NewRole3
                               end,
                    push_17102(NewRole4, NewBook1),
                    {ok, NewRole4, Msg}
            end;
        {false, Reason} -> {false, Reason}
    end.

upgrade_msg(Role,
            #handbook{id = BookId, star_step = StarStep}, BookName,
            1) ->
    case handbook_data:get_attr({BookId, StarStep}) of
        #{star1_desc := Star1Desc, star2_desc := Star2Desc} ->
            Msg = case StarStep of
                      1 ->
                          notice:format(lang:get("恭喜成功提升图鉴:~ts升至~ts，获得以下奖励:~ts"),
                                        [{string_2, 1, BookName},
                                         {string_2, 1, lang:get("星星")},
                                         {string_2, 1, Star1Desc}]);
                      _ ->
                          notice:format(lang:get("恭喜成功提升图鉴:~ts升至~ts，获得以下奖励:~ts"),
                                        [{string_2, 1, BookName},
                                         {string_2, 1, lang:get("月亮")},
                                         {string_2, 1, Star2Desc}])
                  end,
            notice:send(Role, 7, Msg),
            Msg;
        _ -> ""
    end;
upgrade_msg(_, _, _, _) -> "".

check_upgrade([], _Id, _BaseIdList, _BookList, _Args) ->
    {false, lang:get("流程错误")};
check_upgrade([base_data | T], Id, BaseIdList, BookList,
              Args) ->
    case handbook_data:get(Id) of
        BookBase = #handbook_base{} ->
            check_upgrade(T,
                          Id,
                          BaseIdList,
                          BookList,
                          Args#{base_data => BookBase});
        _ -> {false, lang:get("不存在的图鉴无法升星")}
    end;
check_upgrade([has_book | T], Id, BaseIdList, BookList,
              Args = #{base_data :=
                           #handbook_base{max_star_step = MaxStarStep}}) ->
    case lists:keyfind(Id, #handbook.id, BookList) of
        false -> {false, lang:get("没有激活的图鉴无法升星")};
        #handbook{status = 0} ->
            {false, lang:get("没有激活的图鉴无法升星")};
        Book = #handbook{status = 1, star_step = StarStep}
            when StarStep < MaxStarStep ->
            check_upgrade(T,
                          Id,
                          BaseIdList,
                          BookList,
                          Args#{book => Book});
        _ -> {false, lang:get("当前图鉴已经满星，无需升星")}
    end;
check_upgrade([calc_loss | _T], _Id, BaseIdList,
              _BookList,
              #{base_data :=
                    #handbook_base{star_loss = StarLoss,
                                   allow_item = AllowItem, name = BookName},
                book :=
                    Book = #handbook{star_step = StarStep,
                                     star_val = StarVal}}) ->
    case lists:keyfind(StarStep, 1, StarLoss) of
        {_, NeedNum} ->
            NeedNum1 = NeedNum - StarVal,
            case calc_loss_upgrade(NeedNum1,
                                   BaseIdList,
                                   AllowItem,
                                   [],
                                   0)
                of
                {true, LossItem, UpFlag, AddStarVal} ->
                    {NewStarStep, NewStarVal} = case UpFlag of
                                                    1 -> {StarStep + 1, 0};
                                                    0 ->
                                                        {StarStep,
                                                         StarVal + AddStarVal}
                                                end,
                    NewBook = Book#handbook{star_step = NewStarStep,
                                            star_val = NewStarVal},
                    {true, LossItem, NewBook, BookName, UpFlag};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到当前升星阶段消耗")}
    end.

calc_loss_upgrade(NeedNum, [], _AllowItem, LossItem,
                  Num)
    when Num < NeedNum ->
    case Num > 0 of
        true -> {true, LossItem, 0, Num};
        false -> {false, lang:get("道具不足，无法升星")}
    end;
calc_loss_upgrade(NeedNum, _BaseIdList, _AllowItem,
                  LossItem, Num)
    when Num >= NeedNum ->
    {true, LossItem, 1, 0};
calc_loss_upgrade(NeedNum, [{BaseId, N} | T], AllowItem,
                  LossItem, Num)
    when N > 0 ->
    case lists:member(BaseId, AllowItem) of
        true ->
            Last = NeedNum - Num,
            case N > Last of
                true ->
                    calc_loss_upgrade(NeedNum,
                                      [{BaseId, N - Last} | T],
                                      AllowItem,
                                      [{BaseId, Last} | LossItem],
                                      Num + Last);
                false ->
                    calc_loss_upgrade(NeedNum,
                                      T,
                                      AllowItem,
                                      [{BaseId, N} | LossItem],
                                      Num + N)
            end;
        false -> {false, lang:get("该碎片不能用于收藏该图鉴")}
    end;
calc_loss_upgrade(NeedNum, [_ | T], AllowItem, LossItem,
                  Num) ->
    calc_loss_upgrade(NeedNum, T, AllowItem, LossItem, Num).

fuse(Id, HandBookId, BaseIdList, AttrId,
     Role = #role{p_bag =
                      Pbag = #package{next_id = RtnId}}) ->
    case check_fuse([handbook, item, loss],
                    Id,
                    HandBookId,
                    BaseIdList,
                    Role,
                    [])
        of
        [{loss, LossItem},
         {lev, _Levs},
         {need_times, NeedTimes}] ->
            role:send_buff_begin(),
            {ok, Item = #item{extra = Extra, base_id = BaseId}} =
                package:find(by_id, Id, Pbag),
            Loss = format:val_to_loss(LossItem),
            logger:debug("~w:~w", [Extra, LossItem], handbook, 562),
            case do_fuse(Item, AttrId, NeedTimes) of
                {ok, GainItem = #item{}} ->
                    logger:debug("~w", [GainItem], handbook, 565),
                    LossGain = [#gain{label = items, val = [GainItem]}] ++
                                   Loss,
                    case lists:keytake(7, 1, Extra) of
                        {value, {_, Times, ""}, OtherList}
                            when Times > NeedTimes ->
                            case role_gain:do(LossGain, Role) of
                                {false, #loss{}} ->
                                    role:send_buff_clean(),
                                    {false, lang:get("材料不足{face_1,2}")};
                                {false, #gain{reason = bag_full}} ->
                                    role:send_buff_clean(),
                                    Msg = lang:get("背包空间不足，清理后再来吧{face_1,2}"),
                                    {false, Msg};
                                {ok,
                                 NRole1 = #role{p_bag =
                                                    NPbag = #package{items =
                                                                         Items}}} ->
                                    NewItem = Item#item{extra =
                                                            [{7,
                                                              Times - NeedTimes,
                                                              ""}
                                                             | OtherList],
                                                        bind = 1},
                                    NewItems = lists:keystore(Id,
                                                              #item.id,
                                                              Items,
                                                              NewItem),
                                    package:push_item_info(update,
                                                           Role,
                                                           [{1, NewItem}]),
                                    NewPbag = NPbag#package{items = NewItems},
                                    NRole2 = NRole1#role{p_bag = NewPbag,
                                                         is_gain = true},
                                    role:send_buff_flush(),
                                    Msg = notice:format(lang:get("获得了高级~ts"),
                                                        [{item_2, BaseId}]),
                                    notice:send(NRole2, 3, Msg),
                                    {true, lang:get("升级成功"), RtnId, NRole2};
                                _Err ->
                                    logger:error("~w", [_Err], handbook, 588),
                                    role:send_buff_clean(),
                                    {false, lang:get("升级失败")}
                            end;
                        {value, {_, Times, ""}, _} when Times =:= NeedTimes ->
                            case role_gain:do_notice([#loss{label = item_id,
                                                            val = [{Id, 1}]}
                                                      | LossGain],
                                                     Role)
                                of
                                {false, #loss{}} ->
                                    role:send_buff_clean(),
                                    {false, lang:get("材料不足{face_1,2}")};
                                {false, #gain{reason = bag_full}} ->
                                    role:send_buff_clean(),
                                    Msg = lang:get("背包空间不足，清理后再来吧{face_1,2}"),
                                    {false, Msg};
                                {ok, NewRole} ->
                                    role:send_buff_flush(),
                                    {true, lang:get("升级成功"), RtnId, NewRole};
                                _Err ->
                                    logger:error("~w", [_Err], handbook, 605),
                                    role:send_buff_clean(),
                                    {false, lang:get("升级失败")}
                            end
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("未知原因不能升级，请联系gm")}
    end.

do_fuse(#item{extra = Extra, base_id = BaseId}, AttrId,
        NeedTimes) ->
    case item:make(BaseId, 1, 1) of
        {ok, [Item = #item{}]} ->
            {NExtra, NLev} = case lists:keyfind(32, 1, Extra) of
                                 {_, Levs, ""} ->
                                     {lists:keystore(32,
                                                     1,
                                                     Extra,
                                                     {32, Levs + 1, ""}),
                                      Levs + 1};
                                 _ ->
                                     {lists:keystore(32, 1, Extra, {32, 1, ""}),
                                      1}
                             end,
            NExtra1 = make_lev_extra(NExtra, AttrId, NLev),
            NExtra2 = lists:keystore(7,
                                     1,
                                     NExtra1,
                                     {7, NeedTimes, ""}),
            logger:debug("~w", [NExtra2], handbook, 630),
            {ok, Item#item{extra = NExtra2}};
        _Msg ->
            logger:error("~w", [_Msg], handbook, 633),
            {false, lang:get("生成道具失败")}
    end.

make_attr(Id, AttrId,
          Role = #role{p_bag = Pbag = #package{items = Items}}) ->
    case package:find(by_id, Id, Pbag) of
        {ok, Item = #item{extra = Extra, base_id = BaseId}} ->
            case item_data:get(BaseId) of
                #item_base{effect = [{52, {HandBookId, _}} | _]} ->
                    case handbook_data:get(HandBookId) of
                        #handbook_base{fuse_flag = 0} ->
                            {false, lang:get("该道具不能设置升级属性")};
                        #handbook_base{} ->
                            ItemLev = case lists:keyfind(32, 1, Extra) of
                                          {_, Levs, ""} -> Levs;
                                          _ -> 0
                                      end,
                            NExtra = make_lev_extra(Extra, AttrId, ItemLev),
                            logger:debug("~w", [NExtra], handbook, 652),
                            NewItem = Item#item{extra = NExtra, bind = 1},
                            NewItems = lists:keystore(Id,
                                                      #item.id,
                                                      Items,
                                                      NewItem),
                            package:push_item_info(update,
                                                   Role,
                                                   [{1, NewItem}]),
                            NewPbag = Pbag#package{items = NewItems},
                            NRole2 = Role#role{p_bag = NewPbag, is_gain = true},
                            {true, lang:get("设置成功"), NRole2};
                        _ -> {false, lang:get("找不到幻化类型")}
                    end;
                _ -> {false, lang:get("不是幻化果道具")}
            end;
        _ ->
            logger:error("~w", [Id], handbook, 666),
            {false, lang:get("没找到该道具")}
    end.

make_lev_extra(Extra, Attr, Lev) ->
    Lable = case Lev of
                1 -> 33;
                2 -> 34;
                _ -> 35
            end,
    lists:keystore(Lable, 1, Extra, {Lable, Attr, ""}).

add_lev_buff(Lev, _, _, Buff) when Lev =< 0 ->
    {ok, Buff};
add_lev_buff(Lev, Extra, HandBookId,
             Buff = #buff_base{dynamic_attr = AttrList}) ->
    logger:debug("~w", [{Lev, HandBookId}], handbook, 681),
    {Lable, Val} = case Lev of
                       1 ->
                           #handbook_base{lev_num1 = LevNum1} =
                               handbook_data:get(HandBookId),
                           {33, LevNum1};
                       2 ->
                           #handbook_base{lev_num2 = LevNum2} =
                               handbook_data:get(HandBookId),
                           {34, LevNum2};
                       _ ->
                           #handbook_base{lev_num3 = LevNum3} =
                               handbook_data:get(HandBookId),
                           {35, LevNum3}
                   end,
    case lists:keyfind(Lable, 1, Extra) of
        {Lable, AttrId, ""} ->
            NBuff = case lists:keyfind(AttrId, 1, AttrList) of
                        {AttrId, OVal} ->
                            Buff#buff_base{dynamic_attr =
                                               lists:keystore(AttrId,
                                                              1,
                                                              AttrList,
                                                              {AttrId,
                                                               OVal + Val})};
                        _ ->
                            Buff#buff_base{dynamic_attr =
                                               [{AttrId, Val} | AttrList]}
                    end,
            logger:debug("~w:~w:~w",
                         [Lev, AttrId, Val],
                         handbook,
                         702),
            add_lev_buff(Lev - 1, Extra, HandBookId, NBuff);
        _ ->
            logger:error("道具升级属性有误~w:~w",
                         [Lable, Extra],
                         handbook,
                         705),
            add_lev_buff(Lev - 1, Extra, HandBookId, Buff)
    end.

check_fuse([handbook | T], Id, HandBookId, _BaseIdList,
           Role = #role{m_handbook =
                            #m_handbook{book_list = BookList}},
           Rtn) ->
    case lists:keyfind(HandBookId, #handbook.id, BookList)
        of
        #handbook{star_step = Star} when Star < 1 ->
            {false, lang:get("图鉴升星才能进行合成")};
        #handbook{} ->
            check_fuse(T, Id, HandBookId, _BaseIdList, Role, Rtn);
        _ -> {false, lang:get("图鉴升星才能进行合成哦")}
    end;
check_fuse([item | T], Id, HandBookId, BaseIdList,
           Role = #role{p_bag = Bag}, _Rtn) ->
    case package:find(by_id, Id, Bag) of
        {ok, #item{extra = Extra, base_id = BaseId}} ->
            case handbook_data:get(HandBookId) of
                #handbook_base{illusion_id = IllusionId,
                               times = NeedTimes}
                    when IllusionId =:= BaseId ->
                    case lists:keyfind(7, 1, Extra) of
                        {_, Times, ""} when Times >= NeedTimes ->
                            case lists:keyfind(32, 1, Extra) of
                                {_, Levs, ""} when Levs >= 3 ->
                                    {false, lang:get("该幻化果已经是最高等级了, 不用再升级了")};
                                {_, Levs, ""} ->
                                    check_fuse(T,
                                               Id,
                                               HandBookId,
                                               BaseIdList,
                                               Role,
                                               [{lev, Levs},
                                                {need_times, NeedTimes}]);
                                _ ->
                                    check_fuse(T,
                                               Id,
                                               HandBookId,
                                               BaseIdList,
                                               Role,
                                               [{lev, 0},
                                                {need_times, NeedTimes}])
                            end;
                        _ ->
                            {false,
                             util:flist("道具剩余使用数量不足~w次, 无法合成高级幻化果",
                                        [NeedTimes])}
                    end;
                _ -> {false, lang:get("不是所需的幻化道具，不能合成")}
            end;
        _ -> {false, lang:get("未发现物品")}
    end;
check_fuse([loss | T], Id, HandBookId, BaseIdList, Role,
           [{lev, Lev} | _] = Rtn) ->
    #handbook_base{fuse_id = FuseId, fuse_num1 = FuseNum1,
                   fuse_num2 = FuseNum2, fuse_num3 = FuseNum3,
                   universal = Universal} =
        handbook_data:get(HandBookId),
    FuseNum = case Lev of
                  0 -> FuseNum1;
                  1 -> FuseNum2;
                  2 -> FuseNum3
              end,
    case calc_loss_fuse(FuseId,
                        BaseIdList,
                        FuseNum,
                        Universal)
        of
        {ok, LossItem} ->
            check_fuse(T,
                       Id,
                       HandBookId,
                       BaseIdList,
                       Role,
                       [{loss, LossItem} | Rtn]);
        {false, Reason} -> {false, Reason}
    end;
check_fuse([], _Id, _HandBookId, _BaseIdList, _Role,
           Rtn) ->
    Rtn.

calc_loss_fuse(FuseId, BaseIdList, FuseNum,
               Universal) ->
    logger:debug("~w", [BaseIdList], handbook, 758),
    Msg = notice:format(lang:get("~ts不足{face_1,2}"),
                        [{item_2, FuseId}]),
    case lists:keyfind(FuseId, 1, BaseIdList) of
        {FuseId, Num} ->
            case Num < FuseNum of
                true when Universal =:= 1 ->
                    case lists:keyfind(28607, 1, BaseIdList) of
                        {28607, UniNum} ->
                            case UniNum + Num >= FuseNum of
                                true when Num =:= 0 -> {ok, [{28607, FuseNum}]};
                                true ->
                                    {ok,
                                     [{FuseId, Num}, {28607, FuseNum - Num}]};
                                _ -> {false, Msg}
                            end;
                        _ -> {false, Msg}
                    end;
                true -> {false, Msg};
                _ -> {ok, [{FuseId, FuseNum}]}
            end;
        _ -> {false, Msg}
    end.

