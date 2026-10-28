-file("src/mod/tournament/tournament_rank.erl", 1).

-module(tournament_rank).

-export([sort_group/1,
         sort_group_top_lev/1,
         sort_celebrity/1,
         list/3,
         list_celebrity/2]).

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

-file("src/mod/tournament/tournament_rank.erl", 17).

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

-file("src/mod/tournament/tournament_rank.erl", 18).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
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

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/mod/tournament/tournament_rank.erl", 19).

sort_group(L) ->
    {L126s, L5} = lists:partition(fun
                                      (#tournament_profile{lev = Lev}) ->
                                          Lev >= 126
                                  end,
                                  L),
    {L116s, L4} = lists:partition(fun
                                      (#tournament_profile{lev = Lev}) ->
                                          Lev >= 116
                                  end,
                                  L5),
    {L106s, L1} = lists:partition(fun
                                      (#tournament_profile{lev = Lev}) ->
                                          Lev >= 106
                                  end,
                                  L4),
    {L101s, L2} = lists:partition(fun
                                      (#tournament_profile{lev = Lev}) ->
                                          Lev >= 101
                                  end,
                                  L1),
    {L90s, L3} = lists:partition(fun
                                     (#tournament_profile{lev = Lev}) ->
                                         Lev >= 90
                                 end,
                                 L2),
    {L80s, L70s} = lists:partition(fun
                                       (#tournament_profile{lev = Lev}) ->
                                           Lev >= 80
                                   end,
                                   L3),
    L126s1 = util:keys_sort([#tournament_profile.rank_point,
                             #tournament_profile.rank_lev],
                            L126s),
    L126s2 = lists:sublist(L126s1, 100),
    Last126 = case L126s2 of
                  [] -> false;
                  _ -> lists:last(L126s2)
              end,
    L116s1 = util:keys_sort([#tournament_profile.rank_point,
                             #tournament_profile.rank_lev],
                            L116s),
    L116s2 = lists:sublist(L116s1, 100),
    Last116 = case L116s2 of
                  [] -> false;
                  _ -> lists:last(L116s2)
              end,
    L106s1 = util:keys_sort([#tournament_profile.rank_point,
                             #tournament_profile.rank_lev],
                            L106s),
    L106s2 = lists:sublist(L106s1, 100),
    Last106 = case L106s2 of
                  [] -> false;
                  _ -> lists:last(L106s2)
              end,
    L101s1 = util:keys_sort([#tournament_profile.rank_point,
                             #tournament_profile.rank_lev],
                            L101s),
    L101s2 = lists:sublist(L101s1, 100),
    Last101 = case L101s2 of
                  [] -> false;
                  _ -> lists:last(L101s2)
              end,
    L90s1 = util:keys_sort([#tournament_profile.rank_point,
                            #tournament_profile.rank_lev],
                           L90s),
    L90s2 = lists:sublist(L90s1, 100),
    Last90 = case L90s2 of
                 [] -> false;
                 _ -> lists:last(L90s2)
             end,
    L80s1 = util:keys_sort([#tournament_profile.rank_point,
                            #tournament_profile.rank_lev],
                           L80s),
    L80s2 = lists:sublist(L80s1, 100),
    Last80 = case L80s2 of
                 [] -> false;
                 _ -> lists:last(L80s2)
             end,
    L70s1 = util:keys_sort([#tournament_profile.rank_point,
                            #tournament_profile.rank_lev],
                           L70s),
    L70s2 = lists:sublist(L70s1, 100),
    Last70 = case L70s2 of
                 [] -> false;
                 _ -> lists:last(L70s2)
             end,
    [{70, L70s2},
     {80, L80s2},
     {90, L90s2},
     {101, L101s2},
     {106, L106s2},
     {116, L116s2},
     {126, L126s2},
     {{70, last}, Last70},
     {{80, last}, Last80},
     {{90, last}, Last90},
     {{101, last}, Last101},
     {{106, last}, Last106},
     {{116, last}, Last116},
     {{126, last}, Last126}].

sort_group_top_lev(L) ->
    {L126s, L5} = lists:partition(fun
                                      (#tournament_profile{lev = Lev}) ->
                                          Lev >= 126
                                  end,
                                  L),
    {L116s, L4} = lists:partition(fun
                                      (#tournament_profile{lev = Lev}) ->
                                          Lev >= 116
                                  end,
                                  L5),
    {L106s, L1} = lists:partition(fun
                                      (#tournament_profile{lev = Lev}) ->
                                          Lev >= 106
                                  end,
                                  L4),
    {L101s, L2} = lists:partition(fun
                                      (#tournament_profile{lev = Lev}) ->
                                          Lev >= 101
                                  end,
                                  L1),
    {L90s, L3} = lists:partition(fun
                                     (#tournament_profile{lev = Lev}) ->
                                         Lev >= 90
                                 end,
                                 L2),
    {L80s, L70s} = lists:partition(fun
                                       (#tournament_profile{lev = Lev}) ->
                                           Lev >= 80
                                   end,
                                   L3),
    L126s1 = util:keys_sort([#tournament_profile.rank_lev,
                             #tournament_profile.rank_point],
                            L126s),
    {L126s2, L126s3} = reset_top_lev(L126s1, [], [], 1),
    Last126 = case L126s2 of
                  [] -> false;
                  _ -> lists:last(L126s2)
              end,
    L116s1 = util:keys_sort([#tournament_profile.rank_lev,
                             #tournament_profile.rank_point],
                            L116s),
    {L116s2, L116s3} = reset_top_lev(L116s1, [], L126s3, 1),
    Last116 = case L116s2 of
                  [] -> false;
                  _ -> lists:last(L116s2)
              end,
    L106s1 = util:keys_sort([#tournament_profile.rank_lev,
                             #tournament_profile.rank_point],
                            L106s),
    {L106s2, L106s3} = reset_top_lev(L106s1, [], L116s3, 1),
    Last106 = case L106s2 of
                  [] -> false;
                  _ -> lists:last(L106s2)
              end,
    L101s1 = util:keys_sort([#tournament_profile.rank_lev,
                             #tournament_profile.rank_point],
                            L101s),
    {L101s2, L101s3} = reset_top_lev(L101s1, [], L106s3, 1),
    Last101 = case L101s2 of
                  [] -> false;
                  _ -> lists:last(L101s2)
              end,
    L90s1 = util:keys_sort([#tournament_profile.rank_lev,
                            #tournament_profile.rank_point],
                           L90s),
    {L90s2, L90s3} = reset_top_lev(L90s1, [], L101s3, 1),
    Last90 = case L90s2 of
                 [] -> false;
                 _ -> lists:last(L90s2)
             end,
    L80s1 = util:keys_sort([#tournament_profile.rank_lev,
                            #tournament_profile.rank_point],
                           L80s),
    {L80s2, L80s3} = reset_top_lev(L80s1, [], L90s3, 1),
    Last80 = case L80s2 of
                 [] -> false;
                 _ -> lists:last(L80s2)
             end,
    L70s1 = util:keys_sort([#tournament_profile.rank_lev,
                            #tournament_profile.rank_point],
                           L70s),
    {L70s2, L70s3} = reset_top_lev(L70s1, [], L80s3, 1),
    Last70 = case L70s2 of
                 [] -> false;
                 _ -> lists:last(L70s2)
             end,
    {[{70, L70s2},
      {80, L80s2},
      {90, L90s2},
      {101, L101s2},
      {106, L106s2},
      {116, L116s2},
      {126, L126s2},
      {{70, last}, Last70},
      {{80, last}, Last80},
      {{90, last}, Last90},
      {{101, last}, Last101},
      {{106, last}, Last106},
      {{116, last}, Last116},
      {{126, last}, Last126}],
     L70s3}.

reset_top_lev([], Rank, Changed, _) ->
    {lists:reverse(Rank), Changed};
reset_top_lev([P = #tournament_profile{rank_point =
                                           RankRp,
                                       rank_lev = Lv}
               | T],
              Rank, Changed, Order)
    when Order =< 100 ->
    NewOrder = Order + 1,
    NeedRp = case tournament_data:get(10) of
                 #{rank_point := Rp} -> Rp + 50;
                 _ -> 0
             end,
    case Lv >= 10 andalso RankRp >= NeedRp of
        true ->
            P1 = P#tournament_profile{rank_lev = 11,
                                      season_rank_lev = 11, best_rank_lev = 11,
                                      historical_high = 11},
            reset_top_lev(T, [P1 | Rank], [P1 | Changed], NewOrder);
        _ -> reset_top_lev(T, [P | Rank], Changed, NewOrder)
    end;
reset_top_lev([P = #tournament_profile{rank_lev = Lv}
               | T],
              Rank, Changed, Order) ->
    NewOrder = Order + 1,
    case Lv >= 11 of
        true ->
            P1 = P#tournament_profile{rank_lev = 10},
            reset_top_lev(T, Rank, [P1 | Changed], NewOrder);
        _ -> reset_top_lev(T, Rank, Changed, NewOrder)
    end.

sort_celebrity(Ranks) ->
    do_sort_celebrity(Ranks, lists:seq(1, 16), []).

do_sort_celebrity(_Rank, [], Result) -> Result;
do_sort_celebrity(Rank, [Type = 1 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_kill = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 2 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   win_count = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 3 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   combat_count = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 4 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_reverse = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 5 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = round((All - Win) / max(1, All) * 100)}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   win_count = Win, combat_count = All}
                   <- Rank],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 6 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_revive = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 7 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = round(Val / 10000)}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_dmg = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 8 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = round(Val / 10000)}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_bearing_dmg = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 9 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_zero_dmg = Val}
                   <- Rank,
               Classes < 4 andalso Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 10 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_pet_revive = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 11 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_mvp = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 12 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_awesome_kill = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 13 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_awesome_kill_num = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 14 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_awesome_dmg = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 15 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_awesome_heal = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]);
do_sort_celebrity(Rank, [Type = 16 | T], Result) ->
    List = [#tournament_celebrity{id = Id, name = Name,
                                  sex = Sex, classes = Classes, lev = Lev,
                                  val1 = Val}
            || #tournament_profile{id = Id, name = Name, sex = Sex,
                                   lev = Lev, classes = Classes,
                                   season_awesome_control = Val}
                   <- Rank,
               Val > 0],
    SortRank = {Type,
                lists:sublist(lists:reverse(lists:keysort(#tournament_celebrity.val1,
                                                          List)),
                              15)},
    do_sort_celebrity(Rank, T, [SortRank | Result]).

list(1, Key, _) ->
    case ets:lookup(tournament_rank, Key) of
        [{_, L}] -> L;
        _ -> []
    end;
list(2, Key, _) ->
    case ets:lookup(tournament_rank_local, Key) of
        [{_, L}] -> L;
        _ -> []
    end;
list(3, _, #role{id = Id}) ->
    Ids = friend:list_id(Id),
    list_profile(Ids).

list_celebrity(Type, 0) ->
    case ets:lookup(tournament_rank, Type) of
        [{_, L}] -> L;
        _ -> []
    end;
list_celebrity(Type, _) ->
    case ets:lookup(tournament_rank_local, Type) of
        [{_, L}] -> L;
        _ -> []
    end.

list_profile([]) -> [];
list_profile([Id | T]) ->
    case tournament_agent:get_profile(Id) of
        P = #tournament_profile{} -> [P | list_profile(T)];
        _ -> list_profile(T)
    end.

