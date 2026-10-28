-file("src/data/camp_rushing_top_data.erl", 1).

-module(camp_rushing_top_data).

-export([get_etc_config/0,
         question_list/1,
         season_id_list/0,
         get_season/1,
         get_question/1,
         get_offsex/1,
         get_rushing_gold/1,
         get_lost_reward/1]).

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

-file("src/data/camp_rushing_top_data.erl", 22).

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

-file("src/data/camp_rushing_top_data.erl", 23).

-file("inc/camp_rushing_top.hrl", 1).

-author("jia").

-record(camp_rushing_top_season_info,
        {season_id = 0,
         cur_index = 0,
         total_index = 0,
         question_group = 0,
         option_a = 0,
         option_b = 0,
         option_c = 0,
         gold = 0,
         final_num = 0,
         final_roles = [],
         gain_gold = 0,
         last_num = 0}).

-record(camp_rushing_top_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         is_sign = 0,
         in_map = 0,
         index = 0,
         option = 0,
         is_lost = 0,
         sign_times = 0,
         final_times = 0,
         revive_times = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0}).

-record(camp_rushing_top_question_base,
        {question_group = 0,
         question_index = 0,
         question = "",
         option_a = "",
         option_b = "",
         option_c = "",
         answer = 0}).

-file("src/data/camp_rushing_top_data.erl", 24).

get_etc_config() ->
    [#{min_lev => 40, question_time => 20,
       answer_time => 10, notice_time => 10, reward_time => 10,
       clean_time => 120, first_time => 20,
       ticket => [{26013, 1}], revive => [{26014, 1}],
       max_revive => 3, gold_id => 90026,
       rule =>
           lang:get("1.全民冲顶答题，答对12题可平分<color='#00ff00'>十万钻石</color"
                    ">奖金\n2.若不慎答错在规定时间内使用<color='#00ff00'>复活卡</col"
                    "or>可继续答题\n3.多余的入场券<color='#00ff00'>赠送好友</colo"
                    "r>，还可获得复活卡哟\n4.每场最多使用<color='#00ff00'>3张</col"
                    "or>复活卡，最终决胜题不能复活"),
       min_barrage => 60, info => lang:get("备注")}].

question_list(11) ->
    [#camp_rushing_top_question_base{question_group = 11,
                                     question_index = 1,
                                     question = lang:get("美国“自由女神”座落在哪个城市?"),
                                     option_a = lang:get("纽约"),
                                     option_b = lang:get("洛杉机"),
                                     option_c = lang:get("旧金山"), answer = 1},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 2,
                                     question = lang:get("世界上海拔最高的山峰是哪一座？"),
                                     option_a = lang:get("乔戈里峰"),
                                     option_b = lang:get("珠穆朗玛峰"),
                                     option_c = lang:get("公格尔山峰"), answer = 2},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 3,
                                     question = lang:get("古代“四大美女”西汉时期的是"),
                                     option_a = lang:get("西施"),
                                     option_b = lang:get("王昭君"),
                                     option_c = lang:get("貂蝉"), answer = 2},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 4,
                                     question = lang:get("“隐形飞机”是指什么样的飞机？"),
                                     option_a = lang:get("肉眼看不见"),
                                     option_b = lang:get("飞行太高看不见"),
                                     option_c = lang:get("雷达测不到\n "),
                                     answer = 3},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 5,
                                     question = lang:get("化学反应中最小的粒子是？"),
                                     option_a = lang:get("分子"),
                                     option_b = lang:get("原子"),
                                     option_c = lang:get("质子"), answer = 2},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 6,
                                     question = lang:get("“三峡水电站”位于长江哪？"),
                                     option_a = lang:get("上游"),
                                     option_b = lang:get("中游"),
                                     option_c = lang:get("下游"), answer = 1},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 7,
                                     question = lang:get("围棋比赛中是哪方先行？"),
                                     option_a = lang:get("黑方"),
                                     option_b = lang:get("白方"),
                                     option_c = lang:get("猜拳获胜先行"), answer = 1},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 8,
                                     question =
                                         lang:get("“虎门硝烟”事件发生在广东现在的哪个城市？"),
                                     option_a = lang:get("广州"),
                                     option_b = lang:get("深圳"),
                                     option_c = lang:get("东莞"), answer = 3},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 9,
                                     question = lang:get("世界上大约有多少种植物？"),
                                     option_a = lang:get("40万种"),
                                     option_b = lang:get("400万种"),
                                     option_c = lang:get("4000万种"), answer = 1},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 10,
                                     question =
                                         lang:get("《鹿鼎记》中提到的《四十二章经》共几本？"),
                                     option_a = lang:get("6本"),
                                     option_b = lang:get("8本"),
                                     option_c = lang:get("42本"), answer = 2},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 11,
                                     question = lang:get("“郁金香”的原产地是？"),
                                     option_a = lang:get("荷兰"),
                                     option_b = lang:get("中国"),
                                     option_c = lang:get("芬兰"), answer = 2},
     #camp_rushing_top_question_base{question_group = 11,
                                     question_index = 12,
                                     question = lang:get("中国是世界上第几个拥有原子弹的国家？"),
                                     option_a = lang:get("第3个"),
                                     option_b = lang:get("第4个"),
                                     option_c = lang:get("第5个"), answer = 3}];
question_list(12) ->
    [#camp_rushing_top_question_base{question_group = 12,
                                     question_index = 1,
                                     question = lang:get("游戏中公会战在每周的哪两天举办？"),
                                     option_a = lang:get("周二、周四"),
                                     option_b = lang:get("周一、周二"),
                                     option_c = lang:get("周一、周三"), answer = 1},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 2,
                                     question = lang:get("下列名关哪一座被称为“天下第一关”？"),
                                     option_a = lang:get("潼门关"),
                                     option_b = lang:get("山海关"),
                                     option_c = lang:get("居庸关\n "), answer = 2},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 3,
                                     question = lang:get("世界四大洋中面积最小的是？"),
                                     option_a = lang:get("太平洋"),
                                     option_b = lang:get("印度洋"),
                                     option_c = lang:get("北冰洋"), answer = 3},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 4,
                                     question = lang:get("马可波罗是在哪一朝代来到中国的"),
                                     option_a = lang:get("唐朝"),
                                     option_b = lang:get("宋朝"),
                                     option_c = lang:get("元朝"), answer = 3},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 5,
                                     question = lang:get("秦始皇统一的文字是什么？"),
                                     option_a = lang:get("小篆"),
                                     option_b = lang:get("大篆"),
                                     option_c = lang:get("隶书"), answer = 1},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 6,
                                     question = lang:get("世界上最大的群岛国家是？"),
                                     option_a = lang:get("马来西亚"),
                                     option_b = lang:get("芬兰"),
                                     option_c = lang:get("印度尼西亚"), answer = 3},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 7,
                                     question = lang:get("对人体来说安全电压为多少伏？"),
                                     option_a = "32", option_b = "36",
                                     option_c = "38", answer = 2},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 8,
                                     question = lang:get("《越女剑》书中主角的武器是什么？"),
                                     option_a = lang:get("刀"),
                                     option_b = lang:get("剑"),
                                     option_c = lang:get("竹"), answer = 3},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 9,
                                     question = lang:get("世界上最早种植棉花的国家？"),
                                     option_a = lang:get("中国"),
                                     option_b = lang:get("印度"),
                                     option_c = lang:get("越南"), answer = 2},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 10,
                                     question = lang:get("谁发现并证明“白光由七色光组成”的？"),
                                     option_a = lang:get("爱因斯坦"),
                                     option_b = lang:get("牛顿"),
                                     option_c = lang:get("爱迪生"), answer = 2},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 11,
                                     question = lang:get("我国第一颗原子弹研制成功在哪年？"),
                                     option_a = "1961", option_b = "1964",
                                     option_c = "1967", answer = 2},
     #camp_rushing_top_question_base{question_group = 12,
                                     question_index = 12,
                                     question = lang:get("《永乐大典》是什么时候纂修的？"),
                                     option_a = lang:get("唐朝"),
                                     option_b = lang:get("宋朝"),
                                     option_c = lang:get("明朝"), answer = 3}];
question_list(13) ->
    [#camp_rushing_top_question_base{question_group = 13,
                                     question_index = 1,
                                     question = lang:get("元旦是指哪一天？"),
                                     option_a = lang:get("1月1日"),
                                     option_b = lang:get("2月1日"),
                                     option_c = lang:get("12月25日"), answer = 1},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 2,
                                     question = lang:get("下列哪个尊称是对古代太子的尊称"),
                                     option_a = lang:get("陛下"),
                                     option_b = lang:get("殿下"),
                                     option_c = lang:get("阁下"), answer = 2},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 3,
                                     question = lang:get("在元旦这一天通常中国人们会吃什么？"),
                                     option_a = lang:get("粽子"),
                                     option_b = lang:get("饺子"),
                                     option_c = lang:get("煎饼"), answer = 2},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 4,
                                     question = lang:get("火焰中温度最高的是哪个部位？"),
                                     option_a = lang:get("外焰"),
                                     option_b = lang:get("内焰"),
                                     option_c = lang:get("焰心"), answer = 1},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 5,
                                     question = lang:get("下列运动中球速最快的是？"),
                                     option_a = lang:get("羽毛球"),
                                     option_b = lang:get("乒乓球"),
                                     option_c = lang:get("足球"), answer = 1},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 6,
                                     question =
                                         lang:get("比喻变被动为主动是“三十六计”中的哪一计？"),
                                     option_a = lang:get("声东击西"),
                                     option_b = lang:get("李代桃僵"),
                                     option_c = lang:get("反客为主"), answer = 3},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 7,
                                     question = lang:get("诺贝尔奖没有哪项？"),
                                     option_a = lang:get("数学奖"),
                                     option_b = lang:get("文学奖"),
                                     option_c = lang:get("化学奖"), answer = 1},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 8,
                                     question = lang:get("被称为酿酒行业的祖师是谁？"),
                                     option_a = lang:get("柳永"),
                                     option_b = lang:get("鲁班"),
                                     option_c = lang:get("杜康"), answer = 3},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 9,
                                     question = lang:get("美国的国球是？"),
                                     option_a = lang:get("棒球"),
                                     option_b = lang:get("橄榄球"),
                                     option_c = lang:get("篮球"), answer = 1},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 10,
                                     question = lang:get("秦朝共有几个皇帝？"),
                                     option_a = lang:get("2个"),
                                     option_b = lang:get("3个"),
                                     option_c = lang:get("4个"), answer = 2},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 11,
                                     question = lang:get("世界上养牛最多的国家？"),
                                     option_a = lang:get("澳大利亚"),
                                     option_b = lang:get("蒙古"),
                                     option_c = lang:get("印度"), answer = 3},
     #camp_rushing_top_question_base{question_group = 13,
                                     question_index = 12,
                                     question = lang:get("第二次世界大战是哪一年爆发的？"),
                                     option_a = "1937", option_b = "1938",
                                     option_c = "1939", answer = 3}];
question_list(_) -> [].

season_id_list() -> [11, 12, 13].

get_season(11) ->
    #{session_id => 11, start_time => 1546131600,
      ready_time => 1546169400, answer_time => 1546170000,
      end_time => 1546170660, question_group => 11};
get_season(12) ->
    #{session_id => 12, start_time => 1546218000,
      ready_time => 1546255800, answer_time => 1546256400,
      end_time => 1546257060, question_group => 12};
get_season(13) ->
    #{session_id => 13, start_time => 1568077200,
      ready_time => 1568115000, answer_time => 1568115600,
      end_time => 1568116260, question_group => 13};
get_season(_) -> false.

get_question({11, 1}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 1,
                                    question = lang:get("美国“自由女神”座落在哪个城市?"),
                                    option_a = lang:get("纽约"),
                                    option_b = lang:get("洛杉机"),
                                    option_c = lang:get("旧金山"), answer = 1};
get_question({11, 2}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 2,
                                    question = lang:get("世界上海拔最高的山峰是哪一座？"),
                                    option_a = lang:get("乔戈里峰"),
                                    option_b = lang:get("珠穆朗玛峰"),
                                    option_c = lang:get("公格尔山峰"), answer = 2};
get_question({11, 3}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 3,
                                    question = lang:get("古代“四大美女”西汉时期的是"),
                                    option_a = lang:get("西施"),
                                    option_b = lang:get("王昭君"),
                                    option_c = lang:get("貂蝉"), answer = 2};
get_question({11, 4}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 4,
                                    question = lang:get("“隐形飞机”是指什么样的飞机？"),
                                    option_a = lang:get("肉眼看不见"),
                                    option_b = lang:get("飞行太高看不见"),
                                    option_c = lang:get("雷达测不到\n "),
                                    answer = 3};
get_question({11, 5}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 5,
                                    question = lang:get("化学反应中最小的粒子是？"),
                                    option_a = lang:get("分子"),
                                    option_b = lang:get("原子"),
                                    option_c = lang:get("质子"), answer = 2};
get_question({11, 6}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 6,
                                    question = lang:get("“三峡水电站”位于长江哪？"),
                                    option_a = lang:get("上游"),
                                    option_b = lang:get("中游"),
                                    option_c = lang:get("下游"), answer = 1};
get_question({11, 7}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 7,
                                    question = lang:get("围棋比赛中是哪方先行？"),
                                    option_a = lang:get("黑方"),
                                    option_b = lang:get("白方"),
                                    option_c = lang:get("猜拳获胜先行"), answer = 1};
get_question({11, 8}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 8,
                                    question =
                                        lang:get("“虎门硝烟”事件发生在广东现在的哪个城市？"),
                                    option_a = lang:get("广州"),
                                    option_b = lang:get("深圳"),
                                    option_c = lang:get("东莞"), answer = 3};
get_question({11, 9}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 9,
                                    question = lang:get("世界上大约有多少种植物？"),
                                    option_a = lang:get("40万种"),
                                    option_b = lang:get("400万种"),
                                    option_c = lang:get("4000万种"), answer = 1};
get_question({11, 10}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 10,
                                    question = lang:get("《鹿鼎记》中提到的《四十二章经》共几本？"),
                                    option_a = lang:get("6本"),
                                    option_b = lang:get("8本"),
                                    option_c = lang:get("42本"), answer = 2};
get_question({11, 11}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 11,
                                    question = lang:get("“郁金香”的原产地是？"),
                                    option_a = lang:get("荷兰"),
                                    option_b = lang:get("中国"),
                                    option_c = lang:get("芬兰"), answer = 2};
get_question({11, 12}) ->
    #camp_rushing_top_question_base{question_group = 11,
                                    question_index = 12,
                                    question = lang:get("中国是世界上第几个拥有原子弹的国家？"),
                                    option_a = lang:get("第3个"),
                                    option_b = lang:get("第4个"),
                                    option_c = lang:get("第5个"), answer = 3};
get_question({12, 1}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 1,
                                    question = lang:get("游戏中公会战在每周的哪两天举办？"),
                                    option_a = lang:get("周二、周四"),
                                    option_b = lang:get("周一、周二"),
                                    option_c = lang:get("周一、周三"), answer = 1};
get_question({12, 2}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 2,
                                    question = lang:get("下列名关哪一座被称为“天下第一关”？"),
                                    option_a = lang:get("潼门关"),
                                    option_b = lang:get("山海关"),
                                    option_c = lang:get("居庸关\n "), answer = 2};
get_question({12, 3}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 3,
                                    question = lang:get("世界四大洋中面积最小的是？"),
                                    option_a = lang:get("太平洋"),
                                    option_b = lang:get("印度洋"),
                                    option_c = lang:get("北冰洋"), answer = 3};
get_question({12, 4}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 4,
                                    question = lang:get("马可波罗是在哪一朝代来到中国的"),
                                    option_a = lang:get("唐朝"),
                                    option_b = lang:get("宋朝"),
                                    option_c = lang:get("元朝"), answer = 3};
get_question({12, 5}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 5,
                                    question = lang:get("秦始皇统一的文字是什么？"),
                                    option_a = lang:get("小篆"),
                                    option_b = lang:get("大篆"),
                                    option_c = lang:get("隶书"), answer = 1};
get_question({12, 6}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 6,
                                    question = lang:get("世界上最大的群岛国家是？"),
                                    option_a = lang:get("马来西亚"),
                                    option_b = lang:get("芬兰"),
                                    option_c = lang:get("印度尼西亚"), answer = 3};
get_question({12, 7}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 7,
                                    question = lang:get("对人体来说安全电压为多少伏？"),
                                    option_a = "32", option_b = "36",
                                    option_c = "38", answer = 2};
get_question({12, 8}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 8,
                                    question = lang:get("《越女剑》书中主角的武器是什么？"),
                                    option_a = lang:get("刀"),
                                    option_b = lang:get("剑"),
                                    option_c = lang:get("竹"), answer = 3};
get_question({12, 9}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 9,
                                    question = lang:get("世界上最早种植棉花的国家？"),
                                    option_a = lang:get("中国"),
                                    option_b = lang:get("印度"),
                                    option_c = lang:get("越南"), answer = 2};
get_question({12, 10}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 10,
                                    question = lang:get("谁发现并证明“白光由七色光组成”的？"),
                                    option_a = lang:get("爱因斯坦"),
                                    option_b = lang:get("牛顿"),
                                    option_c = lang:get("爱迪生"), answer = 2};
get_question({12, 11}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 11,
                                    question = lang:get("我国第一颗原子弹研制成功在哪年？"),
                                    option_a = "1961", option_b = "1964",
                                    option_c = "1967", answer = 2};
get_question({12, 12}) ->
    #camp_rushing_top_question_base{question_group = 12,
                                    question_index = 12,
                                    question = lang:get("《永乐大典》是什么时候纂修的？"),
                                    option_a = lang:get("唐朝"),
                                    option_b = lang:get("宋朝"),
                                    option_c = lang:get("明朝"), answer = 3};
get_question({13, 1}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 1,
                                    question = lang:get("元旦是指哪一天？"),
                                    option_a = lang:get("1月1日"),
                                    option_b = lang:get("2月1日"),
                                    option_c = lang:get("12月25日"), answer = 1};
get_question({13, 2}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 2,
                                    question = lang:get("下列哪个尊称是对古代太子的尊称"),
                                    option_a = lang:get("陛下"),
                                    option_b = lang:get("殿下"),
                                    option_c = lang:get("阁下"), answer = 2};
get_question({13, 3}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 3,
                                    question = lang:get("在元旦这一天通常中国人们会吃什么？"),
                                    option_a = lang:get("粽子"),
                                    option_b = lang:get("饺子"),
                                    option_c = lang:get("煎饼"), answer = 2};
get_question({13, 4}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 4,
                                    question = lang:get("火焰中温度最高的是哪个部位？"),
                                    option_a = lang:get("外焰"),
                                    option_b = lang:get("内焰"),
                                    option_c = lang:get("焰心"), answer = 1};
get_question({13, 5}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 5,
                                    question = lang:get("下列运动中球速最快的是？"),
                                    option_a = lang:get("羽毛球"),
                                    option_b = lang:get("乒乓球"),
                                    option_c = lang:get("足球"), answer = 1};
get_question({13, 6}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 6,
                                    question =
                                        lang:get("比喻变被动为主动是“三十六计”中的哪一计？"),
                                    option_a = lang:get("声东击西"),
                                    option_b = lang:get("李代桃僵"),
                                    option_c = lang:get("反客为主"), answer = 3};
get_question({13, 7}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 7,
                                    question = lang:get("诺贝尔奖没有哪项？"),
                                    option_a = lang:get("数学奖"),
                                    option_b = lang:get("文学奖"),
                                    option_c = lang:get("化学奖"), answer = 1};
get_question({13, 8}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 8,
                                    question = lang:get("被称为酿酒行业的祖师是谁？"),
                                    option_a = lang:get("柳永"),
                                    option_b = lang:get("鲁班"),
                                    option_c = lang:get("杜康"), answer = 3};
get_question({13, 9}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 9,
                                    question = lang:get("美国的国球是？"),
                                    option_a = lang:get("棒球"),
                                    option_b = lang:get("橄榄球"),
                                    option_c = lang:get("篮球"), answer = 1};
get_question({13, 10}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 10,
                                    question = lang:get("秦朝共有几个皇帝？"),
                                    option_a = lang:get("2个"),
                                    option_b = lang:get("3个"),
                                    option_c = lang:get("4个"), answer = 2};
get_question({13, 11}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 11,
                                    question = lang:get("世界上养牛最多的国家？"),
                                    option_a = lang:get("澳大利亚"),
                                    option_b = lang:get("蒙古"),
                                    option_c = lang:get("印度"), answer = 3};
get_question({13, 12}) ->
    #camp_rushing_top_question_base{question_group = 13,
                                    question_index = 12,
                                    question = lang:get("第二次世界大战是哪一年爆发的？"),
                                    option_a = "1937", option_b = "1938",
                                    option_c = "1939", answer = 3};
get_question(_) -> false.

get_offsex(0) -> {0, 20, 100};
get_offsex(1) -> {1, 30, 100};
get_offsex(2) -> {2, 50, 100};
get_offsex(3) -> {3, 80, 100};
get_offsex(4) -> {4, 100, 100};
get_offsex(5) -> {5, 150, 100};
get_offsex(6) -> {6, 200, 100};
get_offsex(7) -> {7, 300, 100};
get_offsex(8) -> {8, 450, 100};
get_offsex(9) -> {9, 550, 100};
get_offsex(10) -> {10, 700, 100};
get_offsex(11) -> {11, 850, 100};
get_offsex(12) -> {12, 1000, 100};
get_offsex(_) -> false.

get_rushing_gold(11) -> {11, 0, 100000, 100000};
get_rushing_gold(12) -> {12, 0, 100000, 100000};
get_rushing_gold(13) -> {13, 0, 100000, 100000};
get_rushing_gold(_) -> false.

get_lost_reward({11, 1}) -> {11, 1, []};
get_lost_reward({11, 2}) -> {11, 2, [{20005, 0, 2}]};
get_lost_reward({11, 3}) -> {11, 3, [{20005, 0, 2}]};
get_lost_reward({11, 4}) -> {11, 4, [{20025, 0, 2}]};
get_lost_reward({11, 5}) -> {11, 5, [{20025, 0, 2}]};
get_lost_reward({11, 6}) -> {11, 6, [{90026, 0, 50}]};
get_lost_reward({11, 7}) -> {11, 7, [{22585, 0, 1}]};
get_lost_reward({11, 8}) -> {11, 8, [{22585, 0, 1}]};
get_lost_reward({11, 9}) -> {11, 9, [{20053, 0, 1}]};
get_lost_reward({11, 10}) -> {11, 10, [{20053, 0, 1}]};
get_lost_reward({11, 11}) -> {11, 11, [{20014, 0, 1}]};
get_lost_reward({11, 12}) -> {11, 12, [{23740, 0, 1}]};
get_lost_reward({12, 1}) -> {12, 1, []};
get_lost_reward({12, 2}) -> {12, 2, [{20005, 0, 2}]};
get_lost_reward({12, 3}) -> {12, 3, [{20005, 0, 2}]};
get_lost_reward({12, 4}) -> {12, 4, [{20025, 0, 2}]};
get_lost_reward({12, 5}) -> {12, 5, [{20025, 0, 2}]};
get_lost_reward({12, 6}) -> {12, 6, [{90026, 0, 50}]};
get_lost_reward({12, 7}) -> {12, 7, [{22585, 0, 1}]};
get_lost_reward({12, 8}) -> {12, 8, [{22585, 0, 1}]};
get_lost_reward({12, 9}) -> {12, 9, [{20053, 0, 1}]};
get_lost_reward({12, 10}) -> {12, 10, [{20053, 0, 1}]};
get_lost_reward({12, 11}) -> {12, 11, [{20014, 0, 1}]};
get_lost_reward({12, 12}) -> {12, 12, [{23740, 0, 1}]};
get_lost_reward({13, 1}) -> {13, 1, []};
get_lost_reward({13, 2}) -> {13, 2, [{20005, 0, 2}]};
get_lost_reward({13, 3}) -> {13, 3, [{20005, 0, 2}]};
get_lost_reward({13, 4}) -> {13, 4, [{20025, 0, 2}]};
get_lost_reward({13, 5}) -> {13, 5, [{20025, 0, 2}]};
get_lost_reward({13, 6}) -> {13, 6, [{90026, 0, 50}]};
get_lost_reward({13, 7}) -> {13, 7, [{22585, 0, 1}]};
get_lost_reward({13, 8}) -> {13, 8, [{22585, 0, 1}]};
get_lost_reward({13, 9}) -> {13, 9, [{20053, 0, 1}]};
get_lost_reward({13, 10}) -> {13, 10, [{20053, 0, 1}]};
get_lost_reward({13, 11}) -> {13, 11, [{20014, 0, 1}]};
get_lost_reward({13, 12}) -> {13, 12, [{23740, 0, 1}]};
get_lost_reward(_) -> false.

