-file("src/data/friend_wish_data.erl", 1).

-module(friend_wish_data).

-export([get_title_lev/3,
         get_coment_reward/1,
         get_theme_info/1,
         get_lucky_reward/1,
         get_wish_npc/1,
         camp_list/0]).

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

-file("src/data/friend_wish_data.erl", 17).

get_title_lev(1110, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(1110, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(1110, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(1110, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(1115, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(1115, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(1115, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(1115, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(1116, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(1116, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(1116, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(1116, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(1139, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(1139, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(1139, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(1139, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(1186, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(1186, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(1186, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(1186, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(1421, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(1421, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(1421, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(1421, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(1633, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(1633, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(1633, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(1633, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(1778, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(1778, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(1778, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(1778, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(3028, Praise, Coment)
    when Praise >= 300 andalso Coment >= 8 ->
    3;
get_title_lev(3028, Praise, Coment)
    when Praise >= 50 andalso Coment >= 0 ->
    2;
get_title_lev(3028, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    1;
get_title_lev(3028, Praise, Coment)
    when Praise >= 0 andalso Coment >= 0 ->
    0;
get_title_lev(_, _, _) -> 0.

get_coment_reward({1110, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#美美自拍#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({1110, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#美美自拍#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({1110, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#美美自拍#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face_"
              "1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({1110, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward({1115, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#浓情端午#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({1115, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#浓情端午#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({1115, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#浓情端午#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face_"
              "1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({1115, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward({1116, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#说走就走#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({1116, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#说走就走#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({1116, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#说走就走#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face_"
              "1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({1116, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward({1139, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#青葱校园#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({1139, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#青葱校园#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({1139, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#青葱校园#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face_"
              "1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({1139, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward({1186, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#爱笑的你#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({1186, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#爱笑的你#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({1186, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#爱笑的你#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face_"
              "1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({1186, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward({1421, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#你我的春节#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({1421, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#你我的春节#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({1421, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#你我的春节#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face"
              "_1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({1421, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward({1633, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#你我的故事#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({1633, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#你我的故事#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({1633, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#你我的故事#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face"
              "_1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({1633, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward({1778, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#中秋乐事#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({1778, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#中秋乐事#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({1778, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#中秋乐事#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face_"
              "1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({1778, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward({3028, 3}) ->
    {lang:get("星辰话题火热大奖"),
     lang:get("恭喜您在#你我的春节#话题活动中万人追捧，获得以下奖励，请查收"),
     [{23410, 0, 1}]};
get_coment_reward({3028, 2}) ->
    {lang:get("星辰话题人气大奖"),
     lang:get("恭喜您在#你我的春节#话题活动中人人称赞，获得以下奖励，请查收"),
     [{23409, 0, 1}]};
get_coment_reward({3028, 1}) ->
    {lang:get("星辰话题崭露头角奖"),
     lang:get("恭喜您在#你我的春节#话题活动中登上首页，获得以下奖励，人气再高些奖励会更丰厚哟{face"
              "_1,3}"),
     [{90026, 0, 188}]};
get_coment_reward({3028, 0}) ->
    {lang:get("星辰话题参与奖"),
     lang:get("感谢您参与星辰话题活动，下次就能登上首页受人追捧哟{face_1,18}"),
     [{90026, 0, 20}]};
get_coment_reward(_) -> false.

get_theme_info(1110) ->
    #{camp_id => 1110, theme => lang:get("美美自拍"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#美美自拍#晒出你的自拍照，无论是萌萌哒、帅帅的、美美的、中二的、霸气的、搞怪的…自拍照，"
                   "都可以分享出来哟，图片配上自我介绍或口号，看看谁才是星辰SuperStar{face_1,"
                   "25}")};
get_theme_info(1115) ->
    #{camp_id => 1115, theme => lang:get("浓情端午"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#浓情端午#端午佳节，祖国地域辽阔，各地端午习俗不尽相同，分享你的端午所见所闻，亦或是和亲"
                   "朋好友共度佳节的情景，图片配上简单说明，一起享受美好时光吧{face_1,38}")};
get_theme_info(1116) ->
    #{camp_id => 1116, theme => lang:get("说走就走"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#说走就走#盛夏已至，邀约亲朋好友，来一场说走就走的旅行吧！美如画的风景、有趣的人和事、难"
                   "忘的旅途…图片配上文字说明，分享你曾经在旅途中的所见所闻吧{face_1,56}")};
get_theme_info(1139) ->
    #{camp_id => 1139, theme => lang:get("青葱校园"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#青葱校园#美好的校园时光总是令人向往，相遇同桌的你、球场挥汗如雨、军训英姿飒爽、毕业典礼"
                   "依依不舍…用照片记录你最难忘的瞬间，分享你的青葱校园生活吧，图片配上说明介绍，才会更容易登"
                   "上首页哟{face_1,56}")};
get_theme_info(1186) ->
    #{camp_id => 1186, theme => lang:get("爱笑的你"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#爱笑的你#快乐是人们积极向上的源泉，愉快的分享也能影响周边的人变得快乐哟…用照片记录你最"
                   "难忘的开心瞬间：微笑或开怀大笑的自拍；有趣的新段子；搞笑的图片…把快乐分享给更多的小伙伴吧"
                   "，图片配上说明介绍，才会更容易登上首页哟{face_1,56}")};
get_theme_info(1421) ->
    #{camp_id => 1421, theme => lang:get("你我的春节"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#你我的春节#春节是中国人最重视的节日，亲朋好友欢聚一堂，各种美食让你每逢佳节胖三斤，新春"
                   "红包满天飞，新春祝福也响不停……快来与大家分享你的春节快乐生活吧，图片配上说明介绍，才会更"
                   "容易登上首页哟{face_1,56}")};
get_theme_info(1633) ->
    #{camp_id => 1633, theme => lang:get("你我的故事"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#你我的故事#人的相遇相识是一种奇妙的缘分，在现实生活中会遇到各色各样的人，在游戏中也会遇"
                   "到不同的可爱人儿，编写出独特且精彩的故事……快来与大家分享你在游戏中发生的爱情或友情故事吧"
                   "，图片配上说明介绍，才会更容易登上首页哟{face_1,56}")};
get_theme_info(1778) ->
    #{camp_id => 1778, theme => lang:get("中秋乐事"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#中秋乐事#中秋月圆夜，如此良辰美景正是和亲朋好友相聚的日子，吃着美味的各式各样的月饼，观"
                   "赏一轮明月，真是愉快至极……快来与大家分享你在中秋温馨乐事吧，图片配上说明介绍，才会更容易"
                   "登上首页哟{face_1,56}")};
get_theme_info(3028) ->
    #{camp_id => 3028, theme => lang:get("你我的春节"),
      npc_name => lang:get("星辰小美"),
      content =>
          lang:get("#你我的春节#春节是中国人最重视的节日，亲朋好友欢聚一堂，各种美食让你每逢佳节胖三斤，新春"
                   "红包满天飞，新春祝福也响不停……快来与大家分享你的春节快乐生活吧，图片配上说明介绍，才会更"
                   "容易登上首页哟{face_1,56}")};
get_theme_info(_) -> false.

get_lucky_reward(1110) ->
    #{camp_id => 1110, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#美美自拍#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(1115) ->
    #{camp_id => 1115, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#浓情端午#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(1116) ->
    #{camp_id => 1116, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#说走就走#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(1139) ->
    #{camp_id => 1139, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#青葱校园#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(1186) ->
    #{camp_id => 1186, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#爱笑的你#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(1421) ->
    #{camp_id => 1421, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#我与春节有个约会#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(1633) ->
    #{camp_id => 1633, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#我有故事你想听吗#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(1778) ->
    #{camp_id => 1778, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#中秋乐事#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(3028) ->
    #{camp_id => 3028, score => 10, num => 2, range => 50,
      reward => [{23411, 0, 1}],
      title => lang:get("星辰话题幸运大奖"),
      content =>
          lang:get("恭喜您在#你我的春节#话题活动中排名前50，并幸运的成为了大奖获得者，请查收您的奖励")};
get_lucky_reward(_) -> false.

get_wish_npc(_) -> false.

camp_list() ->
    [1110, 1115, 1116, 1139, 1186, 1421, 1633, 1778, 3028].

