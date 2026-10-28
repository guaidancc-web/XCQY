-file("src/data/guild_truth_dare_data.erl", 1).

-module(guild_truth_dare_data).

-export([get_cfg/0,
         get_timeout/1,
         get_vote_reward/1,
         get_question_list/0,
         get_question/1,
         get_diff_add_flower/1,
         get_pass_flower_num/1,
         get_red_packet_list/0,
         get_reward/1,
         get_talk/1]).

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

-file("src/data/guild_truth_dare_data.erl", 22).

get_cfg() ->
    [#{max_round => 5, loss => [{90000, 100000}],
       max_vote_round => 2, max_question => 50,
       min_question => 6, min_role_num => 5,
       max_role_num => 12, min_val => 1, max_val => 200,
       exp_mod => 3311}].

get_timeout(1) -> 150;
get_timeout(2) -> 30;
get_timeout(3) -> 15;
get_timeout(4) -> 180;
get_timeout(5) -> 30;
get_timeout(6) -> 30;
get_timeout(8) -> 120;
get_timeout(7) -> 30;
get_timeout(_) -> infinity.

get_vote_reward({1, 1}) ->
    #{role_type => 1, action => 1, lucky_reward_type => 1,
      lucky_reward_num => 1, action_reward_type => 1,
      action_reward_num => 0};
get_vote_reward({1, 2}) ->
    #{role_type => 1, action => 2, lucky_reward_type => 2,
      lucky_reward_num => 0, action_reward_type => 2,
      action_reward_num => 0};
get_vote_reward({2, 1}) ->
    #{role_type => 2, action => 1, lucky_reward_type => 1,
      lucky_reward_num => 3, action_reward_type => 1,
      action_reward_num => 1};
get_vote_reward({2, 2}) ->
    #{role_type => 2, action => 2, lucky_reward_type => 2,
      lucky_reward_num => 1, action_reward_type => 2,
      action_reward_num => 1};
get_vote_reward({3, 1}) ->
    #{role_type => 3, action => 1, lucky_reward_type => 3,
      lucky_reward_num => 3, action_reward_type => 1,
      action_reward_num => 1};
get_vote_reward({3, 2}) ->
    #{role_type => 3, action => 2, lucky_reward_type => 3,
      lucky_reward_num => 1, action_reward_type => 1,
      action_reward_num => 1};
get_vote_reward(_) -> 0.

get_question_list() ->
    [1,
     10,
     11,
     12,
     13,
     14,
     15,
     16,
     17,
     2,
     3,
     4,
     5,
     500,
     501,
     502,
     503,
     504,
     505,
     506,
     507,
     508,
     509,
     510,
     511,
     512,
     513,
     514,
     515,
     6,
     7,
     8,
     9].

get_question(1) ->
    #{id => 1, type => 1,
      question =>
          lang:get("用语音在<color='#AB22D8'>世界频道</color>夸赞公会并招人（参考内容"
                   "：公会招人，基佬萌妹通通都要,现在进会就送会长女装正面照啦！）")};
get_question(2) ->
    #{id => 2, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>，说说你的初恋是在什么时候，怎"
                   "么开始的，对方是个怎么样的人？")};
get_question(3) ->
    #{id => 3, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>，介绍一下你的家乡或目前所在的城市")};
get_question(4) ->
    #{id => 4, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>，分享自己觉得最糗的事情")};
get_question(5) ->
    #{id => 5, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>，说说游戏里或现实中对你最重要"
                   "的一个人，分享你们的故事")};
get_question(6) ->
    #{id => 6, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>花式夸自己（参考内容：我这个人"
                   "嘛，没有什么缺点，最大的缺点就是太好看了）")};
get_question(7) ->
    #{id => 7, type => 1,
      question =>
          lang:get("用语音在<color='#AB22D8'>世界频道</color>连说3次“红鲤鱼绿鲤鱼与驴”")};
get_question(8) ->
    #{id => 8, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>回答：玩真心话大冒险的人中，如"
                   "果要找情缘会选谁,为什么？")};
get_question(9) ->
    #{id => 9, type => 1,
      question =>
          lang:get("用语音在<color='#AB22D8'>公会频道</color>回答：公会中的人谁最符合"
                   "你的理想类型？为什么？{face_1,2}")};
get_question(10) ->
    #{id => 10, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>“夸赞”自己的会长，并帮会长征"
                   "婚{face_1,15}")};
get_question(11) ->
    #{id => 11, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，发个剪刀石头布的表情，并说："
                   "“赢我，我给你卖个萌”")};
get_question(12) ->
    #{id => 12, type => 1,
      question =>
          lang:get("用语音在<color='#AB22D8'>世界频道</color>跟世界频道最后一个发言的"
                   "异性玩家告白{face_1,15}")};
get_question(13) ->
    #{id => 13, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，@7给他唱“像一棵海草海草，"
                   "海草海草，随风飘摇”")};
get_question(14) ->
    #{id => 14, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，@你最有好感的一名异性，并告"
                   "白{face_1,3}")};
get_question(15) ->
    #{id => 15, type => 1,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>，展示如何向喜欢的人表白（可找"
                   "现场一名异性表演）{face_1,15}")};
get_question(16) ->
    #{id => 16, type => 1,
      question =>
          lang:get("用语音在<color='#AB22D8'>世界频道</color>，对一个妹子唱“燃烧我的"
                   "卡路里！”")};
get_question(17) ->
    #{id => 17, type => 1,
      question =>
          lang:get("用语音在<color='#AB22D8'>公会频道</color>唱“我们一起学猫叫，一起"
                   "喵喵喵喵喵”")};
get_question(500) ->
    #{id => 500, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，一人分饰两角进行情歌对唱，歌"
                   "曲由参与真心话大冒险的人决定。")};
get_question(501) ->
    #{id => 501, type => 2,
      question =>
          lang:get("用语音在<color='#AB22D8'>公会频道</color>念“黑化肥挥发发灰会挥发"
                   "；灰化肥挥发发黑会发挥”")};
get_question(502) ->
    #{id => 502, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，夸赞本公会的公会宝贝@2，并"
                   "为ta征婚")};
get_question(503) ->
    #{id => 503, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，掷个骰子并说：“骰子赢我，我"
                   "喊你一声哥”")};
get_question(504) ->
    #{id => 504, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>唱一首你最拿手的歌")};
get_question(505) ->
    #{id => 505, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>，对@3用温柔的语气唱出“轻轻"
                   "贴近你的耳朵，莎朗嘿哟”")};
get_question(506) ->
    #{id => 506, type => 2,
      question =>
          lang:get("用语音在<color='#AB22D8'>世界频道</color>对@6表白，并唱“我要带"
                   "你去浪漫的土耳其，然后一起去东京和巴黎”")};
get_question(507) ->
    #{id => 507, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，用语音含情脉脉地说“你就站在"
                   "此处不要动，我去买几个橘子”")};
get_question(508) ->
    #{id => 508, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，分别喊三个异性“大老婆”“二"
                   "老婆”“小老婆”")};
get_question(509) ->
    #{id => 509, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>，表演如何撮合一对情缘。（可以"
                   "有自己哦{face_1,26})")};
get_question(510) ->
    #{id => 510, type => 2,
      question =>
          lang:get("用语音在<color='#AB22D8'>世界频道</color>对一个异性唱“你说你喜欢"
                   "森女系，而我多了一个G”")};
get_question(511) ->
    #{id => 511, type => 2,
      question =>
          lang:get("用语音在<color='#AB22D8'>世界频道</color>对一个异性深情地念“你是"
                   "爱，是暖，是希望，你是人间的四月天！”（异性由@1指定）")};
get_question(512) ->
    #{id => 512, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>回答一个问题，问题由其他参与真"
                   "心话大冒险的人共同决定")};
get_question(513) ->
    #{id => 513, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>用语音吆喝“瞧一瞧看一看，走过"
                   "路过不要错过，切磋赢我送情缘啦！”")};
get_question(514) ->
    #{id => 514, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>世界频道</color>向一个异性推销自己，并说“进帮"
                   "会送我当情缘！”")};
get_question(515) ->
    #{id => 515, type => 2,
      question =>
          lang:get("在<color='#AB22D8'>公会频道</color>，分享一件你听过的游戏里或现实"
                   "中有趣的八卦")};
get_question(_) -> false.

get_diff_add_flower(Num)
    when 1 =< Num andalso Num =< 10 ->
    1;
get_diff_add_flower(Num)
    when 11 =< Num andalso Num =< 20 ->
    2;
get_diff_add_flower(Num)
    when 21 =< Num andalso Num =< 30 ->
    3;
get_diff_add_flower(Num)
    when 31 =< Num andalso Num =< 40 ->
    4;
get_diff_add_flower(Num)
    when 41 =< Num andalso Num =< 200 ->
    5;
get_diff_add_flower(_) -> 0.

get_pass_flower_num(5) -> 6;
get_pass_flower_num(6) -> 9;
get_pass_flower_num(7) -> 9;
get_pass_flower_num(8) -> 12;
get_pass_flower_num(9) -> 12;
get_pass_flower_num(10) -> 15;
get_pass_flower_num(11) -> 15;
get_pass_flower_num(12) -> 18;
get_pass_flower_num(_) -> 0.

get_red_packet_list() ->
    [lang:get("其实我是专业的"),
     lang:get("凡人，被我折服了吗"),
     lang:get("告诉我公会谁最美"),
     lang:get("我果然是美貌与实力并重"),
     lang:get("羡慕我的智慧吗")].

get_reward(1) ->
    #{type => 1, title => lang:get("真心话大冒险奖励"),
      content =>
          lang:get("恭喜你，在真心话大冒险中，成为了公会小花！这是属于你的奖励，下次还要继续参与哦~"),
      reward => [{23412, 1, 1}]};
get_reward(2) ->
    #{type => 2, title => lang:get("真心话大冒险奖励"),
      content =>
          lang:get("恭喜你，在真心话大冒险中，获得了“蛋碎一地”的称号！这是属于你的奖励，下次还要继续参与哦~"),
      reward => [{23413, 1, 1}]};
get_reward(3) ->
    #{type => 3, title => lang:get("真心话大冒险奖励"),
      content =>
          lang:get("恭喜你，在真心话大冒险中，成为了幸运观众！这是属于你的奖励，下次还要继续参与哦~"),
      reward => [{23414, 1, 1}]};
get_reward(_) -> false.

get_talk(1) ->
    lang:get("我在真心话大冒险抢到了沙发，快来一起玩吧！{face_1,25}");
get_talk(2) ->
    lang:get("我在真心话大冒险看到了张板凳，毫不犹豫坐了上去{face_1,15}");
get_talk(3) -> lang:get("我居然在真心话大冒险里抢到了地毯！{face_1,22}");
get_talk(4) -> lang:get("真心话大冒险的地板，有点舒服呀~{face_1,28}");
get_talk(12) ->
    lang:get("哈哈哈哈哈，我抢到了真心话大冒险最后一个座位，约起来！{face_1,38}");
get_talk(_) -> false.

