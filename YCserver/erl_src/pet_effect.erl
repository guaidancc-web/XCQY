-file("src/mod/pet/pet_effect.erl", 1).

-module(pet_effect).

-export([book_add_exp/4,
         add_happy/4,
         use_egg/2,
         set_talk/4,
         init_talk/1,
         rand_talk/2,
         auto_exp_book/3,
         add_color/3,
         change_color/3]).

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

-file("src/mod/pet/pet_effect.erl", 21).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/pet/pet_effect.erl", 22).

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

-file("src/mod/pet/pet_effect.erl", 23).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/mod/pet/pet_effect.erl", 24).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/pet/pet_effect.erl", 25).

-file("inc/notice.hrl", 1).

-record(notice,
        {id = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 1 :: pos_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         msg = "" :: bitstring()}).

-record(notice_board,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         title = "",
         content = "",
         msg = "",
         gain = [],
         condition = []}).

-record(notice_scroll,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         interval_time = 0,
         content = ""}).

-record(notice_board_log, {id = 1, log_list = []}).

-record(campaign_notice,
        {title = [] :: list(),
         content = [] :: list(),
         process = [] :: list(),
         extern_content = [] :: list(),
         rewards = [] :: list()}).

-file("src/mod/pet/pet_effect.erl", 26).

add_color(Role = #role{m_pet =
                           Mpet = #m_pet{pets = Pets}},
          Pet = #pet{id = PetId, base_id = PetBaseId,
                     name = PetName,
                     pet_skin = #pet_skin{has_skin = HasSkin}},
          SkinId) ->
    case lists:member(SkinId, HasSkin) of
        true -> {false, lang:get("已经激活过，无需再次激活皮肤")};
        false ->
            case check_pet(Pet) of
                true ->
                    case pet_data:get_skin({PetBaseId, SkinId}) of
                        SkinData = #{skin_name := SkinName, cost := Cost} ->
                            Loss = format:val_to_loss(Cost,
                                                      #{item_base_id_auto_buy =>
                                                            1,
                                                        auto_scene =>
                                                            lang:get("宠物染色")}),
                            case role_gain:do_notice(Loss,
                                                     Role,
                                                     lang:get("宠物激活皮肤"))
                                of
                                {ok, NewRole} ->
                                    case update_color(Pet, SkinId, SkinData) of
                                        {true, Pet1} ->
                                            {ok, NewPet, NewRole1} =
                                                pet_attr:calc(Pet1, NewRole),
                                            NewPets = lists:keystore(PetId,
                                                                     #pet.id,
                                                                     Pets,
                                                                     NewPet),
                                            NewRole2 = NewRole1#role{m_pet =
                                                                         Mpet#m_pet{pets
                                                                                        =
                                                                                        NewPets}},
                                            pet:push_10503(NewRole2, NewPet),
                                            role:link_send(NewRole2,
                                                           10559,
                                                           {PetId,
                                                            NewPet#pet.pet_skin}),
                                            log:pet(NewRole,
                                                    "宠物激活皮肤",
                                                    Pet,
                                                    NewPet),
                                            Msg =
                                                notice:format(lang:get("成功给~ts激活~ts皮肤"),
                                                              [{string_2,
                                                                1,
                                                                PetName},
                                                               {string_2,
                                                                1,
                                                                SkinName}]),
                                            {ok, NewRole2, Msg};
                                        false -> {false, lang:get("找不到皮肤数据")}
                                    end;
                                {false, #loss{msg = Msg}} -> {false, Msg}
                            end;
                        _ -> {false, lang:get("该宠物无法染此方案")}
                    end;
                {false, Reason} -> {false, Reason}
            end
    end.

update_color(Pet = #pet{pet_attr =
                            PetAttr = #pet_attr{max_hp_aptitude = MaxHpApt,
                                                max_phy_aptitude = MaxPhyApt,
                                                max_pdef_aptitude = MaxPdefApt,
                                                max_magic_aptitude =
                                                    MaxMagciApt,
                                                max_aspd_aptitude = MaxAspdApt},
                        growth = OldGrowth,
                        pet_skin =
                            PetSkin = #pet_skin{has_skin = HasSkin,
                                                add_hp_aptitude = AddHpApt,
                                                add_phy_aptitude = AddPhyApt,
                                                add_pdef_aptitude = AddPdefApt,
                                                add_magic_aptitude =
                                                    AddMagicApt,
                                                add_aspd_aptitude = AddAspdApt,
                                                add_growth = AddGrowth}},
             SkinId,
             #{phy_aptitude := PhyApt, pdef_aptitude := PdefApt,
               hp_aptitude := HpApt, magic_aptitude := MagicApt,
               aspd_aptitude := AspdApt, growth := Growth}) ->
    NewHasSkin = [SkinId | HasSkin],
    NewPetAttr = PetAttr#pet_attr{max_hp_aptitude =
                                      MaxHpApt + HpApt,
                                  max_phy_aptitude = MaxPhyApt + PhyApt,
                                  max_pdef_aptitude = MaxPdefApt + PdefApt,
                                  max_magic_aptitude = MaxMagciApt + MagicApt,
                                  max_aspd_aptitude = MaxAspdApt + AspdApt},
    NewPetSkin = PetSkin#pet_skin{has_skin = NewHasSkin,
                                  use_skin = SkinId,
                                  add_hp_aptitude = AddHpApt + HpApt,
                                  add_phy_aptitude = AddPhyApt + PhyApt,
                                  add_pdef_aptitude = AddPdefApt + PdefApt,
                                  add_magic_aptitude = AddMagicApt + MagicApt,
                                  add_aspd_aptitude = AddAspdApt + AspdApt,
                                  add_growth = AddGrowth + Growth},
    NewGrowth = OldGrowth + Growth,
    {true,
     Pet#pet{pet_attr = NewPetAttr, pet_skin = NewPetSkin,
             growth = NewGrowth}};
update_color(_, _, _) -> false.

check_pet(#pet{base_id = BaseId, genre = 1,
               grade = Grade}) ->
    IsMaxGrade = case pet_data:get_grade({BaseId,
                                          Grade + 1})
                     of
                     {_AddAptitude, _HoleNum} -> 0;
                     _ -> 1
                 end,
    case IsMaxGrade of
        1 -> true;
        _ -> {false, lang:get("宠物进阶到满阶后才可以激活皮肤")}
    end;
check_pet(#pet{base_id = _BaseId, genre = Genre,
               grade = Grade})
    when Genre =:= 2 orelse Genre =:= 4 ->
    IsMaxGrade = case Grade >= 2 of
                     true -> 1;
                     _ -> 0
                 end,
    case IsMaxGrade of
        1 -> true;
        _ -> {false, lang:get("神兽、珍兽需要进阶2次后才能激活皮肤")}
    end;
check_pet(_) ->
    Msg = notice:format(lang:get("完成~ts的~ts宠物才可激活皮肤"),
                        [{string_2, 1, lang:get("二次进阶")},
                         {string_2, 1, lang:get("变异")}]),
    {false, Msg}.

change_color(Role = #role{m_pet =
                              Mpet = #m_pet{pets = Pets}},
             Pet = #pet{id = PetId,
                        pet_skin =
                            PetSkin = #pet_skin{use_skin = UseSkin,
                                                has_skin = HasSkin}},
             SkinId) ->
    Flag = case UseSkin =:= SkinId of
               true -> null;
               false ->
                   case SkinId =:= 0 of
                       true -> true;
                       false ->
                           case lists:member(SkinId, HasSkin) of
                               true -> true;
                               _ -> {false, lang:get("没有激活过的皮肤，无法切换")}
                           end
                   end
           end,
    case Flag of
        null -> {false, lang:get("皮肤方案没有变化")};
        {false, Reason} -> {false, Reason};
        true ->
            NewPetSkin = PetSkin#pet_skin{use_skin = SkinId},
            NewPet = Pet#pet{pet_skin = NewPetSkin},
            NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
            NewRole = Role#role{m_pet = Mpet#m_pet{pets = NewPets}},
            role:link_send(NewRole, 10559, {PetId, NewPetSkin}),
            Msg = lang:get("切换皮肤成功"),
            {ok, NewRole, Msg}
    end.

set_talk(Pet = #pet{id = PetId,
                    combat_talk = CombatTalk},
         Type, Msg,
         Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case util:check_text(Msg, 22) of
        ok ->
            NewCombatTalk = lists:keystore(Type,
                                           1,
                                           CombatTalk,
                                           {Type, Msg}),
            NewPet = Pet#pet{combat_talk = NewCombatTalk},
            NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
            NewMpet = Mpet#m_pet{pets = NewPets},
            NewRole = Role#role{m_pet = NewMpet},
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end.

init_talk(BaseId) ->
    case pet_data:pet_talk(BaseId) of
        #{show := Show, atk := Atk, dfd := Dfd, dead := Dead,
          master_dead := MasterDead, use := Use,
          escape := Escape} ->
            Show1 = case Show =:= "" of
                        true -> [];
                        false -> [{1, Show}]
                    end,
            Atk1 = case Atk =:= "" of
                       true -> [];
                       false -> [{2, Atk}]
                   end,
            Dfd1 = case Dfd =:= "" of
                       true -> [];
                       false -> [{3, Dfd}]
                   end,
            Dead1 = case Dead =:= "" of
                        true -> [];
                        false -> [{4, Dead}]
                    end,
            MasterDead1 = case MasterDead =:= "" of
                              true -> [];
                              false -> [{5, MasterDead}]
                          end,
            Use1 = case Use =:= "" of
                       true -> [];
                       false -> [{6, Use}]
                   end,
            Escape1 = case Escape =:= "" of
                          true -> [];
                          false -> [{7, Escape}]
                      end,
            Show1 ++
                Atk1 ++ Dfd1 ++ Dead1 ++ MasterDead1 ++ Use1 ++ Escape1;
        _ -> []
    end.

rand_talk(BaseId, Type) ->
    case pet_data:pet_talk(BaseId) of
        #{show_rate := ShowRate, atk_rate := AtkRate,
          dfd_rate := DfdRate, dead_rate := DeadRate,
          master_dead_rate := MasterDeadRate, use_rate := UseRate,
          escape_rate := EscapeRate} ->
            Rate = case Type of
                       1 -> ShowRate;
                       2 -> AtkRate;
                       3 -> DfdRate;
                       4 -> DeadRate;
                       5 -> MasterDeadRate;
                       6 -> UseRate;
                       7 -> EscapeRate;
                       _ -> 0
                   end,
            util:rand(1, 100) =< Rate;
        _Err -> false
    end.

use_egg(Role = #role{name = _RoleName}, EggId) ->
    case pet_data:get_egg(EggId) of
        CreateArgs = #{base_id := PetBaseId} ->
            _Genre = maps:get(genre, CreateArgs, 0),
            case pet:create(Role, CreateArgs#{from => "使用宠物蛋"}) of
                {ok, NewRole} ->
                    Msg = notice:format(lang:get("获得~ts"),
                                        [{pet_2, PetBaseId}]),
                    notice:send(Role, 3, Msg),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到对应宠物数据")}
    end.

add_happy(Role = #role{m_pet =
                           Mpet = #m_pet{pets = Pets}},
          PetId, BaseId, Step) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{genre = GenreType, happy = Happy,
                   name = Name, feed_item = FeedItem,
                   feed_point = FeedPoint,
                   pet_attr = PetAttr = #pet_attr{point = AttrPoint}} ->
            case item:attr(effect, BaseId) of
                [{4, Val}] ->
                    case GenreType of
                        2 -> {false, lang:get("这只宠物是永生宠，无需再加寿命啦！")};
                        6 -> {false, lang:get("这只宠物是永生宠，无需再加寿命啦！")};
                        4 -> {false, lang:get("这只宠物是永生宠，无需再加寿命啦！")};
                        _ ->
                            Loss = [#loss{label = item_base_id,
                                          val = [{BaseId, 1}]}],
                            case role_gain:do(Loss, Role) of
                                {false, _} -> {false, lang:get("数量不足, 无法喂养")};
                                {ok, NewRole} ->
                                    NewPet = Pet#pet{happy =
                                                         Happy + Val + Step},
                                    NewPets = lists:keyreplace(PetId,
                                                               #pet.id,
                                                               Pets,
                                                               NewPet),
                                    NR = NewRole#role{m_pet =
                                                          Mpet#m_pet{pets =
                                                                         NewPets}},
                                    Msg =
                                        notice:format(lang:get("为~ts补充了~ts点寿命"),
                                                      [{string_2, 5, Name},
                                                       {string_2, 5, Val}]),
                                    pet:push_10502(NR, NewPet),
                                    {ok, NR, Msg}
                            end
                    end;
                EffectList = [_ | _] ->
                    FeedItemNum = case lists:keyfind(BaseId, 1, FeedItem) of
                                      {_, TmpFeedItemNum} -> TmpFeedItemNum;
                                      _ -> 0
                                  end,
                    FeedItemMax = feed_item_max(BaseId),
                    case lists:keyfind(27, 1, EffectList) of
                        _ when FeedItemNum >= FeedItemMax ->
                            {false,
                             notice:format(lang:get("当前宠物额外属性已增加过~ts次，无法再增加"),
                                           [{string_2, 5, FeedItemMax}])};
                        {_, AddAttrPoint} ->
                            Loss = [#loss{label = item_base_id,
                                          val = [{BaseId, 1}]}],
                            case role_gain:do(Loss, Role) of
                                {false, _} -> {false, lang:get("数量不足, 无法喂养")};
                                {ok, NewRole} ->
                                    AddVal = case lists:keyfind(4,
                                                                1,
                                                                EffectList)
                                                 of
                                                 {_, Val} -> Val;
                                                 _ -> 0
                                             end,
                                    NewHappy = case AddVal of
                                                   0 -> Happy;
                                                   _ -> Happy + AddVal + Step
                                               end,
                                    NewFeedItem = lists:keystore(BaseId,
                                                                 1,
                                                                 FeedItem,
                                                                 {BaseId,
                                                                  FeedItemNum +
                                                                      1}),
                                    NewPetAttr = PetAttr#pet_attr{point =
                                                                      AttrPoint
                                                                          +
                                                                          AddAttrPoint},
                                    NewPet = Pet#pet{happy = NewHappy,
                                                     feed_item = NewFeedItem,
                                                     feed_point =
                                                         FeedPoint +
                                                             AddAttrPoint,
                                                     pet_attr = NewPetAttr},
                                    NewPets = lists:keyreplace(PetId,
                                                               #pet.id,
                                                               Pets,
                                                               NewPet),
                                    NR = NewRole#role{m_pet =
                                                          Mpet#m_pet{pets =
                                                                         NewPets}},
                                    Msg = case AddVal of
                                              0 ->
                                                  notice:format(lang:get("为~ts增加~ts点属性点, 已提升~ts/~ts次"),
                                                                [{string_2,
                                                                  5,
                                                                  Name},
                                                                 {string_2,
                                                                  5,
                                                                  AddAttrPoint},
                                                                 {string_2,
                                                                  5,
                                                                  FeedItemNum +
                                                                      1},
                                                                 {string_2,
                                                                  5,
                                                                  FeedItemMax}]);
                                              _ ->
                                                  notice:format(lang:get("为~ts增加~ts点属性点，补充了~ts点寿命, 已提升~ts/~ts次"),
                                                                [{string_2,
                                                                  5,
                                                                  Name},
                                                                 {string_2,
                                                                  5,
                                                                  AddAttrPoint},
                                                                 {string_2,
                                                                  5,
                                                                  AddVal},
                                                                 {string_2,
                                                                  5,
                                                                  FeedItemNum +
                                                                      1},
                                                                 {string_2,
                                                                  5,
                                                                  FeedItemMax}])
                                          end,
                                    pet:push_10502(NR, NewPet),
                                    pet:push_10503(NR, NewPet),
                                    log:pet(NR, "增加属性点", Pet, NewPet),
                                    {ok, NR, Msg}
                            end;
                        _ -> {false, lang:get("该道具不可喂养")}
                    end;
                _ -> {false, lang:get("不可喂养的道具")}
            end;
        _ -> {false, lang:get("当前没有出战宠物, 无法使用")}
    end.

book_add_exp(Role = #role{m_pet = #m_pet{pets = Pets},
                          lev = RoleLev},
             PetId, ItemId, Args) ->
    Result = case lists:keyfind(PetId, #pet.id, Pets) of
                 #pet{genre = 6} ->
                     {false, lang:get("宠物蛋只能通过战斗成长，不能使用经验道具哟{face_1,3}")};
                 Pet = #pet{} -> {true, Pet};
                 _ -> {false, lang:get("找不到目标宠物, 无法使用")}
             end,
    case Result of
        {true, #pet{lev = Lev}} when Lev >= RoleLev + 5 ->
            {false, lang:get("宠物已超过人物等级5级，无法获得经验")};
        {true,
         GetPet = #pet{lev = Lev, exp = Exp,
                       max_exp = MaxExp}} ->
            Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
            case role_gain:do(Loss, Role) of
                {false, _} -> {false, lang:get("道具不足, 无法使用")};
                {ok, NewRole} ->
                    Mode = maps:get(mode, Args, fruit),
                    Val = case Mode of
                              {book, OldExp} ->
                                  case OldExp > 0 of
                                      true -> OldExp;
                                      false -> round(151 * Lev + 12750)
                                  end;
                              fruit -> round((76 * Lev + 6350) * 2.5);
                              levup ->
                                  case Lev < 70 of
                                      true -> max(1, MaxExp - Exp);
                                      false -> 700000
                                  end;
                              _ -> round((76 * Lev + 6350) * 2.5)
                          end,
                    pet:add_exp(NewRole, #{mode => GetPet, val => Val})
            end;
        {false, Reason} -> {false, Reason}
    end.

auto_exp_book(Role = #role{m_pet = #m_pet{pets = Pets},
                           lev = RoleLev},
              PetId, Num) ->
    Result = case lists:keyfind(PetId, #pet.id, Pets) of
                 Pet = #pet{} -> {true, Pet};
                 _ -> {false, lang:get("找不到目标宠物, 无法使用")}
             end,
    case Result of
        {true, #pet{lev = Lev}} when Lev >= RoleLev + 5 ->
            {false, lang:get("宠物已超过人物等级5级，无法获得经验")};
        {true, GetPet = #pet{lev = Lev}} ->
            UseNum = calc_use_num(GetPet, RoleLev, Num),
            case UseNum > 0 of
                true ->
                    Loss = [#loss{label = item_base_id,
                                  val = [{20004, UseNum}]}],
                    case role_gain:do(Loss, Role) of
                        {false, _} -> {false, lang:get("道具不足, 无法使用")};
                        {ok, NewRole} ->
                            Val = round(UseNum * (151 * Lev + 12750)),
                            pet:add_exp(NewRole, #{mode => GetPet, val => Val})
                    end;
                _ -> {false, lang:get("宠物累积将超过人物等级5级，无需使用")}
            end;
        {false, Reason} -> {false, Reason}
    end.

calc_use_num(Pet, RoleLev, Num) ->
    calc_use_num(Pet, RoleLev, Num, 0).

calc_use_num(_Pet, _RoleLev, Num, UseNum)
    when Num =< 0 ->
    UseNum;
calc_use_num(#pet{lev = Lev}, RoleLev, _, UseNum)
    when Lev >= RoleLev + 5 ->
    UseNum;
calc_use_num(Pet = #pet{lev = Lev, exp = Exp,
                        max_exp = MaxExp},
             RoleLev, Num, UseNum) ->
    case Exp >= MaxExp of
        true ->
            NewLev = Lev + 1,
            case pet_data:get_exp(NewLev) of
                MaxExp1 when MaxExp1 > 0 ->
                    calc_use_num(Pet#pet{lev = NewLev, exp = Exp - MaxExp,
                                         max_exp = MaxExp1},
                                 RoleLev,
                                 Num,
                                 UseNum);
                _ -> UseNum
            end;
        false ->
            AddVal = round(151 * Lev + 12750),
            NewExp = Exp + AddVal,
            case NewExp >= MaxExp of
                true ->
                    NewLev = Lev + 1,
                    case pet_data:get_exp(NewLev) of
                        MaxExp1 when MaxExp1 > 0 ->
                            calc_use_num(Pet#pet{lev = NewLev,
                                                 exp = NewExp - MaxExp,
                                                 max_exp = MaxExp1},
                                         RoleLev,
                                         Num - 1,
                                         UseNum + 1);
                        _ -> UseNum
                    end;
                false ->
                    calc_use_num(Pet#pet{exp = NewExp},
                                 RoleLev,
                                 Num - 1,
                                 UseNum + 1)
            end
    end.

feed_item_max(29102) -> 20;
feed_item_max(_) -> 0.

