-file("src/mod/redpacket/red_packet.erl", 1).

-module(red_packet).

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

-file("src/mod/redpacket/red_packet.erl", 10).

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

-file("src/mod/redpacket/red_packet.erl", 11).

-file("inc/red_packet.hrl", 1).

-record(red_packet,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         title = "" :: string(),
         assets_type = 0,
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list(),
         has_soul = 0}).

-record(red_packet_grab_log,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         time = 0,
         value = 0,
         is_item = 0}).

-file("src/mod/redpacket/red_packet.erl", 12).

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

-file("src/mod/redpacket/red_packet.erl", 13).

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

-file("src/mod/redpacket/red_packet.erl", 14).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/mod/redpacket/red_packet.erl", 15).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/redpacket/red_packet.erl", 16).

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

-file("src/mod/redpacket/red_packet.erl", 17).

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

-file("src/mod/redpacket/red_packet.erl", 18).

-export([push_red_packet_list/1,
         push_packet_info/2,
         rpc_send_red_packet/5,
         rpc_grab_red_packet/2,
         rpc_get_rain_red_packet/2]).

push_red_packet_list(Role = #role{id = RoleId}) ->
    {ok, SelfPackets, GetingPackets, NewDonePackets} =
        red_packet_mgr:get_red_packet_list(RoleId),
    Reply = SelfPackets ++ GetingPackets ++ NewDonePackets,
    IsOver = case SelfPackets of
                 [#red_packet{num = Num}] when Num =/= 0 -> 0;
                 _ -> 1
             end,
    role:link_send(Role, 18500, {IsOver, Reply}),
    ok.

push_packet_info(Role, RedPacket = #red_packet{}) ->
    role:link_send(Role, 18505, {RedPacket}),
    ok;
push_packet_info(Role, PacketId) ->
    case red_packet_mgr:get_red_packet(PacketId) of
        {ok, RedPacket} ->
            role:link_send(Role, 18505, {RedPacket}),
            ok;
        _ ->
            notice:send(Role, 1, lang:get("红包已经过期了")),
            ok
    end.

rpc_send_red_packet(Role = #role{id = RoleId}, Type,
                    Lev, Count, Title) ->
    case red_packet_mgr:call({query_packet, RoleId}) of
        {ok, #red_packet{type = PacketType, num = Num}}
            when Num > 0 ->
            case PacketType =/= 3 of
                true ->
                    red_packet_mgr:cast({repetition_send, RoleId}),
                    {ok, Role, lang:get("您发送了未领取完的红包")};
                false -> {false, lang:get("您发送的红包雨还未被抢完，请稍后再发红包吧")}
            end;
        _ ->
            case check_send_red_packet([count_range,
                                        title_msg,
                                        total_count,
                                        rain_count],
                                       Role,
                                       #{packet_type => Type, packet_lev => Lev,
                                         count => Count, title => Title})
                of
                {true, _Args} ->
                    case red_packet_data:get_red_packet({Type, Lev}) of
                        #{cost := Cost} ->
                            Loss = format:val_to_loss(Cost),
                            case role_gain:do_notice(Loss, Role) of
                                {ok, LossRole} ->
                                    case make_red_packet(Role,
                                                         Type,
                                                         Lev,
                                                         Count,
                                                         Title)
                                        of
                                        {false, Reason} -> {false, Reason};
                                        {ok, RedPacket} ->
                                            red_packet_mgr:cast({send_red_packet,
                                                                 RedPacket}),
                                            RtnMsg = case Type of
                                                         1 ->
                                                             lang:get("您成功向世界派发了拼手气红包");
                                                         2 ->
                                                             lang:get("您成功向世界派发了口令红包");
                                                         3 ->
                                                             lang:get("您成功向世界派发了红包雨");
                                                         _ -> lang:get("发送红包成功")
                                                     end,
                                            {ok, LossRole, RtnMsg}
                                    end;
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                _ -> {false, lang:get("您的钻石不足，不能发送红包")}
                            end;
                        _ -> {false, lang:get("该金额的红包暂时不能发送，请选择其他金额")}
                    end;
                {false, Reason} -> {false, Reason}
            end
    end.

rpc_grab_red_packet(#role{lev = Lev}, _RedPacketId)
    when Lev < 30 ->
    {false, lang:get("等级不足30级无法领取红包，加油升级吧")};
rpc_grab_red_packet(Role = #role{id = RoleId,
                                 name = Name, lev = Lev, classes = Classes,
                                 sex = Sex},
                    RedPacketId) ->
    case red_packet_mgr:call({grab_red_packet,
                              RoleId,
                              Name,
                              Lev,
                              Classes,
                              Sex,
                              RedPacketId})
        of
        {ok, Reward} ->
            SendName = case
                           red_packet_mgr:get_red_packet(RedPacketId)
                           of
                           {ok,
                            RedPacket = #red_packet{id = SendId,
                                                    name = _SendName,
                                                    type = PacketType}} ->
                               push_packet_info(Role, RedPacket),
                               case PacketType of
                                   1 ->
                                       role:pack_send(SendId,
                                                      18506,
                                                      {RoleId,
                                                       Lev,
                                                       Name,
                                                       Classes,
                                                       Sex,
                                                       date:unixtime(),
                                                       0,
                                                       0});
                                   _ -> skip
                               end,
                               util:flist(lang:get("~ts"), [_SendName]);
                           _ -> lang:get("")
                       end,
            case Reward of
                [{90000, Val}] when Val >= 300000 ->
                    Announce =
                        notice:format(lang:get("~ts豪气的甩出一个红包，~ts随手拆开获得银币~ts，这手气还有谁！"),
                                      [{role_2, SendName},
                                       {role_2, Name},
                                       {string_2, 1, Val}]),
                    notice:cast(all, 5, Announce, []);
                [{90003, Val}] when Val >= 5000 ->
                    Announce =
                        notice:format(lang:get("~ts豪气的甩出一个红包，~ts随手拆开获得金币~ts，这手气还有谁！"),
                                      [{role_2, SendName},
                                       {role_2, Name},
                                       {string_2, 1, Val}]),
                    notice:cast(all, 5, Announce, []);
                [{_, _, _}, {90000, Val}] when Val >= 300000 ->
                    Announce =
                        notice:format(lang:get("~ts豪气的甩出一个红包，~ts随手拆开获得银币~ts，这手气还有谁！"),
                                      [{role_2, SendName},
                                       {role_2, Name},
                                       {string_2, 1, Val}]),
                    notice:cast(all, 5, Announce, []);
                [{_, _, _}, {90003, Val}] when Val >= 500 ->
                    Announce =
                        notice:format(lang:get("~ts豪气的甩出一个红包，~ts随手拆开获得金币~ts，这手气还有谁！"),
                                      [{role_2, SendName},
                                       {role_2, Name},
                                       {string_2, 1, Val}]),
                    notice:cast(all, 5, Announce, []);
                _Else ->
                    logger:debug("==============:~w",
                                 [_Else],
                                 red_packet,
                                 136),
                    ok
            end,
            Gain = format:val_to_gain(Reward),
            case role_gain:do_notice(Gain, Role) of
                {ok, GainRole} -> {ok, GainRole, lang:get("恭喜，您抢到了红包")};
                _ ->
                    Title = lang:get("抢红包奖励"),
                    Content =
                        notice:format(lang:get("您以迅雷不及掩耳之势抢到了~ts世界红包，这是您的奖励:"),
                                      [{string_2, SendName}]),
                    mail:send(Role, Title, Content, Reward),
                    {ok, Role, lang:get("恭喜，您抢到了红包")}
            end;
        {false, Reason} -> {false, Reason}
    end.

rpc_get_rain_red_packet(#role{lev = Lev}, _)
    when Lev < 30 ->
    {false, lang:get("等级不足30级无法领取红包，加油升级吧")};
rpc_get_rain_red_packet(Role = #role{id = RoleId,
                                     name = Name, lev = Lev, classes = Classes,
                                     sex = Sex},
                        UnitId) ->
    NoticeChannel = case unit_mgr:info({48, UnitId}) of
                        {ok, #unit{pos = #pos{map = MapId}}} -> {map, MapId};
                        _Else -> all
                    end,
    case red_packet_mgr:call({grab_rain_packet,
                              RoleId,
                              Name,
                              Lev,
                              Classes,
                              Sex,
                              UnitId})
        of
        {ok, Reward, RedPacketId} ->
            RedPacket = case
                            red_packet_mgr:get_red_packet(RedPacketId)
                            of
                            {ok, _RedPacket = #red_packet{id = SendId}} ->
                                role:pack_send(SendId,
                                               18506,
                                               {RoleId,
                                                Lev,
                                                Name,
                                                Classes,
                                                Sex,
                                                date:unixtime(),
                                                0,
                                                0}),
                                _RedPacket;
                            _ -> #red_packet{}
                        end,
            #red_packet{name = SendName, total = TotalCount,
                        num = LeftCount} =
                RedPacket,
            case Reward of
                [{90000, Val}] when Val >= 300000 ->
                    Announce =
                        notice:format(lang:get("~ts豪气的甩出一个红包，~ts随手拆开获得银币~ts，这手气还有谁！"),
                                      [{role_2, SendName},
                                       {role_2, Name},
                                       {string_2, 1, Val}]),
                    notice:cast(all, 5, Announce, []);
                [{90003, Val}] when Val >= 5000 ->
                    Announce =
                        notice:format(lang:get("~ts豪气的甩出一个红包，~ts随手拆开获得金币~ts，这手气还有谁！"),
                                      [{role_2, SendName},
                                       {role_2, Name},
                                       {string_2, 1, Val}]),
                    notice:cast(all, 5, Announce, []);
                [{_, _, _}, {90000, Val}] when Val >= 300000 ->
                    Announce =
                        notice:format(lang:get("~ts豪气的甩出一个红包，~ts随手拆开获得银币~ts，这手气还有谁！"),
                                      [{role_2, SendName},
                                       {role_2, Name},
                                       {string_2, 1, Val}]),
                    notice:cast(all, 5, Announce, []);
                [{_, _, _}, {90003, Val}] when Val >= 500 ->
                    Announce =
                        notice:format(lang:get("~ts豪气的甩出一个红包，~ts随手拆开获得金币~ts，这手气还有谁！"),
                                      [{role_2, SendName},
                                       {role_2, Name},
                                       {string_2, 1, Val}]),
                    notice:cast(all, 5, Announce, []);
                _ -> ok
            end,
            case LeftCount > 0 of
                true ->
                    NoticeMsg =
                        notice:format(lang:get("~ts拾取了一个~ts发出的红包雨，当前剩余~ts"),
                                      [{role_2, Name},
                                       {role_2, SendName},
                                       {string_2,
                                        1,
                                        util:flist(lang:get("~w/~w"),
                                                   [LeftCount, TotalCount])}]),
                    notice:cast(NoticeChannel, 1, NoticeMsg);
                false -> ok
            end,
            Gain = format:val_to_gain(Reward),
            case role_gain:do_notice(Gain, Role) of
                {ok, GainRole} ->
                    push_packet_info(GainRole, RedPacket),
                    {ok, GainRole, lang:get("恭喜，您抢到了红包")};
                {false, _} ->
                    push_packet_info(Role, RedPacket),
                    Title = lang:get("抢红包奖励"),
                    Content =
                        notice:format(lang:get("您以迅雷不及掩耳之势抢夺到了~ts世界红包，这是您的奖励:"),
                                      [{string_2, SendName}]),
                    mail:send(Role, Title, Content, Reward),
                    {ok, Role, lang:get("恭喜，您抢到了红包")}
            end;
        {false, Reason} -> {false, Reason}
    end.

check_send_red_packet([], _Role, Args) -> {true, Args};
check_send_red_packet([Type | Rest], Role, Args) ->
    case check_send_red_packet(Type, Role, Args) of
        true -> check_send_red_packet(Rest, Role, Args);
        {true, NewArgs} ->
            check_send_red_packet(Rest, Role, NewArgs);
        {false, Reason} -> {false, Reason}
    end;
check_send_red_packet(total_count,
                      _Role = #role{id = RoleId}, _Args) ->
    case red_packet_mgr:get_red_packet_list(RoleId) of
        {ok, SelfRedPks, GetingPks, _DonePks} ->
            case length(SelfRedPks ++ GetingPks) >= 10 of
                true -> {false, lang:get("当前以后许多红包未抢完呢")};
                false -> true
            end;
        _ -> {false, lang:get("当前不能发送红包")}
    end;
check_send_red_packet(count_range, _Role,
                      #{packet_type := PacketType, packet_lev := PacketLev,
                        count := Count}) ->
    case red_packet_data:get_red_packet({PacketType,
                                         PacketLev})
        of
        #{min := Min, max := Max} ->
            case Count >= Min andalso Count =< Max of
                true -> true;
                false -> {false, lang:get("红包数量不在规定范围内无法发送")}
            end;
        _ -> {false, lang:get("红包数量不在规定范围内无法发送")}
    end;
check_send_red_packet(title_msg, _Role,
                      #{title := Title}) ->
    case util:check_text(Title, 16) of
        {false, Reason} -> {false, Reason};
        _Else -> true
    end;
check_send_red_packet(rain_count, _Role,
                      #{packet_type := PacketType}) ->
    case PacketType =:= 3 of
        true ->
            case red_packet_mgr:get_rain_packet_count() >= 2 of
                true -> {false, lang:get("当前红包雨以及遍布各地，大家以及拾取不过来了")};
                false -> true
            end;
        false -> true
    end.

make_red_packet(#role{id = RoleId, name = Name,
                      lev = RoleLev, classes = Classes, sex = Sex},
                Type, PacketLev, AssetsCount, Title) ->
    case red_packet_data:get_red_packet({Type, PacketLev})
        of
        #{assets := Assets, val := Val, is_soul := IsSoul} ->
            Ave = max(1, Val div AssetsCount div 3),
            L = [Ave || _I <- lists:duplicate(AssetsCount, 1)],
            Pks = gen_packets(Val - lists:sum(L), L),
            RedPks = case IsSoul of
                         1 ->
                             RewarList = [[{Assets, AsVal}] || AsVal <- Pks],
                             [LuckeyReward | Left] = RewarList,
                             NewLuckeyReward = [{23213, 0, 1} | LuckeyReward],
                             [NewLuckeyReward | Left];
                         0 -> [[{Assets, AsVal}] || AsVal <- Pks]
                     end,
            Now = date:unixtime(),
            RedPacket = #red_packet{id = RoleId, type = Type,
                                    name = Name, classes = Classes,
                                    lev = RoleLev, sex = Sex, title = Title,
                                    amount = Val, remain = Val,
                                    total = AssetsCount, num = AssetsCount,
                                    time = Now, assets_type = Assets,
                                    packs = RedPks, has_soul = IsSoul},
            {ok, RedPacket};
        _ -> {false, lang:get("获取红包配置错误")}
    end.

gen_packets(Amount, L) when Amount < 1 -> L;
gen_packets(Amount, L) ->
    O = util:rand_list(L),
    R = util:rand(1, max(1, Amount div 3)),
    NL = L -- [O],
    gen_packets(Amount - R, [O + R | NL]).

