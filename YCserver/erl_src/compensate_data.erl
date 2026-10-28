-file("src/data/compensate_data.erl", 1).

-module(compensate_data).

-export([list/0,
         get_reward/1,
         get_mail/1,
         get_mail_other/1]).

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

-file("src/data/compensate_data.erl", 17).

list() ->
    [35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95].

get_reward(35) -> [{22242, 1}, {20025, 1}];
get_reward(40) -> [{22240, 1}, {20025, 1}];
get_reward(45) -> [{22237, 1}, {20025, 2}];
get_reward(50) -> [{22233, 1}, {20025, 3}];
get_reward(55) -> [{22221, 1}, {20025, 5}];
get_reward(60) -> [{22221, 1}, {20025, 8}];
get_reward(65) -> [{22227, 1}, {20025, 10}];
get_reward(70) -> [{22227, 1}, {20025, 15}];
get_reward(75) -> [{22227, 1}, {20025, 20}];
get_reward(80) -> [{22227, 1}, {20025, 25}];
get_reward(85) -> [{22227, 1}, {20025, 30}];
get_reward(90) -> [{22227, 1}, {20025, 35}];
get_reward(95) -> [{22227, 1}, {20025, 40}];
get_reward(_Lv) -> none.

get_mail(1) ->
    {lang:get("星辰学院的来信"),
     lang:get("星辰学院的来信:\n  亲爱的<color='#ffff00'>~ts</color>，欢"
              "迎回到星辰大世界，你所选的狂剑以<color='#ffff00'>强大物理爆发能力</co"
              "lor>著称，推荐增加<color='#00ff00'>力量</color>属性，达到20"
              "级后可前往<color='#ffff00'>导师德林</color>处拜师哟，更快融入星辰"
              "大家庭吧{face_1,54}")};
get_mail(2) ->
    {lang:get("星辰学院的来信"),
     lang:get("星辰学院的来信:\n  亲爱的<color='#ffff00'>~ts</color>，欢"
              "迎回到星辰大世界，你所选的魔导以<color='#ffff00'>卓越魔法群伤能力</co"
              "lor>著称，推荐增加<color='#00ff00'>智力</color>属性，达到20"
              "级后可前往<color='#ffff00'>导师德林</color>处拜师哟，更快融入星辰"
              "大家庭吧{face_1,54}")};
get_mail(3) ->
    {lang:get("星辰学院的来信"),
     lang:get("星辰学院的来信:\n  亲爱的<color='#ffff00'>~ts</color>，欢"
              "迎回到星辰大世界，你所选的战弓以<color='#ffff00'>强大物理群伤能力</co"
              "lor>著称，推荐增加<color='#00ff00'>力量、敏捷</color>属性，达"
              "到20级后可前往<color='#ffff00'>导师德林</color>处拜师哟，更快融"
              "入星辰大家庭吧{face_1,54}")};
get_mail(4) ->
    {lang:get("星辰学院的来信"),
     lang:get("星辰学院的来信:\n  亲爱的<color='#ffff00'>~ts</color>，欢"
              "迎回到星辰大世界，你所选的兽灵以<color='#ffff00'>强大战斗控场能力</co"
              "lor>著称，推荐增加<color='#00ff00'>体质、敏捷</color>属性，达"
              "到20级后可前往<color='#ffff00'>导师德林</color>处拜师哟，更快融"
              "入星辰大家庭吧{face_1,54}")};
get_mail(5) ->
    {lang:get("星辰学院的来信"),
     lang:get("星辰学院的来信:\n  亲爱的<color='#ffff00'>~ts</color>，欢"
              "迎回到星辰大世界，你所选的秘言以<color='#ffff00'>强大治疗辅助能力</co"
              "lor>著称，推荐增加<color='#00ff00'>体质、耐力、敏捷</color>属"
              "性，达到20级后可前往<color='#ffff00'>导师德林</color>处拜师哟，"
              "更快融入星辰大家庭吧{face_1,54}")};
get_mail(6) ->
    {lang:get("星辰学院的来信"),
     lang:get("星辰学院的来信:\n  亲爱的<color='#ffff00'>~ts</color>，欢"
              "迎回到星辰大世界，你所选的月魂以<color='#ffff00'>持续输出能力</colo"
              "r>著称，推荐增加<color='#00ff00'>智力</color>属性，达到20级后"
              "可前往<color='#ffff00'>导师德林</color>处拜师哟，更快融入星辰大家"
              "庭吧{face_1,54}")};
get_mail(7) ->
    {lang:get("星辰学院的来信"),
     lang:get("星辰学院的来信:\n  亲爱的<color='#ffff00'>~ts</color>，欢"
              "迎回到星辰大世界，你所选的圣堂以<color='#ffff00'>强大的输出续航能力</c"
              "olor>著称，推荐增加<color='#00ff00'>力量、体质</color>属性，"
              "达到20级后可前往<color='#ffff00'>导师德林</color>处拜师哟，更快"
              "融入星辰大家庭吧{face_1,54}")};
get_mail(_Classes) -> none.

get_mail_other(1) ->
    #{title => lang:get("开服活动即将结束"),
      content =>
          lang:get("亲爱的玩家：\n    开服活动即将结束。活动结束后将<color='#00ff00'>关"
                   "闭</color>相关活动，并发放<color='#ffff00'>冲榜奖励</color"
                   ">。请大家注意活动时间，即时参与领取相关活动奖励。\n<color='#ffff00'>人"
                   "气榜</color>前十可获得稀有时装<color='#ffff00'>【绝世芳华】</c"
                   "olor>\n<color='#ffff00'>竞技榜</color>前十可获得<colo"
                   "r='#ffff00'>500</color>{assets_2,90002}\n<col"
                   "or='#ffff00'>实力榜</color>前十可获得稀有饰品<color='#fff"
                   "f00'>【至尊皇冠】</color>\n<color='#ffff00'>恩爱榜</co"
                   "lor>前十可获得稀有饰品<color='#ffff00'>【浓情蜜意】</color>\n"
                   "<color='#ffff00'>宠物榜</color>前十可获得超值礼包<color='"
                   "#ffff00'>【宠物排行礼包】</color>\n")};
get_mail_other(_Id) -> none.

