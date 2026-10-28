-file("src/mod/wedding/wedding_treasure.erl", 1).

-module(wedding_treasure).

-export([apply_show/2,
         apply_show_history_box/2,
         use/3,
         shop/2,
         use_history_box/3]).

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

-file("src/mod/wedding/wedding_treasure.erl", 18).

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

-file("src/mod/wedding/wedding_treasure.erl", 19).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/wedding/wedding_treasure.erl", 20).

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

-file("src/mod/wedding/wedding_treasure.erl", 21).

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

-file("src/mod/wedding/wedding_treasure.erl", 22).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/wedding/wedding_treasure.erl", 23).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/wedding/wedding_treasure.erl", 24).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/wedding/wedding_treasure.erl", 25).

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

-file("src/mod/wedding/wedding_treasure.erl", 26).

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

-file("src/mod/wedding/wedding_treasure.erl", 27).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/wedding/wedding_treasure.erl", 28).

-file("inc/trigger.hrl", 1).

-record(trigger,
        {id = 1 :: pos_integer(),
         label :: undefined | atom(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: list()}).

-record(evt_enter_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_ico, {id = 0 :: non_neg_integer()}).

-record(evt_close_guide, {id = 0 :: pos_integer()}).

-record(evt_guild, {}).

-record(evt_guild_leave, {val = 0}).

-record(evt_guild_war, {}).

-record(evt_battle_plot,
        {plot_id = 1 :: pos_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         role_name = "" :: bitstring(),
         role_pid :: undefined | pid()}).

-record(evt_plot,
        {id = 1 :: pos_integer(), type = 1 :: pos_integer()}).

-record(evt_shop_buy,
        {assets_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 0 :: 0..1,
         num = 0 :: non_neg_integer()}).

-record(evt_store_buy, {s_items = []}).

-record(evt_enchant,
        {base_id = 1 :: pos_integer(),
         pre_lev = 1 :: pos_integer(),
         lev = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer()}).

-record(evt_select, {type = 0 :: non_neg_integer()}).

-record(evt_guild_lev, {}).

-record(evt_skill_up, {id = 0, lev = 0}).

-record(evt_skill_unique_up, {id = 0, lev = 0}).

-record(evt_quest_treasure, {}).

-record(evt_fc,
        {val :: undefined | pos_integer(),
         now_val = 0 :: non_neg_integer()}).

-record(evt_wedding_score, {}).

-record(evt_wedding_req_agreed, {}).

-record(evt_wedding_marry, {}).

-record(evt_wedding_divorce, {}).

-record(evt_guard, {base_id = 0, num = 0}).

-record(evt_leave_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_move_map,
        {base_id = 1 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_dungeon_enter,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_exit,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_pass,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_kill_unit,
        {dun_id = 0, unit_id = 0}).

-record(evt_dungeon_unit_reward,
        {id = 0 :: non_neg_integer()}).

-record(evt_get_item,
        {base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_use_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_use_item_type,
        {type = 0 :: non_neg_integer()}).

-record(evt_del_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_gain_coin,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_coin, {val = 1 :: pos_integer()}).

-record(evt_loss_coin,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_gain_gold,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_loss_gold,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_loss_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_levup,
        {old_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(evt_logout, {}).

-record(evt_tower, {floor = 0, unit_id = 0}).

-record(evt_tower_floor, {floor = 0}).

-record(evt_glory, {lev_id = 0}).

-record(evt_reset_eqm, {type = 0}).

-record(evt_cli_loaded, {mod = 0 :: non_neg_integer()}).

-record(evt_eqm, {type = 0}).

-record(evt_pet_war, {base_id = 0}).

-record(evt_pet_skill, {base_id = 0}).

-record(evt_pet_rest, {base_id = 0}).

-record(evt_select_pet, {}).

-record(evt_get_pet,
        {base_id = 0,
         genre = 0,
         lev = 0,
         status = 0,
         is_catched = false,
         talent = 0}).

-record(evt_del_pet, {base_id = 0, num = 0}).

-record(evt_levup_pet,
        {pet_id = 0, base_id = 0, lev = 0}).

-record(evt_aptitude_pet, {base_id = 0, genre = 0}).

-record(evt_pick_flower, {id}).

-record(evt_send_flower,
        {num = 0, val = 0, base_id = 0, recv_id, items = []}).

-record(evt_recv_flower, {num = 0, val = 0, send_id}).

-record(evt_accept_quest, {id = 0 :: pos_integer()}).

-record(evt_commit_quest,
        {id = 0 :: pos_integer(), sec_type = 0}).

-record(evt_finish_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_guild_round, {}).

-record(evt_commit_quest_chain,
        {id = 0 :: pos_integer(), type = 0}).

-record(evt_giveup_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_del, {id = 0 :: pos_integer()}).

-record(evt_map_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_map_role_move,
        {role_id = {0, "", 0},
         role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         sx = 0 :: non_neg_integer(),
         sy = 0 :: non_neg_integer(),
         dx = 0 :: non_neg_integer(),
         dy = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer()}).

-record(evt_map_role_leave,
        {role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer()}).

-record(evt_combat_round,
        {round :: undefined | pos_integer(),
         self = [] :: [tuple()],
         opp = [] :: [tuple()]}).

-record(evt_combat_init,
        {self = [] :: [tuple()], opp = [] :: [tuple()]}).

-record(evt_kill_npc,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         origin_id = {1, 1} :: tuple(),
         ratio_val = 0,
         num = 1 :: pos_integer()}).

-record(evt_kill_npc_lose,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_kill_role_clone,
        {id = {0, "robot", 0}, ratio_val = 0}).

-record(evt_fight_unit,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_mount_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_unit_click,
        {id = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         name = "",
         pid,
         type = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         do_type = -1 :: integer()}).

-record(evt_online_time, {acc_time = 0, add_val = 0}).

-record(evt_battle_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         dun_id = 0 :: non_neg_integer(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         dun_role :: undefined | tuple()}).

-record(evt_battle_enter_map,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid :: undefined | pid(),
         map_base_id = 0 :: non_neg_integer()}).

-record(evt_battle_role_login,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(evt_battle_role_exit,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring()}).

-record(evt_battle_role_logout,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         ext_id = 0 :: non_neg_integer()}).

-record(evt_battle_unit_killed,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         role_list = [] ::
             [{role_id(), list(), undefined | pid()}]}).

-record(evt_battle_unit_picked,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 102 :: pos_integer(),
         action_type = 1 :: pos_integer(),
         map_base_id = 1,
         x = 1,
         y = 1,
         role_id = {1, "", 0},
         role_name = "",
         role_pid}).

-record(evt_battle_unit_die,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer()}).

-record(evt_create_unit,
        {unit_id = {1, 1}, base_id = 1, type = 1}).

-record(evt_team_join, {pid :: undefined | pid()}).

-record(evt_team_leave, {}).

-record(evt_team_away, {}).

-record(evt_team_follow, {}).

-record(evt_team_appoint, {status, leader_id}).

-record(evt_arena_fight, {}).

-record(evt_arena_win, {cup = 0}).

-record(evt_trial, {mode = 0}).

-record(evt_escort, {}).

-record(evt_friend, {num = 0}).

-record(evt_fairyland, {}).

-record(evt_fairyland_floor,
        {floor = 0, is_leader = 0}).

-record(evt_fairyland_box, {box_punish = 0}).

-record(evt_pet, {}).

-record(evt_pet_lev, {old_lev = 0, lev = 0}).

-record(evt_quest_offer_ring, {ring = 0, old_ring = 0}).

-record(evt_quest_offer_reward, {}).

-record(evt_qualifying_combat, {type = 0}).

-record(evt_qualifying_combat_over,
        {type = 0, win_flag = 0}).

-record(evt_guild_answer, {}).

-record(evt_parade, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_bind_buy,
        {base_id = 0,
         num = 0,
         init_price = 0,
         price = 0,
         margin = 0}).

-record(evt_market_gold_bind_sold,
        {base_id = 0, price = 0}).

-record(evt_kill_guild_robber, {}).

-record(evt_shipping_sail, {type = 0}).

-record(evt_shipping_commit, {type = 0, pack_type = 0}).

-record(evt_shipping_help, {}).

-record(evt_treasure, {base_id = 0}).

-record(evt_treasure_compass, {}).

-record(evt_guild_propagate, {}).

-record(evt_pay, {sn = "", gold = 0, source = 0}).

-record(evt_kill_treasure_ghost, {}).

-record(evt_pray, {}).

-record(evt_skill_prac_levup, {id = 0, lev = 0}).

-record(evt_skill_life_levup, {id = 0, lev = 0}).

-record(evt_skill_life_produce,
        {id = 0, base_id = 0, num = 0}).

-record(evt_blacksmith_embed, {num = 0}).

-record(evt_blacksmith_embed_lev, {lev = 0}).

-record(evt_blacksmith_enchant,
        {base_id = 0,
         is_succ = 0,
         luck_list = 0,
         is_protect = 0,
         all_lev = 0,
         pre_all_lev = 0,
         sum_lev = 0,
         pre_sum_lev = 0}).

-record(evt_guild_plant_mature, {}).

-record(evt_examination, {type = 1 :: 1..3}).

-record(evt_question_match, {score = 0}).

-record(evt_question_match_answer, {is_right = 0}).

-record(evt_question_match_mvp, {}).

-record(evt_question_match_last_right, {count = 0}).

-record(evt_warrior_fight, {win_flag = 0}).

-record(evt_warrior_reward, {win_flag = 0, score = 0}).

-record(evt_warrior, {}).

-record(evt_gold_league_fight, {win_flag = 0}).

-record(evt_gold_league_reward,
        {win_flag = 0, score = 0}).

-record(evt_gold_league, {}).

-record(evt_achievement, {id = 0}).

-record(evt_gain_achieve, {val = 0}).

-record(evt_gain_gold_bind,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_wing,
        {grade = 1 :: pos_integer(),
         growth = 1 :: pos_integer(),
         star = 0}).

-record(evt_wing_reset, {}).

-record(evt_wing_skill, {count = 0}).

-record(evt_wing_lev,
        {grade = 1 :: pos_integer(), star_lev = 0}).

-record(evt_fuse, {base_id = 0 :: non_neg_integer()}).

-record(evt_guild_post,
        {post = 0 :: non_neg_integer()}).

-record(evt_examination_answer,
        {is_right = 1 :: 1 | 2}).

-record(evt_pet_use_item, {base_id = 0}).

-record(evt_pet_repleace_skill, {}).

-record(evt_activity, {val = 0}).

-record(evt_pet_rename, {}).

-record(evt_pet_free, {}).

-record(evt_pet_stone_upgrade, {grade = 0}).

-record(evt_guard_upgrade_eqm, {}).

-record(evt_guard_reset_eqm, {}).

-record(evt_guard_embed_gem, {}).

-record(evt_friend_intimacy, {val = 0}).

-record(evt_friend_intimacy_camp,
        {val = 0, target_id = {0, "", 0}}).

-record(evt_friend_zone_photo, {}).

-record(evt_friend_zone_like, {val = 0}).

-record(evt_friend_zone_liked, {val = 0}).

-record(evt_friend_zone_like_baby, {val = 0}).

-record(evt_friend_zone_leave_trend, {}).

-record(evt_friend_zone_leave_trended, {val = 0}).

-record(evt_formation_lev, {id = 0, lev = 0}).

-record(evt_alchemy_produce, {item_list = []}).

-record(evt_alchemy_melt, {item_list = []}).

-record(evt_classes_challenge_order, {order = 0}).

-record(evt_classes_challenge_rank, {rank = 0}).

-record(evt_classes_challenge_up_rank, {rank = 0}).

-record(evt_market_silver_assets,
        {assets = coin, val = 0}).

-record(evt_market_silver_sold,
        {assets = [], sold_items = []}).

-record(evt_market_silver_buy, {num = 0}).

-record(evt_combat_statistics,
        {revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         use_item = 0,
         is_win = 0,
         is_die = 0,
         guard = [],
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0}).

-record(evt_honor, {id = 0}).

-record(evt_pre_honor, {pre_id = 0}).

-record(evt_fashion, {}).

-record(evt_gain_character, {val = 1 :: pos_integer()}).

-record(evt_campaign_unit_match, {val = 0}).

-record(evt_campaign_unit_heap2, {val = 0}).

-record(evt_campaign_unit_match_boss, {val = 0}).

-record(evt_campaign_unit_card, {val = 0}).

-record(evt_campaign_unit_card_boss, {val = 0}).

-record(evt_campaign_unit_order, {val = 0}).

-record(evt_campaign_unit_order_boss, {val = 0}).

-record(evt_campaign_unit_steal, {val = 0}).

-record(evt_campaign_unit_kill, {val = 0}).

-record(evt_campaign_unit_base, {val = 0}).

-record(evt_campaign_unit_kill_boss, {val = 0}).

-record(evt_campaign_unit_fox, {val = 0}).

-record(evt_qualifying, {}).

-record(evt_gain_guild, {val = 1 :: pos_integer()}).

-record(evt_guard_score,
        {val = 0 :: non_neg_integer()}).

-record(evt_constellation,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_constellation_score,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_roll,
        {point = 0 :: non_neg_integer(),
         reward = 0 :: non_neg_integer()}).

-record(evt_finish_marriage_question, {}).

-record(evt_commit_marriage_question, {}).

-record(evt_marriage_flower, {}).

-record(evt_finish_couple_question, {}).

-record(evt_finish_couple_task, {}).

-record(evt_commit_couple_question, {}).

-record(evt_couple_flower, {}).

-record(evt_cultivate_plant, {}).

-record(evt_guild_plant_irrigate, {}).

-record(evt_teacher_score_sum, {score = 0}).

-record(evt_teacher_student, {num = 0}).

-record(evt_finish_ask_question, {fun_type = 0}).

-record(evt_teacher_to_sudent, {id = {0, "", 0}}).

-record(evt_teacher, {num = 0}).

-record(evt_commit_ask_question, {}).

-record(evt_get_pet_item_skill_guide, {}).

-record(evt_brave_trial_order, {order = 0}).

-record(evt_shipping_dun, {flag = 0}).

-record(evt_consume, {gold = 0, source = 0}).

-record(evt_guild_hero, {}).

-record(evt_hero, {}).

-record(evt_lover_combat, {win_flag = 0}).

-record(evt_wedding_treasure, {base_id = 0}).

-record(evt_constellation_first, {base_id = 0}).

-record(evt_boss_first, {base_id = 0}).

-record(evt_quest_prac_help, {}).

-record(evt_arena_win_rate, {classes = 0, rate = 0}).

-record(evt_wedding_guest, {}).

-record(evt_dragon_boat, {camp_id = 0}).

-record(evt_dragon_boat_rank, {camp_id = 0, rank = 0}).

-record(evt_dragon_boat_cplt,
        {camp_id = 0, time_span = 0}).

-record(evt_mount_dye_diff, {dye_id = 0, val = 0}).

-record(evt_arena_cup, {cup = 0}).

-record(evt_arena_cup_target, {id = 0}).

-record(evt_arena_roll, {flag = 0, num = 0}).

-record(evt_achi_num, {id = 0, num = 0}).

-record(evt_dun_first, {id = 0, floor = 0}).

-record(evt_tournament_combat, {type = 0}).

-record(evt_comprehend_eqm, {}).

-record(evt_elf_combat, {}).

-record(evt_finish_goal, {id = 0}).

-record(evt_hide_seek, {}).

-record(evt_hide_seek_help, {}).

-record(evt_hide_seek_reward, {}).

-record(evt_camp_fruit, {base_id = 0, num = 0}).

-record(evt_camp_fruit_help, {base_id = 0, num = 0}).

-record(evt_camp_fruit_reward, {}).

-record(evt_tournament,
        {awesome_kill = 0,
         awesome_kill_num = 0,
         awesome_dmg = 0,
         awesome_heal = 0,
         awesome_control = 0,
         mvp = 0,
         rank_lev = 0,
         liked = 0 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer()}).

-record(evt_tournament_point,
        {rank_lev = 0, rank_point = 0}).

-record(evt_friend_circle,
        {photos = 0, mentions = 0, day_num = 0}).

-record(evt_friend_circle_liked, {num = 0, other = 0}).

-record(evt_friend_circle_like, {self = 0}).

-record(evt_friend_circle_commented,
        {num = 0, other = 0}).

-record(evt_friend_circle_comment, {self = 0}).

-record(evt_family_update, {type = 0, lev = 0}).

-record(evt_family, {lev = 0}).

-record(evt_family_env, {env = 0}).

-record(evt_family_self_magic_beans, {}).

-record(evt_family_help_magic_beans, {}).

-record(evt_family_furnishing, {type = 0, count = 0}).

-record(evt_own_mount, {status = 0, count = 0}).

-record(evt_mount_growth, {growth = 0}).

-record(evt_mount_appearand, {count = 0}).

-record(evt_mount_mange_pet, {}).

-record(evt_mount_lev, {lev = 0}).

-record(evt_mount_attr, {}).

-record(evt_everyday, {val = 0}).

-record(evt_campaign_reward,
        {type = 0, sec_type = 0, id = 0}).

-record(evt_wedding_day, {day = 0}).

-record(evt_lev_break, {}).

-record(evt_enjoy_moon, {}).

-record(evt_enjoy_moon_wish, {type = 1}).

-record(evt_join_glue_pudding, {}).

-record(evt_glue_pudding_answer, {result = 0}).

-record(evt_glue_pudding_win, {}).

-record(evt_join_kongming_lanterns, {camp_id = 0}).

-record(evt_kongming_lanterns_answer,
        {camp_id = 0, result = 0}).

-record(evt_kongming_lanterns_win, {camp_id = 0}).

-record(evt_join_mid_pudding, {}).

-record(evt_mid_pudding_answer, {result = 0}).

-record(evt_mid_pudding_win, {}).

-record(evt_mid_pudding_agenda, {}).

-record(evt_guild_dragon, {}).

-record(evt_lev_break_active, {}).

-record(evt_camp_cake_finish, {}).

-record(evt_camp_cake_exit, {}).

-record(evt_camp_cake_sub, {}).

-record(evt_national_wisdom, {}).

-record(evt_national_wisdom_right, {}).

-record(evt_national_wisdom_luckyer, {}).

-record(evt_campaign_bag_fill, {}).

-record(evt_rainbow_lottery_day, {}).

-record(evt_campaign_bag_reward, {}).

-record(evt_lev_break_exch, {val = 0}).

-record(evt_classes_modify_times, {times = 0}).

-record(evt_use_fruit_limit, {base_id = 0, lev = 0}).

-record(endless_challenge_cross, {wave = 0}).

-record(endless_challenge_card, {}).

-record(evt_camp_halloween, {}).

-record(evt_camp_halloween_rank, {win = 0, rank = 0}).

-record(evt_camp_halloween_first, {}).

-record(evt_sworn_finish, {times = 0}).

-record(evt_sworn_invite, {times = 0}).

-record(evt_sworn_defined_name, {times = 0}).

-record(evt_sworn_name, {times = 0}).

-record(evt_sworn_skill, {times = 0}).

-record(evt_other, {}).

-record(evt_guild_league_join, {}).

-record(evt_guild_league_cannon, {}).

-record(evt_guild_league_win, {}).

-record(evt_campaign_snow, {val = 0}).

-record(evt_child_info,
        {growth_type = 0, skills = [], talent_skills = []}).

-record(evt_child_eat, {base_id = 0, num = 0}).

-record(evt_child_study,
        {study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(evt_go_to_bed, {}).

-record(evt_child_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_child_deliver, {}).

-record(evt_child_grow, {stage}).

-record(evt_fashion_collect_lev, {lev = 0}).

-record(evt_maze, {times = 0}).

-record(evt_maze_sweep, {}).

-record(evt_maze_monster, {}).

-record(evt_maze_gold, {gold = 0}).

-record(evt_maze_monkey, {}).

-record(evt_maze_cat, {}).

-record(evt_may_day_bags, {}).

-record(evt_may_day_help, {}).

-record(evt_may_day_clean, {camp_id = 0}).

-record(evt_rencounter, {is_win = 0}).

-record(evt_rencounter_star,
        {rank_lev = 1, star = 0, total_star = 0}).

-record(evt_guild_siege_combat, {is_win = 0, star = 1}).

-record(evt_guild_dungeon, {}).

-record(evt_guild_pray, {}).

-record(evt_talisman, {type = 0, id = 0}).

-record(evt_camp_whiteday, {type = 0}).

-record(evt_camp_animal_chess, {}).

-record(evt_animal_chess_win, {}).

-record(evt_animal_chess_soldier, {}).

-record(evt_animal_chess_fail, {}).

-record(evt_animal_chess_coach_killed, {}).

-record(evt_animal_chess_kill_coach, {}).

-record(evt_animal_chess_kill_soldier, {}).

-record(evt_pet_add_point, {pet_id = 0, base_id = 0}).

-record(evt_combat_over,
        {combat_type = 0, win_flag = win}).

-record(evt_goodvoice, {}).

-record(evt_spirit_treasure_general, {}).

-record(evt_spirit_treasure_boss, {}).

-record(evt_spirit_treasure_offer_star, {star = 0}).

-record(evt_spirit_treasure_first_kill, {}).

-record(evt_spirit_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_general, {}).

-record(evt_oracle_treasure_boss, {}).

-record(evt_oracle_treasure_offer_star, {star = 0}).

-record(evt_oracle_treasure_first_kill, {}).

-record(evt_oracle_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_boss_times, {times = 0}).

-record(evt_camp_7_7th_point, {val = 0}).

-record(evt_chat_guild, {}).

-record(evt_guard_activate, {}).

-record(evt_exquisite_shelf_wave, {wave = 0}).

-record(evt_chat, {channel = undefined, content = ""}).

-record(evt_combat_wing_power, {val = 0}).

-record(evt_combat_sq_point,
        {combat_type = 0,
         is_win = lose,
         val = 0,
         unit_lev = 0}).

-record(evt_guild_dragon_times, {times = 0}).

-record(evt_guild_dragon_rank, {rank = 0}).

-record(evt_guild_dragon_total_point, {point = 0}).

-record(evt_exquisite_shelf_help, {}).

-record(evt_rushing_top_final_times, {final_times = 0}).

-record(g_evt_lev, {val = 0}).

-record(g_evt_member, {val = 0}).

-record(evt_expression, {}).

-record(evt_fuse_expression, {cost_item_id = 0}).

-record(evt_kingbadge,
        {base_id = 0 :: non_neg_integer()}).

-record(evt_sprog_mount, {}).

-record(evt_gods_duel_score, {score = 0}).

-record(evt_provocation_times, {}).

-record(evt_provocation_5v5, {}).

-record(evt_quest_offer_teacher, {}).

-record(evt_boss_teacher, {}).

-record(evt_constellation_kill, {}).

-record(evt_tower_teacher, {}).

-record(evt_gain_experience, {val = 0}).

-record(evt_provocation_use_horn, {}).

-record(evt_provocation_duel_win, {}).

-record(evt_provocation_duel_5v5_win, {}).

-record(evt_stars_trial,
        {base_id = 0,
         round = 99,
         use_item_num = 50,
         self_die_times = 0,
         pet_summon = 0,
         combat_formation = 0}).

-record(evt_stars_trial_combat_round, {dies = []}).

-record(evt_stars_trial_combat,
        {npc_dies = 0,
         after_die_done = 0,
         skill_use_times = []}).

-record(evt_camp_black_white_chess, {}).

-record(evt_black_white_chess_change_in_round,
        {change_num = 0}).

-record(evt_black_white_chess_win, {}).

-record(evt_black_white_chess_lose, {}).

-record(evt_black_white_chess_more_than_ops_chess,
        {num = 0}).

-record(evt_black_white_chess_draw_whitout_ask_draw,
        {}).

-record(evt_black_white_chess_win_remain_one_color, {}).

-record(evt_black_white_chess_lose_remain_one_color,
        {}).

-record(evt_canyon_summit_join, {}).

-record(evt_canyon_summit_cannon, {}).

-record(evt_canyon_summit_win, {}).

-record(evt_star_moon, {}).

-record(evt_truth_dare_join, {}).

-record(evt_truth_dare_lucky, {}).

-record(evt_truth_dare_lucky_choose, {type = 0}).

-record(evt_truth_dare_end, {type = 0}).

-record(evt_truth_dare_two_fail, {}).

-record(evt_truth_dare_one_shot, {}).

-record(evt_general_send_flower, {items = []}).

-file("src/mod/wedding/wedding_treasure.erl", 29).

use(_Role, _Item, Num) when Num =/= 1 ->
    {false, lang:get("每次只能开一个")};
use(Role = #role{id = RoleId, name = Name,
                 m_wedding = #m_wedding{lover_id = WedLoverId},
                 m_team = #m_team{pid = TeamPid, status = 1}, lev = Lev,
                 sex = Sex},
    Item = #item{base_id = BaseId, extra = Extra}, _Num)
    when is_pid(TeamPid) ->
    NowTime = var:get_var(Role, day, 44, 0),
    case check_pos(Role, Extra) of
        true ->
            case team:get_members(Role) of
                [_, _ | _] ->
                    {false, lang:get("队伍中存在第3者，不能让其他人知道你们两人的秘密哦")};
                [#team_mate{sex = LSex}] when Sex == LSex ->
                    {false, lang:get("需要组上你异性好友才能开启")};
                [#team_mate{id = LoverId}]
                    when LoverId =/= WedLoverId andalso NowTime >= 6 ->
                    {false,
                     notice:format(lang:get("今日使用同心宝藏次数已达~ts次，无法继续使用"),
                                   [{string_2, 5, 6}])};
                [#team_mate{id = LoverId, name = LoverName,
                            status = 2}] ->
                    IsFriend = friend:is_friend(RoleId, LoverId),
                    case role_query:attr(by_id,
                                         LoverId,
                                         [#role.lev, #role.pid, #role.m_var])
                        of
                        _ when IsFriend == false ->
                            {false, lang:get("需要异性好友才能挖掘同心宝藏哦")};
                        {ok, [LoverLev, _Pid, _]} when LoverLev < 20 ->
                            {false,
                             notice:format(lang:get("对方等级不足~ts级，不能参与"),
                                           [{string_2, 5, 20}])};
                        {ok, [LoverLev, Pid, Mvar]} ->
                            case get_mate_treasure_time(Mvar) of
                                {false, Reason} when LoverId =/= WedLoverId ->
                                    {false, Reason};
                                _ ->
                                    Max = 20,
                                    Pos = util:rand(1, Max),
                                    TmpRandList = wedding_data:get_box(BaseId),
                                    RandList = [I
                                                || I = #{min_lev := MinLev,
                                                         max_lev := MaxLev}
                                                       <- TmpRandList,
                                                   LoverLev >= MinLev andalso
                                                       LoverLev =< MaxLev,
                                                   Lev >= MinLev,
                                                   Lev =< MaxLev],
                                    #{item_id := GItemId, bind := GBind,
                                      num := GNum, is_cast := IsCast} =
                                        util:rand_list(RandList, weigth),
                                    NewItemId = item_type:special_id(GItemId),
                                    Gain = format:val_to_gain([{NewItemId,
                                                                GBind,
                                                                GNum}]),
                                    ShowList = show_table(RandList,
                                                          Max - 1,
                                                          []),
                                    Msg = notice:format(lang:get("获得~ts"),
                                                        [{item_2,
                                                          NewItemId,
                                                          GBind,
                                                          GNum}]),
                                    MapId = util:rand_list([10001,
                                                            10002,
                                                            10003,
                                                            10004,
                                                            10007]),
                                    {GetM, GetX, GetY} = case
                                                             map:rand_pos(MapId)
                                                             of
                                                             {X, Y} ->
                                                                 {MapId, X, Y};
                                                             _ ->
                                                                 util:rand_list([{10001,
                                                                                  306,
                                                                                  3507},
                                                                                 {10001,
                                                                                  2583,
                                                                                  3848},
                                                                                 {10001,
                                                                                  4957,
                                                                                  3680},
                                                                                 {10001,
                                                                                  445,
                                                                                  2565},
                                                                                 {10001,
                                                                                  4646,
                                                                                  704},
                                                                                 {10001,
                                                                                  841,
                                                                                  1033},
                                                                                 {10001,
                                                                                  2098,
                                                                                  1834},
                                                                                 {10001,
                                                                                  3617,
                                                                                  1816}])
                                                         end,
                                    NewExtra = [{4, GetM, ""},
                                                {5, GetX, ""},
                                                {6, GetY, ""}],
                                    {ok, NRole} = loss_treasure(Item#item{extra
                                                                              =
                                                                              NewExtra},
                                                                Role),
                                    MsgSys = notice:format(lang:get("开启~ts"),
                                                           [{item_2, BaseId}]),
                                    Result = case role_gain:do_notice(Gain,
                                                                      NRole,
                                                                      MsgSys)
                                                 of
                                                 {ok, NewRole} -> {ok, NewRole};
                                                 {false, #loss{}} ->
                                                     {false, lang:get("物品不足")};
                                                 _Err ->
                                                     Title = lang:get("开启同心宝藏"),
                                                     Content =
                                                         lang:get("开启同心宝藏时，背包已满"),
                                                     Items = [{NewItemId,
                                                               GBind,
                                                               GNum}],
                                                     mail:send(Role,
                                                               #{title => Title,
                                                                 content =>
                                                                     Content,
                                                                 items =>
                                                                     Items}),
                                                     {ok, Role}
                                             end,
                                    case Result of
                                        {ok, NewRole2} ->
                                            role:apply(async,
                                                       Pid,
                                                       {wedding_treasure,
                                                        apply_show,
                                                        [#{id => RoleId,
                                                           name => Name,
                                                           gain =>
                                                               {NewItemId,
                                                                GBind,
                                                                GNum},
                                                           use_item_id =>
                                                               BaseId,
                                                           show => ShowList,
                                                           msg => Msg,
                                                           pos => Pos}]}),
                                            sys_conn:pack_send(15018,
                                                               {1,
                                                                BaseId,
                                                                NewItemId,
                                                                GBind,
                                                                GNum,
                                                                ShowList,
                                                                Pos,
                                                                Msg,
                                                                20,
                                                                0}),
                                            case IsCast of
                                                1 ->
                                                    notice:cast(all,
                                                                4,
                                                                notice:format(lang:get("~ts与~ts爱意绵绵的开启了~ts，各获得~ts。{face_1,3}{face_1,3}"),
                                                                              [{role_1,
                                                                                Role},
                                                                               {role_1,
                                                                                LoverId,
                                                                                LoverName},
                                                                               {item_2,
                                                                                BaseId},
                                                                               {item_2,
                                                                                NewItemId,
                                                                                GBind,
                                                                                GNum}]));
                                                _ -> ignore
                                            end,
                                            notice:effect({role_pid, self()},
                                                          30076),
                                            notice:return(lang:get("恭喜你们，得到爱神的认可并且开启了同心宝藏！{face_1,3}")),
                                            notice:send(Role,
                                                        41,
                                                        notice:format(lang:get("~ts开启了~ts，获得了~ts"),
                                                                      [{role_2,
                                                                        LoverName},
                                                                       {item_2,
                                                                        BaseId},
                                                                       {item_2,
                                                                        [{NewItemId,
                                                                          GBind,
                                                                          GNum}]}])),
                                            notice:send(Role,
                                                        41,
                                                        notice:format(lang:get("~ts开启了~ts，获得了~ts"),
                                                                      [{role_2,
                                                                        Role},
                                                                       {item_2,
                                                                        BaseId},
                                                                       {item_2,
                                                                        [{NewItemId,
                                                                          GBind,
                                                                          GNum}]}])),
                                            NewRole3 = var:set_var(NewRole2,
                                                                   day,
                                                                   44,
                                                                   NowTime + 1),
                                            NewRole4 =
                                                role_trigger:fire(#evt_wedding_treasure{base_id
                                                                                            =
                                                                                            BaseId},
                                                                  NewRole3),
                                            NewRole5 =
                                                role_trigger:fire(#evt_treasure{base_id
                                                                                    =
                                                                                    BaseId},
                                                                  NewRole4),
                                            {ok, NewRole5};
                                        {false, Reason} -> {falsem, Reason}
                                    end
                            end;
                        _ -> {false, lang:get("对方没有在线")}
                    end;
                [#team_mate{}] -> {false, lang:get("让对方归队才能使用道具")};
                _ -> {false, lang:get("需要组上你异性好友再过来开启")}
            end;
        {false, Err} -> {false, Err}
    end;
use(#role{m_team = #m_team{pid = TeamPid}}, _Item, _Num)
    when is_pid(TeamPid) ->
    {false, lang:get("只能由队长使用同心宝藏哦")};
use(#role{}, _Item, _Num) ->
    {false, lang:get("同心宝藏与一名异性好友组队才可使用")}.

use_history_box(_Role, _Item, Num) when Num > 1 ->
    {false, lang:get("每次只能开一个")};
use_history_box(Role = #role{id = RoleId, name = Name,
                             m_team = #m_team{pid = TeamPid, status = 1},
                             lev = Lev},
                Item = #item{base_id = BaseId}, _Num)
    when is_pid(TeamPid) ->
    case wedding:lover(RoleId) of
        {ok,
         #lover{status = 3, lover_id = LoverId,
                time = WeddingTime, lover_name = LoverName,
                lover_lev = LoverLev}} ->
            case team:get_members(Role) of
                [_, _ | _] ->
                    {false, lang:get("队伍中存在第3者，不能让其他人知道你们两人的秘密哦")};
                [#team_mate{id = MateId}] when MateId =/= LoverId ->
                    {false, lang:get("需要同您的伴侣组队才能开启真爱永恒宝藏")};
                [#team_mate{pid = LoverPid, status = 2}] ->
                    Now = date:unixtime(),
                    Day = util:ceil((Now - WeddingTime) / 86400),
                    Month = min(max(0, util:floor(Day / 30)), 12),
                    TmpRandList = wedding_data:get_history_box({BaseId,
                                                                Month}),
                    RandList = [I
                                || I = #{min_lev := MinLev, max_lev := MaxLev}
                                       <- TmpRandList,
                                   LoverLev >= MinLev andalso
                                       LoverLev =< MaxLev,
                                   Lev >= MinLev, Lev =< MaxLev],
                    {Rewards, ScoreRewards, IsCast} = case
                                                          util:rand_list(RandList,
                                                                         weigth)
                                                          of
                                                          #{item_id := _GItemId,
                                                            bind := _GBind,
                                                            num := _GNum,
                                                            is_cast := _IsCast,
                                                            reward := Reward} ->
                                                              NewItemId =
                                                                  item_type:special_id(_GItemId),
                                                              {[{NewItemId,
                                                                 _GBind,
                                                                 _Num}],
                                                               Reward,
                                                               _IsCast};
                                                          _ErrCfg ->
                                                              logger:error("配置错误:~w",
                                                                           [_ErrCfg],
                                                                           wedding_treasure,
                                                                           153),
                                                              {[], [], 0}
                                                      end,
                    Gain = format:val_to_gain(Rewards ++ ScoreRewards),
                    MapId = util:rand_list([10001,
                                            10002,
                                            10003,
                                            10004,
                                            10007]),
                    {GetM, GetX, GetY} = case map:rand_pos(MapId) of
                                             {X, Y} -> {MapId, X, Y};
                                             _ ->
                                                 util:rand_list([{10001,
                                                                  306,
                                                                  3507},
                                                                 {10001,
                                                                  2583,
                                                                  3848},
                                                                 {10001,
                                                                  4957,
                                                                  3680},
                                                                 {10001,
                                                                  445,
                                                                  2565},
                                                                 {10001,
                                                                  4646,
                                                                  704},
                                                                 {10001,
                                                                  841,
                                                                  1033},
                                                                 {10001,
                                                                  2098,
                                                                  1834},
                                                                 {10001,
                                                                  3617,
                                                                  1816}])
                                         end,
                    NewExtra = [{4, GetM, ""},
                                {5, GetX, ""},
                                {6, GetY, ""}],
                    {ok, NRole} = loss_treasure(Item#item{extra = NewExtra},
                                                Role),
                    MsgSys = notice:format(lang:get("开启~ts"),
                                           [{item_2, BaseId}]),
                    Result = case role_gain:do_notice(Gain, NRole, MsgSys)
                                 of
                                 {ok, NewRole} -> {ok, NewRole};
                                 {false, #loss{}} -> {false, lang:get("物品不足")};
                                 _Err ->
                                     Title = lang:get("开启同心宝藏"),
                                     Content = lang:get("开启同心宝藏时，背包已满"),
                                     mail:send(Role,
                                               #{title => Title,
                                                 content => Content,
                                                 items =>
                                                     Rewards ++ ScoreRewards}),
                                     {ok, Role}
                             end,
                    case Result of
                        {ok, NewRole2} ->
                            role:apply(async,
                                       LoverPid,
                                       {wedding_treasure,
                                        apply_show_history_box,
                                        [#{id => RoleId, name => Name,
                                           day => Day, gain => Rewards,
                                           score_gain => ScoreRewards,
                                           use_item_id => BaseId}]}),
                            case IsCast of
                                1 ->
                                    notice:cast(all,
                                                4,
                                                notice:format(lang:get("~ts与~ts爱意绵绵的开启了~ts，各获得~ts。{face_1,3}{face_1,3}"),
                                                              [{role_1, Role},
                                                               {role_1,
                                                                LoverId,
                                                                LoverName},
                                                               {item_2, BaseId},
                                                               {item_2,
                                                                Rewards}]));
                                _ -> ignore
                            end,
                            notice:effect({role_pid, self()}, 30076),
                            notice:send(Role,
                                        41,
                                        notice:format(lang:get("~ts开启了~ts，获得了~ts"),
                                                      [{role_2, LoverName},
                                                       {item_2, BaseId},
                                                       {item_2, Rewards}])),
                            notice:send(Role,
                                        41,
                                        notice:format(lang:get("~ts开启了~ts，获得了~ts"),
                                                      [{role_2, Name},
                                                       {item_2, BaseId},
                                                       {item_2, Rewards}])),
                            RewardTitle = lang:get("真爱永恒宝藏"),
                            RewardContent =
                                notice:format(lang:get("爱神见证了你们相爱相伴走过的~ts天，特赠送以下奖励:"),
                                              [{string_2, 1, Day}]),
                            NoticeReward = lists:map(fun ({ItemId, _, Count}) ->
                                                             {ItemId, Count};
                                                         ({Assets, Val}) ->
                                                             {Assets, Val}
                                                     end,
                                                     Rewards),
                            role:link_send(Role,
                                           9928,
                                           {RewardTitle,
                                            RewardContent,
                                            "",
                                            "",
                                            NoticeReward ++ ScoreRewards}),
                            {ok,
                             role_trigger:fire(#evt_wedding_treasure{base_id =
                                                                         BaseId},
                                               NewRole2)};
                        {false, Reason} -> {falsem, Reason}
                    end;
                [#team_mate{}] -> {false, lang:get("让对方归队才能使用道具")};
                _ -> {false, lang:get("需要同您的伴侣组队才能开启真爱永恒宝藏")}
            end;
        _Err -> {false, lang:get("您尚未结婚，不能使用真爱永恒宝藏")}
    end;
use_history_box(#role{m_team = #m_team{pid = TeamPid}},
                _Item, _Num)
    when is_pid(TeamPid) ->
    {false, lang:get("只能由队长使用同心宝藏哦")};
use_history_box(#role{}, _Item, _Num) ->
    {false, lang:get("真爱永恒宝藏必须与自己的伴侣才能开启")}.

get_mate_treasure_time(#m_var{day_vars = Vars}) ->
    Time = case lists:keyfind(44, 1, Vars) of
               {_, Val} -> Val;
               _ -> 0
           end,
    case Time >= 6 of
        true -> {false, lang:get("队员今日获得同心宝藏奖励已达3次，无法使用")};
        false -> true
    end.

shop(Role = #role{m_wedding =
                      #m_wedding{lover_id = LoverId}},
     OpType) ->
    sys_conn:pack_send(15019, {OpType, 1, ""}),
    role:pack_send(LoverId,
                   15019,
                   {OpType,
                    2,
                    notice:format(lang:get("~ts 确定"), [{role_1, Role}])}),
    ok.

apply_show(Role,
           #{name := LoverName, gain := {GItemId, GBind, GNum},
             use_item_id := BaseId, show := ShowList, msg := Msg,
             pos := Pos}) ->
    NewItemId = item_type:special_id(GItemId),
    Gain = format:val_to_gain([{NewItemId, GBind, GNum}]),
    Msg = notice:format(lang:get("获得~ts"),
                        [{item_2, GItemId, GBind, GNum}]),
    NewRole2 = case role_gain:do_notice(Gain,
                                        Role,
                                        lang:get("开启同心宝藏"))
                   of
                   {ok, NewRole} -> NewRole;
                   _Err ->
                       Title = lang:get("开启同心宝藏"),
                       Content = lang:get("开启同心宝藏时，背包已满"),
                       Items = [{GItemId, GBind, GNum}],
                       mail:send(Role,
                                 #{title => Title, content => Content,
                                   items => Items}),
                       Role
               end,
    NoticeTopMsg =
        notice:format(lang:get("恭喜你们，得到爱神的认可并且开启了~ts！祝你们<color='#ffff00'>永结同心"
                               "</color>哦～{face_1,3}"),
                      [{item_2, BaseId}]),
    notice:return(NoticeTopMsg),
    notice:send(Role,
                41,
                notice:format(lang:get("~ts开启了~ts，获得了~ts"),
                              [{role_2, LoverName},
                               {item_2, BaseId},
                               {item_2, [{GItemId, GBind, GNum}]}])),
    notice:send(Role,
                41,
                notice:format(lang:get("~ts开启了~ts，获得了~ts"),
                              [{role_2, Role},
                               {item_2, BaseId},
                               {item_2, [{GItemId, GBind, GNum}]}])),
    notice:effect({role_pid, self()}, 30076),
    sys_conn:pack_send(15018,
                       {2,
                        BaseId,
                        GItemId,
                        GBind,
                        GNum,
                        ShowList,
                        Pos,
                        Msg,
                        20,
                        0}),
    NowTime = var:get_var(NewRole2, day, 44, 0),
    NewRole3 = var:set_var(NewRole2, day, 44, NowTime + 1),
    {ok,
     role_trigger:fire(#evt_wedding_treasure{base_id =
                                                 BaseId},
                       NewRole3)}.

apply_show_history_box(Role,
                       #{name := LoverName, gain := Rewards,
                         score_gain := ScoreRewards, day := Day,
                         use_item_id := BaseId}) ->
    Gain = format:val_to_gain(Rewards ++ ScoreRewards),
    NewRole2 = case role_gain:do_notice(Gain,
                                        Role,
                                        lang:get("开启同心宝藏"))
                   of
                   {ok, NewRole} -> NewRole;
                   _Err ->
                       Title = lang:get("开启真爱永恒宝藏"),
                       Content = lang:get("开启真爱永恒宝藏时，背包已满"),
                       mail:send(Role,
                                 #{title => Title, content => Content,
                                   items => Rewards ++ ScoreRewards}),
                       Role
               end,
    RewardTitle = lang:get("真爱永恒宝藏"),
    RewardContent =
        notice:format(lang:get("爱神见证了你们相爱相伴走过的~ts天，特赠送以下奖励:"),
                      [{string_2, 1, Day}]),
    NoticeReward = lists:map(fun ({ItemId, _, Count}) ->
                                     {ItemId, Count};
                                 ({Assets, Val}) -> {Assets, Val}
                             end,
                             Rewards),
    role:link_send(Role,
                   9928,
                   {RewardTitle,
                    RewardContent,
                    "",
                    "",
                    NoticeReward ++ ScoreRewards}),
    notice:send(Role,
                41,
                notice:format(lang:get("~ts开启了~ts，获得了~ts"),
                              [{role_2, LoverName},
                               {item_2, BaseId},
                               {item_2, Rewards}])),
    notice:send(Role,
                41,
                notice:format(lang:get("~ts开启了~ts，获得了~ts"),
                              [{role_2, Role},
                               {item_2, BaseId},
                               {item_2, Rewards}])),
    notice:effect({role_pid, self()}, 30076),
    {ok,
     role_trigger:fire(#evt_wedding_treasure{base_id =
                                                 BaseId},
                       NewRole2)}.

show_table(_RandList, 0, List) -> List;
show_table([], 0, List) -> List;
show_table(RandList, Num, List) ->
    #{item_id := ItemId, bind := Bind, num := NNum} =
        util:rand_list(RandList, show_weigth),
    show_table(RandList,
               Num - 1,
               [{ItemId, Bind, NNum} | List]).

check_pos(#role{pos = #pos{map = Rmap, x = Rx, y = Ry}},
          Extra) ->
    {MapId1, X1, Y1} = case lists:keyfind(4, 1, Extra) of
                           {_, MapId, _} ->
                               case lists:keyfind(5, 1, Extra) of
                                   {_, X, _} ->
                                       case lists:keyfind(6, 1, Extra) of
                                           {_, Y, _} -> {MapId, X, Y};
                                           _ ->
                                               util:rand_list([{10001,
                                                                306,
                                                                3507},
                                                               {10001,
                                                                2583,
                                                                3848},
                                                               {10001,
                                                                4957,
                                                                3680},
                                                               {10001,
                                                                445,
                                                                2565},
                                                               {10001,
                                                                4646,
                                                                704},
                                                               {10001,
                                                                841,
                                                                1033},
                                                               {10001,
                                                                2098,
                                                                1834},
                                                               {10001,
                                                                3617,
                                                                1816}])
                                       end;
                                   _ ->
                                       util:rand_list([{10001, 306, 3507},
                                                       {10001, 2583, 3848},
                                                       {10001, 4957, 3680},
                                                       {10001, 445, 2565},
                                                       {10001, 4646, 704},
                                                       {10001, 841, 1033},
                                                       {10001, 2098, 1834},
                                                       {10001, 3617, 1816}])
                               end;
                           _ ->
                               util:rand_list([{10001, 306, 3507},
                                               {10001, 2583, 3848},
                                               {10001, 4957, 3680},
                                               {10001, 445, 2565},
                                               {10001, 4646, 704},
                                               {10001, 841, 1033},
                                               {10001, 2098, 1834},
                                               {10001, 3617, 1816}])
                       end,
    case MapId1 =:= Rmap andalso
             abs(Rx - X1) =< 300 andalso abs(Ry - Y1) =< 300
        of
        false -> {false, lang:get("离宝藏点还很远, 请靠近再使用")};
        true -> true
    end.

loss_treasure(Item = #item{quantity = Quantity,
                           id = ItemId, pos = Pos},
              Role = #role{p_bag =
                               Pbag = #package{items = Items,
                                               free_cell = FreeCell}}) ->
    NewQuantity = Quantity - 1,
    NewItem = Item#item{quantity = NewQuantity},
    {NewItems, NewFreeCell} = case NewQuantity >= 1 of
                                  true ->
                                      package:push_item_info(update,
                                                             Role,
                                                             [{1, NewItem}]),
                                      {lists:keystore(ItemId,
                                                      #item.id,
                                                      Items,
                                                      NewItem),
                                       FreeCell};
                                  false ->
                                      package:push_item_info(del,
                                                             Role,
                                                             [{1, NewItem}]),
                                      {lists:keydelete(ItemId, #item.id, Items),
                                       [Pos | FreeCell]}
                              end,
    NewPbag = Pbag#package{items = NewItems,
                           free_cell = lists:sort(NewFreeCell)},
    NewRole = Role#role{p_bag = NewPbag, is_gain = true},
    NewRole1 = NewRole,
    {ok, NewRole1}.

