-file("src/lib/captcha.erl", 1).

-module(captcha).

-export([get/0, check/3, auth/2]).

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

-file("src/lib/captcha.erl", 15).

-spec check(rpc | cb_fun, Cmd :: pos_integer(),
            Data :: tuple()) -> ok | false.

check(rpc, Cmd, Data) ->
    case erase({captcha_auth, Cmd, Data}) of
        true -> ok;
        _ ->
            {Code, ImgBin} = captcha:get(),
            put({captcha_key, Cmd},
                {rpc, Code, Data, 0, 0, date:unixtime()}),
            sys_conn:pack_send(get(conn_pid),
                               9910,
                               {0, Cmd, ImgBin}),
            false
    end;
check(cb_fun, Cmd, {Fun, Args}) ->
    check(cb_fun, Cmd, {undefined, Fun, Args});
check(cb_fun, Cmd, {Mod, Fun, Args}) ->
    {Code, ImgBin} = captcha:get(),
    put({captcha_key, Cmd},
        {cb_fun,
         Code,
         {Mod, Fun, Args},
         0,
         0,
         date:unixtime()}),
    sys_conn:pack_send(get(conn_pid),
                       9910,
                       {0, Cmd, ImgBin}),
    false.

-spec auth(Cmd :: pos_integer(),
           Code :: non_neg_integer()) -> ok |
                                         {false, ImgBin :: binary()} |
                                         {refresh, ImgBin :: binary()} |
                                         {ok, Data :: tuple()}.

auth(Cmd, Code) ->
    Now = date:unixtime(),
    case get({captcha_key, Cmd}) of
        {Type, Code, Data, _N, _M, Time}
            when Time + 60 >= Now ->
            {ok, {Type, Data}};
        {_Type, _Code, Data, N, M, Time}
            when Code =:= 0 andalso Now =/= Time ->
            {NewCode, ImgBin} = captcha:get(),
            put({captcha_key, Cmd},
                {rpc, NewCode, Data, N, M + 1, Now}),
            {refresh, ImgBin};
        {_Type, _Code, Data, N, _M, _Time}
            when Code =/= 0 andalso N < 5 ->
            {NewCode, ImgBin} = captcha:get(),
            put({captcha_key, Cmd},
                {rpc, NewCode, Data, N + 1, 0, Now}),
            {false, ImgBin};
        _ -> ok
    end.

-spec get() -> {Code, ImgBin} when Code ::
                                       pos_integer(),
                                   ImgBin :: binary().

get() ->
    Code = util:rand(1000, 9999),
    Str = integer_to_list(Code),
    {Code, img(Str)}.

img(String) ->
    With = 160,
    Height = 50,
    Img = egd:create(With, Height),
    noise(point, 80, {With, Height}, Img),
    noise(line, 10, {With, Height}, Img),
    noise(rectangle, 5, {With, Height}, Img),
    P = {util:rand(45, 50), util:rand(10, 30)},
    lineup(String, Img, P),
    Bin = egd:render(Img, png),
    egd:save(Bin, "d:/captcha.png"),
    Bin.

lineup([], _Img, _P) -> ok;
lineup([H | T], Img, {X, Y} = P0) ->
    Color = egd:color({util:rand(0, 255),
                       util:rand(0, 255),
                       util:rand(0, 255)}),
    Font = {util:rand(12, 14),
            util:rand(14, 16),
            util:rand(1, 3)},
    draw([H], Img, P0, Font, Color),
    P = {X + util:rand(18, 20), Y + util:rand(-5, 5)},
    lineup(T, Img, P).

noise(_Mod, 0, _, _Img) -> ok;
noise(Mod = point, N, {With, Height}, Img) ->
    Color = egd:color({util:rand(0, 255),
                       util:rand(0, 255),
                       util:rand(0, 255)}),
    X = util:rand(1, With),
    Y = util:rand(1, Height),
    egd:rectangle(Img, {X, Y}, {X + 1, Y + 1}, Color),
    noise(Mod, N - 1, {With, Height}, Img);
noise(Mod = line, N, {With, Height}, Img) ->
    Color = egd:color({util:rand(0, 255),
                       util:rand(0, 255),
                       util:rand(0, 255)}),
    X0 = util:rand(0, With),
    Y0 = util:rand(0, Height),
    X1 = util:rand(X0, X0 + 15),
    Y1 = util:rand(Y0 - 5, Y0 + 5),
    egd:line(Img, {X0, Y0}, {X1, Y1}, Color),
    noise(Mod, N - 1, {With, Height}, Img);
noise(Mod = rectangle, N, {With, Height}, Img) ->
    Color = egd:color({util:rand(0, 255),
                       util:rand(0, 255),
                       util:rand(0, 255)}),
    X0 = util:rand(0, With),
    Y0 = util:rand(0, Height),
    R = util:rand(5, 12),
    egd:rectangle(Img, {X0, Y0}, {X0 + R, Y0 + R}, Color),
    noise(Mod, N - 1, {With, Height}, Img).

draw("0", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + Wei, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y},
                        {X + W, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("1", Img, {X, Y}, {_W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + Wei, Y + H + Wei},
                        Color),
    ok;
draw("2", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y},
                        {X + W, Y + H / 2},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + Wei, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("3", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y + Wei},
                        {X + W, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("4", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + Wei, Y + H / 2},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("5", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + Wei, Y + H / 2},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y + H / 2},
                        {X + W, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("6", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + Wei, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y + H / 2},
                        {X + W, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("7", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y + Wei},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("8", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + Wei, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y},
                        {X + W, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("9", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + Wei, Y + H / 2},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y},
                        {X + W, Y + H},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H},
                        {X + W, Y + H + Wei},
                        Color),
    ok;
draw("+", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + trunc(W / 2 - Wei / 2), Y + Wei},
                        {X + trunc(W / 2 - Wei / 2) + Wei, Y + H},
                        Color),
    ok;
draw("-", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    ok;
draw("=", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y + H / 2 - Wei},
                        {X + W, Y + H / 2},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2 + Wei},
                        {X + W, Y + H / 2 + Wei * 2},
                        Color),
    ok;
draw("?", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + Wei, Y + H - Wei * 1.5},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y},
                        {X + W, Y + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X + W - Wei, Y},
                        {X + W, Y + H / 2},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H / 2},
                        {X + W, Y + H / 2 + Wei},
                        Color),
    egd:filledRectangle(Img,
                        {X, Y + H},
                        {X + Wei, Y + H + Wei},
                        Color),
    ok;
draw(_, _Img, _P, _F, _Color) -> ignore.

