-file("src/services.erl", 1).

-module(services).

-export([config/1, get/1]).

-file("inc/service.hrl", 1).

-record(service,
        {id :: undefined | atom(),
         name = "" :: list(),
         mfa :: undefined | {atom(), atom(), list()},
         multi = false :: boolean(),
         world = false :: boolean(),
         depend_on = [] :: list(),
         can_stop = false :: boolean(),
         restart = transient ::
             permanent | transient | temporary,
         type = worker :: worker | supervisor}).

-file("src/services.erl", 15).

-spec cfg(atom()) -> {ok, list()} | {error, undefined}.

cfg(shell) -> {ok, []};
cfg(node) -> {ok, [log, info, cross]};
cfg(center) ->
    {ok,
     [log,
      info,
      edets_mon,
      treasure,
      role_group,
      cross_group_mgr,
      map_mgr,
      roll_mgr,
      open_card_mgr,
      dungeon_mgr,
      unit_mgr,
      battle_mgr,
      combat_mgr,
      c_trip_mgr,
      sup_center,
      team_mgr,
      team_recruit,
      camp_halloween_mgr,
      guild_war,
      guild_hero,
      warrior_mgr,
      elf_mgr,
      qualifying_mgr,
      camp_animal_chess_mgr,
      question_match_mgr,
      gold_league_mgr,
      spirit_treasure_mgr,
      exquisite_shelf_mgr,
      provocation_mgr,
      oracle_treasure_mgr,
      camp_black_white_chess_mgr,
      canyon_summit_mgr]};
cfg(big_world) ->
    {ok,
     [log,
      info,
      edets_mon,
      role_group,
      map_mgr,
      unit_mgr,
      battle_mgr,
      sup_big_world,
      tournament,
      friend_circle,
      lottery_asyn,
      lottery_mgr,
      c_goodvoice_mgr,
      c_extension_mgr,
      guild_league,
      gods_duel_mgr,
      rencounter_mgr,
      preparation,
      combat_record_cross,
      dungeon_mgr,
      team_mgr,
      dungeon_team,
      roll_mgr,
      open_card_mgr,
      c_guild_siege_mgr,
      review,
      c_camp_whiteday,
      c_camp_pet_egg,
      c_camp_fashion_vote,
      c_camp_lucky_draw,
      c_camp_rushing_top,
      gods_place_mgr,
      camp_black_white_chess_mgr,
      gods_challenge_mgr]};
cfg(zone) ->
    {ok,
     [log,
      info,
      edets_mon,
      ip_mgr,
      client_auth,
      cross_group_agent,
      world_lev,
      var,
      role_group,
      role_query,
      role_data,
      map_mgr,
      unit_mgr,
      battle_mgr,
      combat_mgr,
      honor_mgr,
      cross,
      big_world,
      mail,
      rank_mgr,
      dungeon_mgr,
      campaign_mgr,
      camp_web_mgr,
      guild_mgr,
      arena_mgr,
      robot_mgr,
      roll_mgr,
      shop_mgr,
      team_mgr,
      friend,
      friend_zone,
      market_gold,
      market_silver,
      world_boss,
      parade,
      card_mgr,
      qualifying_mgr,
      team_recruit,
      shipping,
      guild_robber,
      skill_prac_box,
      chat_mgr,
      treasure,
      adm_mgr,
      fairyland,
      warrior_mgr,
      examination,
      classes_challenge,
      notice_board,
      campaign_unit,
      camp_guild_bady,
      teacher_mgr,
      open_card_mgr,
      achievement,
      wedding_mgr,
      constellation,
      gods_duel_agent,
      top_compete_mgr,
      quest_marriage,
      guild_war,
      quest_couple,
      quest_plant,
      goodvoice_mgr,
      friend_circle,
      help_mgr,
      ask_mgr,
      guild_hero,
      hero_mgr,
      brave_trial,
      combat_record,
      camp_dragon_boat,
      glory_mgr,
      tournament_agent,
      elf_mgr,
      family_mgr,
      examination_final,
      strategy_mgr,
      camp_fruit,
      camp_hide_seek,
      privilege,
      lottery_local,
      camp_cake,
      rencounter_agent,
      endless_challenge_rank,
      camp_web_rank_mgr,
      camp_mid_autumn,
      lev_break,
      head,
      extension_mgr,
      camp_national_wisdom,
      guild_league_agent,
      role_classes_statistics,
      sworn,
      campaign_world_gift,
      preparation,
      campaign_snow_mgr,
      child,
      dungeon_team,
      friend_group,
      raffle,
      review,
      camp_halloween_mgr,
      campaign_group_purchase,
      friend_recall,
      spectral_box,
      red_packet_mgr,
      lucky_money,
      camp_whiteday,
      guild_siege_mgr,
      guild_dungeon,
      guild_auction,
      agenda_stat,
      camp_animal_chess_mgr,
      campaign_rank_mgr,
      question_match_mgr,
      spirit_treasure_mgr,
      gold_league_mgr,
      camp_discount,
      camp_7_7th_mgr,
      exquisite_shelf_mgr,
      guild_dragon_mgr,
      camp_fashion_vote,
      camp_lucky_draw,
      camp_rushing_top,
      gods_place_agent,
      provocation_agent,
      stars_trial_mgr,
      oracle_treasure_mgr,
      camp_pass_flower_language,
      friend_wish_agent,
      camp_black_white_chess_mgr,
      gods_challenge_agent,
      canyon_summit_agent,
      star_moon_mgr,
      guild_truth_dare_mgr,
      camp_new_discount,
      sys_shutdown,
      sup_acceptor,
      sys_listener]};
cfg(_) -> {error, undefined}.

-spec get(atom()) -> {ok, #service{}} |
                     {error, undefined}.

get(log = Id) ->
    {ok,
     #service{id = Id, name = "系统日志服务器",
              mfa = {log, start_link, []}}};
get(sup_acceptor = Id) ->
    {ok,
     #service{id = Id, name = "acceptor监控树",
              mfa = {sup_acceptor, start_link, []},
              type = supervisor}};
get(sys_listener = Id) ->
    {ok,
     #service{id = Id, name = "socket监听服务",
              mfa = {sys_listener, start_link, []},
              depend_on = [env, sup_acceptor]}};
get(sys_shutdown = Id) ->
    {ok,
     #service{id = Id, name = "关闭应用善后服务",
              mfa = {sys_shutdown, start_link, []}}};
get(sup_center = Id) ->
    {ok,
     #service{id = Id, name = "中央控制服相关服务",
              mfa = {sup_center, start_link, []}, type = supervisor}};
get(sup_big_world = Id) ->
    {ok,
     #service{id = Id, name = "中央大世界控制服相关服务",
              mfa = {sup_big_world, start_link, []},
              type = supervisor}};
get(cross = Id) ->
    {ok,
     #service{id = Id, name = "跨服调用服务",
              mfa = {cross, start_link, []}}};
get(big_world = Id) ->
    {ok,
     #service{id = Id, name = "大世界调用服务",
              mfa = {big_world, start_link, []}}};
get(ip_mgr = Id) ->
    {ok,
     #service{id = Id, name = "IP管理服务",
              mfa = {ip_mgr, start_link, []}}};
get(client_auth = Id) ->
    {ok,
     #service{id = Id, name = "验证服务",
              mfa = {client_auth, start_link, []}}};
get(role_data = Id) ->
    {ok,
     #service{id = Id, name = "角色数据存取服务",
              mfa = {role_data, start_link, []}}};
get(world_lev = Id) ->
    {ok,
     #service{id = Id, name = "世界等级管理器",
              mfa = {world_lev, start_link, []}}};
get(role_group = Id) ->
    {ok,
     #service{id = Id, name = "角色分组管理器",
              mfa = {role_group, start_link, []}}};
get(role_query = Id) ->
    {ok,
     #service{id = Id, name = "角色查询服务",
              mfa = {role_query, start_link, []}}};
get(battle_mgr = Id) ->
    {ok,
     #service{id = Id, name = "战场管理器",
              mfa = {battle_mgr, start_link, []}}};
get(combat_mgr = Id) ->
    {ok,
     #service{id = Id, name = "战斗管理器",
              mfa = {combat_mgr, start_link, []}}};
get(honor_mgr = Id) ->
    {ok,
     #service{id = Id, name = "称号管理器",
              mfa = {honor_mgr, start_link, []}}};
get(unit_mgr = Id) ->
    {ok,
     #service{id = Id, name = "地图单位管理器",
              mfa = {unit_mgr, start_link, []}}};
get(guild_mgr = Id) ->
    {ok,
     #service{id = Id, name = "公会管理器",
              mfa = {guild_mgr, start_link, []}}};
get(arena_mgr = Id) ->
    {ok,
     #service{id = Id, name = "竞技场管理器",
              mfa = {arena_mgr, start_link, []}}};
get(roll_mgr = Id) ->
    {ok,
     #service{id = Id, name = "roll点管理器",
              mfa = {roll_mgr, start_link, []}}};
get(robot_mgr = Id) ->
    {ok,
     #service{id = Id, name = "机器克隆人",
              mfa = {robot_mgr, start_link, []}}};
get(dungeon_mgr = Id) ->
    {ok,
     #service{id = Id, name = "副本管理器",
              mfa = {dungeon_mgr, start_link, []}}};
get(campaign_mgr = Id) ->
    {ok,
     #service{id = Id, name = "活动管理器",
              mfa = {campaign_mgr, start_link, []}}};
get(camp_web_mgr = Id) ->
    {ok,
     #service{id = Id, name = "后台活动管理器",
              mfa = {camp_web_mgr, start_link, []}}};
get(rank_mgr = Id) ->
    {ok,
     #service{id = Id, name = "排行榜管理器",
              mfa = {rank_mgr, start_link, []}}};
get(shop_mgr = Id) ->
    {ok,
     #service{id = Id, name = "商场管理器",
              mfa = {shop_mgr, start_link, []}}};
get(map_mgr = Id) ->
    {ok,
     #service{id = Id, name = "地图管理器",
              mfa = {map_mgr, start_link, []}}};
get(info = Id) ->
    {ok,
     #service{id = Id, name = "系统状态信息查询服务",
              mfa = {info, start_link, []}}};
get(edets_mon = Id) ->
    {ok,
     #service{id = Id, name = "dets和ets监视器与启动器",
              mfa = {edets_mon, start_link, []}}};
get(team_mgr = Id) ->
    {ok,
     #service{id = Id, name = "组队管理进程",
              mfa = {team_mgr, start_link, []}}};
get(team_recruit = Id) ->
    {ok,
     #service{id = Id, name = "招募管理进程",
              mfa = {team_recruit, start_link, []}}};
get(friend = Id) ->
    {ok,
     #service{id = Id, name = "好友管理进程",
              mfa = {friend, start_link, []}}};
get(friend_zone = Id) ->
    {ok,
     #service{id = Id, name = "好友管理进程",
              mfa = {friend_zone, start_link, []}}};
get(market_gold = Id) ->
    {ok,
     #service{id = Id, name = "金币市场",
              mfa = {market_gold, start_link, []}}};
get(market_silver = Id) ->
    {ok,
     #service{id = Id, name = "银币市场",
              mfa = {market_silver, start_link, []}}};
get(world_boss = Id) ->
    {ok,
     #service{id = Id, name = "世界boss",
              mfa = {world_boss, start_link, []}}};
get(parade = Id) ->
    {ok,
     #service{id = Id, name = "吃货大游行",
              mfa = {parade, start_link, []}}};
get(mail = Id) ->
    {ok,
     #service{id = Id, name = "邮件",
              mfa = {mail, start_link, []}}};
get(card_mgr = Id) ->
    {ok,
     #service{id = Id, name = "礼包卡领取系统",
              mfa = {card_mgr, start_link, []}}};
get(glory_mgr = Id) ->
    {ok,
     #service{id = Id, name = "荣耀试炼系统",
              mfa = {glory_mgr, start_link, []}}};
get(qualifying_mgr = Id) ->
    {ok,
     #service{id = Id, name = "段位赛",
              mfa = {qualifying_mgr, start_link, []}}};
get(guild_spring = Id) ->
    {ok,
     #service{id = Id, name = "公会温泉",
              mfa = {guild_spring, start_link, []}}};
get(shipping = Id) ->
    {ok,
     #service{id = Id, name = "远航商人",
              mfa = {shipping, start_link, []}}};
get(guild_robber = Id) ->
    {ok,
     #service{id = Id, name = "公会盗贼",
              mfa = {guild_robber, start_link, []}}};
get(quest_kill = Id) ->
    {ok,
     #service{id = Id, name = "屠魔任务",
              mfa = {quest_kill, start_link, []}}};
get(skill_prac_box = Id) ->
    {ok,
     #service{id = Id, name = "冒险宝箱",
              mfa = {skill_prac_box, start_link, []}}};
get(chat_mgr = Id) ->
    {ok,
     #service{id = Id, name = "聊天管理服务",
              mfa = {chat_mgr, start_link, []}}};
get(treasure = Id) ->
    {ok,
     #service{id = Id, name = "封妖",
              mfa = {treasure, start_link, []}}};
get(adm_mgr = Id) ->
    {ok,
     #service{id = Id, name = "后台管理",
              mfa = {adm_mgr, start_link, []}}};
get(notice_board = Id) ->
    {ok,
     #service{id = Id, name = "公告板系统",
              mfa = {notice_board, start_link, []}}};
get(classes_challenge = Id) ->
    {ok,
     #service{id = Id, name = "职业挑战",
              mfa = {classes_challenge, start_link, []}}};
get(fairyland = Id) ->
    {ok,
     #service{id = Id, name = "幻境寻宝",
              mfa = {fairyland, start_link, []}}};
get(examination = Id) ->
    {ok,
     #service{id = Id, name = "科举答题",
              mfa = {examination, start_link, []}}};
get(warrior_mgr = Id) ->
    {ok,
     #service{id = Id, name = "勇士战场",
              mfa = {warrior_mgr, start_link, []}}};
get(gold_league_mgr = Id) ->
    {ok,
     #service{id = Id, name = "赏金战场",
              mfa = {gold_league_mgr, start_link, []}}};
get(campaign_unit = Id) ->
    {ok,
     #service{id = Id, name = "活动怪物",
              mfa = {campaign_unit, start_link, []}}};
get(camp_guild_bady = Id) ->
    {ok,
     #service{id = Id, name = "公会宝贝",
              mfa = {camp_guild_bady, start_link, []}}};
get(teacher_mgr = Id) ->
    {ok,
     #service{id = Id, name = "师徒",
              mfa = {teacher_mgr, start_link, []}}};
get(var = Id) ->
    {ok,
     #service{id = Id, name = "玩家变量",
              mfa = {var, start_link, []}}};
get(achievement = Id) ->
    {ok,
     #service{id = Id, name = "成就",
              mfa = {achievement, start_link, []}}};
get(wedding_mgr = Id) ->
    {ok,
     #service{id = Id, name = "婚礼管理进程",
              mfa = {wedding_mgr, start_link, []}}};
get(top_compete_mgr = Id) ->
    {ok,
     #service{id = Id, name = "巅峰决斗管理进程",
              mfa = {top_compete_mgr, start_link, []}}};
get(constellation = Id) ->
    {ok,
     #service{id = Id, name = "星座",
              mfa = {constellation, start_link, []}}};
get(quest_marriage = Id) ->
    {ok,
     #service{id = Id, name = "夫妻任务",
              mfa = {quest_marriage, start_link, []}}};
get(guild_war = Id) ->
    {ok,
     #service{id = Id, name = "公会战",
              mfa = {guild_war, start_link, []}}};
get(meet_pet = Id) ->
    {ok,
     #service{id = Id, name = "宠物情缘",
              mfa = {meet_pet, start_link, []}}};
get(quest_couple = Id) ->
    {ok,
     #service{id = Id, name = "情缘任务",
              mfa = {quest_couple, start_link, []}}};
get(quest_plant = Id) ->
    {ok,
     #service{id = Id, name = "种植任务",
              mfa = {quest_plant, start_link, []}}};
get(help_mgr = Id) ->
    {ok,
     #service{id = Id, name = "求助",
              mfa = {help_mgr, start_link, []}}};
get(ask_mgr = Id) ->
    {ok,
     #service{id = Id, name = "答题",
              mfa = {ask_mgr, start_link, []}}};
get(hero_mgr = Id) ->
    {ok,
     #service{id = Id, name = "武道大会",
              mfa = {hero_mgr, start_link, []}}};
get(guild_hero = Id) ->
    {ok,
     #service{id = Id, name = "公会精英战",
              mfa = {guild_hero, start_link, []}}};
get(brave_trial = Id) ->
    {ok,
     #service{id = Id, name = "勇者试炼",
              mfa = {brave_trial, start_link, []}}};
get(combat_record = Id) ->
    {ok,
     #service{id = Id, name = "战斗录像",
              mfa = {combat_record, start_link, []}}};
get(c_trip_mgr = Id) ->
    {ok,
     #service{id = Id, name = "跨服入口",
              mfa = {c_trip_mgr, start_link, []}}};
get(c_guild_siege_mgr = Id) ->
    {ok,
     #service{id = Id, name = "公会攻城战跨服",
              mfa = {c_guild_siege_mgr, start_link, []}}};
get(guild_siege_mgr = Id) ->
    {ok,
     #service{id = Id, name = "公会攻城战",
              mfa = {guild_siege_mgr, start_link, []}}};
get(camp_dragon_boat = Id) ->
    {ok,
     #service{id = Id, name = "赛龙舟",
              mfa = {Id, start_link, []}}};
get(open_card_mgr = Id) ->
    {ok,
     #service{id = Id, name = "翻牌",
              mfa = {Id, start_link, []}}};
get(tournament = Id) ->
    {ok,
     #service{id = Id, name = "武道会",
              mfa = {Id, start_link, []}}};
get(tournament_agent = Id) ->
    {ok,
     #service{id = Id, name = "武道会代理",
              mfa = {Id, start_link, []}}};
get(elf_mgr = Id) ->
    {ok,
     #service{id = Id, name = "精灵总动员",
              mfa = {Id, start_link, []}}};
get(family_mgr = Id) ->
    {ok,
     #service{id = Id, name = "家园管理器",
              mfa = {family_mgr, start_link, []}}};
get(examination_final = Id) ->
    {ok,
     #service{id = Id, name = "答题决赛",
              mfa = {Id, start_link, []}}};
get(strategy_mgr = Id) ->
    {ok,
     #service{id = Id, name = "攻略系统",
              mfa = {Id, start_link, []}}};
get(camp_fruit = Id) ->
    {ok,
     #service{id = Id, name = "水果种植",
              mfa = {Id, start_link, []}}};
get(camp_hide_seek = Id) ->
    {ok,
     #service{id = Id, name = "捉迷藏",
              mfa = {camp_hide_seek, start_link, []}}};
get(goodvoice_mgr = Id) ->
    {ok,
     #service{id = Id, name = "好声音",
              mfa = {Id, start_link, []}}};
get(c_goodvoice_mgr = Id) ->
    {ok,
     #service{id = Id, name = "好声音跨服",
              mfa = {Id, start_link, []}}};
get(privilege = Id) ->
    {ok,
     #service{id = Id, name = "特权",
              mfa = {privilege, start_link, []}}};
get(lottery_mgr = Id) ->
    {ok,
     #service{id = Id, name = "一元夺宝",
              mfa = {Id, start_link, []}}};
get(lottery_local = Id) ->
    {ok,
     #service{id = Id, name = "一元夺宝本地",
              mfa = {Id, start_link, []}}};
get(camp_cake = Id) ->
    {ok,
     #service{id = Id, name = "蛋糕活动",
              mfa = {Id, start_link, []}}};
get(camp_halloween_mgr = Id) ->
    {ok,
     #service{id = Id, name = "万圣节活动",
              mfa = {Id, start_link, []}}};
get(campaign_group_purchase = Id) ->
    {ok,
     #service{id = Id, name = "团购活动活动",
              mfa = {Id, start_link, []}}};
get(lottery_asyn = Id) ->
    {ok,
     #service{id = Id, name = "一元夺宝本地",
              mfa = {Id, start_link, []}}};
get(friend_circle = Id) ->
    {ok,
     #service{id = Id, name = "朋友圈",
              mfa = {Id, start_link, []}}};
get(endless_challenge_rank = Id) ->
    {ok,
     #service{id = Id, name = "无尽挑战排行榜管理",
              mfa = {endless_challenge_rank, start_link, []}}};
get(camp_mid_autumn = Id) ->
    {ok,
     #service{id = Id, name = "中秋赏月会",
              mfa = {camp_mid_autumn, start_link, []}}};
get(guild_league = Id) ->
    {ok,
     #service{id = Id, name = "公会联赛主进程",
              mfa = {guild_league, start_link, []}}};
get(guild_league_agent = Id) ->
    {ok,
     #service{id = Id, name = "公会联赛本服代理",
              mfa = {guild_league_agent, start_link, []}}};
get(role_classes_statistics = Id) ->
    {ok,
     #service{id = Id, name = "职业人数统计",
              mfa = {role_classes_statistics, start_link, []}}};
get(camp_web_rank_mgr = Id) ->
    {ok,
     #service{id = Id, name = "活动排行榜管理",
              mfa = {Id, start_link, []}}};
get(lev_break = Id) ->
    {ok,
     #service{id = Id, name = "等级突破",
              mfa = {Id, start_link, []}}};
get(extension_mgr = Id) ->
    {ok,
     #service{id = Id, name = "推广员",
              mfa = {Id, start_link, []}}};
get(camp_national_wisdom = Id) ->
    {ok,
     #service{id = Id, name = "国庆智多星",
              mfa = {camp_national_wisdom, start_link, []}}};
get(c_extension_mgr = Id) ->
    {ok,
     #service{id = Id, name = "推广员大世界",
              mfa = {Id, start_link, []}}};
get(head = Id) ->
    {ok,
     #service{id = Id, name = "自定义头像",
              mfa = {Id, start_link, []}}};
get(sworn = Id) ->
    {ok,
     #service{id = Id, name = "结拜系统",
              mfa = {Id, start_link, []}}};
get(campaign_world_gift = Id) ->
    {ok,
     #service{id = Id, name = "堆雪人系统",
              mfa = {Id, start_link, []}}};
get(campaign_snow_mgr = Id) ->
    {ok,
     #service{id = Id, name = "打雪仗系统",
              mfa = {Id, start_link, []}}};
get(gods_duel_mgr = Id) ->
    {ok,
     #service{id = Id, name = "诸神之战",
              mfa = {Id, start_link, []}}};
get(gods_duel_agent = Id) ->
    {ok,
     #service{id = Id, name = "诸神之战单服代理",
              mfa = {Id, start_link, []}}};
get(friend_recall = Id) ->
    {ok,
     #service{id = Id, name = "好友招募",
              mfa = {Id, start_link, []}}};
get(camp_acc_charge = Id) ->
    {ok,
     #service{id = Id, name = "累计充值",
              mfa = {Id, start_link, []}}};
get(spectral_box = Id) ->
    {ok,
     #service{id = Id, name = "鸿福宝箱",
              mfa = {Id, start_link, []}}};
get(red_packet_mgr = Id) ->
    {ok,
     #service{id = Id, name = "世界红包",
              mfa = {Id, start_link, []}}};
get(lucky_money = Id) ->
    {ok,
     #service{id = Id, name = "压岁钱",
              mfa = {Id, start_link, []}}};
get(camp_whiteday = Id) ->
    {ok,
     #service{id = Id, name = "白色情人节",
              mfa = {Id, start_link, []}}};
get(c_camp_whiteday = Id) ->
    {ok,
     #service{id = Id, name = "白色情人节跨服",
              mfa = {Id, start_link, []}}};
get(c_camp_pet_egg = Id) ->
    {ok,
     #service{id = Id, name = "精灵蛋活动跨服",
              mfa = {Id, start_link, []}}};
get(c_camp_fashion_vote = Id) ->
    {ok,
     #service{id = Id, name = "时装评选跨服",
              mfa = {Id, start_link, []}}};
get(camp_fashion_vote = Id) ->
    {ok,
     #service{id = Id, name = "时装评选本服",
              mfa = {Id, start_link, []}}};
get(camp_may_day = Id) ->
    {ok,
     #service{id = Id, name = "五一活动",
              mfa = {Id, start_link, []}}};
get(c_camp_lucky_draw = Id) ->
    {ok,
     #service{id = Id, name = "全服转盘抽奖跨服",
              mfa = {Id, start_link, []}}};
get(camp_lucky_draw = Id) ->
    {ok,
     #service{id = Id, name = "全服转盘抽奖本服",
              mfa = {Id, start_link, []}}};
get(c_camp_rushing_top = Id) ->
    {ok,
     #service{id = Id, name = "冲顶答题跨服",
              mfa = {Id, start_link, []}}};
get(camp_rushing_top = Id) ->
    {ok,
     #service{id = Id, name = "冲顶答题本服",
              mfa = {Id, start_link, []}}};
get(gods_place_mgr = Id) ->
    {ok,
     #service{id = Id, name = "诸神殿堂跨服",
              mfa = {Id, start_link, []}}};
get(gods_place_agent = Id) ->
    {ok,
     #service{id = Id, name = "诸神殿堂本服",
              mfa = {Id, start_link, []}}};
get(stars_trial_mgr = Id) ->
    {ok,
     #service{id = Id, name = "星辰试炼",
              mfa = {Id, start_link, []}}};
get(provocation_agent = Id) ->
    {ok,
     #service{id = Id, name = "跨服约战本服",
              mfa = {Id, start_link, []}}};
get(preparation = Id) ->
    {ok,
     #service{id = Id, name = "活动匹配登记大厅",
              mfa = {preparation, start_link, []}}};
get(child = Id) ->
    {ok,
     #service{id = Id, name = "子女系统",
              mfa = {Id, start_link, []}}};
get(friend_group = Id) ->
    {ok,
     #service{id = Id, name = "好友群组",
              mfa = {Id, start_link, []}}};
get(combat_record_cross = Id) ->
    {ok,
     #service{id = Id, name = "战斗录像，跨服",
              mfa = {Id, start_link, []}}};
get(dungeon_team = Id) ->
    {ok,
     #service{id = Id, name = "副本匹配厅",
              mfa = {Id, start_link, []}}};
get(raffle = Id) ->
    {ok,
     #service{id = Id, name = "抽奖系统",
              mfa = {Id, start_link, []}}};
get(review = Id) ->
    {ok,
     #service{id = Id, name = "评论系统",
              mfa = {Id, start_link, []}}};
get(rencounter_mgr = Id) ->
    {ok,
     #service{id = Id, name = "星辰擂台",
              mfa = {Id, start_link, []}}};
get(rencounter_agent = Id) ->
    {ok,
     #service{id = Id, name = "星辰擂台单服代理",
              mfa = {Id, start_link, []}}};
get(guild_dungeon = Id) ->
    {ok,
     #service{id = Id, name = "公会副本",
              mfa = {Id, start_link, []}}};
get(guild_auction = Id) ->
    {ok,
     #service{id = Id, name = "公会拍卖",
              mfa = {Id, start_link, []}}};
get(agenda_stat = Id) ->
    {ok,
     #service{id = Id, name = "日程统计",
              mfa = {Id, start_link, []}}};
get(camp_animal_chess_mgr = Id) ->
    {ok,
     #service{id = Id, name = "斗兽棋",
              mfa = {Id, start_link, []}}};
get(campaign_rank_mgr = Id) ->
    {ok,
     #service{id = Id, name = "排行榜活动",
              mfa = {Id, start_link, []}}};
get(question_match_mgr = Id) ->
    {ok,
     #service{id = Id, name = "答题比赛活动",
              mfa = {Id, start_link, []}}};
get(spirit_treasure_mgr = Id) ->
    {ok,
     #service{id = Id, name = "精灵兽的宝藏",
              mfa = {Id, start_link, []}}};
get(camp_discount = Id) ->
    {ok,
     #service{id = Id, name = "折扣商店",
              mfa = {Id, start_link, []}}};
get(exquisite_shelf_mgr = Id) ->
    {ok,
     #service{id = Id, name = "玲珑宝阁",
              mfa = {Id, start_link, []}}};
get(provocation_mgr = Id) ->
    {ok,
     #service{id = Id, name = "跨服约战",
              mfa = {Id, start_link, []}}};
get(camp_7_7th_mgr = Id) ->
    {ok,
     #service{id = Id, name = "七夕活动",
              mfa = {Id, start_link, []}}};
get(guild_dragon_mgr = Id) ->
    {ok,
     #service{id = Id, name = "公会魔龙挑战",
              mfa = {Id, start_link, []}}};
get(oracle_treasure_mgr = Id) ->
    {ok,
     #service{id = Id, name = "天启兽的宝藏",
              mfa = {Id, start_link, []}}};
get(friend_wish_agent = Id) ->
    {ok,
     #service{id = Id, name = "庆典寄语",
              mfa = {Id, start_link, []}}};
get(camp_pass_flower_language = Id) ->
    {ok,
     #service{id = Id, name = "传递花语",
              mfa = {Id, start_link, []}}};
get(camp_black_white_chess_mgr = Id) ->
    {ok,
     #service{id = Id, name = "龙凤棋",
              mfa = {Id, start_link, []}}};
get(gods_challenge_agent = Id) ->
    {ok,
     #service{id = Id, name = "诸神挑战单服代理",
              mfa = {Id, start_link, []}}};
get(gods_challenge_mgr = Id) ->
    {ok,
     #service{id = Id, name = "诸神挑战",
              mfa = {Id, start_link, []}}};
get(canyon_summit_mgr = Id) ->
    {ok,
     #service{id = Id, name = "峡谷之巅",
              mfa = {Id, start_link, []}}};
get(canyon_summit_agent = Id) ->
    {ok,
     #service{id = Id, name = "峡谷之巅",
              mfa = {Id, start_link, []}}};
get(star_moon_mgr = Id) ->
    {ok,
     #service{id = Id, name = "星月灵兽",
              mfa = {Id, start_link, []}}};
get(guild_truth_dare_mgr = Id) ->
    {ok,
     #service{id = Id, name = "真心话大冒险",
              mfa = {Id, start_link, []}}};
get(camp_new_discount = Id) ->
    {ok,
     #service{id = Id, name = "新折扣商店",
              mfa = {Id, start_link, []}}};
get(cross_group_mgr = Id) ->
    {ok,
     #service{id = Id, name = "跨服集群分组",
              mfa = {Id, start_link, []}}};
get(cross_group_agent = Id) ->
    {ok,
     #service{id = Id, name = "跨服集群分组代理",
              mfa = {Id, start_link, []}}};
get(_Name) -> {error, undefined}.

-spec config(atom()) -> {ok, list()} |
                        {error, undefined}.

config(Type) ->
    case cfg(Type) of
        {ok, L} -> {ok, parse(L, Type, [])};
        Else -> Else
    end.

parse([], _Type, L) -> lists:reverse(L);
parse([Id = combat_mgr | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = map_mgr | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = battle_mgr | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = team_recruit | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = role_group | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = treasure | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = guild_war | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = guild_hero | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = dungeon_mgr | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = elf_mgr | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = warrior_mgr | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = preparation | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = dungeon_team | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = review | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = qualifying_mgr | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id = gold_league_mgr | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id | T], Type, L) ->
    parse(T, Type, [{Id, []} | L]).

