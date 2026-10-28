-file("src/data/rune_data.erl", 1).

-module(rune_data).

-author("liyufei").

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

-file("src/data/rune_data.erl", 15).

-export([get_base/1,
         get_all_rune/0,
         get_understand/1,
         get_update/1,
         get_unload/1,
         get_combat/1,
         get_resonate/1,
         get_pet_rune/1]).

get_base({23900, 1}) ->
    #{id => 23900, name => lang:get("连击无双"), quality => 2,
      lev => 1, skill_id => 65001};
get_base({23901, 1}) ->
    #{id => 23901, name => lang:get("愈战愈勇"), quality => 2,
      lev => 1, skill_id => 65011};
get_base({23902, 1}) ->
    #{id => 23902, name => lang:get("破隐一击"), quality => 2,
      lev => 1, skill_id => 65021};
get_base({23903, 1}) ->
    #{id => 23903, name => lang:get("狂暴之怒"), quality => 2,
      lev => 1, skill_id => 65031};
get_base({23904, 1}) ->
    #{id => 23904, name => lang:get("饮胆尝血"), quality => 2,
      lev => 1, skill_id => 65041};
get_base({23905, 1}) ->
    #{id => 23905, name => lang:get("魔法洞察"), quality => 2,
      lev => 1, skill_id => 65051};
get_base({23906, 1}) ->
    #{id => 23906, name => lang:get("元素掌控"), quality => 2,
      lev => 1, skill_id => 65061};
get_base({23907, 1}) ->
    #{id => 23907, name => lang:get("魔法涌动"), quality => 2,
      lev => 1, skill_id => 65071};
get_base({23908, 1}) ->
    #{id => 23908, name => lang:get("魂飞魄散"), quality => 2,
      lev => 1, skill_id => 65081};
get_base({23909, 1}) ->
    #{id => 23909, name => lang:get("魔力之心"), quality => 2,
      lev => 1, skill_id => 65091};
get_base({23910, 1}) ->
    #{id => 23910, name => lang:get("暗影躲避"), quality => 2,
      lev => 1, skill_id => 65101};
get_base({23911, 1}) ->
    #{id => 23911, name => lang:get("钢铁之躯"), quality => 2,
      lev => 1, skill_id => 65111};
get_base({23912, 1}) ->
    #{id => 23912, name => lang:get("莲华护体"), quality => 2,
      lev => 1, skill_id => 65121};
get_base({23913, 1}) ->
    #{id => 23913, name => lang:get("元素屏障"), quality => 2,
      lev => 1, skill_id => 65131};
get_base({23914, 1}) ->
    #{id => 23914, name => lang:get("灵动迅捷"), quality => 2,
      lev => 1, skill_id => 65141};
get_base({23915, 1}) ->
    #{id => 23915, name => lang:get("治愈圣歌"), quality => 2,
      lev => 1, skill_id => 65151};
get_base({23916, 1}) ->
    #{id => 23916, name => lang:get("敏锐"), quality => 1,
      lev => 1, skill_id => 65201};
get_base({23917, 1}) ->
    #{id => 23917, name => lang:get("狂暴"), quality => 1,
      lev => 1, skill_id => 65211};
get_base({23918, 1}) ->
    #{id => 23918, name => lang:get("连刺"), quality => 1,
      lev => 1, skill_id => 65221};
get_base({23919, 1}) ->
    #{id => 23919, name => lang:get("连环"), quality => 1,
      lev => 1, skill_id => 65231};
get_base({23920, 1}) ->
    #{id => 23920, name => lang:get("识破"), quality => 1,
      lev => 1, skill_id => 65241};
get_base({23921, 1}) ->
    #{id => 23921, name => lang:get("暗杀"), quality => 1,
      lev => 1, skill_id => 65251};
get_base({23922, 1}) ->
    #{id => 23922, name => lang:get("突袭"), quality => 1,
      lev => 1, skill_id => 65261};
get_base({23923, 1}) ->
    #{id => 23923, name => lang:get("嗜血"), quality => 1,
      lev => 1, skill_id => 65271};
get_base({23924, 1}) ->
    #{id => 23924, name => lang:get("灵心"), quality => 1,
      lev => 1, skill_id => 65281};
get_base({23925, 1}) ->
    #{id => 23925, name => lang:get("元灭"), quality => 1,
      lev => 1, skill_id => 65291};
get_base({23926, 1}) ->
    #{id => 23926, name => lang:get("灵爆"), quality => 1,
      lev => 1, skill_id => 65301};
get_base({23927, 1}) ->
    #{id => 23927, name => lang:get("灵犀"), quality => 1,
      lev => 1, skill_id => 65311};
get_base({23928, 1}) ->
    #{id => 23928, name => lang:get("围攻"), quality => 1,
      lev => 1, skill_id => 65321};
get_base({23929, 1}) ->
    #{id => 23929, name => lang:get("唤击"), quality => 1,
      lev => 1, skill_id => 65331};
get_base({23930, 1}) ->
    #{id => 23930, name => lang:get("唤法"), quality => 1,
      lev => 1, skill_id => 65341};
get_base({23931, 1}) ->
    #{id => 23931, name => lang:get("矫健"), quality => 1,
      lev => 1, skill_id => 65351};
get_base({23932, 1}) ->
    #{id => 23932, name => lang:get("法护"), quality => 1,
      lev => 1, skill_id => 65361};
get_base({23933, 1}) ->
    #{id => 23933, name => lang:get("尖刺"), quality => 1,
      lev => 1, skill_id => 65371};
get_base({23934, 1}) ->
    #{id => 23934, name => lang:get("怒火"), quality => 1,
      lev => 1, skill_id => 65381};
get_base({23935, 1}) ->
    #{id => 23935, name => lang:get("韧性"), quality => 1,
      lev => 1, skill_id => 65391};
get_base({23900, 2}) ->
    #{id => 23900, name => lang:get("连击无双"), quality => 2,
      lev => 2, skill_id => 65002};
get_base({23901, 2}) ->
    #{id => 23901, name => lang:get("愈战愈勇"), quality => 2,
      lev => 2, skill_id => 65012};
get_base({23902, 2}) ->
    #{id => 23902, name => lang:get("破隐一击"), quality => 2,
      lev => 2, skill_id => 65022};
get_base({23903, 2}) ->
    #{id => 23903, name => lang:get("狂暴之怒"), quality => 2,
      lev => 2, skill_id => 65032};
get_base({23904, 2}) ->
    #{id => 23904, name => lang:get("饮胆尝血"), quality => 2,
      lev => 2, skill_id => 65042};
get_base({23905, 2}) ->
    #{id => 23905, name => lang:get("魔法洞察"), quality => 2,
      lev => 2, skill_id => 65052};
get_base({23906, 2}) ->
    #{id => 23906, name => lang:get("元素掌控"), quality => 2,
      lev => 2, skill_id => 65062};
get_base({23907, 2}) ->
    #{id => 23907, name => lang:get("魔法涌动"), quality => 2,
      lev => 2, skill_id => 65072};
get_base({23908, 2}) ->
    #{id => 23908, name => lang:get("魂飞魄散"), quality => 2,
      lev => 2, skill_id => 65082};
get_base({23909, 2}) ->
    #{id => 23909, name => lang:get("魔力之心"), quality => 2,
      lev => 2, skill_id => 65092};
get_base({23910, 2}) ->
    #{id => 23910, name => lang:get("暗影躲避"), quality => 2,
      lev => 2, skill_id => 65102};
get_base({23911, 2}) ->
    #{id => 23911, name => lang:get("钢铁之躯"), quality => 2,
      lev => 2, skill_id => 65112};
get_base({23912, 2}) ->
    #{id => 23912, name => lang:get("莲华护体"), quality => 2,
      lev => 2, skill_id => 65122};
get_base({23913, 2}) ->
    #{id => 23913, name => lang:get("元素屏障"), quality => 2,
      lev => 2, skill_id => 65132};
get_base({23914, 2}) ->
    #{id => 23914, name => lang:get("灵动迅捷"), quality => 2,
      lev => 2, skill_id => 65142};
get_base({23915, 2}) ->
    #{id => 23915, name => lang:get("治愈圣歌"), quality => 2,
      lev => 2, skill_id => 65152};
get_base({23916, 2}) ->
    #{id => 23916, name => lang:get("敏锐"), quality => 1,
      lev => 2, skill_id => 65202};
get_base({23917, 2}) ->
    #{id => 23917, name => lang:get("狂暴"), quality => 1,
      lev => 2, skill_id => 65212};
get_base({23918, 2}) ->
    #{id => 23918, name => lang:get("连刺"), quality => 1,
      lev => 2, skill_id => 65222};
get_base({23919, 2}) ->
    #{id => 23919, name => lang:get("连环"), quality => 1,
      lev => 2, skill_id => 65232};
get_base({23920, 2}) ->
    #{id => 23920, name => lang:get("识破"), quality => 1,
      lev => 2, skill_id => 65242};
get_base({23921, 2}) ->
    #{id => 23921, name => lang:get("暗杀"), quality => 1,
      lev => 2, skill_id => 65252};
get_base({23922, 2}) ->
    #{id => 23922, name => lang:get("突袭"), quality => 1,
      lev => 2, skill_id => 65262};
get_base({23923, 2}) ->
    #{id => 23923, name => lang:get("嗜血"), quality => 1,
      lev => 2, skill_id => 65272};
get_base({23924, 2}) ->
    #{id => 23924, name => lang:get("灵心"), quality => 1,
      lev => 2, skill_id => 65282};
get_base({23925, 2}) ->
    #{id => 23925, name => lang:get("元灭"), quality => 1,
      lev => 2, skill_id => 65292};
get_base({23926, 2}) ->
    #{id => 23926, name => lang:get("灵爆"), quality => 1,
      lev => 2, skill_id => 65302};
get_base({23927, 2}) ->
    #{id => 23927, name => lang:get("灵犀"), quality => 1,
      lev => 2, skill_id => 65312};
get_base({23928, 2}) ->
    #{id => 23928, name => lang:get("围攻"), quality => 1,
      lev => 2, skill_id => 65322};
get_base({23929, 2}) ->
    #{id => 23929, name => lang:get("唤击"), quality => 1,
      lev => 2, skill_id => 65332};
get_base({23930, 2}) ->
    #{id => 23930, name => lang:get("唤法"), quality => 1,
      lev => 2, skill_id => 65342};
get_base({23931, 2}) ->
    #{id => 23931, name => lang:get("矫健"), quality => 1,
      lev => 2, skill_id => 65352};
get_base({23932, 2}) ->
    #{id => 23932, name => lang:get("法护"), quality => 1,
      lev => 2, skill_id => 65362};
get_base({23933, 2}) ->
    #{id => 23933, name => lang:get("尖刺"), quality => 1,
      lev => 2, skill_id => 65372};
get_base({23934, 2}) ->
    #{id => 23934, name => lang:get("怒火"), quality => 1,
      lev => 2, skill_id => 65382};
get_base({23935, 2}) ->
    #{id => 23935, name => lang:get("韧性"), quality => 1,
      lev => 2, skill_id => 65392};
get_base({23900, 3}) ->
    #{id => 23900, name => lang:get("连击无双"), quality => 2,
      lev => 3, skill_id => 65003};
get_base({23901, 3}) ->
    #{id => 23901, name => lang:get("愈战愈勇"), quality => 2,
      lev => 3, skill_id => 65013};
get_base({23902, 3}) ->
    #{id => 23902, name => lang:get("破隐一击"), quality => 2,
      lev => 3, skill_id => 65023};
get_base({23903, 3}) ->
    #{id => 23903, name => lang:get("狂暴之怒"), quality => 2,
      lev => 3, skill_id => 65033};
get_base({23904, 3}) ->
    #{id => 23904, name => lang:get("饮胆尝血"), quality => 2,
      lev => 3, skill_id => 65043};
get_base({23905, 3}) ->
    #{id => 23905, name => lang:get("魔法洞察"), quality => 2,
      lev => 3, skill_id => 65053};
get_base({23906, 3}) ->
    #{id => 23906, name => lang:get("元素掌控"), quality => 2,
      lev => 3, skill_id => 65063};
get_base({23907, 3}) ->
    #{id => 23907, name => lang:get("魔法涌动"), quality => 2,
      lev => 3, skill_id => 65073};
get_base({23908, 3}) ->
    #{id => 23908, name => lang:get("魂飞魄散"), quality => 2,
      lev => 3, skill_id => 65083};
get_base({23909, 3}) ->
    #{id => 23909, name => lang:get("魔力之心"), quality => 2,
      lev => 3, skill_id => 65093};
get_base({23910, 3}) ->
    #{id => 23910, name => lang:get("暗影躲避"), quality => 2,
      lev => 3, skill_id => 65103};
get_base({23911, 3}) ->
    #{id => 23911, name => lang:get("钢铁之躯"), quality => 2,
      lev => 3, skill_id => 65113};
get_base({23912, 3}) ->
    #{id => 23912, name => lang:get("莲华护体"), quality => 2,
      lev => 3, skill_id => 65123};
get_base({23913, 3}) ->
    #{id => 23913, name => lang:get("元素屏障"), quality => 2,
      lev => 3, skill_id => 65133};
get_base({23914, 3}) ->
    #{id => 23914, name => lang:get("灵动迅捷"), quality => 2,
      lev => 3, skill_id => 65143};
get_base({23915, 3}) ->
    #{id => 23915, name => lang:get("治愈圣歌"), quality => 2,
      lev => 3, skill_id => 65153};
get_base({23916, 3}) ->
    #{id => 23916, name => lang:get("敏锐"), quality => 1,
      lev => 3, skill_id => 65203};
get_base({23917, 3}) ->
    #{id => 23917, name => lang:get("狂暴"), quality => 1,
      lev => 3, skill_id => 65213};
get_base({23918, 3}) ->
    #{id => 23918, name => lang:get("连刺"), quality => 1,
      lev => 3, skill_id => 65223};
get_base({23919, 3}) ->
    #{id => 23919, name => lang:get("连环"), quality => 1,
      lev => 3, skill_id => 65233};
get_base({23920, 3}) ->
    #{id => 23920, name => lang:get("识破"), quality => 1,
      lev => 3, skill_id => 65243};
get_base({23921, 3}) ->
    #{id => 23921, name => lang:get("暗杀"), quality => 1,
      lev => 3, skill_id => 65253};
get_base({23922, 3}) ->
    #{id => 23922, name => lang:get("突袭"), quality => 1,
      lev => 3, skill_id => 65263};
get_base({23923, 3}) ->
    #{id => 23923, name => lang:get("嗜血"), quality => 1,
      lev => 3, skill_id => 65273};
get_base({23924, 3}) ->
    #{id => 23924, name => lang:get("灵心"), quality => 1,
      lev => 3, skill_id => 65283};
get_base({23925, 3}) ->
    #{id => 23925, name => lang:get("元灭"), quality => 1,
      lev => 3, skill_id => 65293};
get_base({23926, 3}) ->
    #{id => 23926, name => lang:get("灵爆"), quality => 1,
      lev => 3, skill_id => 65303};
get_base({23927, 3}) ->
    #{id => 23927, name => lang:get("灵犀"), quality => 1,
      lev => 3, skill_id => 65313};
get_base({23928, 3}) ->
    #{id => 23928, name => lang:get("围攻"), quality => 1,
      lev => 3, skill_id => 65323};
get_base({23929, 3}) ->
    #{id => 23929, name => lang:get("唤击"), quality => 1,
      lev => 3, skill_id => 65333};
get_base({23930, 3}) ->
    #{id => 23930, name => lang:get("唤法"), quality => 1,
      lev => 3, skill_id => 65343};
get_base({23931, 3}) ->
    #{id => 23931, name => lang:get("矫健"), quality => 1,
      lev => 3, skill_id => 65353};
get_base({23932, 3}) ->
    #{id => 23932, name => lang:get("法护"), quality => 1,
      lev => 3, skill_id => 65363};
get_base({23933, 3}) ->
    #{id => 23933, name => lang:get("尖刺"), quality => 1,
      lev => 3, skill_id => 65373};
get_base({23934, 3}) ->
    #{id => 23934, name => lang:get("怒火"), quality => 1,
      lev => 3, skill_id => 65383};
get_base({23935, 3}) ->
    #{id => 23935, name => lang:get("韧性"), quality => 1,
      lev => 3, skill_id => 65393};
get_base({23900, 4}) ->
    #{id => 23900, name => lang:get("连击无双"), quality => 2,
      lev => 4, skill_id => 65004};
get_base({23901, 4}) ->
    #{id => 23901, name => lang:get("愈战愈勇"), quality => 2,
      lev => 4, skill_id => 65014};
get_base({23902, 4}) ->
    #{id => 23902, name => lang:get("破隐一击"), quality => 2,
      lev => 4, skill_id => 65024};
get_base({23903, 4}) ->
    #{id => 23903, name => lang:get("狂暴之怒"), quality => 2,
      lev => 4, skill_id => 65034};
get_base({23904, 4}) ->
    #{id => 23904, name => lang:get("饮胆尝血"), quality => 2,
      lev => 4, skill_id => 65044};
get_base({23905, 4}) ->
    #{id => 23905, name => lang:get("魔法洞察"), quality => 2,
      lev => 4, skill_id => 65054};
get_base({23906, 4}) ->
    #{id => 23906, name => lang:get("元素掌控"), quality => 2,
      lev => 4, skill_id => 65064};
get_base({23907, 4}) ->
    #{id => 23907, name => lang:get("魔法涌动"), quality => 2,
      lev => 4, skill_id => 65074};
get_base({23908, 4}) ->
    #{id => 23908, name => lang:get("魂飞魄散"), quality => 2,
      lev => 4, skill_id => 65084};
get_base({23909, 4}) ->
    #{id => 23909, name => lang:get("魔力之心"), quality => 2,
      lev => 4, skill_id => 65094};
get_base({23910, 4}) ->
    #{id => 23910, name => lang:get("暗影躲避"), quality => 2,
      lev => 4, skill_id => 65104};
get_base({23911, 4}) ->
    #{id => 23911, name => lang:get("钢铁之躯"), quality => 2,
      lev => 4, skill_id => 65114};
get_base({23912, 4}) ->
    #{id => 23912, name => lang:get("莲华护体"), quality => 2,
      lev => 4, skill_id => 65124};
get_base({23913, 4}) ->
    #{id => 23913, name => lang:get("元素屏障"), quality => 2,
      lev => 4, skill_id => 65134};
get_base({23914, 4}) ->
    #{id => 23914, name => lang:get("灵动迅捷"), quality => 2,
      lev => 4, skill_id => 65144};
get_base({23915, 4}) ->
    #{id => 23915, name => lang:get("治愈圣歌"), quality => 2,
      lev => 4, skill_id => 65154};
get_base({23916, 4}) ->
    #{id => 23916, name => lang:get("敏锐"), quality => 1,
      lev => 4, skill_id => 65204};
get_base({23917, 4}) ->
    #{id => 23917, name => lang:get("狂暴"), quality => 1,
      lev => 4, skill_id => 65214};
get_base({23918, 4}) ->
    #{id => 23918, name => lang:get("连刺"), quality => 1,
      lev => 4, skill_id => 65224};
get_base({23919, 4}) ->
    #{id => 23919, name => lang:get("连环"), quality => 1,
      lev => 4, skill_id => 65234};
get_base({23920, 4}) ->
    #{id => 23920, name => lang:get("识破"), quality => 1,
      lev => 4, skill_id => 65244};
get_base({23921, 4}) ->
    #{id => 23921, name => lang:get("暗杀"), quality => 1,
      lev => 4, skill_id => 65254};
get_base({23922, 4}) ->
    #{id => 23922, name => lang:get("突袭"), quality => 1,
      lev => 4, skill_id => 65264};
get_base({23923, 4}) ->
    #{id => 23923, name => lang:get("嗜血"), quality => 1,
      lev => 4, skill_id => 65274};
get_base({23924, 4}) ->
    #{id => 23924, name => lang:get("灵心"), quality => 1,
      lev => 4, skill_id => 65284};
get_base({23925, 4}) ->
    #{id => 23925, name => lang:get("元灭"), quality => 1,
      lev => 4, skill_id => 65294};
get_base({23926, 4}) ->
    #{id => 23926, name => lang:get("灵爆"), quality => 1,
      lev => 4, skill_id => 65304};
get_base({23927, 4}) ->
    #{id => 23927, name => lang:get("灵犀"), quality => 1,
      lev => 4, skill_id => 65314};
get_base({23928, 4}) ->
    #{id => 23928, name => lang:get("围攻"), quality => 1,
      lev => 4, skill_id => 65324};
get_base({23929, 4}) ->
    #{id => 23929, name => lang:get("唤击"), quality => 1,
      lev => 4, skill_id => 65334};
get_base({23930, 4}) ->
    #{id => 23930, name => lang:get("唤法"), quality => 1,
      lev => 4, skill_id => 65344};
get_base({23931, 4}) ->
    #{id => 23931, name => lang:get("矫健"), quality => 1,
      lev => 4, skill_id => 65354};
get_base({23932, 4}) ->
    #{id => 23932, name => lang:get("法护"), quality => 1,
      lev => 4, skill_id => 65364};
get_base({23933, 4}) ->
    #{id => 23933, name => lang:get("尖刺"), quality => 1,
      lev => 4, skill_id => 65374};
get_base({23934, 4}) ->
    #{id => 23934, name => lang:get("怒火"), quality => 1,
      lev => 4, skill_id => 65384};
get_base({23935, 4}) ->
    #{id => 23935, name => lang:get("韧性"), quality => 1,
      lev => 4, skill_id => 65394};
get_base({23900, 5}) ->
    #{id => 23900, name => lang:get("连击无双"), quality => 2,
      lev => 5, skill_id => 65005};
get_base({23901, 5}) ->
    #{id => 23901, name => lang:get("愈战愈勇"), quality => 2,
      lev => 5, skill_id => 65015};
get_base({23902, 5}) ->
    #{id => 23902, name => lang:get("破隐一击"), quality => 2,
      lev => 5, skill_id => 65025};
get_base({23903, 5}) ->
    #{id => 23903, name => lang:get("狂暴之怒"), quality => 2,
      lev => 5, skill_id => 65035};
get_base({23904, 5}) ->
    #{id => 23904, name => lang:get("饮胆尝血"), quality => 2,
      lev => 5, skill_id => 65045};
get_base({23905, 5}) ->
    #{id => 23905, name => lang:get("魔法洞察"), quality => 2,
      lev => 5, skill_id => 65055};
get_base({23906, 5}) ->
    #{id => 23906, name => lang:get("元素掌控"), quality => 2,
      lev => 5, skill_id => 65065};
get_base({23907, 5}) ->
    #{id => 23907, name => lang:get("魔法涌动"), quality => 2,
      lev => 5, skill_id => 65075};
get_base({23908, 5}) ->
    #{id => 23908, name => lang:get("魂飞魄散"), quality => 2,
      lev => 5, skill_id => 65085};
get_base({23909, 5}) ->
    #{id => 23909, name => lang:get("魔力之心"), quality => 2,
      lev => 5, skill_id => 65095};
get_base({23910, 5}) ->
    #{id => 23910, name => lang:get("暗影躲避"), quality => 2,
      lev => 5, skill_id => 65105};
get_base({23911, 5}) ->
    #{id => 23911, name => lang:get("钢铁之躯"), quality => 2,
      lev => 5, skill_id => 65115};
get_base({23912, 5}) ->
    #{id => 23912, name => lang:get("莲华护体"), quality => 2,
      lev => 5, skill_id => 65125};
get_base({23913, 5}) ->
    #{id => 23913, name => lang:get("元素屏障"), quality => 2,
      lev => 5, skill_id => 65135};
get_base({23914, 5}) ->
    #{id => 23914, name => lang:get("灵动迅捷"), quality => 2,
      lev => 5, skill_id => 65145};
get_base({23915, 5}) ->
    #{id => 23915, name => lang:get("治愈圣歌"), quality => 2,
      lev => 5, skill_id => 65155};
get_base({23916, 5}) ->
    #{id => 23916, name => lang:get("敏锐"), quality => 1,
      lev => 5, skill_id => 65205};
get_base({23917, 5}) ->
    #{id => 23917, name => lang:get("狂暴"), quality => 1,
      lev => 5, skill_id => 65215};
get_base({23918, 5}) ->
    #{id => 23918, name => lang:get("连刺"), quality => 1,
      lev => 5, skill_id => 65225};
get_base({23919, 5}) ->
    #{id => 23919, name => lang:get("连环"), quality => 1,
      lev => 5, skill_id => 65235};
get_base({23920, 5}) ->
    #{id => 23920, name => lang:get("识破"), quality => 1,
      lev => 5, skill_id => 65245};
get_base({23921, 5}) ->
    #{id => 23921, name => lang:get("暗杀"), quality => 1,
      lev => 5, skill_id => 65255};
get_base({23922, 5}) ->
    #{id => 23922, name => lang:get("突袭"), quality => 1,
      lev => 5, skill_id => 65265};
get_base({23923, 5}) ->
    #{id => 23923, name => lang:get("嗜血"), quality => 1,
      lev => 5, skill_id => 65275};
get_base({23924, 5}) ->
    #{id => 23924, name => lang:get("灵心"), quality => 1,
      lev => 5, skill_id => 65285};
get_base({23925, 5}) ->
    #{id => 23925, name => lang:get("元灭"), quality => 1,
      lev => 5, skill_id => 65295};
get_base({23926, 5}) ->
    #{id => 23926, name => lang:get("灵爆"), quality => 1,
      lev => 5, skill_id => 65305};
get_base({23927, 5}) ->
    #{id => 23927, name => lang:get("灵犀"), quality => 1,
      lev => 5, skill_id => 65315};
get_base({23928, 5}) ->
    #{id => 23928, name => lang:get("围攻"), quality => 1,
      lev => 5, skill_id => 65325};
get_base({23929, 5}) ->
    #{id => 23929, name => lang:get("唤击"), quality => 1,
      lev => 5, skill_id => 65335};
get_base({23930, 5}) ->
    #{id => 23930, name => lang:get("唤法"), quality => 1,
      lev => 5, skill_id => 65345};
get_base({23931, 5}) ->
    #{id => 23931, name => lang:get("矫健"), quality => 1,
      lev => 5, skill_id => 65355};
get_base({23932, 5}) ->
    #{id => 23932, name => lang:get("法护"), quality => 1,
      lev => 5, skill_id => 65365};
get_base({23933, 5}) ->
    #{id => 23933, name => lang:get("尖刺"), quality => 1,
      lev => 5, skill_id => 65375};
get_base({23934, 5}) ->
    #{id => 23934, name => lang:get("怒火"), quality => 1,
      lev => 5, skill_id => 65385};
get_base({23935, 5}) ->
    #{id => 23935, name => lang:get("韧性"), quality => 1,
      lev => 5, skill_id => 65395};
get_base({23916, 6}) ->
    #{id => 23916, name => lang:get("敏锐"), quality => 1,
      lev => 6, skill_id => 65206};
get_base({23917, 6}) ->
    #{id => 23917, name => lang:get("狂暴"), quality => 1,
      lev => 6, skill_id => 65216};
get_base({23918, 6}) ->
    #{id => 23918, name => lang:get("连刺"), quality => 1,
      lev => 6, skill_id => 65226};
get_base({23919, 6}) ->
    #{id => 23919, name => lang:get("连环"), quality => 1,
      lev => 6, skill_id => 65236};
get_base({23920, 6}) ->
    #{id => 23920, name => lang:get("识破"), quality => 1,
      lev => 6, skill_id => 65246};
get_base({23921, 6}) ->
    #{id => 23921, name => lang:get("暗杀"), quality => 1,
      lev => 6, skill_id => 65256};
get_base({23922, 6}) ->
    #{id => 23922, name => lang:get("突袭"), quality => 1,
      lev => 6, skill_id => 65266};
get_base({23923, 6}) ->
    #{id => 23923, name => lang:get("嗜血"), quality => 1,
      lev => 6, skill_id => 65276};
get_base({23924, 6}) ->
    #{id => 23924, name => lang:get("灵心"), quality => 1,
      lev => 6, skill_id => 65286};
get_base({23925, 6}) ->
    #{id => 23925, name => lang:get("元灭"), quality => 1,
      lev => 6, skill_id => 65296};
get_base({23926, 6}) ->
    #{id => 23926, name => lang:get("灵爆"), quality => 1,
      lev => 6, skill_id => 65306};
get_base({23927, 6}) ->
    #{id => 23927, name => lang:get("灵犀"), quality => 1,
      lev => 6, skill_id => 65316};
get_base({23928, 6}) ->
    #{id => 23928, name => lang:get("围攻"), quality => 1,
      lev => 6, skill_id => 65326};
get_base({23929, 6}) ->
    #{id => 23929, name => lang:get("唤击"), quality => 1,
      lev => 6, skill_id => 65336};
get_base({23930, 6}) ->
    #{id => 23930, name => lang:get("唤法"), quality => 1,
      lev => 6, skill_id => 65346};
get_base({23931, 6}) ->
    #{id => 23931, name => lang:get("矫健"), quality => 1,
      lev => 6, skill_id => 65356};
get_base({23932, 6}) ->
    #{id => 23932, name => lang:get("法护"), quality => 1,
      lev => 6, skill_id => 65366};
get_base({23933, 6}) ->
    #{id => 23933, name => lang:get("尖刺"), quality => 1,
      lev => 6, skill_id => 65376};
get_base({23934, 6}) ->
    #{id => 23934, name => lang:get("怒火"), quality => 1,
      lev => 6, skill_id => 65386};
get_base({23935, 6}) ->
    #{id => 23935, name => lang:get("韧性"), quality => 1,
      lev => 6, skill_id => 65396};
get_base(_) -> false.

get_all_rune() ->
    [{2, 23906},
     {1, 23925},
     {2, 23903},
     {1, 23922},
     {2, 23900},
     {1, 23918},
     {2, 23914},
     {1, 23933},
     {2, 23911},
     {1, 23929},
     {1, 23930},
     {2, 23907},
     {1, 23926},
     {2, 23904},
     {1, 23923},
     {2, 23901},
     {1, 23919},
     {1, 23920},
     {2, 23915},
     {1, 23916},
     {1, 23934},
     {2, 23912},
     {1, 23931},
     {2, 23908},
     {1, 23927},
     {2, 23905},
     {1, 23924},
     {2, 23902},
     {1, 23921},
     {1, 23917},
     {1, 23935},
     {2, 23913},
     {1, 23932},
     {2, 23909},
     {2, 23910},
     {1, 23928}].

get_understand(1) -> [{90000, 500000}];
get_understand(2) -> [{20061, 2}];
get_understand(_) -> false.

get_update({1, 1}) -> 1;
get_update({1, 2}) -> 1;
get_update({1, 3}) -> 2;
get_update({1, 4}) -> 4;
get_update({1, 5}) -> 0;
get_update({1, 6}) -> 0;
get_update({2, 1}) -> 1;
get_update({2, 2}) -> 1;
get_update({2, 3}) -> 1;
get_update({2, 4}) -> 1;
get_update({2, 5}) -> 0;
get_update(_) -> false.

get_unload({1, 1}) -> 0;
get_unload({1, 2}) -> 1;
get_unload({1, 3}) -> 1;
get_unload({1, 4}) -> 2;
get_unload({1, 5}) -> 3;
get_unload({1, 6}) -> 3;
get_unload({2, 1}) -> 0;
get_unload({2, 2}) -> 1;
get_unload({2, 3}) -> 1;
get_unload({2, 4}) -> 2;
get_unload({2, 5}) -> 2;
get_unload(_) -> false.

get_combat(4) -> 2;
get_combat(5) -> 10;
get_combat(8) -> 1;
get_combat(11) -> 1;
get_combat(9) -> 1;
get_combat(13) -> 2;
get_combat(17) -> 5;
get_combat(18) -> 1;
get_combat(19) -> 10;
get_combat(26) -> 10;
get_combat(40) -> 10;
get_combat(41) -> 5;
get_combat(58) -> 10;
get_combat(63) -> 5;
get_combat(68) -> 10;
get_combat(100) -> 5;
get_combat(102) -> 5;
get_combat(103) -> 5;
get_combat(104) -> 5;
get_combat(105) -> 5;
get_combat(106) -> 5;
get_combat(107) -> 5;
get_combat(112) -> 5;
get_combat(113) -> 5;
get_combat(114) -> 5;
get_combat(116) -> 5;
get_combat(_) -> false.

get_resonate(1) -> {1, 1};
get_resonate(2) -> {1, 1};
get_resonate(3) -> {1, 1};
get_resonate(4) -> {1, 1};
get_resonate(5) -> {1, 1};
get_resonate(_) -> false.

get_pet_rune({1, 0, 0}) -> {1, 1};
get_pet_rune({15, 0, 0}) -> {1, 1};
get_pet_rune({35, 0, 0}) -> {1, 1};
get_pet_rune({45, 0, 0}) -> {1, 2};
get_pet_rune({55, 0, 0}) -> {1, 2};
get_pet_rune({65, 0, 0}) -> {1, 2};
get_pet_rune({75, 0, 0}) -> {1, 3};
get_pet_rune({85, 0, 0}) -> {1, 3};
get_pet_rune({90, 0, 0}) -> {1, 3};
get_pet_rune({95, 0, 0}) -> {1, 3};
get_pet_rune({95, 0, 1}) -> {1, 3};
get_pet_rune({105, 0, 1}) -> {1, 3};
get_pet_rune({110, 0, 1}) -> {1, 3};
get_pet_rune({115, 0, 1}) -> {1, 3};
get_pet_rune({120, 0, 1}) -> {1, 3};
get_pet_rune({1, 1, 0}) -> {1, 3};
get_pet_rune({1, 1, 1}) -> {1, 3};
get_pet_rune(_) -> false.

