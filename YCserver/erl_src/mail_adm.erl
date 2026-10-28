-file("src/mod/mail/mail_adm.erl", 1).

-module(mail_adm).

-export([send/5, limit_send/5, check_mail/0]).

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

-file("src/mod/mail/mail_adm.erl", 14).

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

-file("src/mod/mail/mail_adm.erl", 15).

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

-file("src/mod/mail/mail_adm.erl", 16).

check_mail() ->
    mail ! check_error_mail,
    ok.

send(RoleInfo, Title, Content, Items, _AdminName) ->
    case check_bitstring([Title, Content], []) of
        {true, [NewContent, NewTitle]} ->
            case check_role(RoleInfo) of
                {true, NewRoleInfo} ->
                    Args = #{title => NewTitle, content => NewContent,
                             items => Items},
                    mail:send(NewRoleInfo, Args)
            end;
        {false, Reason} -> {false, Reason}
    end.

limit_send(RoleInfo, Title, Content, Items,
           _AdminName) ->
    case check_bitstring([Title, Content], []) of
        {true, [NewContent, NewTitle]} ->
            case check_role(RoleInfo) of
                {false, Reason} -> {false, Reason};
                {true, NewRoleInfo} ->
                    Args = #{title => NewTitle, content => NewContent,
                             items => Items},
                    limit_send2(NewRoleInfo, Args)
            end;
        {false, Reason} -> {false, Reason}
    end.

limit_send2([I], Args = #{items := Items}) ->
    case var:get_role_var(I, forever, {2040, Items}, 0) of
        0 ->
            var:set_role_var(I, forever, {2040, Items}, 1),
            mail:send(I, Args),
            ok;
        _ -> {false, util:fbin("~w", [1])}
    end;
limit_send2(_, _) -> {false, lang:get("只能发一个人奖励")}.

check_bitstring([], Data) -> {true, Data};
check_bitstring([H | T], Data) when is_list(H) ->
    check_bitstring(T, [H | Data]);
check_bitstring([H | _T], _Data) ->
    {false, util:fbin("错误的参数:~w", [H])}.

check_role(RoleInfo) -> check_role(RoleInfo, []).

check_role([], RoleInfo) -> {true, RoleInfo};
check_role([{RoleId, Platform, ZoneId} | T], RoleInfo)
    when is_integer(RoleId) andalso
             is_list(Platform) andalso is_integer(ZoneId) ->
    check_role(T, [{RoleId, Platform, ZoneId} | RoleInfo]);
check_role([[RoleId, Platform, ZoneId] | T], RoleInfo)
    when is_integer(RoleId) andalso
             is_list(Platform) andalso is_integer(ZoneId) ->
    check_role(T, [{RoleId, Platform, ZoneId} | RoleInfo]);
check_role([_Err | _T], _NewRoleInfo) ->
    {false, util:fbin("错误的参数:~w", [_Err])}.

