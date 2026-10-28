-file("src/mod/adm/adm.erl", 1).

-module(adm).

-export([init/0,
         feedback/4,
         restart/0,
         restart/1,
         restart/2,
         modify_status/2,
         silent/5,
         advert/5,
         lock/4,
         unlock/2,
         adm_rename/4,
         do_adm_rename/2,
         adm_set_label/2,
         set_role_label/2,
         loss_gold/2,
         loss_coin/2,
         do_loss_coin/2,
         do_loss_gold/2,
         loss_gold_bind/2,
         loss_item/3,
         do_loss_item/3,
         do_loss_gold_bind/2,
         update_cookie/1,
         apply_del_var/3,
         apply_set_var/4,
         apply_update/3,
         adm_score_mail/0,
         del_gold_all/0,
         del_gold_all/1,
         del_gold/2,
         login/1,
         del_gold_list/0,
         del_item/1,
         del_item_all/0,
         del_item_all/1,
         login2/1,
         web_loss/5,
         do_web_loss/3,
         adm_group_mail/0,
         adm_single_dog_mail/0,
         role_show/1,
         role_show/3,
         create_unit/0,
         create_unit/2,
         create_unit/3,
         update_role_charge_cfg/1,
         get_role_charge_cfg/1,
         mail_deal/0,
         del_single_dog_all/0,
         del_single_dog/2,
         adm_guild_clear/3,
         adm_guild_dismiss/3,
         adm_guild_transfer/5,
         adm_guild_member/3,
         adm_guild_blockade/3,
         adm_guild_unblock/3,
         adm_guild_action/5,
         send_gift/6,
         batch_lock_role/0,
         batch_unlock_role/0,
         do_deal_mail2/1,
         mail_deal_other/0,
         query_server_info/0,
         delete_role_mail/2,
         unit_recreate/0]).

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

-file("src/mod/adm/adm.erl", 76).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/mod/adm/adm.erl", 77).

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

-file("src/mod/adm/adm.erl", 78).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/adm/adm.erl", 79).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/adm/adm.erl", 80).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/adm/adm.erl", 81).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/mod/adm/adm.erl", 82).

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

-file("src/mod/adm/adm.erl", 83).

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

-file("src/mod/adm/adm.erl", 84).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/adm/adm.erl", 85).

login(Role = #role{id = Id}) ->
    case var:get_var(Role, other, 3001, 0) of
        0 ->
            case lists:keyfind(Id, 1, del_gold_all2()) of
                {_, Type} ->
                    case del_gold(Role, Type) of
                        {ok, NRole} ->
                            NRole2 = var:set_var(NRole, other, 3001, 1),
                            {ok, NRole2};
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

login2(Role = #role{id = Id}) ->
    case lists:member(Id, del_item_list()) of
        true -> del_item(Role);
        _ -> ok
    end.

role_show(Id, Plat, ZoneId) ->
    role_show({Id, Plat, ZoneId}).

role_show({Id, Plat, ZoneId}) ->
    case role_query:pid(by_id, Id, Plat, ZoneId) of
        {ok, Pid} ->
            role:apply(sync, Pid, {adm, role_show, []});
        _ -> {false, <<"该玩家不在线">>}
    end;
role_show(Pid) when is_pid(Pid) ->
    role:apply(sync, Pid, {adm, role_show, []});
role_show(Role = #role{}) ->
    List = do_role_show(Role,
                        [eqm,
                         wing,
                         talisman,
                         talisman_lev,
                         pet,
                         guard,
                         skill,
                         fashion,
                         skill_prac,
                         skill_life],
                        []),
    {ok, {ok, List}};
role_show(_) -> {false, <<"格式不对">>}.

do_role_show(_Role, [], List) -> lists:reverse(List);
do_role_show(Role, [Label | T], List) ->
    case role_show(Role, Label) of
        {ok, Val} ->
            case do_role_show2(Val, []) of
                Val2 when is_list(Val2) ->
                    do_role_show(Role, T, [[Label | Val2] | List]);
                Val2 -> do_role_show(Role, T, [[Label, Val2] | List])
            end;
        {false, _} -> do_role_show(Role, T, List);
        _Err ->
            logger:error("~w, ~w", [Label, _Err], adm, 146),
            do_role_show(Role, T, List)
    end.

do_role_show2([], List) -> lists:reverse(List);
do_role_show2([I | T], List) when is_list(I) ->
    Val2 = do_role_show2(I, []),
    do_role_show2(T, [Val2 | List]);
do_role_show2([{_Label, Val} | T], List) ->
    Val2 = do_role_show2(Val, []),
    do_role_show2(T, [Val2 | List]);
do_role_show2(Val, _) when is_list(Val) ->
    util:fbin(Val);
do_role_show2(Val, _) -> Val.

role_show(Role, eqm) -> blacksmith:adm_show(Role);
role_show(Role, wing) -> wing:adm_show(Role);
role_show(Role, talisman) -> talisman:adm_show(Role);
role_show(Role, talisman_lev) ->
    talisman:adm_show_lev(Role);
role_show(Role, pet) -> pet:adm_show(Role);
role_show(Role, guard) -> guard:adm_show(Role);
role_show(Role, guild) -> guild:adm_show(Role);
role_show(Role, skill) -> skill:adm_show(Role);
role_show(Role, skill_prac) ->
    skill_prac:adm_show(Role);
role_show(Role, skill_life) ->
    skill_life:adm_show(Role);
role_show(Role, fashion) -> fashion:adm_show(Role);
role_show(_Role, _Label) ->
    logger:error("没有实现~w", [_Label], adm, 183),
    {false, "没有实现"}.

init() -> #m_adm{}.

restart() -> restart(lang:get("游戏更新,重新启动")).

restart(Msg) -> restart("v151229", Msg).

restart(Version, Msg) when is_list(Version) ->
    logger:info("推送重启版本[~ts],附加信息[~ts]",
                [Version, Msg],
                adm,
                198),
    role_group:pack_send(world, 14701, {Version, Msg}),
    ok;
restart(Version, Msg) ->
    logger:error("无法识别的重启版本[~w,~w]",
                 [Version, Msg],
                 adm,
                 202),
    ok.

apply_del_var(Role, Mod, Key) ->
    NewRole = var:del_var(Role, Mod, Key),
    {ok, NewRole}.

apply_set_var(Role, Mod, Key, Val) ->
    NewRole = var:set_var(Role, Mod, Key, Val),
    {ok, NewRole}.

web_loss(Rid, Platform, ZoneId, Val, 1) when Val > 0 ->
    RoleId = {Rid, Platform, ZoneId},
    role:apply(async,
               RoleId,
               {adm, do_web_loss, [gold, Val]}),
    ok;
web_loss(Rid, Platform, ZoneId, Val, 2) when Val > 0 ->
    RoleId = {Rid, Platform, ZoneId},
    role:apply(async,
               RoleId,
               {adm, do_web_loss, [coin, Val]}),
    ok;
web_loss(Rid, Platform, ZoneId, Val, 3) when Val > 0 ->
    RoleId = {Rid, Platform, ZoneId},
    role:apply(async,
               RoleId,
               {adm, do_web_loss, [gold_bind, Val]}),
    ok;
web_loss(_, _, _, _, _) -> ok.

do_web_loss(Role = #role{name = Name,
                         assets =
                             #assets{gold = Gold, coin = Coin,
                                     gold_bind = GoldBind}},
            Type, Val) ->
    {Loss, MinVal} = case Type of
                         gold ->
                             NewVal = min(Gold, Val),
                             {format:val_to_loss([{90002, NewVal}]), NewVal};
                         coin ->
                             NewVal = min(Coin, Val),
                             {format:val_to_loss([{90000, NewVal}]), NewVal};
                         gold_bind ->
                             NewVal = min(GoldBind, Val),
                             {format:val_to_loss([{90003, NewVal}]), NewVal}
                     end,
    case role_gain:do_notice(Loss, Role) of
        {ok, NewRole} ->
            logger:info("[~ts]扣除[~w][~w]实际[~w]",
                        [Name, Type, Val, MinVal],
                        adm,
                        243),
            {ok, NewRole};
        _Err ->
            logger:info("扣除失败:~w", [_Err], adm, 246),
            ok
    end.

create_unit() ->
    Unit = #{type => unit, id => 80, base => 20080,
             pos => {10001, 3653, 1567}, event => [],
             disabled => ""},
    create_unit(1, Unit).

create_unit(BattleId, Unit) ->
    battle_mgr:apply(async,
                     BattleId,
                     {adm, create_unit, [BattleId, Unit]}).

create_unit(_Battle, BattleId, Unit) ->
    battle_fun:create_unit(BattleId, [Unit]),
    ok.

update_role_charge_cfg(RoleId) when is_tuple(RoleId) ->
    adm_mgr:reload_role_charge_cfg(),
    case role_misc:is_local_role(RoleId) of
        true ->
            case ets:lookup(role_charge_cfg, RoleId) of
                [#role_charge_cfg{label = Label}] ->
                    role:pack_send(RoleId, 9953, {Label});
                _ -> role:pack_send(RoleId, 9953, {""})
            end;
        _ -> ok
    end;
update_role_charge_cfg(_RoleId) ->
    logger:error("玩家计费点变更参数错误Data:[~w]",
                 [_RoleId],
                 adm,
                 273),
    ok.

get_role_charge_cfg(#role{id = RoleId}) ->
    case catch ets:lookup(role_charge_cfg, RoleId) of
        [#role_charge_cfg{label = Label}] -> Label;
        _ -> ""
    end.

loss_coin(RoleId, Val) when Val > 0 ->
    role:apply(async, RoleId, {adm, do_loss_coin, [Val]}),
    ok;
loss_coin(_, _) -> ok.

do_loss_coin(Role = #role{name = Name,
                          assets = #assets{coin = Coin}},
             Val) ->
    Val1 = min(Val, Coin),
    Loss = format:val_to_loss([{90000, Val1}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, NewRole} ->
            case Val > Val1 of
                true ->
                    AddOwe = round(Val - Val1),
                    AllOwe = var:get_var(NewRole, other, 2127, 0),
                    NewAddOwe = min(800000000, AllOwe + AddOwe),
                    NewRole1 = var:set_var(NewRole, other, 2127, NewAddOwe),
                    logger:info("[~ts]需要扣除银币[~w],实际扣除银币[~w],原有银币欠款[~w],新增银币欠款[~w]",
                                [Name, Val, Val1, AllOwe, NewAddOwe - AllOwe],
                                adm,
                                303),
                    {ok, NewRole1};
                _ ->
                    logger:info("[~ts]需要扣除银币[~w],实际扣除银币[~w]",
                                [Name, Val, Val1],
                                adm,
                                306),
                    {ok, NewRole}
            end;
        _Err ->
            logger:info("扣除失败:~w", [_Err], adm, 310),
            ok
    end.

loss_gold(RoleId, Val) when Val > 0 ->
    role:apply(async, RoleId, {adm, do_loss_gold, [Val]}),
    ok;
loss_gold(_, _) -> ok.

do_loss_gold(Role = #role{name = Name,
                          assets = #assets{gold = Gold}},
             Val) ->
    Val1 = min(Val, Gold),
    Loss = format:val_to_loss([{90002, Val1}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, NewRole} ->
            case Val > Val1 of
                true ->
                    AddOwe = round(Val - Val1),
                    AllOwe = var:get_var(NewRole, other, 2126, 0),
                    NewAddOwe = min(200000, AllOwe + AddOwe),
                    NewRole1 = var:set_var(NewRole, other, 2126, NewAddOwe),
                    logger:info("[~ts]需要扣除钻石[~w],实际扣除钻石[~w],原有钻石欠款[~w],新增钻石欠款[~w]",
                                [Name, Val, Val1, AllOwe, NewAddOwe - AllOwe],
                                adm,
                                332),
                    {ok, NewRole1};
                _ ->
                    logger:info("[~ts]需要扣除[~w],实际扣除[~w]",
                                [Name, Val, Val1],
                                adm,
                                335),
                    {ok, NewRole}
            end;
        _Err ->
            logger:info("扣除失败:~w", [_Err], adm, 339),
            ok
    end.

loss_gold_bind(RoleId, Val) when Val > 0 ->
    role:apply(async,
               RoleId,
               {adm, do_loss_gold_bind, [Val]}),
    ok;
loss_gold_bind(_, _) -> ok.

loss_item(RoleId, ItemId, Num) ->
    role:apply(async,
               RoleId,
               {adm, do_loss_item, [ItemId, Num]}),
    ok.

do_loss_item(Role, ItemId, Num) ->
    Loss = format:val_to_loss([{ItemId, Num}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, NewRole} -> {ok, NewRole};
        _Err ->
            logger:info("扣除失败:~w", [_Err], adm, 361),
            ok
    end.

do_loss_gold_bind(Role = #role{name = Name,
                               assets = #assets{gold_bind = GoldBind}},
                  Val) ->
    Val1 = min(Val, GoldBind),
    Loss = format:val_to_loss([{90003, Val1}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, NewRole} ->
            case Val > Val1 of
                true ->
                    AddOwe = round(Val - Val1),
                    AllOwe = var:get_var(NewRole, other, 2061, 0),
                    NewAddOwe = min(18000000, AddOwe),
                    NewRole1 = var:set_var(NewRole,
                                           other,
                                           2061,
                                           NewAddOwe + AllOwe),
                    logger:info("[~ts]需要扣除[~w],实际扣除[~w],原有欠款[~w],新增欠款[~w]",
                                [Name, Val, Val1, AllOwe, NewAddOwe - AllOwe],
                                adm,
                                376),
                    {ok, NewRole1};
                _ ->
                    logger:info("[~ts]需要扣除[~w],实际扣除[~w]",
                                [Name, Val, Val1],
                                adm,
                                379),
                    {ok, NewRole}
            end;
        _Err ->
            logger:info("扣除失败:~w", [_Err], adm, 383),
            ok
    end.

apply_update(Role, Pos, Data) ->
    case erlang:element(Pos, Role) of
        E when is_tuple(E) ->
            A = erlang:element(1, E),
            case is_atom(A) andalso is_record(Data, A) of
                true ->
                    NRole = setelement(Pos, Role, Data),
                    logger:info("更新结构:~w;原来:~w;更新：~w",
                                [Pos, E, Data],
                                adm,
                                394),
                    {ok, NRole};
                _A ->
                    logger:error("不能替换结构:~w", [_A], adm, 397),
                    ok
            end;
        _E ->
            logger:error("不能替换结构:~w", [_E], adm, 401),
            ok
    end.

update_cookie(Cookie) ->
    erlang:set_cookie(erlang:node(), Cookie),
    env:set(cookie, Cookie).

feedback(Now, Content, Contact, Role) ->
    case check_len([{content, Content}, {contact, Contact}])
        of
        {false, Reason} -> {false, Reason};
        true ->
            case adm_db:save_feedback(Now, Content, Contact, Role)
                of
                ok ->
                    Title = lang:get("提交反馈成功"),
                    ReContent =
                        lang:get("尊敬的玩家，您反馈的问题已经记录，会有GM姐姐及时跟进处理，感谢您对游戏的支持，祝您游戏愉快！"),
                    mail:send(Role,
                              #{title => Title, content => ReContent,
                                items => []}),
                    ok;
                false -> {false, lang:get("系统繁忙，请稍后尝试")}
            end
    end.

check_len([]) -> true;
check_len([{content, Content} | T]) ->
    case util:check_text(Content, 150, lang:get("反馈内容")) of
        {false, Reason} -> {false, Reason};
        ok -> check_len(T)
    end;
check_len([{contact, Contact} | T]) ->
    case util:check_text(Contact, 15, lang:get("联系方式")) of
        {false, Reason} -> {false, Reason};
        ok -> check_len(T)
    end.

silent(Roles, Time, Hide, Msg, AdminName) ->
    case check_role_info(Roles) of
        {false, Reason} -> {false, Reason};
        true ->
            Ctime = date:unixtime(),
            TimeOut = case Time of
                          0 -> 0;
                          _ -> Ctime + Time * 60
                      end,
            case do_change_role(silent,
                                Roles,
                                Ctime,
                                TimeOut,
                                Hide,
                                Msg,
                                AdminName,
                                Time,
                                [])
                of
                [] -> ok;
                Reason -> {false, Reason}
            end
    end.

advert(Roles, Time, Hide, _Msg, _AdminName) ->
    case check_role_info(Roles) of
        {false, Reason} -> {false, Reason};
        true ->
            Ctime = date:unixtime(),
            TimeOut = case Time of
                          0 -> 0;
                          _ -> Ctime + Time * 60
                      end,
            case do_change_role(private,
                                Roles,
                                TimeOut,
                                Hide,
                                Time,
                                [])
                of
                [] -> ok;
                Reason -> {false, Reason}
            end
    end.

lock(Roles, Time, Msg, AdminName) ->
    logger:debug("对角色进行封号,~w, ~w, ~w, ~w",
                 [Roles, Time, Msg, AdminName],
                 adm,
                 473),
    case check_role_info(Roles) of
        {false, Reason} -> {false, Reason};
        true ->
            Ctime = date:unixtime(),
            TimeOut = case Time of
                          0 -> 0;
                          _ -> Ctime + Time * 60
                      end,
            case do_change_role(lock,
                                Roles,
                                Ctime,
                                TimeOut,
                                Msg,
                                AdminName,
                                Time,
                                [])
                of
                [] -> ok;
                Reason -> {false, Reason}
            end
    end.

unlock(RoleList, AdminName) ->
    Ctime = date:unixtime(),
    case do_unlock(RoleList, AdminName, Ctime, []) of
        [] -> ok;
        Reason -> {false, Reason}
    end.

modify_status(#role{lock_status = 0}, 0) -> {ok, ok};
modify_status(Role = #role{lock_status = 1}, 4) ->
    {ok, ok, Role#role{lock_status = 4}};
modify_status(Role = #role{lock_status = _Lock}, 0) ->
    {ok, ok, Role#role{lock_status = 0}};
modify_status(Role = #role{lock_status = Lock}, Type) ->
    {Flag, NewLock} = case Lock of
                          0 -> {ok, Type};
                          1 when Type =:= 2 -> {ok, 3};
                          2 when Type =:= 1 -> {ok, 3};
                          _ -> {false, Lock}
                      end,
    case Flag of
        ok ->
            NewRole = Role#role{lock_status = NewLock},
            attr:push_10000(NewRole),
            {ok, ok, NewRole};
        false -> {ok, ok}
    end.

do_unlock([], _AdminName, _Ctime, Reason) -> Reason;
do_unlock([Rinfo | T], AdminName, Ctime, Reason) ->
    case get_role(Rinfo) of
        {online, RoleId, RolePid, RoleName} ->
            catch unlock_role(RoleId),
            case role:apply(sync,
                            RolePid,
                            {adm, modify_status, [0]})
                of
                ok -> do_unlock(T, AdminName, Ctime, Reason);
                Err ->
                    Rs = util:flist("角色[~ts]同步调用修改封号字段失败:~w",
                                    [RoleName, Err]),
                    do_unlock(T, AdminName, Ctime, [Rs | Reason])
            end;
        {offline, RoleId, RoleName, LockStatus} ->
            catch unlock_role(RoleId),
            case update_db_role(free, RoleId, LockStatus) of
                ok -> do_unlock(T, AdminName, Ctime, Reason);
                Err ->
                    Rs = util:flist("角色[~ts]修改封号字段失败:~w", [RoleName, Err]),
                    do_unlock(T, AdminName, Ctime, [Rs | Reason])
            end;
        _X ->
            Err = case Rinfo of
                      {Rid, Platform, ZoneId} when is_integer(Rid) ->
                          util:flist("角色[~w]不存在或者获取失败",
                                     [{Rid, Platform, ZoneId}]);
                      {RoleName, _Platform, _ZoneId} ->
                          util:flist("角色[~ts]不存在或者获取失败", [RoleName])
                  end,
            do_unlock(T, AdminName, Ctime, [Err | Reason])
    end.

check_role_info([]) -> true;
check_role_info([{RoleId, Platform, ZoneId} | T])
    when (is_integer(RoleId) orelse is_list(RoleId)) andalso
             is_list(Platform) andalso is_integer(ZoneId) ->
    check_role_info(T);
check_role_info([Err | _T]) ->
    {false, util:flist("错误的参数:~w", [Err])}.

do_change_role(lock, [], _Ctime, _TimeOut, _Msg,
               _AdminName, _, Reason) ->
    Reason;
do_change_role(lock, [Rinfo | T], Ctime, TimeOut, Msg,
               AdminName, Time, Reason) ->
    case get_role(Rinfo) of
        {online, RoleId, RolePid, RoleName} ->
            Type = case TimeOut of
                       0 -> 1;
                       _ -> 2
                   end,
            update_role_lock({AdminName,
                              Msg,
                              2,
                              Type,
                              Ctime,
                              TimeOut},
                             RoleId),
            case role:apply(sync,
                            RolePid,
                            {adm, modify_status, [2]})
                of
                ok ->
                    case Type of
                        1 ->
                            role:stop(async,
                                      RolePid,
                                      lang:get("您的账号登陆出现异常，请联系GM"));
                        _ ->
                            role:stop(async,
                                      RolePid,
                                      lang:get("您的账号登陆出现异常，请联系GM"))
                    end,
                    do_change_role(lock,
                                   T,
                                   Ctime,
                                   TimeOut,
                                   Msg,
                                   AdminName,
                                   Time,
                                   Reason);
                Err ->
                    Rs = util:flist("角色[~ts]同步调用修改封号字段失败:~w",
                                    [RoleName, Err]),
                    do_change_role(lock,
                                   T,
                                   Ctime,
                                   TimeOut,
                                   Msg,
                                   AdminName,
                                   Time,
                                   [Rs | Reason])
            end;
        {offline, RoleId, RoleName, LockStatus} ->
            Type = case TimeOut of
                       0 -> 1;
                       _ -> 2
                   end,
            update_role_lock({AdminName,
                              Msg,
                              2,
                              Type,
                              Ctime,
                              TimeOut},
                             RoleId),
            case update_db_role(lock, RoleId, LockStatus) of
                ok ->
                    do_change_role(lock,
                                   T,
                                   Ctime,
                                   TimeOut,
                                   Msg,
                                   AdminName,
                                   Time,
                                   Reason);
                Err ->
                    Rs = util:flist("角色[~ts]修改封号字段失败:~w", [RoleName, Err]),
                    do_change_role(lock,
                                   T,
                                   Ctime,
                                   TimeOut,
                                   Msg,
                                   AdminName,
                                   Time,
                                   [Rs | Reason])
            end;
        _ ->
            Err = case Rinfo of
                      {Rid, Platform, ZoneId} when is_integer(Rid) ->
                          util:flist("角色[~w]不存在或者获取失败",
                                     [{Rid, Platform, ZoneId}]);
                      {RoleName, _Platform, _ZoneId} ->
                          util:flist("角色[~ts]不存在或者获取失败", [RoleName])
                  end,
            do_change_role(lock,
                           T,
                           Ctime,
                           TimeOut,
                           Msg,
                           AdminName,
                           Time,
                           [Err | Reason])
    end.

do_change_role(silent, [], _Ctime, _TimeOut,
               _SilentHide, _Msg, _AdminName, _, Reason) ->
    Reason;
do_change_role(silent, [Rinfo | T], Ctime, TimeOut,
               SilentHide, Msg, AdminName, Time, Reason) ->
    logger:debug("获取角色信息，~w", [Rinfo], adm, 612),
    case get_role(Rinfo) of
        {online, RoleId, RolePid, RoleName} ->
            logger:debug("对角色进行禁言，~w,~w,~w",
                         [RoleId, RolePid, RoleName],
                         adm,
                         615),
            Type = case TimeOut of
                       0 -> 1;
                       _ -> 2
                   end,
            update_role_lock({AdminName,
                              SilentHide,
                              Msg,
                              1,
                              Type,
                              Ctime,
                              TimeOut},
                             RoleId),
            case role:apply(sync,
                            RolePid,
                            {adm, modify_status, [1]})
                of
                ok ->
                    silent_mail(RoleId, Type, Time, SilentHide),
                    do_change_role(silent,
                                   T,
                                   Ctime,
                                   TimeOut,
                                   SilentHide,
                                   Msg,
                                   AdminName,
                                   Time,
                                   Reason);
                Err ->
                    Rs = util:flist("角色[~ts]同步调用修改禁言字段失败:~w",
                                    [RoleName, Err]),
                    do_change_role(silent,
                                   T,
                                   Ctime,
                                   TimeOut,
                                   SilentHide,
                                   Msg,
                                   AdminName,
                                   Time,
                                   [Rs | Reason])
            end;
        {offline, RoleId, RoleName, LockStatus} ->
            logger:debug("对非在线角色进行禁言，~w,~w,~w",
                         [RoleId, RoleName, LockStatus],
                         adm,
                         632),
            Type = case TimeOut of
                       0 -> 1;
                       _ -> 2
                   end,
            update_role_lock({AdminName,
                              SilentHide,
                              Msg,
                              1,
                              Type,
                              Ctime,
                              TimeOut},
                             RoleId),
            case update_db_role(silent, RoleId, LockStatus) of
                ok ->
                    silent_mail(RoleId, Type, Time, SilentHide),
                    do_change_role(silent,
                                   T,
                                   Ctime,
                                   TimeOut,
                                   SilentHide,
                                   Msg,
                                   AdminName,
                                   Time,
                                   Reason);
                Err ->
                    Rs = util:flist("角色[~ts]修改禁言字段失败:~w", [RoleName, Err]),
                    do_change_role(silent,
                                   T,
                                   Ctime,
                                   TimeOut,
                                   SilentHide,
                                   Msg,
                                   AdminName,
                                   Time,
                                   [Rs | Reason])
            end;
        _ ->
            logger:debug("角色状态错误", [], adm, 649),
            Err = case Rinfo of
                      {Rid, Platform, ZoneId} when is_integer(Rid) ->
                          util:flist("角色[~w]不存在或者获取失败",
                                     [{Rid, Platform, ZoneId}]);
                      {RoleName, _Platform, _ZoneId} ->
                          util:flist("角色[~ts]不存在或者获取失败", [RoleName])
                  end,
            do_change_role(silent,
                           T,
                           Ctime,
                           TimeOut,
                           SilentHide,
                           Msg,
                           AdminName,
                           Time,
                           [Err | Reason])
    end.

do_change_role(private, [], _TimeOut, _SilentHide, _,
               Reason) ->
    Reason;
do_change_role(private, [Rinfo | T], TimeOut,
               SilentHide, Time, Reason) ->
    logger:debug("获取角色信息，~w", [Rinfo], adm, 662),
    case get_role(Rinfo) of
        {online, RoleId, RolePid, RoleName} ->
            logger:debug("对角色进行禁止私聊，~w,~w,~w",
                         [RoleId, RolePid, RoleName],
                         adm,
                         665),
            Type = case TimeOut of
                       0 -> 1;
                       _ -> 2
                   end,
            case role:apply(sync,
                            RolePid,
                            {adm, modify_status, [4]})
                of
                ok ->
                    silent_mail(RoleId, Type, Time, SilentHide),
                    do_change_role(private,
                                   T,
                                   TimeOut,
                                   SilentHide,
                                   Time,
                                   Reason);
                Err ->
                    Rs = util:flist("角色[~ts]同步调用修改禁言字段失败:~w",
                                    [RoleName, Err]),
                    do_change_role(private,
                                   T,
                                   TimeOut,
                                   SilentHide,
                                   Time,
                                   [Rs | Reason])
            end;
        {offline, RoleId, RoleName, LockStatus} ->
            logger:debug("对非在线角色进行禁言，~w,~w,~w",
                         [RoleId, RoleName, LockStatus],
                         adm,
                         681),
            Type = case TimeOut of
                       0 -> 1;
                       _ -> 2
                   end,
            case update_db_role(private, RoleId, LockStatus) of
                ok ->
                    silent_mail(RoleId, Type, Time, SilentHide),
                    do_change_role(private,
                                   T,
                                   TimeOut,
                                   SilentHide,
                                   Time,
                                   Reason);
                Err ->
                    Rs = util:flist("角色[~ts]修改禁言字段失败:~w", [RoleName, Err]),
                    do_change_role(private,
                                   T,
                                   TimeOut,
                                   SilentHide,
                                   Time,
                                   [Rs | Reason])
            end;
        _ ->
            logger:debug("角色状态错误", [], adm, 697),
            Err = case Rinfo of
                      {Rid, Platform, ZoneId} when is_integer(Rid) ->
                          util:flist("角色[~w]不存在或者获取失败",
                                     [{Rid, Platform, ZoneId}]);
                      {RoleName, _Platform, _ZoneId} ->
                          util:flist("角色[~ts]不存在或者获取失败", [RoleName])
                  end,
            do_change_role(private,
                           T,
                           TimeOut,
                           SilentHide,
                           Time,
                           [Err | Reason])
    end.

get_role({Rid, Platform, ZoneId})
    when is_integer(Rid) ->
    case role_query:index(by_id, Rid, Platform, ZoneId) of
        {ok, #id_index{name = Name, pid = Pid}} ->
            {online, {Rid, Platform, ZoneId}, Pid, Name};
        {error, not_found} ->
            case role_data:info(by_id, Rid, Platform, ZoneId) of
                {ok,
                 #role_info{name = Name, lock_status = LockStatus}} ->
                    {offline, {Rid, Platform, ZoneId}, Name, LockStatus};
                _ -> {false, error}
            end;
        _ -> {false, error}
    end;
get_role({RoleName, Platform, ZoneId}) ->
    case role_query:index(by_name,
                          RoleName,
                          Platform,
                          ZoneId)
        of
        {ok, #name_index{id = Rid, pid = Pid}} ->
            {online, {Rid, Platform, ZoneId}, Pid, RoleName};
        {error, not_found} ->
            case role_data:info(by_name, RoleName, Platform, ZoneId)
                of
                {ok, #role_info{id = Rid, lock_status = LockStatus}} ->
                    {offline,
                     {Rid, Platform, ZoneId},
                     RoleName,
                     LockStatus};
                _Err -> {false, error}
            end;
        _Err -> {false, error}
    end.

update_db_role(free, _RoleId, 0) -> ok;
update_db_role(free, {Rid, Platform, ZoneId}, _) ->
    Sql = "update role set lock_status = ? where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    case db:exec(Sql, [0, Rid, Platform, ZoneId]) of
        ok -> ok;
        {error, Reason} -> {false, Reason}
    end;
update_db_role(silent, {_Rid, _Platform, _ZoneId}, 1) ->
    ok;
update_db_role(silent, {_Rid, _Platform, _ZoneId}, 3) ->
    ok;
update_db_role(silent, {Rid, Platform, ZoneId}, 2) ->
    Sql = "update role set lock_status = ? where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    case db:exec(Sql, [3, Rid, Platform, ZoneId]) of
        ok -> ok;
        {error, Reason} -> {false, Reason}
    end;
update_db_role(silent, {Rid, Platform, ZoneId}, 0) ->
    Sql = "update role set lock_status = ? where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    case db:exec(Sql, [1, Rid, Platform, ZoneId]) of
        ok -> ok;
        {error, Reason} -> {false, Reason}
    end;
update_db_role(private, {Rid, Platform, ZoneId}, 1) ->
    Sql = "update role set lock_status = ? where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    case db:exec(Sql, [4, Rid, Platform, ZoneId]) of
        ok -> ok;
        {error, Reason} -> {false, Reason}
    end;
update_db_role(private, {_Rid, _Platform, _ZoneId},
               3) ->
    ok;
update_db_role(private, {_Rid, _Platform, _ZoneId},
               2) ->
    ok;
update_db_role(private, {Rid, Platform, ZoneId}, 0) ->
    Sql = "update role set lock_status = ? where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    case db:exec(Sql, [4, Rid, Platform, ZoneId]) of
        ok -> ok;
        {error, Reason} -> {false, Reason}
    end;
update_db_role(lock, {_Rid, _Platform, _ZoneId}, 2) ->
    ok;
update_db_role(lock, {_Rid, _Platform, _ZoneId}, 3) ->
    ok;
update_db_role(lock, {Rid, Platform, ZoneId}, 1) ->
    Sql = "update role set lock_status = ? where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    case db:exec(Sql, [3, Rid, Platform, ZoneId]) of
        ok -> ok;
        {error, Reason} -> {false, Reason}
    end;
update_db_role(lock, {Rid, Platform, ZoneId}, 4) ->
    Sql = "update role set lock_status = ? where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    case db:exec(Sql, [3, Rid, Platform, ZoneId]) of
        ok -> ok;
        {error, Reason} -> {false, Reason}
    end;
update_db_role(lock, {Rid, Platform, ZoneId}, 0) ->
    Sql = "update role set lock_status = ? where "
          "id = ? and platform = ? and zone_id "
          "= ?",
    case db:exec(Sql, [2, Rid, Platform, ZoneId]) of
        ok -> ok;
        {error, Reason} -> {false, Reason}
    end.

update_role_lock({AdminName,
                  Msg,
                  2,
                  Type,
                  Ctime,
                  TimeOut},
                 {Rid, Platform, ZoneId}) ->
    Sql = "insert into lock_role(id, platform, "
          "zone_id, admin_name, lock_type, lock_ctime, "
          "lock_timeout, lock_info, silent_type, "
          "silent_ctime, silent_timeout, silent_hide, "
          "silent_info) values(?, ?, ?, ?, ?, ?, "
          "?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY "
          "UPDATE admin_name = ?, lock_type = ?, "
          "lock_ctime = ?, lock_timeout = ?, lock_info "
          "= ?",
    case db:exec(Sql,
                 [Rid,
                  Platform,
                  ZoneId,
                  AdminName,
                  Type,
                  Ctime,
                  TimeOut,
                  Msg,
                  0,
                  0,
                  0,
                  0,
                  "",
                  AdminName,
                  Type,
                  Ctime,
                  TimeOut,
                  Msg])
        of
        ok -> ok;
        _Other ->
            logger:error("封号修改数据库失败,AdminName:~w,Rid:~w,Platform:~w,Zon"
                         "eId:~w,Reason:~w",
                         [AdminName, Rid, Platform, ZoneId, _Other],
                         adm,
                         799),
            false
    end;
update_role_lock({AdminName,
                  Hide,
                  Msg,
                  1,
                  Type,
                  Ctime,
                  TimeOut},
                 {Rid, Platform, ZoneId}) ->
    Sql = "insert into lock_role(id, platform, "
          "zone_id, admin_name, lock_type, lock_ctime, "
          "lock_timeout, lock_info, silent_type, "
          "silent_ctime, silent_timeout, silent_hide, "
          "silent_info) values(?, ?, ?, ?, ?, ?, "
          "?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY "
          "UPDATE admin_name = ?, silent_type = "
          "?, silent_ctime = ?, silent_timeout "
          "= ?, silent_hide= ?, silent_info = ?",
    case db:exec(Sql,
                 [Rid,
                  Platform,
                  ZoneId,
                  AdminName,
                  0,
                  0,
                  0,
                  "",
                  Type,
                  Ctime,
                  TimeOut,
                  Hide,
                  Msg,
                  AdminName,
                  Type,
                  Ctime,
                  TimeOut,
                  Hide,
                  Msg])
        of
        ok -> ok;
        _Other ->
            logger:error("禁言修改数据库失败,AdminName:~ts,Rid:~w,Platform:~ts,Z"
                         "oneId:~w,Reason:~w",
                         [AdminName, Rid, Platform, ZoneId, _Other],
                         adm,
                         808),
            false
    end.

unlock_role({Rid, Platform, ZoneId}) ->
    Sql = "delete from lock_role where id = ? and "
          "platform = ? and zone_id = ?",
    case db:exec(Sql, [Rid, Platform, ZoneId]) of
        ok -> ok;
        _Other ->
            logger:error("解除封号禁言状态失败,Rid:~w,Platform:~w,ZoneId:~w,Reaso"
                         "n:~w",
                         [Rid, Platform, ZoneId, _Other],
                         adm,
                         818),
            false
    end.

silent_mail(RoleId, Type, Min, 0) ->
    Title = lang:get("禁言"),
    ReContent = case Type of
                    2 ->
                        util:flist(lang:get("由于你在游戏中言行不雅，已被禁言~w分钟"), [Min]);
                    _ -> lang:get("由于你在游戏中言行不雅，已被禁言")
                end,
    mail:send(RoleId,
              #{title => Title, content => ReContent, items => []});
silent_mail(_, _, _, _) -> ok.

adm_rename(Rid, Platform, ZoneId, NewName) ->
    case util:check_name(NewName) of
        ok ->
            case role_query:local_pid(by_id,
                                      {Rid, Platform, ZoneId})
                of
                {ok, RolePid} ->
                    role:apply(async,
                               RolePid,
                               {adm, do_adm_rename, [NewName]}),
                    ok;
                _ -> {false, role_offline}
            end;
        _ -> {false, name_failed}
    end.

do_adm_rename(Role, Name) ->
    Time = var:get_var(Role, acc, 1005, 0),
    PayTime = var:get_var(Role, acc, 1008, 0),
    case role_misc:rename(Role, Name) of
        {false, Reason} ->
            role:pack_send(Role,
                           10015,
                           {0, Reason, Name, Time, PayTime}),
            ok;
        {ok, NewRole} ->
            Title = lang:get("系统更名"),
            Content =
                notice:format(lang:get("由于你的角色名不合法，系统自动更名为~ts，请知悉"),
                              [{role_2, Name}]),
            mail:send(NewRole,
                      #{title => Title, content => Content, items => []}),
            role:pack_send(NewRole,
                           10015,
                           {1, lang:get("改名成功"), Name, Time, PayTime}),
            {ok, NewRole}
    end.

adm_set_label(RoleInfos, Label) ->
    case check_role_info(RoleInfos) of
        {false, Reason} -> {false, Reason};
        true ->
            case lists:member(Label, [0, 1, 2]) of
                true -> do_adm_set_label(RoleInfos, Label);
                false -> {false, lang:get("错误的角色状态")}
            end
    end.

do_adm_set_label([], _Label) -> ok;
do_adm_set_label([{Rid, Platform, ZoneId} | T],
                 Label) ->
    case role_query:local_pid(by_id,
                              {Rid, Platform, ZoneId})
        of
        {ok, RolePid} ->
            role:apply(async,
                       RolePid,
                       {adm, set_role_label, [Label]}),
            do_adm_set_label(T, Label);
        _ ->
            Sql = "update role set label = ? where id = "
                  "? and platform = ? and zone_id = ?",
            case db:exec(Sql, [Label, Rid, Platform, ZoneId]) of
                ok -> do_adm_set_label(T, Label);
                _Err ->
                    logger:error("更改角色状态失败:~w", [_Err], adm, 895),
                    false
            end
    end;
do_adm_set_label([_ | T], Label) ->
    do_adm_set_label(T, Label).

set_role_label(Role, Label) ->
    {ok, Role#role{label = Label}}.

adm_group_mail() ->
    List = get_adm_group_mail(),
    MailRole = [{Id, Val * 80}
                || {Id, Val} <- List,
                   role_misc:is_local_role(Id) =:= true],
    case MailRole of
        [_ | _] ->
            Title = "光棍节积分",
            Content = "亲爱的玩家：\n这是您参与光棍节活动的积分，请查收",
            do_adm_group_mail(MailRole, Title, Content);
        _ -> ignore
    end.

adm_single_dog_mail() ->
    List = get_adm_group_mail(),
    MailRole = [{Id, Val}
                || {Id, Val} <- List,
                   role_misc:is_local_role(Id) =:= true],
    case MailRole of
        [_ | _] ->
            Title = "光棍节积分",
            Content = "亲爱的玩家：\n这是补发给您参与光棍节活动的积分，请查收",
            do_adm_group_mail(MailRole, Title, Content);
        _ -> ignore
    end.

do_adm_group_mail([], _Title, _Content) -> ok;
do_adm_group_mail([{RoleId = {Rid, P, Z}, Val} | T],
                  Title, Content)
    when Val > 0 ->
    mail:send(RoleId,
              #{title => Title, content => Content,
                items => [{90050, Val}]}),
    logger:info("给[~w:~ts:~w]发送光棍节补偿[~w]",
                [Rid, P, Z, Val],
                adm,
                935),
    do_adm_group_mail(T, Title, Content);
do_adm_group_mail([_ | T], Title, Content) ->
    do_adm_group_mail(T, Title, Content).

adm_score_mail() ->
    List = get_adm_recover_mail(),
    MailRole = [{Id, Val}
                || {Id, Val} <- List,
                   role_misc:is_local_role(Id) =:= true],
    case MailRole of
        [_ | _] ->
            Title = "砸蛋积分补偿",
            Content =
                "亲爱的玩家以下是您在今日<color='#ffff00'>砸蛋活动</color>中未及时"
                "获得的积分，请查收，祝您在后面的砸蛋抽奖中<color='#ffff00'>运气爆棚</c"
                "olor>！{face_1,3}",
            do_adm_recover_mail(MailRole, Title, Content);
        _ -> ok
    end.

do_adm_recover_mail([], _, _) -> ok;
do_adm_recover_mail([{RoleId = {Rid, P, Z}, Val} | T],
                    Title, Content)
    when Val > 0 ->
    mail:send(RoleId,
              #{title => Title, content => Content,
                items => [{90039, Val}]}),
    logger:info("给[~w:~ts:~w]发送砸蛋积分补偿[~w]",
                [Rid, P, Z, Val],
                adm,
                956),
    do_adm_recover_mail(T, Title, Content);
do_adm_recover_mail([_ | T], Title, Content) ->
    do_adm_recover_mail(T, Title, Content).

del_gold_all() ->
    List = del_gold_list(),
    del_gold_all(List).

del_gold_all([]) -> ok;
del_gold_all([{Id, Type} | T]) ->
    case role_misc:is_local_role(Id) of
        true ->
            case role_query:pid(by_id, Id) of
                {ok, Pid} ->
                    role:apply(async, Pid, {adm, del_gold, [Type]});
                _ ->
                    logger:info("礼包扣钻石玩家不在线：~w ", [{Id, Type}], adm, 973),
                    ignore
            end;
        _ -> ignore
    end,
    del_gold_all(T).

del_gold(Role = #role{id = Id, name = Name,
                      assets = #assets{gold = Gold}},
         Type) ->
    Val = case Type of
              2 -> 980 * 2;
              _ -> 1980 * 2
          end,
    Loss = case Gold >= Val of
               true -> [{90002, Val}];
               _ ->
                   logger:info("礼包扣钻石缺少：~w ~ts 应扣：~w 实扣：~w",
                               [Id, Name, Val, Gold],
                               adm,
                               991),
                   [{90002, Gold}]
           end,
    Loss2 = format:val_to_loss(Loss),
    case role_gain:do_notice(Loss2, Role) of
        {ok, NewRole} ->
            logger:info("礼包扣钻石成功：~w ~ts ~w",
                        [Id, Name, Loss],
                        adm,
                        997),
            mail:send(Role,
                      "故障通知",
                      "由于系统故障，您购买浅夏送福礼包时钻石消耗出现异常，我们刚刚对钻石进行了扣除操作，祝您游戏愉快"),
            {ok, NewRole};
        _ ->
            logger:info("礼包扣钻石失败：~w ~ts 应扣：~w ",
                        [Id, Name, Val],
                        adm,
                        1001),
            ok
    end.

del_item_all() ->
    List = del_item_list(),
    del_item_all(List).

del_item_all([]) -> ok;
del_item_all([Id | T]) ->
    case role_misc:is_local_role(Id) of
        true ->
            case role_query:pid(by_id, Id) of
                {ok, Pid} ->
                    role:apply(async, Pid, {adm, del_item, []});
                _ ->
                    logger:info("礼包扣道具玩家不在线：~w ", [Id], adm, 1016),
                    ignore
            end;
        _ -> ignore
    end,
    del_item_all(T).

del_item(Role = #role{id = _Id, name = _Name}) ->
    Var = var:get_var(Role, other, 3002, 0),
    Loss = [{29314, 1}],
    Loss2 = format:val_to_loss(Loss),
    case Var of
        0 ->
            NewRole1 = case role_gain:do_notice(Loss2, Role) of
                           {ok, NewRole} ->
                               logger:info("礼包扣道具成功：~w ~ts ~w",
                                           [_Id, _Name, Loss],
                                           adm,
                                           1032),
                               mail:send(Role,
                                         "故障通知",
                                         "由于系统故障，您购买浅夏送福礼包时钻石消耗出现异常，我们刚刚对礼包内的物品进行处理，祝您游戏愉快"),
                               NewRole;
                           _ ->
                               logger:info("礼包扣道具失败：~w ~ts",
                                           [_Id, _Name],
                                           adm,
                                           1036),
                               Role
                       end,
            NewRole2 = var:set_var(NewRole1, other, 3002, 1),
            {ok, NewRole2};
        _ -> ok
    end.

del_item_list() ->
    [{5664, "unite", 35},
     {73033, [100, 101, 118], 1},
     {73033, [100, 101, 118], 1},
     {1508, "unite", 35},
     {6789, "unite", 33},
     {1595, "unite", 50},
     {665, "unite", 53},
     {120, "unite", 39},
     {26792, "beta", 47},
     {221, "ios", 47},
     {106, "mix", 39},
     {10274, "mix", 55},
     {7603, "unite", 20},
     {218, "mix", 81},
     {3, "beta", 38},
     {12729, "ios", 5},
     {25167, "ios", 14},
     {2027, "mix", 116},
     {5187, "unite", 55},
     {24872, "mix", 37},
     {9835, "unite", 49},
     {7294, "unite", 51},
     {684, "ios", 10},
     {167, "beta", 27},
     {63708, "ios", 2},
     {3498, "unite", 25},
     {6982, "unite", 55},
     {14246, "unite", 29},
     {3883, "ios", 3},
     {13294, "mix", 89},
     {64, "mix", 108},
     {704, "mix", 65},
     {2077, "beta", 22},
     {1870, "mix", 60},
     {92, "unite", 53},
     {32401, "ios", 4},
     {3827, "ios", 2},
     {5267, "unite", 40},
     {12084, "unite", 12},
     {2215, "unite", 1},
     {15411, "unite", 39},
     {13616, "unite", 54},
     {4083, "unite", 54},
     {226, "unite", 53},
     {1436, "mix", 115},
     {536, "mix", 101},
     {126, "unite", 55},
     {8018, "unite", 52},
     {8014, "unite", 20},
     {152, "mix", 115},
     {1945, "unite", 39},
     {988, "mix", 100},
     {95, "mix", 101},
     {5387, "unite", 35},
     {12397, "mix", 100},
     {11834, "beta", 30},
     {10115, "beta", 31},
     {2434, "unite", 53},
     {5491, "ios", 12},
     {316, "unite", 47},
     {3397, "unite", 30},
     {13972, "unite", 29},
     {13618, "unite", 40},
     {6390, "mix", 96},
     {4957, "unite", 39},
     {12609, "unite", 46},
     {14789, "ios", 16},
     {2292, "unite", 53},
     {16626, "unite", 40},
     {336, "unite", 29},
     {22342, "beta", 30},
     {11758, "unite", 39},
     {68096, "ios", 2},
     {1864, "unite", 30},
     {446, "unite", 39},
     {15659, "ios", 6},
     {8941, "unite", 53},
     {454, "unite", 49},
     {11748, "unite", 25},
     {21002, "unite", 39},
     {9703, "unite", 29},
     {354, "unite", 17},
     {1807, "ios", 6},
     {50, "unite", 39},
     {15304, "unite", 7},
     {5130, "ios", 11},
     {19052, "unite", 30},
     {110, "unite", 39},
     {11785, "ios", 14},
     {97, "unite", 30},
     {6752, "mix", 30},
     {11400, "unite", 47},
     {67, "mix", 115},
     {12949, "unite", 53},
     {10049, "unite", 30},
     {2075, "unite", 29},
     {25105, "mix", 62},
     {10196, "unite", 30},
     {807, "unite", 39},
     {3160, "mix", 35},
     {9470, "mix", 21},
     {23, "unite", 35},
     {704, "unite", 53},
     {5918, "unite", 29},
     {35753, "mix", 45},
     {23593, "unite", 39},
     {376, "unite", 54},
     {1274, "unite", 30},
     {7339, "beta", 55},
     {2347, "beta", 62},
     {18498, "unite", 25},
     {4992, "unite", 40},
     {3253, "mix", 23},
     {5806, "unite", 39},
     {7134, "unite", 52},
     {7678, "unite", 50},
     {490, "mix", 110},
     {4867, "unite", 39},
     {12448, "unite", 39},
     {136, "unite", 29},
     {23913, "unite", 40},
     {1006, "mix", 100},
     {157, "unite", 30},
     {2704, "mix", 87},
     {793, "unite", 25},
     {1339, "unite", 39},
     {7499, "unite", 29},
     {468, "beta", 28},
     {5617, "unite", 46},
     {22140, "unite", 25},
     {22143, "unite", 25},
     {22052, "unite", 25},
     {22051, "unite", 25},
     {22027, "unite", 25},
     {22026, "unite", 25},
     {21876, "unite", 25},
     {21875, "unite", 25},
     {22170, "unite", 25},
     {15422, "unite", 25},
     {22276, "unite", 25},
     {18109, "unite", 25},
     {25032, "unite", 40},
     {25031, "unite", 40},
     {19006, "unite", 39},
     {20475, "unite", 39},
     {23708, "unite", 39},
     {71396, "ios", 14},
     {71370, "ios", 14},
     {71220, "ios", 14},
     {70916, "ios", 14},
     {37931, "ios", 14},
     {37791, "ios", 14},
     {37613, "ios", 14},
     {37612, "ios", 14},
     {261, "ios", 7},
     {37517, "ios", 14},
     {37518, "ios", 14},
     {44413, "ios", 3},
     {44551, "ios", 3},
     {44579, "ios", 3},
     {37711, "ios", 14},
     {973, "unite", 52},
     {5008, "unite", 52},
     {20387, "unite", 30},
     {19644, "unite", 30},
     {20446, "unite", 29},
     {10851, "mix", 119},
     {9426, "unite", 43},
     {140, "unite", 46},
     {898, "mix", 112},
     {1225, "mix", 91},
     {4254, "unite", 40},
     {2171, "mix", 106},
     {58, "unite", 55},
     {2990, "mix", 103},
     {17477, "unite", 39},
     {12602, "mix", 103},
     {87, "mix", 85},
     {9177, "mix", 114},
     {10359, "unite", 30},
     {14707, "unite", 49},
     {9931, "mix", 106},
     {398, "unite", 39},
     {11247, "unite", 39},
     {1486, "unite", 47},
     {17202, "unite", 39},
     {3849, "ios", 16},
     {862, "unite", 29}].

del_gold_all2() ->
    [{{143, "beta", 3}, 3},
     {{46217, "beta", 1}, 3},
     {{36622, "beta", 9}, 3},
     {{73033, [100, 101, 118], 1}, 2},
     {{73033, [100, 101, 118], 1}, 2},
     {{5664, "unite", 35}, 2},
     {{6789, "unite", 33}, 3},
     {{4262, "beta", 46}, 3},
     {{7339, "beta", 55}, 3},
     {{2197, "beta", 62}, 3},
     {{22342, "beta", 30}, 3},
     {{11834, "beta", 30}, 3},
     {{1609, "beta", 21}, 3},
     {{9118, "beta", 25}, 3},
     {{40574, "ios", 4}, 3},
     {{14669, "ios", 3}, 3},
     {{1142, "ios", 16}, 3},
     {{3849, "ios", 16}, 2},
     {{71220, "ios", 14}, 3},
     {{22971, "ios", 1}, 3},
     {{70916, "ios", 14}, 3},
     {{37931, "ios", 14}, 3},
     {{37613, "ios", 14}, 3},
     {{37612, "ios", 14}, 3},
     {{20176, "ios", 4}, 3},
     {{261, "ios", 7}, 3},
     {{37517, "ios", 14}, 3},
     {{44413, "ios", 3}, 3},
     {{44551, "ios", 3}, 3},
     {{44579, "ios", 3}, 3},
     {{37711, "ios", 14}, 3},
     {{15407, "ios", 39}, 3},
     {{18162, "ios", 42}, 3},
     {{955, "ios", 17}, 3},
     {{221, "ios", 47}, 3},
     {{33863, "mix", 82}, 3},
     {{218, "mix", 81}, 3},
     {{3101, "mix", 81}, 3},
     {{10274, "mix", 55}, 3},
     {{35753, "mix", 45}, 3},
     {{16682, "mix", 35}, 3},
     {{244, "mix", 37}, 3},
     {{13764, "mix", 62}, 3},
     {{1870, "mix", 60}, 3},
     {{2704, "mix", 87}, 3},
     {{1990, "mix", 85}, 3},
     {{24865, "mix", 85}, 2},
     {{29511, "mix", 76}, 3},
     {{15769, "mix", 91}, 3},
     {{13294, "mix", 89}, 3},
     {{1006, "mix", 100}, 3},
     {{514, "mix", 99}, 3},
     {{13540, "mix", 97}, 3},
     {{11977, "mix", 105}, 2},
     {{25638, "mix", 106}, 3},
     {{249, "mix", 108}, 3},
     {{182, "mix", 108}, 3},
     {{198, "mix", 111}, 3},
     {{9177, "mix", 114}, 2},
     {{2474, "mix", 114}, 3},
     {{2558, "mix", 115}, 3},
     {{10851, "mix", 119}, 3},
     {{2147, "unite", 6}, 3},
     {{5874, "unite", 1}, 3},
     {{2513, "unite", 2}, 3},
     {{2215, "unite", 1}, 3},
     {{354, "unite", 17}, 3},
     {{7603, "unite", 20}, 3},
     {{1730, "unite", 25}, 3},
     {{673, "unite", 25}, 2},
     {{22140, "unite", 25}, 3},
     {{22143, "unite", 25}, 3},
     {{22052, "unite", 25}, 3},
     {{22051, "unite", 25}, 3},
     {{22027, "unite", 25}, 3},
     {{3498, "unite", 25}, 3},
     {{22026, "unite", 25}, 3},
     {{21876, "unite", 25}, 3},
     {{11748, "unite", 25}, 3},
     {{21875, "unite", 25}, 3},
     {{22170, "unite", 25}, 3},
     {{15422, "unite", 25}, 3},
     {{22276, "unite", 25}, 3},
     {{18109, "unite", 25}, 3},
     {{10386, "unite", 30}, 3},
     {{1864, "unite", 30}, 3},
     {{14246, "unite", 29}, 3},
     {{136, "unite", 29}, 3},
     {{20387, "unite", 30}, 3},
     {{19644, "unite", 30}, 3},
     {{7499, "unite", 29}, 3},
     {{10196, "unite", 30}, 3},
     {{1274, "unite", 30}, 3},
     {{20446, "unite", 29}, 3},
     {{12084, "unite", 12}, 3},
     {{494, "unite", 12}, 3},
     {{447, "unite", 38}, 3},
     {{4254, "unite", 40}, 2},
     {{25032, "unite", 40}, 3},
     {{25031, "unite", 40}, 3},
     {{398, "unite", 39}, 2},
     {{807, "unite", 39}, 3},
     {{16626, "unite", 40}, 3},
     {{5806, "unite", 39}, 3},
     {{11247, "unite", 39}, 2},
     {{446, "unite", 39}, 3},
     {{13618, "unite", 40}, 3},
     {{20475, "unite", 39}, 3},
     {{5267, "unite", 40}, 3},
     {{23708, "unite", 39}, 3},
     {{23913, "unite", 40}, 3},
     {{384, "unite", 41}, 2},
     {{43, "unite", 41}, 2},
     {{15007, "unite", 47}, 3},
     {{153, "unite", 47}, 3},
     {{316, "unite", 47}, 3},
     {{11400, "unite", 47}, 3},
     {{9835, "unite", 49}, 3},
     {{7663, "unite", 48}, 3},
     {{7294, "unite", 51}, 3},
     {{12412, "unite", 51}, 3},
     {{8542, "unite", 53}, 3},
     {{704, "unite", 53}, 3},
     {{92, "unite", 53}, 3},
     {{226, "unite", 53}, 3},
     {{973, "unite", 52}, 3},
     {{5008, "unite", 52}, 3},
     {{8471, "unite", 52}, 3},
     {{6982, "unite", 55}, 3},
     {{7818, "unite", 55}, 2},
     {{9173, "unite", 55}, 2},
     {{4270, "unite", 54}, 3},
     {{14338, "unite", 54}, 2},
     {{4083, "unite", 54}, 3}].

del_gold_list() ->
    [{{281, "mix", 13}, 3},
     {{221, "ios", 47}, 3},
     {{30809, "mix", 5}, 3},
     {{12895, "beta", 49}, 3},
     {{7246, "beta", 51}, 2},
     {{3307, "beta", 50}, 3},
     {{7339, "beta", 55}, 3},
     {{150, "beta", 55}, 3},
     {{2197, "beta", 62}, 3},
     {{2347, "beta", 62}, 3},
     {{8267, "unite", 16}, 3},
     {{11757, "unite", 11}, 3},
     {{14605, "unite", 11}, 3},
     {{12084, "unite", 12}, 3},
     {{494, "unite", 12}, 3},
     {{8014, "unite", 20}, 3},
     {{23097, "unite", 20}, 3},
     {{354, "unite", 17}, 3},
     {{7603, "unite", 20}, 3},
     {{15007, "unite", 47}, 3},
     {{153, "unite", 47}, 3},
     {{316, "unite", 47}, 3},
     {{1486, "unite", 47}, 2},
     {{11400, "unite", 47}, 3},
     {{7663, "unite", 48}, 3},
     {{13165, "unite", 27}, 3},
     {{1730, "unite", 25}, 3},
     {{793, "unite", 25}, 3},
     {{673, "unite", 25}, 2},
     {{18498, "unite", 25}, 3},
     {{22140, "unite", 25}, 3},
     {{22143, "unite", 25}, 3},
     {{22052, "unite", 25}, 3},
     {{22051, "unite", 25}, 3},
     {{22027, "unite", 25}, 3},
     {{3498, "unite", 25}, 3},
     {{22026, "unite", 25}, 3},
     {{21876, "unite", 25}, 3},
     {{11748, "unite", 25}, 3},
     {{21875, "unite", 25}, 3},
     {{22170, "unite", 25}, 3},
     {{15422, "unite", 25}, 3},
     {{22276, "unite", 25}, 3},
     {{18109, "unite", 25}, 3},
     {{245, "mix", 107}, 2},
     {{9835, "unite", 49}, 3},
     {{8119, "unite", 49}, 3},
     {{14707, "unite", 49}, 2},
     {{454, "unite", 49}, 3},
     {{249, "mix", 108}, 3},
     {{182, "mix", 108}, 3},
     {{64, "mix", 108}, 3},
     {{5, "unite", 38}, 3},
     {{447, "unite", 38}, 3},
     {{10274, "mix", 55}, 3},
     {{803, "mix", 56}, 3},
     {{1271, "mix", 53}, 3},
     {{3082, "mix", 109}, 3},
     {{1675, "unite", 50}, 3},
     {{144, "unite", 50}, 3},
     {{1595, "unite", 50}, 3},
     {{7678, "unite", 50}, 3},
     {{658, "unite", 50}, 3},
     {{18, "unite", 50}, 3},
     {{179, "unite", 50}, 3},
     {{3901, "unite", 50}, 3},
     {{490, "mix", 110}, 3},
     {{9724, "mix", 110}, 3},
     {{16134, "mix", 111}, 3},
     {{198, "mix", 111}, 3},
     {{1350, "unite", 51}, 2},
     {{7294, "unite", 51}, 3},
     {{953, "unite", 51}, 3},
     {{12412, "unite", 51}, 3},
     {{3133, "unite", 51}, 3},
     {{1567, "unite", 40}, 3},
     {{1945, "unite", 39}, 3},
     {{4254, "unite", 40}, 2},
     {{50, "unite", 39}, 3},
     {{21002, "unite", 39}, 3},
     {{25032, "unite", 40}, 3},
     {{7148, "unite", 40}, 2},
     {{17477, "unite", 39}, 2},
     {{110, "unite", 39}, 3},
     {{120, "unite", 39}, 3},
     {{11758, "unite", 39}, 3},
     {{25031, "unite", 40}, 3},
     {{19006, "unite", 39}, 3},
     {{398, "unite", 39}, 2},
     {{807, "unite", 39}, 3},
     {{768, "unite", 39}, 3},
     {{17202, "unite", 39}, 2},
     {{16626, "unite", 40}, 3},
     {{5806, "unite", 39}, 3},
     {{4957, "unite", 39}, 3},
     {{1339, "unite", 39}, 3},
     {{11247, "unite", 39}, 2},
     {{15411, "unite", 39}, 3},
     {{4992, "unite", 40}, 3},
     {{446, "unite", 39}, 3},
     {{5186, "unite", 40}, 3},
     {{13618, "unite", 40}, 3},
     {{20475, "unite", 39}, 3},
     {{23593, "unite", 39}, 3},
     {{5267, "unite", 40}, 3},
     {{12448, "unite", 39}, 3},
     {{23708, "unite", 39}, 3},
     {{23913, "unite", 40}, 3},
     {{4867, "unite", 39}, 3},
     {{222, "unite", 39}, 3},
     {{6428, "mix", 81}, 3},
     {{33863, "mix", 82}, 3},
     {{218, "mix", 81}, 3},
     {{3101, "mix", 81}, 3},
     {{384, "unite", 41}, 2},
     {{3598, "unite", 42}, 3},
     {{43, "unite", 41}, 2},
     {{13764, "mix", 62}, 3},
     {{8330, "mix", 60}, 3},
     {{25105, "mix", 62}, 3},
     {{1870, "mix", 60}, 3},
     {{763, "mix", 57}, 3},
     {{3367, "mix", 98}, 3},
     {{13540, "mix", 97}, 3},
     {{298, "mix", 97}, 2},
     {{13035, "mix", 98}, 3},
     {{955, "ios", 17}, 3},
     {{5533, "ios", 29}, 3},
     {{551, "ios", 28}, 3},
     {{7751, "ios", 24}, 3},
     {{22253, "ios", 20}, 3},
     {{6752, "mix", 30}, 3},
     {{2372, "mix", 26}, 3},
     {{3253, "mix", 23}, 3},
     {{2449, "mix", 25}, 3},
     {{9470, "mix", 21}, 3},
     {{22625, "beta", 38}, 3},
     {{4262, "beta", 46}, 3},
     {{26792, "beta", 47}, 3},
     {{15878, "beta", 39}, 3},
     {{3, "beta", 38}, 3},
     {{11315, "beta", 46}, 3},
     {{15327, "ios", 14}, 3},
     {{4043, "ios", 13}, 3},
     {{13432, "ios", 1}, 3},
     {{20048, "ios", 11}, 3},
     {{40574, "ios", 4}, 3},
     {{17510, "ios", 3}, 3},
     {{3883, "ios", 3}, 3},
     {{14669, "ios", 3}, 3},
     {{32401, "ios", 4}, 3},
     {{25167, "ios", 14}, 3},
     {{1142, "ios", 16}, 3},
     {{63708, "ios", 2}, 3},
     {{684, "ios", 10}, 3},
     {{5491, "ios", 12}, 3},
     {{241, "ios", 5}, 3},
     {{11334, "ios", 14}, 3},
     {{71396, "ios", 14}, 3},
     {{21960, "ios", 3}, 3},
     {{7582, "ios", 8}, 3},
     {{21995, "ios", 1}, 3},
     {{18, "ios", 1}, 3},
     {{20345, "ios", 1}, 3},
     {{71370, "ios", 14}, 3},
     {{3849, "ios", 16}, 2},
     {{71220, "ios", 14}, 3},
     {{22971, "ios", 1}, 3},
     {{2428, "ios", 1}, 3},
     {{25890, "ios", 1}, 3},
     {{70916, "ios", 14}, 3},
     {{37931, "ios", 14}, 3},
     {{1715, "ios", 1}, 3},
     {{37791, "ios", 14}, 3},
     {{460, "ios", 16}, 3},
     {{21521, "ios", 1}, 3},
     {{37613, "ios", 14}, 3},
     {{37612, "ios", 14}, 3},
     {{5130, "ios", 11}, 3},
     {{68096, "ios", 2}, 3},
     {{3827, "ios", 2}, 3},
     {{20176, "ios", 4}, 3},
     {{14789, "ios", 16}, 3},
     {{261, "ios", 7}, 3},
     {{37517, "ios", 14}, 3},
     {{1807, "ios", 6}, 3},
     {{11785, "ios", 14}, 3},
     {{15659, "ios", 6}, 3},
     {{37518, "ios", 14}, 3},
     {{14556, "ios", 1}, 3},
     {{44413, "ios", 3}, 3},
     {{44551, "ios", 3}, 3},
     {{12729, "ios", 5}, 3},
     {{3557, "ios", 1}, 3},
     {{44579, "ios", 3}, 3},
     {{37711, "ios", 14}, 3},
     {{1449, "mix", 112}, 3},
     {{248, "mix", 112}, 3},
     {{898, "mix", 112}, 2},
     {{5, "unite", 52}, 3},
     {{8018, "unite", 52}, 3},
     {{3519, "unite", 52}, 2},
     {{973, "unite", 52}, 3},
     {{5008, "unite", 52}, 3},
     {{7134, "unite", 52}, 3},
     {{8471, "unite", 52}, 3},
     {{5412, "unite", 52}, 3},
     {{988, "mix", 100}, 3},
     {{1006, "mix", 100}, 3},
     {{12397, "mix", 100}, 3},
     {{514, "mix", 99}, 3},
     {{178, "mix", 100}, 3},
     {{10705, "unite", 30}, 3},
     {{10386, "unite", 30}, 3},
     {{11530, "unite", 29}, 3},
     {{7224, "unite", 29}, 3},
     {{1186, "unite", 29}, 3},
     {{1864, "unite", 30}, 3},
     {{14246, "unite", 29}, 3},
     {{3397, "unite", 30}, 3},
     {{136, "unite", 29}, 3},
     {{9703, "unite", 29}, 3},
     {{97, "unite", 30}, 3},
     {{5609, "unite", 30}, 3},
     {{336, "unite", 29}, 3},
     {{862, "unite", 29}, 2},
     {{13972, "unite", 29}, 3},
     {{20387, "unite", 30}, 3},
     {{5918, "unite", 29}, 3},
     {{10359, "unite", 30}, 2},
     {{19644, "unite", 30}, 3},
     {{10049, "unite", 30}, 3},
     {{19052, "unite", 30}, 3},
     {{7499, "unite", 29}, 3},
     {{10196, "unite", 30}, 3},
     {{2075, "unite", 29}, 3},
     {{157, "unite", 30}, 3},
     {{1274, "unite", 30}, 3},
     {{7115, "unite", 31}, 3},
     {{20446, "unite", 29}, 3},
     {{2704, "mix", 87}, 3},
     {{87, "mix", 85}, 2},
     {{1990, "mix", 85}, 3},
     {{21433, "mix", 88}, 2},
     {{10588, "mix", 88}, 3},
     {{24865, "mix", 85}, 2},
     {{4516, "unite", 44}, 2},
     {{513, "unite", 44}, 3},
     {{17766, "unite", 43}, 3},
     {{9426, "unite", 43}, 2},
     {{22342, "beta", 30}, 3},
     {{14835, "beta", 25}, 3},
     {{1465, "beta", 31}, 2},
     {{167, "beta", 27}, 3},
     {{6908, "beta", 32}, 3},
     {{11834, "beta", 30}, 3},
     {{2077, "beta", 22}, 3},
     {{1609, "beta", 21}, 3},
     {{9118, "beta", 25}, 3},
     {{468, "beta", 28}, 3},
     {{10115, "beta", 31}, 3},
     {{9177, "mix", 114}, 2},
     {{2474, "mix", 114}, 3},
     {{3190, "mix", 114}, 3},
     {{3796, "mix", 114}, 3},
     {{163, "mix", 114}, 3},
     {{855, "mix", 114}, 3},
     {{8542, "unite", 53}, 3},
     {{704, "unite", 53}, 3},
     {{1671, "unite", 53}, 3},
     {{2161, "unite", 53}, 3},
     {{1641, "unite", 53}, 3},
     {{665, "unite", 53}, 3},
     {{92, "unite", 53}, 3},
     {{252, "unite", 53}, 2},
     {{12949, "unite", 53}, 3},
     {{2292, "unite", 53}, 3},
     {{8941, "unite", 53}, 3},
     {{309, "unite", 53}, 3},
     {{2434, "unite", 53}, 3},
     {{226, "unite", 53}, 3},
     {{753, "mix", 115}, 3},
     {{152, "mix", 115}, 3},
     {{331, "mix", 115}, 3},
     {{1436, "mix", 115}, 3},
     {{2558, "mix", 115}, 3},
     {{67, "mix", 115}, 3},
     {{4270, "unite", 54}, 3},
     {{12136, "unite", 54}, 3},
     {{10315, "unite", 54}, 3},
     {{114, "unite", 54}, 3},
     {{376, "unite", 54}, 3},
     {{13616, "unite", 54}, 3},
     {{213, "unite", 54}, 2},
     {{14338, "unite", 54}, 2},
     {{4083, "unite", 54}, 3},
     {{2027, "mix", 116}, 3},
     {{95, "mix", 101}, 3},
     {{3911, "mix", 102}, 3},
     {{536, "mix", 101}, 3},
     {{15304, "unite", 7}, 3},
     {{2147, "unite", 6}, 3},
     {{117, "unite", 1}, 3},
     {{4369, "unite", 7}, 3},
     {{24622, "unite", 1}, 3},
     {{3386, "unite", 8}, 3},
     {{5874, "unite", 1}, 3},
     {{2513, "unite", 2}, 3},
     {{2215, "unite", 1}, 3},
     {{29511, "mix", 76}, 3},
     {{1693, "mix", 76}, 3},
     {{18627, "mix", 71}, 3},
     {{704, "mix", 65}, 3},
     {{857, "mix", 65}, 3},
     {{9838, "mix", 70}, 3},
     {{11338, "mix", 70}, 2},
     {{15476, "mix", 90}, 2},
     {{15769, "mix", 91}, 3},
     {{5735, "mix", 89}, 3},
     {{13294, "mix", 89}, 3},
     {{1225, "mix", 91}, 2},
     {{11132, "mix", 117}, 3},
     {{82, "unite", 55}, 3},
     {{6982, "unite", 55}, 3},
     {{58, "unite", 55}, 2},
     {{5187, "unite", 55}, 3},
     {{8724, "unite", 55}, 3},
     {{65, "unite", 55}, 3},
     {{7818, "unite", 55}, 2},
     {{8079, "unite", 55}, 3},
     {{126, "unite", 55}, 3},
     {{3922, "unite", 55}, 2},
     {{9173, "unite", 55}, 2},
     {{354, "unite", 55}, 3},
     {{4318, "unite", 55}, 3},
     {{10851, "mix", 119}, 3},
     {{2120, "unite", 34}, 3},
     {{8493, "unite", 36}, 3},
     {{5387, "unite", 35}, 3},
     {{10700, "unite", 35}, 3},
     {{1962, "unite", 36}, 3},
     {{6789, "unite", 33}, 3},
     {{23, "unite", 35}, 3},
     {{6390, "mix", 96}, 3},
     {{1394, "mix", 93}, 2},
     {{2560, "unite", 46}, 3},
     {{12609, "unite", 46}, 3},
     {{17735, "unite", 45}, 3},
     {{121, "unite", 45}, 3},
     {{5617, "unite", 46}, 3},
     {{140, "unite", 46}, 2},
     {{2990, "mix", 103}, 2},
     {{12602, "mix", 103}, 2},
     {{9, "mix", 103}, 3},
     {{11977, "mix", 105}, 2},
     {{25638, "mix", 106}, 3},
     {{9931, "mix", 106}, 2},
     {{2171, "mix", 106}, 2},
     {{3160, "mix", 35}, 3},
     {{35753, "mix", 45}, 3},
     {{16682, "mix", 35}, 3},
     {{106, "mix", 39}, 3},
     {{13634, "mix", 38}, 3},
     {{24872, "mix", 37}, 3},
     {{244, "mix", 37}, 3},
     {{143, "beta", 3}, 3},
     {{46217, "beta", 1}, 3},
     {{36622, "beta", 9}, 3},
     {{15407, "ios", 39}, 3},
     {{18162, "ios", 42}, 3},
     {{245, "ios", 43}, 3},
     {{5313, "ios", 37}, 3},
     {{9715, "ios", 42}, 3}].

get_adm_recover_mail() -> [].

get_adm_group_mail() ->
    [{9030, "unite", 244},
     {8287, "unite", 248},
     {24622, "unite", 1},
     {9166, "unite", 253},
     {249, "unite", 222},
     {2896, "unite", 99},
     {10252, "unite", 31},
     {1696, "unite", 248},
     {54, "mix", 321},
     {21302, "mix", 241},
     {324, "unite", 251},
     {9891, "mix", 262},
     {2469, "unite", 248},
     {989, "unite", 253},
     {84, "unite", 252},
     {7328, "unite", 235},
     {429, "unite", 257},
     {8740, "unite", 244},
     {150, "unite", 241},
     {7149, "unite", 240},
     {223, "unite", 249},
     {701, "unite", 241},
     {391, "mix", 323},
     {2482, "mix", 214},
     {1464, "unite", 257},
     {2406, "unite", 243},
     {87, "unite", 256},
     {98, "unite", 266},
     {800, "unite", 237},
     {733, "unite", 253},
     {5794, "unite", 51},
     {746, "unite", 168},
     {3044, "unite", 229},
     {480, "mix", 326},
     {66, "unite", 247},
     {540, "unite", 244},
     {470, "mix", 331},
     {10809, "unite", 257},
     {62, "unite", 239},
     {9864, "unite", 247},
     {2197, "beta", 62},
     {5069, "unite", 200},
     {25, "mix", 322},
     {2351, "unite", 147},
     {519, "mix", 332},
     {11883, "unite", 244},
     {3865, "unite", 249},
     {4653, "unite", 215},
     {8257, "unite", 224},
     {2283, "unite", 244},
     {5716, "unite", 243},
     {175, "unite", 233},
     {12701, "ios", 26},
     {2417, "unite", 248},
     {2373, "unite", 247},
     {3482, "unite", 231},
     {13308, "mix", 310},
     {1682, "unite", 211},
     {407, "unite", 257},
     {547, "unite", 107},
     {59, "mix", 323},
     {19553, "beta", 50},
     {1148, "unite", 251},
     {1233, "mix", 324},
     {74, "unite", 248},
     {9148, "unite", 246},
     {671, "mix", 329},
     {209, "unite", 254},
     {6689, "unite", 235},
     {501, "unite", 253},
     {509, "unite", 254},
     {232, "unite", 130},
     {5877, "mix", 287},
     {97, "unite", 241},
     {6951, "unite", 261},
     {4961, "mix", 297},
     {3726, "unite", 65},
     {2186, "unite", 87},
     {11523, "unite", 269},
     {190, "mix", 331},
     {8561, "unite", 224},
     {744, "unite", 253},
     {1228, "unite", 252},
     {1910, "unite", 251},
     {826, "mix", 323},
     {174, "unite", 244},
     {371, "unite", 230},
     {106, "unite", 141},
     {423, "unite", 163},
     {6909, "unite", 237},
     {2749, "unite", 243},
     {453, "unite", 60},
     {87, "unite", 219},
     {5651, "unite", 247},
     {7341, "mix", 278},
     {90, "unite", 251},
     {10820, "unite", 254},
     {6373, "unite", 248},
     {479, "unite", 254},
     {79, "unite", 255},
     {1220, "unite", 224},
     {5454, "unite", 240},
     {124, "mix", 329},
     {9646, "unite", 225},
     {3852, "unite", 248},
     {155, "unite", 73},
     {52, "unite", 217},
     {5473, "mix", 321},
     {467, "unite", 231},
     {6270, "mix", 334},
     {927, "unite", 252},
     {135, "unite", 169},
     {60, "mix", 336},
     {69333, "beta", 21},
     {3237, "unite", 251},
     {2917, "unite", 245},
     {3564, "unite", 168},
     {5453, "mix", 321},
     {185, "mix", 331},
     {3158, "unite", 202},
     {4947, "unite", 246},
     {4660, "unite", 251},
     {3557, "unite", 238},
     {318, "mix", 325},
     {5770, "unite", 229},
     {208, "unite", 253},
     {3456, "unite", 243},
     {1803, "unite", 242},
     {4143, "mix", 336},
     {68, "mix", 330},
     {1653, "unite", 230},
     {3885, "unite", 250},
     {2304, "unite", 248},
     {2980, "unite", 246},
     {632, "mix", 300},
     {2120, "mix", 334},
     {2586, "mix", 90},
     {4174, "unite", 259},
     {6973, "unite", 254},
     {1986, "unite", 232},
     {915, "unite", 251},
     {456, "unite", 254},
     {15952, "mix", 318},
     {3528, "mix", 321},
     {8501, "unite", 257},
     {6865, "mix", 330},
     {3507, "unite", 251},
     {10274, "mix", 55},
     {8887, "unite", 257},
     {45, "unite", 254},
     {2045, "unite", 232},
     {2944, "unite", 251},
     {5926, "unite", 225},
     {80, "unite", 226},
     {1303, "unite", 262},
     {3, "mix", 334},
     {2715, "mix", 325},
     {184, "unite", 225},
     {268, "unite", 232},
     {1203, "unite", 201},
     {259, "unite", 249},
     {5874, "unite", 1},
     {979, "mix", 329},
     {3518, "unite", 222},
     {15538, "unite", 59},
     {5312, "unite", 230},
     {864, "unite", 69},
     {966, "unite", 258},
     {270, "unite", 239},
     {1035, "beta", 31},
     {179, "unite", 242},
     {10789, "unite", 215},
     {1226, "unite", 240},
     {969, "unite", 248},
     {4618, "unite", 215},
     {2931, "unite", 228},
     {303, "unite", 237},
     {255, "unite", 238},
     {27, "unite", 185},
     {12395, "mix", 163},
     {139, "mix", 338},
     {47, "unite", 238},
     {485, "unite", 182},
     {1987, "unite", 261},
     {5539, "beta", 5},
     {478, "unite", 166},
     {2537, "unite", 237},
     {13155, "unite", 255},
     {1858, "unite", 257},
     {171, "unite", 254},
     {670, "mix", 319},
     {4267, "unite", 254},
     {10365, "beta", 6},
     {2120, "unite", 14},
     {147, "unite", 239},
     {1802, "unite", 255},
     {30041, "unite", 11},
     {4919, "mix", 218},
     {622, "mix", 323},
     {5938, "unite", 230},
     {6621, "unite", 223},
     {3590, "unite", 201},
     {2759, "beta", 42},
     {1164, "unite", 222},
     {49, "unite", 249},
     {250, "unite", 229},
     {208, "local", 1}].

mail_deal() ->
    DealMailList = get_adm_group_mail(),
    Fun = fun (RoleId) ->
                  case dets:lookup(mailbox, RoleId) of
                      Mails = [_ | _] ->
                          {Flag, LeftMail} = do_deal_mail(RoleId,
                                                          Mails,
                                                          false,
                                                          []),
                          case Flag of
                              true ->
                                  logger:info("删除玩家[~w]邮件成功",
                                              [RoleId],
                                              adm,
                                              1977),
                                  dets:delete(mailbox, RoleId),
                                  dets:insert(mailbox, LeftMail);
                              _ ->
                                  logger:info("删除玩家[~w]邮件失败",
                                              [RoleId],
                                              adm,
                                              1981),
                                  ok
                          end;
                      _ ->
                          logger:info("删除玩家[~w]邮件失败", [RoleId], adm, 1985),
                          ok
                  end
          end,
    lists:foreach(Fun, DealMailList).

do_deal_mail(_RoleId, [], Flag, LeftMail) ->
    {Flag, LeftMail};
do_deal_mail(RoleId,
             [M = #mail{item_list = Items} | Rest], Flag,
             LeftMail) ->
    case lists:keyfind(22447, #item.base_id, Items) of
        #item{quantity = 8} ->
            logger:debug("剩余邮件:~w, ~w",
                         [LeftMail, Rest],
                         adm,
                         1996),
            {true, lists:reverse(LeftMail) ++ Rest};
        _ -> do_deal_mail(RoleId, Rest, Flag, [M | LeftMail])
    end.

mail_deal_other() ->
    DealMailList = get_adm_group_mail(),
    Fun = fun (RoleId) ->
                  role:apply(async, RoleId, {adm, do_deal_mail2, []})
          end,
    lists:foreach(Fun, DealMailList).

do_deal_mail2(Role = #role{id = Id, m_mail = MMail}) ->
    case do_deal_mail(Id, MMail, false, []) of
        {false, _} -> ok;
        {true, LeftMail} ->
            logger:info("玩家[~w]邮件处理成功", [Id], adm, 2013),
            NewRole = Role#role{m_mail = LeftMail},
            {ok, NewRole}
    end.

delete_role_mail(Role = #role{m_mail = Mails},
                 MailId) ->
    NewMails = lists:keydelete(MailId, #mail.sess, Mails),
    NewRole = Role#role{m_mail = NewMails},
    {ok, NewRole}.

query_server_info() ->
    TopLev = robot_mgr:get_top_lev(),
    FcList = env:get(max_world_fc),
    TotalFc = lists:sum([Fc || {_, Fc} <- FcList]),
    {WorldLev, _} = world_lev:get_world_lev(),
    IsBreak = lev_break:get_boss_killed(),
    Plat = env:get(platform),
    ZoneId = env:get(zone_id),
    logger:info("区服信息:#{platform => ~w, zone_id => ~w, "
                "max_role_lev => ~w, max_role_fc => ~w, "
                "world_lev => ~w, is_break => ~w}",
                [Plat, ZoneId, TopLev, TotalFc, WorldLev, IsBreak],
                adm,
                2032).

done_mail_deal() ->
    [{10125, "beta", 3},
     {5331, "beta", 49},
     {3137, "ios", 45},
     {14016, "ios", 21},
     {13634, "mix", 38},
     {14802, "mix", 36},
     {8671, "mix", 112},
     {17646, "mix", 129},
     {194, "mix", 139},
     {12604, "mix", 152},
     {11044, "mix", 159},
     {224, "mix", 162},
     {854, "mix", 163},
     {94, "mix", 166},
     {4785, "mix", 168},
     {215, "mix", 170},
     {151, "mix", 176},
     {936, "mix", 173},
     {379, "mix", 179},
     {298, "mix", 180},
     {379, "mix", 181},
     {1628, "mix", 185},
     {11567, "mix", 183},
     {8343, "mix", 183},
     {21182, "unite", 37},
     {17568, "unite", 32},
     {1770, "unite", 32},
     {5852, "unite", 60},
     {3598, "unite", 42},
     {14294, "unite", 50},
     {1638, "unite", 50},
     {7524, "unite", 51},
     {1973, "unite", 66},
     {1986, "unite", 66},
     {143, "unite", 77},
     {340, "unite", 76},
     {4483, "unite", 75},
     {4540, "unite", 73},
     {858, "unite", 75},
     {138, "unite", 80},
     {455, "unite", 82},
     {487, "unite", 81},
     {14055, "unite", 69},
     {62, "unite", 69},
     {70, "unite", 86},
     {2229, "unite", 83},
     {278, "unite", 84},
     {6588, "unite", 85},
     {1288, "unite", 87},
     {633, "unite", 88},
     {2994, "unite", 89},
     {3359, "unite", 89},
     {1172, "unite", 90},
     {5993, "unite", 90},
     {8728, "unite", 90},
     {14789, "ios", 16},
     {21521, "ios", 1},
     {22971, "ios", 1},
     {917, "ios", 9}].

del_single_dog_all() ->
    MailList = get_adm_group_mail(),
    DoneList = done_mail_deal(),
    Fun = fun ({RoleId, Val}) ->
                  case role_misc:is_local_role(RoleId) of
                      true ->
                          case lists:member(RoleId, DoneList) of
                              false ->
                                  DealVal = [{90050, Val}],
                                  Loss = format:val_to_loss(DealVal),
                                  role:apply(async,
                                             RoleId,
                                             {adm, del_single_dog, [Loss]}),
                                  ok;
                              _ -> ingore
                          end;
                      _ -> ingore
                  end
          end,
    lists:foreach(Fun, MailList).

del_single_dog(Role = #role{id = Id,
                            assets = #assets{single_dog = DogScore}},
               Loss) ->
    case role_gain:do(Loss, Role) of
        {ok, NewRole} ->
            logger:info("单身狗积分扣除成功：~w", [Id], adm, 2118),
            mail:send(Role,
                      "光棍积分扣除",
                      "由于系统故障，您通过活动获得的光棍积分异常，现系统进行了回收"),
            {ok, NewRole};
        _ ->
            Val = case Loss of
                      [#loss{val = _Val}] -> _Val;
                      _ -> Loss
                  end,
            RealLoss = format:val_to_loss([{90050, DogScore}]),
            case role_gain:do(RealLoss, Role) of
                {ok, NewRole} ->
                    logger:info("单身狗积分扣除失败：~w 应扣：~w, 实扣:~w ",
                                [Id, Val, DogScore],
                                adm,
                                2129),
                    {ok, NewRole};
                _ ->
                    logger:info("单身狗积分扣除失败：~w 应扣：~w ",
                                [Id, Val],
                                adm,
                                2132),
                    ok
            end
    end.

adm_guild_action(Platform, ZoneId, GuildId, ActionType,
                 _Extra) ->
    case ActionType of
        1 -> adm_guild_member(Platform, ZoneId, GuildId);
        2 -> adm_guild_clear(Platform, ZoneId, GuildId);
        3 -> adm_guild_blockade(Platform, ZoneId, GuildId);
        4 -> adm_guild_unblock(Platform, ZoneId, GuildId);
        5 -> adm_guild_dismiss(Platform, ZoneId, GuildId);
        6 -> todo;
        7 -> todo
    end.

adm_guild_clear(Platform, ZoneId, Gid) ->
    guild_mgr:apply(async,
                    {Gid, util:to_list(Platform), ZoneId},
                    {guild_common, sync_adm_modify_board, [""]}),
    {ok, "清理成功"}.

adm_guild_dismiss(Platform, ZoneId, Gid) ->
    case {guild_war:is_opening(), guild_hero:is_arranging()}
        of
        {true, _} -> {false, "仙盟战中请稍后操作"};
        {_, true} -> {false, "仙盟英雄战中请稍后操作"};
        _ ->
            guild_mgr:apply(async,
                            {Gid, util:to_list(Platform), ZoneId},
                            {guild_common, async_dismis, []}),
            {ok, "清理成功"}
    end.

adm_guild_transfer(Platform, ZoneId, Gid, Rid, Msg) ->
    case {guild_war:is_opening(), guild_hero:is_arranging()}
        of
        {true, _} -> {false, "公会战中请稍后操作"};
        {_, true} -> {false, "公会英雄战中请稍后操作"};
        _ ->
            NewPlat = util:to_list(Platform),
            case guild_mgr:apply(sync,
                                 {Gid, NewPlat, ZoneId},
                                 {guild_common,
                                  sync_adm_transfer,
                                  [{Rid, NewPlat, ZoneId}, Msg]})
                of
                {ok, Msg2} -> {ok, Msg2};
                {false, Why} -> {false, Why}
            end
    end.

adm_guild_member(Platform, ZoneId, Gid) ->
    MemJson = case catch guild_mgr:attr({Gid,
                                         Platform,
                                         ZoneId},
                                        #guild.members)
                  of
                  [H | T] -> member_to_json([H | T]);
                  _ -> []
              end,
    {json, MemJson}.

member_to_json([]) -> [];
member_to_json([#guild_role{id = {Id, Platform, ZoneId},
                            name = Name, lev = Lev, post = Post, value = Value,
                            enter_time = EnterTime, signature = Signature}
                | T]) ->
    Json = {struct,
            [{platform, util:to_bitstring(Platform)},
             {no, ZoneId},
             {role_id, Id},
             {role_name, util:to_bitstring(Name)},
             {office,
              util:to_bitstring(guild_util:post_to_name(Post))},
             {signature, util:to_bitstring(Signature)},
             {lv, Lev},
             {dedicate, Value},
             {join_time, EnterTime}]},
    [Json | member_to_json(T)].

adm_guild_blockade(Platform, ZoneId, Gid) ->
    guild_mgr:apply(async,
                    {Gid, util:to_list(Platform), ZoneId},
                    {guild_common, sync_mark_board_lock, [1]}),
    {ok, "清理成功"}.

adm_guild_unblock(Platform, ZoneId, Gid) ->
    guild_mgr:apply(async,
                    {Gid, util:to_list(Platform), ZoneId},
                    {guild_common, sync_mark_board_lock, [0]}),
    {ok, "清理成功"}.

send_gift(RoleIds, CardId, CardNo, Title, Content,
          Items) ->
    case adm_util:check([role, binary, int, item, gift],
                        #{role_info => RoleIds, int => [CardId],
                          binary => [Title, Content, CardNo], items => Items,
                          gift => {CardId, CardNo}})
        of
        {true,
         #{role_info := NewRoleInfo, items := NewItems}} ->
            mail:local_send(NewRoleInfo,
                            #{title => Title, content => Content,
                              items => NewItems}),
            logger:info("[~w]领取礼包[~ts][~ts],道具[~w]",
                        [NewRoleInfo, Title, Content, NewItems],
                        adm,
                        2241),
            {ok, "发货成功"};
        {false, Reason} -> {false, Reason}
    end.

batch_lock_role() ->
    LockRoles = lock_role_list(),
    LocalRoles = [RoleId
                  || RoleId <- LockRoles,
                     role_misc:is_local_role(RoleId)],
    lock(LocalRoles, 0, "活动返利数据异常", "system").

batch_unlock_role() ->
    LockRoles = lock_role_list(),
    LocalRoles = [RoleId
                  || RoleId <- LockRoles,
                     role_misc:is_local_role(RoleId)],
    unlock(LocalRoles, "system").

lock_role_list() ->
    [{15326, "beta", 32},
     {6908, "beta", 32},
     {75312, "beta", 25},
     {168, "beta", 27},
     {10947, "beta", 20},
     {5112, "beta", 32},
     {15538, "beta", 17},
     {44784, "beta", 17},
     {21247, "beta", 17},
     {7414, "mix", 5},
     {107387, "mix", 16},
     {117379, "mix", 5},
     {13804, "mix", 3},
     {117085, "mix", 4},
     {121673, "mix", 5},
     {118152, "mix", 2},
     {86804, "mix", 5},
     {117382, "mix", 1},
     {7657, "mix", 55},
     {14077, "mix", 59},
     {7413, "mix", 58},
     {2187, "mix", 50},
     {368, "mix", 62},
     {222, "mix", 50},
     {10174, "mix", 54},
     {1707, "mix", 57},
     {303, "unite", 12},
     {15626, "unite", 10},
     {5470, "unite", 16},
     {2242, "unite", 6},
     {11108, "unite", 1},
     {6524, "unite", 12},
     {10926, "unite", 6},
     {30363, "unite", 1},
     {8267, "unite", 16},
     {12565, "unite", 15},
     {283, "mix", 126},
     {26885, "mix", 121},
     {35360, "mix", 121},
     {4647, "mix", 131},
     {1281, "mix", 126},
     {9412, "mix", 129},
     {1887, "mix", 130},
     {10124, "mix", 191},
     {292, "mix", 183},
     {6257, "mix", 191},
     {1532, "mix", 191},
     {7142, "mix", 185},
     {397, "mix", 185},
     {15634, "mix", 187},
     {15633, "mix", 187},
     {274, "mix", 189},
     {383, "unite", 129},
     {89, "unite", 129},
     {2731, "unite", 129},
     {992, "unite", 129},
     {6213, "unite", 130},
     {468, "unite", 130},
     {207, "unite", 130},
     {6938, "mix", 212},
     {1883, "mix", 214},
     {14045, "mix", 214},
     {5435, "mix", 213},
     {634, "mix", 213},
     {242, "mix", 211},
     {363, "mix", 215},
     {706, "mix", 215},
     {261, "mix", 243},
     {3958, "mix", 244},
     {5876, "mix", 244},
     {1861, "mix", 244},
     {44, "mix", 243},
     {5207, "mix", 243},
     {467, "mix", 243},
     {215, "mix", 244},
     {1555, "mix", 243},
     {891, "mix", 148},
     {975, "mix", 172},
     {281, "mix", 159},
     {7398, "mix", 145},
     {811, "mix", 164},
     {19264, "mix", 164},
     {16811, "mix", 165},
     {61, "mix", 169},
     {387, "mix", 161},
     {6481, "mix", 247},
     {6902, "mix", 247},
     {6761, "mix", 248},
     {165, "mix", 248},
     {2841, "mix", 247},
     {136, "mix", 248},
     {268, "mix", 247},
     {32, "mix", 247},
     {247, "mix", 247},
     {107, "mix", 247},
     {187, "mix", 238},
     {1393, "unite", 137},
     {2117, "unite", 137},
     {2804, "unite", 138},
     {441, "unite", 138},
     {4579, "unite", 138},
     {9312, "mix", 228},
     {2530, "mix", 228},
     {126, "mix", 228},
     {4922, "mix", 249},
     {1540, "mix", 250},
     {115, "mix", 250},
     {51, "mix", 250},
     {1092, "mix", 250},
     {859, "mix", 250},
     {972, "unite", 139},
     {119, "unite", 139},
     {2467, "unite", 139},
     {210, "unite", 140},
     {250, "unite", 140},
     {303, "unite", 140},
     {2883, "unite", 140},
     {1560, "unite", 131},
     {2, "unite", 132},
     {3930, "unite", 132},
     {1657, "unite", 131},
     {454, "mix", 240},
     {32, "mix", 240},
     {4042, "unite", 141},
     {477, "unite", 141},
     {516, "unite", 141},
     {149, "unite", 141},
     {93, "mix", 236},
     {563, "mix", 233},
     {8799, "mix", 232},
     {680, "mix", 230},
     {3405, "mix", 230},
     {706, "mix", 232},
     {10095, "mix", 241},
     {5436, "mix", 241},
     {6428, "mix", 242},
     {4047, "mix", 242},
     {41, "mix", 242},
     {3112, "mix", 219},
     {4783, "mix", 220},
     {290, "mix", 217},
     {828, "mix", 218},
     {2087, "unite", 52},
     {863, "unite", 56},
     {10938, "unite", 54},
     {20515, "unite", 60},
     {10974, "unite", 54},
     {129, "unite", 62},
     {15394, "unite", 57},
     {7025, "unite", 49},
     {11175, "unite", 54},
     {36, "unite", 53},
     {1490, "unite", 50},
     {325, "unite", 64},
     {6762, "unite", 60},
     {31, "unite", 63},
     {5852, "unite", 60},
     {1801, "unite", 97},
     {300, "unite", 103},
     {406, "unite", 104},
     {9830, "unite", 99},
     {232, "unite", 100},
     {10111, "unite", 103},
     {217, "unite", 100},
     {10794, "unite", 104},
     {3018, "unite", 97},
     {89, "unite", 103},
     {78, "unite", 98},
     {440, "unite", 104},
     {744, "unite", 98},
     {6419, "unite", 97},
     {4270, "unite", 102},
     {2415, "mix", 202},
     {9491, "mix", 204},
     {6113, "mix", 194},
     {353, "mix", 193},
     {25, "mix", 202},
     {4594, "mix", 197},
     {84, "mix", 198},
     {323, "mix", 204},
     {164, "mix", 203},
     {581, "mix", 206},
     {47, "mix", 199},
     {12758, "mix", 207},
     {6124, "mix", 194},
     {799, "unite", 125},
     {13235, "unite", 125},
     {5038, "unite", 128},
     {11578, "unite", 127},
     {7270, "unite", 127},
     {6286, "unite", 127},
     {1177, "unite", 127},
     {4825, "unite", 128},
     {3236, "unite", 126},
     {45, "unite", 128},
     {186, "unite", 128},
     {129, "unite", 126},
     {90, "unite", 127},
     {817, "unite", 127},
     {51, "unite", 125},
     {1266, "mix", 245},
     {4891, "mix", 245},
     {3868, "mix", 245},
     {122, "mix", 246},
     {289, "mix", 245},
     {32, "mix", 246},
     {5622, "mix", 246},
     {53, "mix", 245},
     {7, "mix", 246},
     {387, "mix", 245},
     {1756, "mix", 245},
     {6614, "mix", 245},
     {8933, "mix", 245},
     {3814, "mix", 245},
     {518, "mix", 246},
     {4146, "unite", 135},
     {522, "unite", 136},
     {135, "unite", 135},
     {7193, "unite", 135},
     {664, "unite", 136},
     {233, "unite", 136},
     {186, "unite", 135},
     {464, "unite", 135},
     {2639, "unite", 136},
     {5, "unite", 136},
     {8972, "unite", 136},
     {2, "local", 1}].

unit_recreate() ->
    unit_mgr:remove({1, 21006}),
    unit_mgr:create({1, 32025},
                    21006,
                    {10001, 2984, 1921},
                    [],
                    ""),
    unit_mgr:create({1, 21006},
                    55199,
                    {41002, 1319, 1535},
                    [],
                    "").

