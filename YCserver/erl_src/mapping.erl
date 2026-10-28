-file("src/mapping.erl", 1).

-module(mapping).

-export([module/2]).

-compile({inline, [{code, 2}]}).

-spec module(Type, Cmd) -> {ok,
                            NeedAuth,
                            Caller,
                            Parser,
                            ModName} |
                           {ok, Parser, ModName} |
                           {error, Reason} when Type :: game_server |
                                                        monitor |
                                                        tester,
                                                Cmd :: pos_integer(),
                                                NeedAuth :: boolean(),
                                                Caller :: connector | object,
                                                Parser :: atom(),
                                                ModName :: atom(),
                                                Reason :: term().

module(Type, Cmd) -> code(Type, trunc(Cmd / 100)).

code(game_server, 10) ->
    {ok, false, connector, proto_10, client_rpc_open};
code(game_server, 11) ->
    {ok, true, connector, proto_11, client_rpc};
code(game_server, 99) ->
    {ok, true, object, proto_99, misc_rpc};
code(game_server, 100) ->
    {ok, true, object, proto_100, role_rpc};
code(game_server, 101) ->
    {ok, true, object, proto_101, map_rpc};
code(game_server, 102) ->
    {ok, true, object, proto_102, quest_rpc};
code(game_server, 103) ->
    {ok, true, object, proto_103, item_rpc};
code(game_server, 104) ->
    {ok, true, object, proto_104, chat_rpc};
code(game_server, 105) ->
    {ok, true, object, proto_105, pet_rpc};
code(game_server, 106) ->
    {ok, true, object, proto_106, blacksmith_rpc};
code(game_server, 107) ->
    {ok, true, object, proto_107, combat_rpc};
code(game_server, 108) ->
    {ok, true, object, proto_108, skill_rpc};
code(game_server, 109) ->
    {ok, true, object, proto_109, guard_rpc};
code(game_server, 110) ->
    {ok, true, object, proto_110, plot_rpc};
code(game_server, 111) ->
    {ok, true, object, proto_111, guild_rpc};
code(game_server, 112) ->
    {ok, true, object, proto_112, family_rpc};
code(game_server, 113) ->
    {ok, true, object, proto_113, shop_rpc};
code(game_server, 114) ->
    {ok, true, object, proto_114, npc_shop_rpc};
code(game_server, 115) ->
    {ok, true, object, proto_115, option_rpc};
code(game_server, 116) ->
    {ok, true, object, proto_116, wing_rpc};
code(game_server, 117) ->
    {ok, true, object, proto_117, team_rpc};
code(game_server, 118) ->
    {ok, true, object, proto_118, friend_rpc};
code(game_server, 119) ->
    {ok, true, object, proto_119, wake_rpc};
code(game_server, 120) ->
    {ok, true, object, proto_120, agenda_rpc};
code(game_server, 121) ->
    {ok, true, object, proto_121, dungeon_rpc};
code(game_server, 122) ->
    {ok, true, object, proto_122, arena_rpc};
code(game_server, 123) ->
    {ok, true, object, proto_123, roll_rpc};
code(game_server, 124) ->
    {ok, true, object, proto_124, market_rpc};
code(game_server, 125) ->
    {ok, true, object, proto_125, rank_rpc};
code(game_server, 126) ->
    {ok, true, object, proto_126, escort_rpc};
code(game_server, 127) ->
    {ok, true, object, proto_127, honor_rpc};
code(game_server, 128) ->
    {ok, true, object, proto_128, buff_rpc};
code(game_server, 129) ->
    {ok, true, object, proto_129, formation_rpc};
code(game_server, 130) ->
    {ok, true, object, proto_130, boss_rpc};
code(game_server, 131) ->
    {ok, true, object, proto_131, trial_rpc};
code(game_server, 132) ->
    {ok, true, object, proto_132, fashion_rpc};
code(game_server, 133) ->
    {ok, true, object, proto_133, parade_rpc};
code(game_server, 134) ->
    {ok, true, object, proto_134, mail_rpc};
code(game_server, 135) ->
    {ok, true, object, proto_135, qualifying_rpc};
code(game_server, 136) ->
    {ok, true, object, proto_136, treasure_rpc};
code(game_server, 137) ->
    {ok, true, object, proto_137, shipping_rpc};
code(game_server, 139) ->
    {ok, true, object, proto_139, store_rpc};
code(game_server, 140) ->
    {ok, true, object, proto_140, campaign_rpc};
code(game_server, 141) ->
    {ok, true, object, proto_141, checkin_rpc};
code(game_server, 142) ->
    {ok, true, object, proto_142, warrior_rpc};
code(game_server, 143) ->
    {ok, true, object, proto_143, tower_rpc};
code(game_server, 144) ->
    {ok, true, object, proto_144, glory_rpc};
code(game_server, 145) ->
    {ok, true, object, proto_145, examination_rpc};
code(game_server, 146) ->
    {ok, true, object, proto_146, fairyland_rpc};
code(game_server, 147) ->
    {ok, true, object, proto_147, adm_rpc};
code(game_server, 148) ->
    {ok, true, object, proto_148, classes_challenge_rpc};
code(game_server, 149) ->
    {ok, true, object, proto_149, alchemy_rpc};
code(game_server, 150) ->
    {ok, true, object, proto_150, wedding_rpc};
code(game_server, 151) ->
    {ok, true, object, proto_151, top_compete_rpc};
code(game_server, 152) ->
    {ok, true, object, proto_152, constellation_rpc};
code(game_server, 153) ->
    {ok, true, object, proto_153, investment_rpc};
code(game_server, 154) ->
    {ok, true, object, proto_154, quest_marriage_rpc};
code(game_server, 155) ->
    {ok, true, object, proto_155, guild_war_rpc};
code(game_server, 157) ->
    {ok, true, object, proto_157, quest_couple_rpc};
code(game_server, 158) ->
    {ok, true, object, proto_158, teacher_rpc};
code(game_server, 159) ->
    {ok, true, object, proto_159, pray_rpc};
code(game_server, 160) ->
    {ok, true, object, proto_160, help_rpc};
code(game_server, 161) ->
    {ok, true, object, proto_161, ask_rpc};
code(game_server, 162) ->
    {ok, true, object, proto_162, guild_hero_rpc};
code(game_server, 163) ->
    {ok, true, object, proto_163, hero_rpc};
code(game_server, 164) ->
    {ok, true, object, proto_164, tournament_rpc};
code(game_server, 165) ->
    {ok, true, object, proto_165, elf_rpc};
code(game_server, 166) ->
    {ok, true, object, proto_166, strategy_rpc};
code(game_server, 167) ->
    {ok, true, object, proto_167, auction_rpc};
code(game_server, 168) ->
    {ok, true, object, proto_168, goodvoice_rpc};
code(game_server, 169) ->
    {ok, true, object, proto_169, lottery_rpc};
code(game_server, 170) ->
    {ok, true, object, proto_170, mount_rpc};
code(game_server, 171) ->
    {ok, true, object, proto_171, handbook_rpc};
code(game_server, 172) ->
    {ok, true, object, proto_172, endless_challenge_rpc};
code(game_server, 173) ->
    {ok, true, object, proto_173, head_rpc};
code(game_server, 174) ->
    {ok, true, object, proto_174, lev_break_rpc};
code(game_server, 175) ->
    {ok, true, object, proto_175, extension_rpc};
code(game_server, 176) ->
    {ok, true, object, proto_176, guild_league_rpc};
code(game_server, 177) ->
    {ok, true, object, proto_177, sworn_rpc};
code(game_server, 178) ->
    {ok, true, object, proto_178, campaign_two_rpc};
code(game_server, 179) ->
    {ok, true, object, proto_179, gods_duel_rpc};
code(game_server, 180) ->
    {ok, true, object, proto_180, role_return_rpc};
code(game_server, 182) ->
    {ok, true, object, proto_182, spectral_box_rpc};
code(game_server, 183) ->
    {ok, true, object, proto_183, preparation_rpc};
code(game_server, 184) ->
    {ok, true, object, proto_184, reward_back_rpc};
code(game_server, 185) ->
    {ok, true, object, proto_185, red_packet_rpc};
code(game_server, 186) ->
    {ok, true, object, proto_186, child_rpc};
code(game_server, 187) ->
    {ok, true, object, proto_187, lucky_money_rpc};
code(game_server, 188) ->
    {ok, true, object, proto_188, maze_rpc};
code(game_server, 190) ->
    {ok, true, object, proto_190, friend_two_rpc};
code(game_server, 191) ->
    {ok, true, object, proto_191, guild_siege_rpc};
code(game_server, 192) ->
    {ok, true, object, proto_192, raffle_rpc};
code(game_server, 193) ->
    {ok, true, object, proto_193, rencounter_rpc};
code(game_server, 194) ->
    {ok, true, object, proto_194, review_rpc};
code(game_server, 195) ->
    {ok, true, object, proto_195, guild_two_rpc};
code(game_server, 196) ->
    {ok, true, object, proto_196, talisman_rpc};
code(game_server, 197) ->
    {ok, true, object, proto_197, guild_auction_rpc};
code(game_server, 198) ->
    {ok, true, object, proto_198, fish_rpc};
code(game_server, 199) ->
    {ok, true, object, proto_199, camp_dragon_boat_rpc};
code(game_server, 200) ->
    {ok, true, object, proto_200, gold_league_rpc};
code(game_server, 201) ->
    {ok, true, object, proto_201, question_match_rpc};
code(game_server, 202) ->
    {ok, true, object, proto_202, spirit_treasure_rpc};
code(game_server, 203) ->
    {ok, true, object, proto_203, exquisite_shelf_rpc};
code(game_server, 204) ->
    {ok, true, object, proto_204, campaign_three_rpc};
code(game_server, 205) ->
    {ok, true, object, proto_205, guild_dragon_rpc};
code(game_server, 206) ->
    {ok, true, object, proto_206, campaign_inquiry_rpc};
code(game_server, 207) ->
    {ok, true, object, proto_207, provocation_rpc};
code(game_server, 208) ->
    {ok, true, object, proto_208, oracle_treasure_rpc};
code(game_server, 209) ->
    {ok,
     true,
     object,
     proto_209,
     camp_black_white_chess_rpc};
code(game_server, 210) ->
    {ok, true, object, proto_210, make_voice_rpc};
code(game_server, 211) ->
    {ok, true, object, proto_211, canyon_summit_rpc};
code(game_server, 212) ->
    {ok, true, object, proto_212, camp_pray_rpc};
code(tester, 10) ->
    {ok, proto_10, test_client_rpc_open};
code(tester, 11) -> {ok, proto_11, test_client_rpc};
code(tester, 99) -> {ok, proto_99, test_misc_rpc};
code(tester, 100) -> {ok, proto_100, test_role_rpc};
code(tester, 101) -> {ok, proto_101, test_map_rpc};
code(tester, 102) -> {ok, proto_102, test_quest_rpc};
code(tester, 103) -> {ok, proto_103, test_rpc};
code(tester, 104) -> {ok, proto_104, test_rpc};
code(tester, 105) -> {ok, proto_105, test_rpc};
code(tester, 106) -> {ok, proto_106, test_rpc};
code(tester, 107) -> {ok, proto_107, test_combat_rpc};
code(tester, 108) -> {ok, proto_108, test_rpc};
code(tester, 109) -> {ok, proto_109, test_rpc};
code(tester, 110) -> {ok, proto_110, test_rpc};
code(tester, 111) -> {ok, proto_111, test_rpc};
code(tester, 112) -> {ok, proto_112, test_rpc};
code(tester, 113) -> {ok, proto_113, test_rpc};
code(tester, 114) -> {ok, proto_114, test_rpc};
code(tester, 115) -> {ok, proto_115, test_rpc};
code(tester, 116) -> {ok, proto_116, test_rpc};
code(tester, 117) -> {ok, proto_117, test_team_rpc};
code(tester, 133) -> {ok, proto_133, test_parade_rpc};
code(tester, 135) ->
    {ok, proto_135, test_qualifying_rpc};
code(tester, 142) -> {ok, proto_142, test_warrior_rpc};
code(tester, 151) ->
    {ok, proto_151, test_top_compete_rpc};
code(tester, 150) -> {ok, proto_150, test_wedding_rpc};
code(tester, 155) ->
    {ok, proto_155, test_guild_war_rpc};
code(tester, 163) -> {ok, proto_163, test_rpc};
code(tester, 164) ->
    {ok, proto_164, test_tournament_rpc};
code(tester, 165) -> {ok, proto_165, test_rpc};
code(tester, 169) -> {ok, proto_169, test_lottery_rpc};
code(tester, 170) -> {ok, proto_170, test_mount_rpc};
code(tester, 171) -> {ok, proto_171, test_rpc};
code(tester, 174) -> {ok, proto_174, test_rpc};
code(tester, 176) ->
    {ok, proto_176, test_guild_league_rpc};
code(tester, 178) -> {ok, proto_178, test_rpc};
code(tester, 179) ->
    {ok, proto_179, test_gods_duel_rpc};
code(tester, 200) ->
    {ok, proto_200, test_gold_league_rpc};
code(tester, 204) ->
    {ok, proto_204, test_campaign_three_rpc};
code(tester, 211) ->
    {ok, proto_211, test_canyon_summit_rpc};
code(tester, 205) ->
    {ok, proto_205, test_guild_dragon_rpc};
code(Type, Code) ->
    {error, {unknow_mapping, Type, Code}}.

