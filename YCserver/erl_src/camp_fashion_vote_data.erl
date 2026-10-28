-file("src/data/camp_fashion_vote_data.erl", 1).

-module(camp_fashion_vote_data).

-export([get_etc_config/0,
         group_list/0,
         group_id_list/0,
         get_group/3]).

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

-file("src/data/camp_fashion_vote_data.erl", 16).

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

-file("src/data/camp_fashion_vote_data.erl", 17).

group_list() ->
    [{1,
      51098,
      lang:get("森之精灵"),
      0,
      0,
      [{1, 51098}, {2, 50098}, {3, 53062}],
      [{29577, 0, 1}]},
     {1,
      51099,
      lang:get("森之精灵"),
      1,
      0,
      [{1, 51099}, {2, 50099}, {3, 53063}],
      [{29578, 0, 1}]},
     {2,
      51088,
      lang:get("春意暖暖"),
      0,
      0,
      [{1, 51088}, {2, 50088}, {3, 53005}],
      [{29540, 0, 1}]},
     {2,
      51089,
      lang:get("春意暖暖"),
      1,
      0,
      [{1, 51089}, {2, 50089}, {3, 53005}],
      [{29541, 0, 1}]},
     {3,
      51072,
      lang:get("星空幻想"),
      0,
      0,
      [{1, 51072}, {2, 50072}, {3, 53012}],
      [{29399, 0, 1}]},
     {3,
      51073,
      lang:get("星空幻想"),
      1,
      0,
      [{1, 51073}, {2, 50073}, {3, 53030}],
      [{29400, 0, 1}]},
     {4,
      51076,
      lang:get("炽热蔷薇"),
      0,
      0,
      [{1, 51076}, {2, 50076}, {3, 53031}],
      [{29433, 0, 1}]},
     {4,
      51075,
      lang:get("狼爵绅士"),
      1,
      0,
      [{1, 51075}, {2, 50075}, {3, 53054}],
      [{29449, 0, 1}]},
     {5,
      51090,
      lang:get("森灵贵族"),
      0,
      0,
      [{1, 51090}, {2, 50090}, {3, 53060}],
      [{29544, 0, 1}]},
     {5,
      51091,
      lang:get("森灵贵族"),
      1,
      0,
      [{1, 51091}, {2, 50091}, {3, 53057}],
      [{29545, 0, 1}]},
     {6,
      51096,
      lang:get("青葱岁月"),
      0,
      0,
      [{1, 51096}, {2, 50096}, {3, 53025}],
      [{29552, 0, 1}]},
     {6,
      51097,
      lang:get("青葱岁月"),
      1,
      0,
      [{1, 51097}, {2, 50097}, {3, 53067}],
      [{29553, 0, 1}]},
     {7,
      51062,
      lang:get("潇洒人生"),
      0,
      0,
      [{1, 51062}, {2, 50062}, {3, 53029}],
      [{29352, 0, 1}]},
     {7,
      51083,
      lang:get("潇洒人生"),
      1,
      0,
      [{1, 51083}, {2, 50083}, {3, 53013}],
      [{29467, 0, 1}]},
     {8,
      51064,
      lang:get("萌萌喵宝"),
      0,
      0,
      [{1, 51064}, {2, 50064}, {3, 53025}],
      [{29357, 0, 1}]},
     {8,
      51065,
      lang:get("萌萌喵宝"),
      1,
      0,
      [{1, 51065}, {2, 50065}, {3, 53072}],
      [{29358, 0, 1}]}].

group_id_list() -> [1, 2, 3, 4, 5, 6, 7, 8].

get_etc_config() ->
    [#{camp_id => 842,
       show_start_time => {2019, 2, 27, 0, 0, 0},
       notice_time => {2019, 2, 27, 0, 0, 0},
       notice_title => lang:get("时装评选活动提醒"),
       notice_content =>
           lang:get("元月星辰人气时装评选活动将于<color='#ffff00'>今晚24时</color>结"
                    "束，拥有时装评选券的玩家快去为心仪的时装投上一票吧！"),
       vote_loss =>
           [{1, [{29929, 1}]},
            {2, [{29930, 1}]},
            {3, [{29931, 1}]}],
       vote_rewards => [{29943, 1, 1}], init_vote => 1,
       max_vote_reward => 1, init_invite => 4,
       reply_rewards => [], max_reply => 9999,
       max_reply_reward => 0,
       refresh_times =>
           [{2018, 1, 19, 9, 0, 30},
            {2018, 1, 20, 0, 0, 30},
            {2018, 1, 21, 0, 0, 30}],
       refresh_title => lang:get("时装评选券发放"),
       refresh_content =>
           lang:get("亲爱的玩家，以下是今日可进行时装评选的投票券，请查收"),
       refresh_rewards =>
           [{1, [{29929, 1, 1}]},
            {2, [{29930, 1, 1}]},
            {3, [{29931, 1, 1}]}],
       invite_rewards => [],
       lucky_title => lang:get("时装评选幸运儿名单公示"),
       lucky_content =>
           lang:get("星辰首届年度人气时装评选活动已圆满结束，以下玩家幸运爆棚，获得了时尚达人的眷顾，免费获得了"
                    "心仪的时装：\n#name#"),
       lucky_scroll =>
           lang:get("星辰人气时装评选已圆满结束，恭喜幸运儿免费获得自己心仪的时装，详情请查看邮件，感谢您的参与"
                    "{face_1,3}"),
       lucky_legend =>
           lang:get("星辰人气时装评选已圆满结束，恭喜幸运儿免费获得自己心仪的时装，详情请查看邮件，感谢您的参与"
                    "{face_1,3}")}].

get_group(GroupID, Classes, Sex)
    when GroupID =:= 1 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {lang:get("森之精灵"), [{29577, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 1 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {lang:get("森之精灵"), [{29578, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 2 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {lang:get("春意暖暖"), [{29540, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 2 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {lang:get("春意暖暖"), [{29541, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 3 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {lang:get("星空幻想"), [{29399, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 3 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {lang:get("星空幻想"), [{29400, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 4 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {lang:get("炽热蔷薇"), [{29433, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 4 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {lang:get("狼爵绅士"), [{29449, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 5 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {lang:get("森灵贵族"), [{29544, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 5 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {lang:get("森灵贵族"), [{29545, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 6 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {lang:get("青葱岁月"), [{29552, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 6 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {lang:get("青葱岁月"), [{29553, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 7 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {lang:get("潇洒人生"), [{29352, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 7 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {lang:get("潇洒人生"), [{29467, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 8 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {lang:get("萌萌喵宝"), [{29357, 0, 1}]};
get_group(GroupID, Classes, Sex)
    when GroupID =:= 8 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {lang:get("萌萌喵宝"), [{29358, 0, 1}]};
get_group(_, _, _) -> false.

