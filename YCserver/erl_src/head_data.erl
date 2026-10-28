-file("src/data/head_data.erl", 1).

-module(head_data).

-export([get_head/1,
         list/0,
         get_head_frame/1,
         list_frame/0,
         get_time/1]).

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

-file("src/data/head_data.erl", 18).

-file("inc/head.hrl", 1).

-record(m_head,
        {ver = 2 :: pos_integer(),
         id_now = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         head = [] :: list(),
         frame_id_now = 0 :: non_neg_integer(),
         frame_time_buy = 0 :: non_neg_integer(),
         frame_day = 0 :: non_neg_integer(),
         head_frame = [] :: list()}).

-record(head,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-record(head_frame,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-file("src/data/head_data.erl", 19).

list() -> [1, 2, 3, 4].

get_head({2, 10000}) ->
    #{type => 2, num => 10000, sex => 1, price => 0};
get_head({2, 10001}) ->
    #{type => 2, num => 10001, sex => 1, price => 0};
get_head({2, 10002}) ->
    #{type => 2, num => 10002, sex => 1, price => 0};
get_head({2, 10003}) ->
    #{type => 2, num => 10003, sex => 1, price => 0};
get_head({2, 10004}) ->
    #{type => 2, num => 10004, sex => 1, price => 0};
get_head({2, 10005}) ->
    #{type => 2, num => 10005, sex => 1, price => 0};
get_head({2, 10006}) ->
    #{type => 2, num => 10006, sex => 1, price => 0};
get_head({2, 10007}) ->
    #{type => 2, num => 10007, sex => 1, price => 0};
get_head({2, 10008}) ->
    #{type => 2, num => 10008, sex => 1, price => 0};
get_head({2, 10009}) ->
    #{type => 2, num => 10009, sex => 1, price => 0};
get_head({2, 10010}) ->
    #{type => 2, num => 10010, sex => 1, price => 0};
get_head({2, 10011}) ->
    #{type => 2, num => 10011, sex => 1, price => 0};
get_head({2, 10012}) ->
    #{type => 2, num => 10012, sex => 1, price => 0};
get_head({2, 10013}) ->
    #{type => 2, num => 10013, sex => 1, price => 0};
get_head({2, 11000}) ->
    #{type => 2, num => 11000, sex => 0, price => 0};
get_head({2, 11001}) ->
    #{type => 2, num => 11001, sex => 0, price => 0};
get_head({2, 11002}) ->
    #{type => 2, num => 11002, sex => 0, price => 0};
get_head({2, 11003}) ->
    #{type => 2, num => 11003, sex => 0, price => 0};
get_head({2, 11004}) ->
    #{type => 2, num => 11004, sex => 0, price => 0};
get_head({2, 11005}) ->
    #{type => 2, num => 11005, sex => 0, price => 0};
get_head({2, 11006}) ->
    #{type => 2, num => 11006, sex => 0, price => 0};
get_head({2, 11007}) ->
    #{type => 2, num => 11007, sex => 0, price => 0};
get_head({2, 11008}) ->
    #{type => 2, num => 11008, sex => 0, price => 0};
get_head({2, 11009}) ->
    #{type => 2, num => 11009, sex => 0, price => 0};
get_head({2, 11010}) ->
    #{type => 2, num => 11010, sex => 0, price => 0};
get_head({2, 11011}) ->
    #{type => 2, num => 11011, sex => 0, price => 0};
get_head({2, 11012}) ->
    #{type => 2, num => 11012, sex => 0, price => 0};
get_head({1, 20000}) ->
    #{type => 1, num => 20000, sex => 1, price => 0};
get_head({1, 20001}) ->
    #{type => 1, num => 20001, sex => 1, price => 0};
get_head({1, 20002}) ->
    #{type => 1, num => 20002, sex => 1, price => 0};
get_head({1, 20003}) ->
    #{type => 1, num => 20003, sex => 1, price => 0};
get_head({1, 20004}) ->
    #{type => 1, num => 20004, sex => 1, price => 0};
get_head({1, 20005}) ->
    #{type => 1, num => 20005, sex => 1, price => 0};
get_head({1, 20006}) ->
    #{type => 1, num => 20006, sex => 1, price => 0};
get_head({1, 20007}) ->
    #{type => 1, num => 20007, sex => 1, price => 0};
get_head({1, 20008}) ->
    #{type => 1, num => 20008, sex => 1, price => 0};
get_head({1, 20009}) ->
    #{type => 1, num => 20009, sex => 1, price => 0};
get_head({1, 20010}) ->
    #{type => 1, num => 20010, sex => 1, price => 0};
get_head({1, 20011}) ->
    #{type => 1, num => 20011, sex => 1, price => 0};
get_head({1, 20012}) ->
    #{type => 1, num => 20012, sex => 1, price => 0};
get_head({1, 20013}) ->
    #{type => 1, num => 20013, sex => 1, price => 0};
get_head({1, 20014}) ->
    #{type => 1, num => 20014, sex => 1, price => 0};
get_head({1, 20015}) ->
    #{type => 1, num => 20015, sex => 1, price => 0};
get_head({1, 20016}) ->
    #{type => 1, num => 20016, sex => 1, price => 0};
get_head({1, 21000}) ->
    #{type => 1, num => 21000, sex => 0, price => 0};
get_head({1, 21001}) ->
    #{type => 1, num => 21001, sex => 0, price => 0};
get_head({1, 21002}) ->
    #{type => 1, num => 21002, sex => 0, price => 0};
get_head({1, 21003}) ->
    #{type => 1, num => 21003, sex => 0, price => 0};
get_head({1, 21004}) ->
    #{type => 1, num => 21004, sex => 0, price => 0};
get_head({1, 21005}) ->
    #{type => 1, num => 21005, sex => 0, price => 0};
get_head({1, 21006}) ->
    #{type => 1, num => 21006, sex => 0, price => 0};
get_head({1, 21007}) ->
    #{type => 1, num => 21007, sex => 0, price => 0};
get_head({1, 21008}) ->
    #{type => 1, num => 21008, sex => 0, price => 0};
get_head({1, 21009}) ->
    #{type => 1, num => 21009, sex => 0, price => 0};
get_head({1, 21010}) ->
    #{type => 1, num => 21010, sex => 0, price => 0};
get_head({1, 21011}) ->
    #{type => 1, num => 21011, sex => 0, price => 0};
get_head({1, 21012}) ->
    #{type => 1, num => 21012, sex => 0, price => 0};
get_head({1, 21013}) ->
    #{type => 1, num => 21013, sex => 0, price => 0};
get_head({4, 30000}) ->
    #{type => 4, num => 30000, sex => 1, price => 100};
get_head({4, 30001}) ->
    #{type => 4, num => 30001, sex => 1, price => 100};
get_head({4, 30002}) ->
    #{type => 4, num => 30002, sex => 1, price => 200};
get_head({4, 30003}) ->
    #{type => 4, num => 30003, sex => 1, price => 100};
get_head({4, 30004}) ->
    #{type => 4, num => 30004, sex => 1, price => 0};
get_head({4, 30005}) ->
    #{type => 4, num => 30005, sex => 1, price => 200};
get_head({4, 30006}) ->
    #{type => 4, num => 30006, sex => 1, price => 0};
get_head({4, 30007}) ->
    #{type => 4, num => 30007, sex => 1, price => 200};
get_head({4, 30008}) ->
    #{type => 4, num => 30008, sex => 1, price => 200};
get_head({4, 30009}) ->
    #{type => 4, num => 30009, sex => 1, price => 200};
get_head({4, 30010}) ->
    #{type => 4, num => 30010, sex => 1, price => 200};
get_head({4, 30011}) ->
    #{type => 4, num => 30011, sex => 1, price => 100};
get_head({4, 30012}) ->
    #{type => 4, num => 30012, sex => 1, price => 100};
get_head({4, 30013}) ->
    #{type => 4, num => 30013, sex => 1, price => 100};
get_head({4, 30014}) ->
    #{type => 4, num => 30014, sex => 1, price => 100};
get_head({4, 31000}) ->
    #{type => 4, num => 31000, sex => 0, price => 200};
get_head({4, 31001}) ->
    #{type => 4, num => 31001, sex => 0, price => 200};
get_head({4, 31002}) ->
    #{type => 4, num => 31002, sex => 0, price => 200};
get_head({4, 31003}) ->
    #{type => 4, num => 31003, sex => 0, price => 0};
get_head({4, 31004}) ->
    #{type => 4, num => 31004, sex => 0, price => 0};
get_head({4, 31005}) ->
    #{type => 4, num => 31005, sex => 0, price => 100};
get_head({4, 31006}) ->
    #{type => 4, num => 31006, sex => 0, price => 100};
get_head({4, 31007}) ->
    #{type => 4, num => 31007, sex => 0, price => 100};
get_head({4, 31008}) ->
    #{type => 4, num => 31008, sex => 0, price => 200};
get_head({4, 31009}) ->
    #{type => 4, num => 31009, sex => 0, price => 100};
get_head({4, 31010}) ->
    #{type => 4, num => 31010, sex => 0, price => 200};
get_head({4, 31011}) ->
    #{type => 4, num => 31011, sex => 0, price => 200};
get_head({4, 31012}) ->
    #{type => 4, num => 31012, sex => 0, price => 100};
get_head({4, 31013}) ->
    #{type => 4, num => 31013, sex => 0, price => 100};
get_head({4, 31014}) ->
    #{type => 4, num => 31014, sex => 0, price => 100};
get_head({4, 31015}) ->
    #{type => 4, num => 31015, sex => 0, price => 100};
get_head({4, 31016}) ->
    #{type => 4, num => 31016, sex => 0, price => 100};
get_head({3, 40000}) ->
    #{type => 3, num => 40000, sex => 2, price => 0};
get_head({3, 40001}) ->
    #{type => 3, num => 40001, sex => 2, price => 0};
get_head({3, 40002}) ->
    #{type => 3, num => 40002, sex => 2, price => 0};
get_head({3, 40003}) ->
    #{type => 3, num => 40003, sex => 2, price => 0};
get_head({3, 40004}) ->
    #{type => 3, num => 40004, sex => 2, price => 0};
get_head({3, 40005}) ->
    #{type => 3, num => 40005, sex => 2, price => 0};
get_head({3, 40006}) ->
    #{type => 3, num => 40006, sex => 2, price => 0};
get_head({3, 40007}) ->
    #{type => 3, num => 40007, sex => 2, price => 0};
get_head({3, 40008}) ->
    #{type => 3, num => 40008, sex => 2, price => 0};
get_head({3, 40009}) ->
    #{type => 3, num => 40009, sex => 2, price => 0};
get_head({3, 40010}) ->
    #{type => 3, num => 40010, sex => 2, price => 0};
get_head({3, 40011}) ->
    #{type => 3, num => 40011, sex => 2, price => 0};
get_head({3, 40012}) ->
    #{type => 3, num => 40012, sex => 2, price => 0};
get_head({3, 40013}) ->
    #{type => 3, num => 40013, sex => 2, price => 0};
get_head({3, 40014}) ->
    #{type => 3, num => 40014, sex => 2, price => 0};
get_head({3, 40015}) ->
    #{type => 3, num => 40015, sex => 2, price => 0};
get_head({_Id, _Type}) -> false.

get_head_frame({5, 50000}) ->
    #{type => 5, num => 50000, sex => 2,
      name => lang:get("彩虹"), cost => [{22428, 1}],
      end_time => 30};
get_head_frame({5, 50001}) ->
    #{type => 5, num => 50001, sex => 2,
      name => lang:get("玫瑰"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50002}) ->
    #{type => 5, num => 50002, sex => 2,
      name => lang:get("笑脸"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50003}) ->
    #{type => 5, num => 50003, sex => 2,
      name => lang:get("狗狗"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50004}) ->
    #{type => 5, num => 50004, sex => 2,
      name => lang:get("萌主"), cost => [{22425, 1}],
      end_time => 30};
get_head_frame({5, 50005}) ->
    #{type => 5, num => 50005, sex => 2,
      name => lang:get("小草"), cost => [{22426, 1}],
      end_time => 30};
get_head_frame({5, 50006}) ->
    #{type => 5, num => 50006, sex => 2,
      name => lang:get("猫耳朵"), cost => [{22427, 1}],
      end_time => 30};
get_head_frame({5, 50007}) ->
    #{type => 5, num => 50007, sex => 2,
      name => lang:get("单身狗"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50008}) ->
    #{type => 5, num => 50008, sex => 2,
      name => lang:get("单身喵"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50009}) ->
    #{type => 5, num => 50009, sex => 2,
      name => lang:get("男神"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50010}) ->
    #{type => 5, num => 50010, sex => 2,
      name => lang:get("女神"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50011}) ->
    #{type => 5, num => 50011, sex => 2,
      name => lang:get("求妹子"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50012}) ->
    #{type => 5, num => 50012, sex => 2,
      name => lang:get("撒狗粮"), cost => [{22423, 1}],
      end_time => 30};
get_head_frame({5, 50013}) ->
    #{type => 5, num => 50013, sex => 2,
      name => lang:get("蛋壳"), cost => [{22424, 1}],
      end_time => 30};
get_head_frame({5, 50014}) ->
    #{type => 5, num => 50014, sex => 2,
      name => lang:get("熊喵"), cost => [{22429, 1}],
      end_time => 30};
get_head_frame({5, 50015}) ->
    #{type => 5, num => 50015, sex => 2,
      name => lang:get("雪娃"), cost => [{22433, 1}],
      end_time => 30};
get_head_frame({5, 50016}) ->
    #{type => 5, num => 50016, sex => 2,
      name => lang:get("吉祥如意"), cost => [{22434, 1}],
      end_time => 30};
get_head_frame({5, 50017}) ->
    #{type => 5, num => 50017, sex => 2,
      name => lang:get("深海魔鲸"), cost => [{22436, 1}],
      end_time => 30};
get_head_frame({5, 50018}) ->
    #{type => 5, num => 50018, sex => 2,
      name => lang:get("心心相印"), cost => [{70288, 1}],
      end_time => 30};
get_head_frame({5, 50019}) ->
    #{type => 5, num => 50019, sex => 2,
      name => lang:get("红星照耀"), cost => [{70377, 1}],
      end_time => 30};
get_head_frame({5, 50020}) ->
    #{type => 5, num => 50020, sex => 2,
      name => lang:get("璀璨水晶"), cost => [{70486, 1}],
      end_time => 90};
get_head_frame({5, 50021}) ->
    #{type => 5, num => 50021, sex => 2,
      name => lang:get("圆蛋超人"), cost => [{70558, 1}],
      end_time => 30};
get_head_frame({5, 50022}) ->
    #{type => 5, num => 50022, sex => 2,
      name => lang:get("金猪宝宝"), cost => [{70630, 1}],
      end_time => 30};
get_head_frame({5, 50023}) ->
    #{type => 5, num => 50023, sex => 2,
      name => lang:get("绿树林荫"), cost => [{70896, 1}],
      end_time => 30};
get_head_frame({5, 50024}) ->
    #{type => 5, num => 50024, sex => 2,
      name => lang:get("奋笔疾书"), cost => [{70944, 1}],
      end_time => 30};
get_head_frame({5, 50025}) ->
    #{type => 5, num => 50025, sex => 2,
      name => lang:get("余音袅袅"), cost => [{71064, 1}],
      end_time => 30};
get_head_frame({5, 50026}) ->
    #{type => 5, num => 50026, sex => 2,
      name => lang:get("欢天喜地"), cost => [{71144, 1}],
      end_time => 30};
get_head_frame({5, 50027}) ->
    #{type => 5, num => 50027, sex => 2,
      name => lang:get("冰蓝之心"), cost => [{71254, 1}],
      end_time => 30};
get_head_frame({5, 50028}) ->
    #{type => 5, num => 50028, sex => 2,
      name => lang:get("小恶魔"), cost => [{71254, 1}],
      end_time => 30};
get_head_frame({5, 50029}) ->
    #{type => 5, num => 50029, sex => 2,
      name => lang:get("小兔纸"), cost => [{71335, 1}],
      end_time => 30};
get_head_frame({5, 50030}) ->
    #{type => 5, num => 50030, sex => 2,
      name => lang:get("金鼠迎春"), cost => [{71392, 1}],
      end_time => 30};
get_head_frame({5, 50031}) ->
    #{type => 5, num => 50031, sex => 2,
      name => lang:get("璀璨巨星"), cost => [{71464, 1}],
      end_time => 30};
get_head_frame({5, 50032}) ->
    #{type => 5, num => 50032, sex => 2,
      name => lang:get("清幽冰鹤"), cost => [{71526, 1}],
      end_time => 30};
get_head_frame({5, 50033}) ->
    #{type => 5, num => 50033, sex => 2,
      name => lang:get("伞下一梦"), cost => [{71570, 1}],
      end_time => 30};
get_head_frame({6, 55000}) ->
    #{type => 6, num => 55000, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55001}) ->
    #{type => 6, num => 55001, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55002}) ->
    #{type => 6, num => 55002, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55003}) ->
    #{type => 6, num => 55003, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55004}) ->
    #{type => 6, num => 55004, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55005}) ->
    #{type => 6, num => 55005, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55006}) ->
    #{type => 6, num => 55006, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55007}) ->
    #{type => 6, num => 55007, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55008}) ->
    #{type => 6, num => 55008, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55009}) ->
    #{type => 6, num => 55009, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55010}) ->
    #{type => 6, num => 55010, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55011}) ->
    #{type => 6, num => 55011, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55012}) ->
    #{type => 6, num => 55012, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55013}) ->
    #{type => 6, num => 55013, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55014}) ->
    #{type => 6, num => 55014, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55015}) ->
    #{type => 6, num => 55015, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55016}) ->
    #{type => 6, num => 55016, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55017}) ->
    #{type => 6, num => 55017, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55018}) ->
    #{type => 6, num => 55018, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55019}) ->
    #{type => 6, num => 55019, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55020}) ->
    #{type => 6, num => 55020, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55021}) ->
    #{type => 6, num => 55021, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55022}) ->
    #{type => 6, num => 55022, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55023}) ->
    #{type => 6, num => 55023, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55024}) ->
    #{type => 6, num => 55024, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55025}) ->
    #{type => 6, num => 55025, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55026}) ->
    #{type => 6, num => 55026, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55027}) ->
    #{type => 6, num => 55027, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55028}) ->
    #{type => 6, num => 55028, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55029}) ->
    #{type => 6, num => 55029, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55030}) ->
    #{type => 6, num => 55030, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55031}) ->
    #{type => 6, num => 55031, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55032}) ->
    #{type => 6, num => 55032, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55033}) ->
    #{type => 6, num => 55033, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55034}) ->
    #{type => 6, num => 55034, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55035}) ->
    #{type => 6, num => 55035, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55036}) ->
    #{type => 6, num => 55036, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55037}) ->
    #{type => 6, num => 55037, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55038}) ->
    #{type => 6, num => 55038, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55039}) ->
    #{type => 6, num => 55039, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55040}) ->
    #{type => 6, num => 55040, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55041}) ->
    #{type => 6, num => 55041, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55042}) ->
    #{type => 6, num => 55042, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55043}) ->
    #{type => 6, num => 55043, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55044}) ->
    #{type => 6, num => 55044, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55045}) ->
    #{type => 6, num => 55045, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55046}) ->
    #{type => 6, num => 55046, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55047}) ->
    #{type => 6, num => 55047, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55048}) ->
    #{type => 6, num => 55048, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55049}) ->
    #{type => 6, num => 55049, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55050}) ->
    #{type => 6, num => 55050, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55051}) ->
    #{type => 6, num => 55051, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55052}) ->
    #{type => 6, num => 55052, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55053}) ->
    #{type => 6, num => 55053, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55054}) ->
    #{type => 6, num => 55054, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55055}) ->
    #{type => 6, num => 55055, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55056}) ->
    #{type => 6, num => 55056, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55057}) ->
    #{type => 6, num => 55057, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55058}) ->
    #{type => 6, num => 55058, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55059}) ->
    #{type => 6, num => 55059, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55060}) ->
    #{type => 6, num => 55060, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55061}) ->
    #{type => 6, num => 55061, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55062}) ->
    #{type => 6, num => 55062, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55063}) ->
    #{type => 6, num => 55063, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55064}) ->
    #{type => 6, num => 55064, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55065}) ->
    #{type => 6, num => 55065, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55066}) ->
    #{type => 6, num => 55066, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55067}) ->
    #{type => 6, num => 55067, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55068}) ->
    #{type => 6, num => 55068, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55069}) ->
    #{type => 6, num => 55069, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55070}) ->
    #{type => 6, num => 55070, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55071}) ->
    #{type => 6, num => 55071, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55072}) ->
    #{type => 6, num => 55072, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55073}) ->
    #{type => 6, num => 55073, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55074}) ->
    #{type => 6, num => 55074, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55075}) ->
    #{type => 6, num => 55075, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55076}) ->
    #{type => 6, num => 55076, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({6, 55077}) ->
    #{type => 6, num => 55077, sex => 2,
      name => lang:get("这是头像框")};
get_head_frame({_Id, _Type}) -> false.

list_frame() -> [5, 6].

get_time(1) -> #{id => 1, end_time => 30};
get_time(2) -> #{id => 2, end_time => 3};
get_time(3) -> #{id => 3, end_time => 7};
get_time(4) -> #{id => 4, end_time => 90};
get_time(_Id) -> false.

