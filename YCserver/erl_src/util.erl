-file("src/lib/util.erl", 1).

-module(util).

-export([sleep/1,
         is_process_alive/1,
         bool2int/1,
         for/3,
         md5/1,
         floor/1,
         check_range/3,
         check_max/2,
         check_min/2,
         fun_from_mod/1,
         ceil/1,
         readlines/1,
         load/1,
         save/2,
         template/2,
         replace/3,
         rand/2,
         rand_list/1,
         rand_list/2,
         rand_list_n/2,
         rand_list_n/3,
         rand_all/2,
         rand_all_n/3,
         shuffle/1,
         keys_sort/2,
         tuplelist_to_record_string/1,
         fbin/1,
         fbin/2,
         flist/1,
         flist/2,
         cn/1,
         cn/2,
         build_fun/1,
         to_string/1,
         to_list/1,
         to_atom/1,
         parse_qs/1,
         parse_qs/3,
         term_to_string/1,
         string_to_term/1,
         string_to_term2/1,
         term_to_bitstring/1,
         all_to_binary/1,
         to_binary/1,
         check_name/1,
         text_filter/1,
         text_filter/2,
         text_banned/1,
         text_banned/2,
         check_text/2,
         check_text/3,
         time_left/2,
         utf8_len/1,
         sub_big_list/2,
         one_to_list/2,
         get_stacktrace/0,
         seg_cross_rect/6,
         seg_cross_circle/4,
         close_dets/1,
         remove_duplicate/1,
         merge_bin_list/1,
         printf/3,
         multi_exec/5,
         multi_exec2/5,
         update_list/3,
         list_avg/1,
         word_is_sensitive_kernel/1,
         word_is_sensitive_kernel_2/1,
         word_is_sensitive_kernel_3/1,
         check_len_and_sensitive/2,
         word_sensitive_kernel_change/2,
         word_sensitive_kernel_change_2/3,
         send_after/3,
         filter_single_world/2]).

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

-file("src/lib/util.erl", 87).

-spec is_process_alive(pid()) -> true | false.

is_process_alive(P) when is_pid(P) ->
    case rpc:call(node(P), erlang, is_process_alive, [P]) of
        true -> true;
        false -> false;
        _ -> false
    end.

-spec sleep(T :: integer()) -> ok.

sleep(T) -> receive  after T -> ok end.

-spec bool2int(X :: boolean()) -> 0 | 1.

bool2int(true) -> 1;
bool2int(false) -> 0.

fun_from_mod(Fun) when is_function(Fun) ->
    case erlang:fun_info(Fun, module) of
        {module, Mod} -> Mod;
        _ -> undefined
    end;
fun_from_mod(_) -> undefined.

-spec for(Begin :: integer(), End :: integer(),
          Fun :: function()) -> ok.

for(End, End, Fun) ->
    Fun(End),
    ok;
for(Begin, End, Fun) when Begin < End ->
    Fun(Begin),
    for(Begin + 1, End, Fun).

-spec md5(iodata()) -> binary().

md5(Data) ->
    list_to_binary([io_lib:format("~2.16.0b", [N])
                    || N <- binary_to_list(erlang:md5(Data))]).

-spec floor(number()) -> integer().

floor(X) ->
    T = erlang:trunc(X),
    case X < T of
        true -> T - 1;
        _ -> T
    end.

-spec ceil(number()) -> integer().

ceil(X) ->
    T = erlang:trunc(X),
    case X > T of
        true -> T + 1;
        _ -> T
    end.

-spec check_range(Val, Min, Max) -> number() when Val ::
                                                      number(),
                                                  Min :: number(),
                                                  Max :: number().

check_range(Val, Min, Max) ->
    if Val > Max -> Max;
       Val < Min -> Min;
       true -> Val
    end.

-spec check_max(Val :: number(),
                Max :: number()) -> number().

check_max(Val, Max) ->
    if Val > Max -> Max;
       true -> Val
    end.

-spec check_min(Val :: number(),
                Min :: number()) -> number().

check_min(Val, Min) ->
    if Val < Min -> Min;
       true -> Val
    end.

-spec keys_sort([pos_integer()],
                [tuple()]) -> [tuple()].

keys_sort([], TupleList) -> lists:reverse(TupleList);
keys_sort([{asc, H} | T], TupleList) ->
    Fun = fun (E1, E2) -> element(H, E1) >= element(H, E2)
          end,
    NewTupleList = lists:sort(Fun, TupleList),
    keys_sort(T, NewTupleList);
keys_sort([H | T], TupleList) ->
    NewTupleList = lists:keysort(H, TupleList),
    keys_sort(T, NewTupleList).

-spec readlines(string()) -> {ok, list()} |
                             {error, term()}.

readlines(FileName) ->
    case file:open(FileName, [read]) of
        {error, Reason} -> {error, Reason};
        {ok, F} -> get_all_lines(F, [])
    end.

get_all_lines(F, L) ->
    case io:get_line(F, "") of
        {error, Reason} -> {error, Reason};
        eof -> {ok, lists:reverse(L)};
        Line -> get_all_lines(F, [Line | L])
    end.

-spec load(string()) -> {ok, undefined} |
                        {ok, term()} |
                        {error, term()}.

load(File) ->
    case file:consult(File) of
        {error, Reason} -> {error, Reason};
        {ok, []} -> {ok, []};
        {ok, [Term]} -> {ok, Term}
    end.

-spec save(string(), term()) -> ok | {error, term()}.

save(File, Term) ->
    case file:open(File, [write]) of
        {error, Reason} -> {error, Reason};
        {ok, F} ->
            io:format(F, "~p.", [Term]),
            file:close(F),
            ok
    end.

-spec template(string(),
               [{atom(), string()}]) -> string() | {error, term()}.

template(File, Vars) ->
    case file:read_file(File) of
        {error, Reason} -> {error, Reason};
        {ok, Content} ->
            V = [{lists:concat(["{{", K, "}}"]), to_list(V)}
                 || {K, V} <- Vars],
            template_replace(bitstring_to_list(Content), V)
    end.

template_replace(Text, []) -> Text;
template_replace(Text, [{K, V} | L]) ->
    T = replace(Text, K, V),
    template_replace(T, L).

-spec replace(string(), string(), string()) -> string().

replace([], _Search, _Replace) -> "";
replace(Str, Search, Replace) ->
    replace(Str, Search, Replace, length(Search), []).

replace(Str, Search, Replace, Len, Rtn) ->
    case string:str(Str, Search) of
        0 -> Rtn ++ Str;
        P ->
            S = string:substr(Str, 1, P - 1) ++ Replace,
            replace(string:substr(Str, P + Len),
                    Search,
                    Replace,
                    Len,
                    Rtn ++ S)
    end.

-spec rand(Min :: integer(),
           Max :: integer()) -> integer().

rand(Min, Max) when Max < Min ->
    logger:error("随机数错误的区间:[~w:~w:~w]",
                 [Min, Max, get_stacktrace()],
                 util,
                 262),
    rand(Max, Min);
rand(Min, Min) -> Min;
rand(Min, Max) ->
    case get(rand_seed) of
        undefined ->
            Seed = case catch sys_rand:get_seed() of
                       N = {_, _, _} -> N;
                       _ -> erlang:now()
                   end,
            random:seed(Seed),
            put(rand_seed, Seed);
        _ -> ignore
    end,
    M = Min - 1,
    random:uniform(Max - M) + M.

-spec rand_list(List :: list()) -> undefined | term().

rand_list([]) -> undefined;
rand_list([I]) -> I;
rand_list(List) ->
    Idx = rand(1, length(List)),
    get_term_from_list(List, Idx).

get_term_from_list([H | _T], 1) -> H;
get_term_from_list([_H | T], Idx) ->
    get_term_from_list(T, Idx - 1).

-spec rand_list(List :: [tuple()],
                Pos :: pos_integer()) -> undefined | tuple().

rand_list([], _Pos) -> undefined;
rand_list([I], _Pos) -> I;
rand_list(List, Pos) when is_integer(Pos) ->
    Sum = lists:sum([element(Pos, I) || I <- List]),
    RandVal = rand(1, Sum),
    get_rand_tuple(List, Pos, RandVal);
rand_list(List, Pos) ->
    Sum = lists:sum([maps:get(Pos, I) || I <- List]),
    RandVal = rand(1, Sum),
    get_rand_tuple(List, Pos, RandVal).

get_rand_tuple([H | T], Pos, RandVal)
    when is_integer(Pos) ->
    Rand = element(Pos, H),
    case RandVal =< Rand of
        true -> H;
        false -> get_rand_tuple(T, Pos, RandVal - Rand)
    end;
get_rand_tuple([H | T], Pos, RandVal) ->
    Rand = maps:get(Pos, H),
    case RandVal =< Rand of
        true -> H;
        false -> get_rand_tuple(T, Pos, RandVal - Rand)
    end.

rand_list_n([], _) -> undefined;
rand_list_n([I], 1) -> [I];
rand_list_n(List, Num) ->
    do_rand_list_n_3(List, Num, []).

do_rand_list_n_3([], _, GetList) -> GetList;
do_rand_list_n_3(_, Num, GetList) when Num =< 0 ->
    GetList;
do_rand_list_n_3(List, Num, GetList) ->
    Idx = rand(1, length(List)),
    {Get, NewList} = get_term_from_list(List, Idx, []),
    do_rand_list_n_3(NewList, Num - 1, [Get | GetList]).

get_term_from_list([H | T], 1, List) -> {H, List ++ T};
get_term_from_list([H | T], Idx, List) ->
    get_term_from_list(T, Idx - 1, [H | List]).

rand_list_n([], _Pos, _Num) -> [];
rand_list_n([I], _Pos, 1) -> [I];
rand_list_n(List, Pos, Num) when is_integer(Pos) ->
    Sum = lists:sum([element(Pos, I) || I <- List]),
    rand_list_n(List, Pos, Sum, Num, []);
rand_list_n(List, Pos, Num) ->
    Sum = lists:sum([maps:get(Pos, I) || I <- List]),
    rand_list_n(List, Pos, Sum, Num, []).

rand_list_n(_List, _Pos, _Sum, Num, GetList)
    when Num =< 0 ->
    GetList;
rand_list_n([], _, _, _, GetList) -> GetList;
rand_list_n(List, Pos, Sum, Num, GetList) ->
    Seed = util:rand(1, Sum),
    case do_rand_list_n(List, Pos, Seed, Sum) of
        {NewList, Get, NewSum} ->
            rand_list_n(NewList,
                        Pos,
                        NewSum,
                        Num - 1,
                        [Get | GetList]);
        {false, Reason} ->
            logger:error("随机数据发生错误，数据内容为:~w", [Reason], util, 350),
            rand_list_n(List, Pos, Sum, Num - 1, GetList)
    end.

do_rand_list_n(List, Pos, Seed, Sum) ->
    do_rand_list_n(List, Pos, Seed, Sum, 0, []).

do_rand_list_n([], _Pos, _Seed, _Sum, _Range, _Back) ->
    {false, util:flist("~w", [_Back])};
do_rand_list_n([L | T], Pos, Seed, Sum, Range, Back)
    when is_integer(Pos) ->
    Ratio = element(Pos, L),
    case Seed =< Ratio + Range of
        true -> {T ++ Back, L, Sum - Ratio};
        false ->
            do_rand_list_n(T,
                           Pos,
                           Seed,
                           Sum,
                           Range + Ratio,
                           [L | Back])
    end;
do_rand_list_n([L | T], Pos, Seed, Sum, Range, Back) ->
    Ratio = maps:get(Pos, L),
    case Seed =< Ratio + Range of
        true -> {T ++ Back, L, Sum - Ratio};
        false ->
            do_rand_list_n(T,
                           Pos,
                           Seed,
                           Sum,
                           Range + Ratio,
                           [L | Back])
    end.

shuffle(List) -> shuffle(List, []).

shuffle([], Acc) -> Acc;
shuffle(List, Acc) ->
    {Leading, [H | T]} =
        lists:split(random:uniform(length(List)) - 1, List),
    shuffle(Leading ++ T, [H | Acc]).

rand_all(List, Pos) -> rand_all(List, Pos, []).

rand_all([], _Pos, List) -> lists:reverse(List);
rand_all([H | T], Pos, List) ->
    Rand = element(Pos, H),
    case Rand >= rand(1, 1000) of
        true -> rand_all(T, Pos, [H | List]);
        false -> rand_all(T, Pos, List)
    end.

rand_all_n(List, Pos, Num) ->
    rand_all_n(List, Pos, Num, []).

rand_all_n([], _Pos, _Num, List) -> List;
rand_all_n([H | T], Pos, Num, List) ->
    Rand = element(Pos, H),
    case Rand >= rand(1, 10000) of
        true ->
            case Num - 1 =< 0 of
                true -> [H | List];
                false -> rand_all_n(T, Pos, Num - 1, [H | List])
            end;
        false -> rand_all_n(T, Pos, Num, List)
    end.

-spec tuplelist_to_record_string([{atom(),
                                   any()}]) -> string() |
                                               {error,
                                                tuplelist_to_record_not_found_record_name}.

tuplelist_to_record_string(L) ->
    case lists:keyfind(record_name, 1, L) of
        false ->
            {error, tuplelist_to_record_not_found_record_name};
        {_, RecName} ->
            Nl = lists:keydelete(record_name, 1, L),
            io_lib:format("#~s{~s}", [RecName, rec_items(Nl, [])])
    end.

rec_items([], L) -> string:join(lists:reverse(L), ", ");
rec_items([{K, V} | T], L) ->
    S = io_lib:format("~s = ~p", [K, V]),
    rec_items(T, [S | L]).

-spec fbin(list() | bitstring() | binary()) -> binary().

fbin(Data) -> fbin(Data, []).

fbin(Data, Args) ->
    unicode:characters_to_binary(io_lib:format(Data, Args)).

flist(Data) -> flist(Data, []).

flist(Data, Args) ->
    lists:flatten(io_lib:format(Data, Args)).

cn(String) -> cn(String, []).

-spec cn(F, A) -> ok when F :: string() | bitstring(),
                          A :: [term()].

cn(F, A) when is_list(F) ->
    L = io_lib:format(F, A),
    io:format("~ts", [L]);
cn(F, A) ->
    L = io_lib:format(F, A),
    io:format("~ts", [list_to_binary(L)]).

-spec to_string(any()) -> string().

to_string(X) -> lists:flatten(io_lib:format("~w", [X])).

-spec to_list(any()) -> list().

to_list(X) when is_integer(X) -> integer_to_list(X);
to_list(X) when is_binary(X) -> binary_to_list(X);
to_list(X) when is_float(X) -> float_to_list(X);
to_list(X) when is_atom(X) -> atom_to_list(X);
to_list(X) when is_binary(X) -> binary_to_list(X);
to_list(X) when is_bitstring(X) -> bitstring_to_list(X);
to_list(X) when is_pid(X) -> pid_to_list(X);
to_list(X) when is_function(X) -> erlang:fun_to_list(X);
to_list(X) when is_port(X) -> erlang:port_to_list(X);
to_list(X) when is_tuple(X) -> to_string(X);
to_list(X) when is_list(X) -> X.

-spec to_atom(any()) -> atom().

to_atom(X) when is_atom(X) -> X;
to_atom(X) ->
    L = to_list(X),
    list_to_atom(L).

-spec build_fun(string()) -> function().

build_fun(String) ->
    {ok, Tokens, _} = erl_scan:string(String),
    {ok, L} = erl_parse:parse_exprs(Tokens),
    B = erl_eval:new_bindings(),
    BS = erl_eval:bindings(B),
    {[F], []} = erl_eval:expr_list(L, BS),
    F.

-spec parse_qs(string()) -> list().

parse_qs(String) when is_bitstring(String) ->
    parse_qs(bitstring_to_list(String));
parse_qs(String) -> parse_qs(String, "&", "=").

-spec parse_qs(String, Token1,
               Token2) -> list() when String :: bitstring() | string(),
                                      Token1 :: list(), Token2 :: list().

parse_qs(String, Token1, Token2)
    when is_bitstring(String) ->
    parse_qs(bitstring_to_list(String), Token1, Token2);
parse_qs(String, Token1, Token2) ->
    [list_to_tuple(string:tokens(Kv, Token2))
     || Kv <- string:tokens(String, Token1)].

-spec term_to_string(term()) -> string().

term_to_string(Term) -> io_lib:format("~w", [Term]).

-spec term_to_bitstring(term()) -> bitstring().

term_to_bitstring(Term) ->
    list_to_bitstring(term_to_string(Term)).

-spec string_to_term(String) -> {error, Reason} |
                                {ok, term()} when String :: undefined |
                                                            string() |
                                                            bitstring(),
                                                  Reason :: term().

string_to_term(undefined) -> {ok, undefined};
string_to_term("undefined") -> {ok, undefined};
string_to_term(String) when is_bitstring(String) ->
    string_to_term(binary_to_list(String));
string_to_term(String) ->
    S = re:replace(String,
                   "<[0-9]+\\.[0-9]+\\.[0-9]+>",
                   "undefined",
                   [{return, list}, global]),
    case erl_scan:string(S ++ ".") of
        {ok, Tokens, _} -> erl_parse:parse_term(Tokens);
        {error, Err, _} -> {error, Err}
    end.

string_to_term2(undefined) -> {ok, undefined};
string_to_term2("undefined") -> {ok, undefined};
string_to_term2(String) when is_bitstring(String) ->
    string_to_term2(binary_to_list(String));
string_to_term2(String) ->
    S = re:replace(String,
                   "<[0-9]+\\.[0-9]+\\.[0-9]+>",
                   "undefined",
                   [unicode, {return, list}, global]),
    case erl_scan:string(S ++ ".") of
        {ok, Tokens, _} -> erl_parse:parse_term(Tokens);
        {error, Err, _} -> {error, Err}
    end.

-spec all_to_binary(list()) -> binary().

all_to_binary(List) -> all_to_binary(List, []).

all_to_binary([], Result) -> list_to_binary(Result);
all_to_binary([P | T], Result) when is_list(P) ->
    all_to_binary(T, lists:append(Result, P));
all_to_binary([P | T], Result) when is_integer(P) ->
    all_to_binary(T,
                  lists:append(Result, integer_to_list(P)));
all_to_binary([P | T], Result) when is_binary(P) ->
    all_to_binary(T,
                  lists:append(Result, binary_to_list(P)));
all_to_binary([P | T], Result) when is_float(P) ->
    all_to_binary(T,
                  lists:append(Result, float_to_list(P)));
all_to_binary([P | T], Result) when is_atom(P) ->
    all_to_binary(T, lists:append(Result, atom_to_list(P))).

-spec to_binary(integer()) -> binary().

to_binary(Val) when is_integer(Val) ->
    list_to_binary(integer_to_list(Val));
to_binary(Val) when is_float(Val) ->
    list_to_binary(float_to_list(Val));
to_binary(Val) when is_list(Val) -> list_to_binary(Val);
to_binary(Val) when is_binary(Val) -> Val;
to_binary(Val) when is_atom(Val) ->
    to_binary(atom_to_list(Val));
to_binary(_Val) -> <<>>.

check_len_and_sensitive(Text, Len) ->
    length(Text) > Len orelse
        word_is_sensitive_kernel(Text).

word_sensitive_kernel_change_2(String, Flag, Char) ->
    word_sensitive_kernel_change_2(String, Flag, Char, "").

word_sensitive_kernel_change_2([], _Flag, _Char,
                               NewString) ->
    NewString;
word_sensitive_kernel_change_2([HeadChar | RestString] =
                                   String,
                               Flag, Char, CmptStr) ->
    WordList = case Flag of
                   1 -> get_key_char_wordlist([HeadChar]);
                   2 -> get_key_char_wordlist_2([HeadChar]);
                   _ -> get_key_char_wordlist([HeadChar])
               end,
    case sensitive_exchange(String, WordList) of
        {true, StrLen, LeftString} ->
            ChangeStr = lists:concat(lists:duplicate(StrLen, Char)),
            word_sensitive_kernel_change_2(LeftString,
                                           Flag,
                                           Char,
                                           CmptStr ++ ChangeStr);
        _ ->
            word_sensitive_kernel_change_2(RestString,
                                           Flag,
                                           Char,
                                           CmptStr ++ [HeadChar])
    end.

word_sensitive_kernel_change(String, Flag) ->
    word_sensitive_kernel_change(String, Flag, "").

word_sensitive_kernel_change([], _Flag, NewString) ->
    NewString;
word_sensitive_kernel_change([HeadChar | RestString] =
                                 String,
                             Flag, CmptStr) ->
    WordList = case Flag of
                   1 -> get_key_char_wordlist([HeadChar]);
                   2 -> get_key_char_wordlist_2([HeadChar]);
                   _ -> get_key_char_wordlist([HeadChar])
               end,
    case sensitive_exchange(String, WordList) of
        {true, StrLen, LeftString} ->
            ChangeStr = lists:concat(lists:duplicate(StrLen,
                                                     "^_^")),
            word_sensitive_kernel_change(LeftString,
                                         Flag,
                                         CmptStr ++ ChangeStr);
        _ ->
            word_sensitive_kernel_change(RestString,
                                         Flag,
                                         CmptStr ++ [HeadChar])
    end.

sensitive_exchange(_, []) -> false;
sensitive_exchange(String, [Word | Rest]) ->
    StrLen = length(String),
    WordLen = length(Word),
    if WordLen > StrLen -> sensitive_exchange(String, Rest);
       WordLen =:= StrLen ->
           case String =:= Word of
               true -> {true, StrLen, ""};
               _ -> sensitive_exchange(String, Rest)
           end;
       true ->
           HeadStr = lists:sublist(String, WordLen),
           TailStr = lists:sublist(String, WordLen + 1, StrLen),
           case HeadStr =:= Word of
               true -> {true, WordLen, TailStr};
               _ -> sensitive_exchange(String, Rest)
           end
    end.

word_is_sensitive_kernel([]) -> false;
word_is_sensitive_kernel(String) when is_list(String) ->
    [HeadChar | TailString] = String,
    StrLen = length(String),
    WordList = get_key_char_wordlist([HeadChar]),
    Match = fun (Word) ->
                    WordLen = length(Word),
                    if WordLen > StrLen -> false;
                       WordLen =:= StrLen -> String =:= Word;
                       true ->
                           HeadStr = lists:sublist(String, WordLen),
                           HeadStr =:= Word
                    end
            end,
    case lists:any(Match, WordList) of
        true -> true;
        false -> word_is_sensitive_kernel(TailString)
    end;
word_is_sensitive_kernel(_) -> true.

get_key_char_wordlist(HeadChar) ->
    case sensitive_data:get(HeadChar) of
        L = [_ | _] -> L;
        _ -> []
    end.

word_is_sensitive_kernel_2([]) -> false;
word_is_sensitive_kernel_2(String)
    when is_list(String) ->
    [HeadChar | TailString] = String,
    StrLen = length(String),
    WordList = get_key_char_wordlist_2([HeadChar]),
    Match = fun (Word) ->
                    WordLen = length(Word),
                    if WordLen > StrLen -> false;
                       WordLen =:= StrLen -> String =:= Word;
                       true ->
                           HeadStr = lists:sublist(String, WordLen),
                           HeadStr =:= Word
                    end
            end,
    case lists:any(Match, WordList) of
        true -> true;
        false -> word_is_sensitive_kernel_2(TailString)
    end;
word_is_sensitive_kernel_2(_) -> true.

get_key_char_wordlist_2(HeadChar) ->
    case sensitive_data:get_normal(HeadChar) of
        L = [_ | _] -> L;
        _ -> []
    end.

word_is_sensitive_kernel_3([]) -> false;
word_is_sensitive_kernel_3(String)
    when is_list(String) ->
    [HeadChar | TailString] = String,
    StrLen = length(String),
    WordList = get_key_char_wordlist_3([HeadChar]),
    Match = fun (Word) ->
                    WordLen = length(Word),
                    if WordLen > StrLen -> false;
                       WordLen =:= StrLen -> String =:= Word;
                       true ->
                           HeadStr = lists:sublist(String, WordLen),
                           HeadStr =:= Word
                    end
            end,
    case lists:any(Match, WordList) of
        true -> true;
        false -> word_is_sensitive_kernel_3(TailString)
    end;
word_is_sensitive_kernel_3(_) -> true.

get_key_char_wordlist_3(HeadChar) ->
    case sensitive_data:get_penson_world(HeadChar) of
        L = [_ | _] -> L;
        _ -> []
    end.

-spec check_name(bitstring()) -> ok |
                                 {false, Reason :: bitstring()}.

check_name(Text) ->
    case name_len_valid(Text, 1, 6) of
        false -> {false, flist(lang:get("名称长度不合要求"))};
        true ->
            case name_valid(Text) of
                false -> {false, flist(lang:get("名字存在不和谐词汇，换个试试吧"))};
                _ ->
                    case check_text(Text, 6) of
                        ok -> ok;
                        _ -> {false, flist(lang:get("名字存在不和谐词汇，换个试试吧"))}
                    end
            end
    end.

-spec is_normal_text(Text :: iodata()) -> boolean().

is_normal_text(Text) ->
    case re:run(Text,
                "[;\034,.\"':+=!?<>/*|~`@#$%(){}\\-\\[\\]\\\\]",
                [{capture, none}, caseless, unicode])
        of
        match -> false;
        nomatch -> true
    end.

-spec text_banned(Text :: iodata()) -> boolean().

text_banned(Text) ->
    case is_normal_text(Text) of
        false -> true;
        true ->
            case text_banned(Text, keywords:banned()) of
                true -> true;
                false -> text_banned(Text, keywords:fuck_hexie())
            end
    end.

-spec check_text(Text :: iodata(),
                 Len :: non_neg_integer()) -> {false, bitstring()} | ok.

check_text(Text, Len) ->
    case name_len_valid(Text, 0, Len) of
        false -> {false, flist(lang:get("长度不合要求"))};
        true ->
            ChineseText = filter_single_world(Text, []),
            ChineseTextResult =
                word_is_sensitive_kernel(ChineseText),
            logger:debug("中文检测结果:~w",
                         [ChineseTextResult],
                         util,
                         818),
            MixTextResult =
                word_is_sensitive_kernel(string:to_lower(Text)),
            logger:debug("检测结果:~w", [MixTextResult], util, 821),
            case ChineseTextResult orelse MixTextResult of
                true -> {false, flist(lang:get("存在不和谐词汇，换个试试吧"))};
                _ -> ok
            end
    end.

check_text(Text, Len, Key) ->
    case name_len_valid(Text, 0, Len) of
        false -> {false, lang:get(flist("~ts长度不合要求", [Key]))};
        true ->
            case check_text(Text, Len) of
                {false, _} ->
                    {false, flist(lang:get("~ts存在不和谐词汇，换个试试吧"), [Key])};
                _ -> ok
            end
    end.

filter_single_world([], Rtn) -> lists:reverse(Rtn);
filter_single_world([Char | Rest], Rtn)
    when Char < 256 ->
    filter_single_world(Rest, Rtn);
filter_single_world([Char | Rest], Rtn) ->
    case lists:member(Char, "，。、；「」【】：『』《》？！￥……（）——）\"") of
        true -> filter_single_world(Rest, Rtn);
        _ -> filter_single_world(Rest, [Char | Rtn])
    end.

-spec text_filter(Text :: iodata()) -> NewText ::
                                           bitstring().

text_filter(Text) ->
    T1 = text_filter(Text, keywords:banned()),
    T2 = text_filter(T1, keywords:fuck_hexie()),
    list_to_bitstring(T2).

-spec text_filter(Text :: iodata(),
                  Keywords :: [string()]) -> string().

text_filter(Text, []) -> Text;
text_filter(Text, [H | L]) ->
    T = re:replace(Text, H, "*", [caseless, global]),
    text_filter(T, L).

-spec time_left(TimeMax :: integer(),
                Begin :: erlang:timestamp()) -> integer().

time_left(TimeMax, Begin) ->
    T = util:floor(TimeMax -
                       timer:now_diff(erlang:now(), Begin) / 1000),
    case T > 0 of
        true -> T;
        false -> 0
    end.

-spec utf8_len(Str :: bitstring()) -> error |
                                      non_neg_integer().

utf8_len(Str) ->
    case unicode:characters_to_list(Str) of
        List when is_list(List) -> string_width(List);
        _ -> error
    end.

-spec sub_big_list(L1 :: list(),
                   L2 :: list()) -> list().

sub_big_list(L1, L2) ->
    H1 = ordsets:from_list(L1),
    H2 = ordsets:from_list(L2),
    ordsets:subtract(H1, H2).

-spec one_to_list(Obj :: term(),
                  Num :: non_neg_integer()) -> list().

one_to_list(Obj, Num) -> one_to_list(Obj, Num, []).

one_to_list(_, 0, Result) -> Result;
one_to_list(Obj, N, Result) ->
    one_to_list(Obj, N - 1, [Obj | Result]).

get_stacktrace() ->
    try throw(a) catch
        _Type:_Err -> tl(erlang:get_stacktrace())
    end.

seg_cross_rect({Sx, Sy}, {Dx, Dy}, {X1, Y1}, {X2, Y1},
               {X2, Y1}, {X2, Y2}) ->
    case point_in_rect({Sx, Sy}, {X1, Y1}, {X2, Y2}) orelse
             point_in_rect({Dx, Dy}, {X1, Y1}, {X2, Y2})
        of
        true -> true;
        false ->
            case seg_in_rect({Sx, Sy}, {Dx, Dy}, {X1, Y1}, {X1, Y2})
                     orelse
                     seg_in_rect({Sx, Sy}, {Dx, Dy}, {X1, Y1}, {X2, Y1})
                         orelse
                         seg_in_rect({Sx, Sy}, {Dx, Dy}, {X2, Y2}, {X1, Y2})
                             orelse
                             seg_in_rect({Sx, Sy}, {Dx, Dy}, {X2, Y2}, {X2, Y1})
                of
                true -> true;
                false -> false
            end
    end.

seg_cross_circle({Sx, Sy}, {Dx, Dy}, {Px, Py}, R) ->
    {Fx, Fy} = {Dx - Sx, Dy - Sy},
    {Ex, Ey} = {Px - Sx, Py - Sy},
    Cross1 = Fx * Ex + Fy * Ey,
    case Cross1 =< 0 of
        true ->
            R >
                math:sqrt(math:pow(Sx - Px, 2) + math:pow(Sy - Py, 2));
        false ->
            Cross2 = Fx * Fx + Fy * Fy,
            case Cross1 >= Cross2 of
                true ->
                    R >
                        math:sqrt(math:pow(Px - Dx, 2) + math:pow(Py - Dy, 2));
                false ->
                    NewCross = Cross1 / Cross2,
                    NewPx = Sx + (Dx - Sx) * NewCross,
                    NewPy = Sy + (Dy - Sy) * NewCross,
                    R >
                        math:sqrt(math:pow(Px - NewPx, 2) +
                                      math:pow(Py - NewPy, 2))
            end
    end.

close_dets(Name) ->
    case catch dets:close(Name) of
        ok -> ok;
        _Err ->
            logger:error("关闭dets[~w]失败:~w", [Name, _Err], util, 946)
    end.

-spec remove_duplicate(L :: list()) -> list().

remove_duplicate([]) -> [];
remove_duplicate(L = [_ | _]) ->
    sets:to_list(sets:from_list(L)).

-spec merge_bin_list(list()) -> binary() | false.

merge_bin_list(List) when is_list(List) ->
    merge_bin_list(List, <<>>);
merge_bin_list(_) -> false.

merge_bin_list([], Bin) -> Bin;
merge_bin_list([Data | T], Bin) ->
    merge_bin_list(T, <<Bin/binary, Data/binary>>).

update_list(N, List, Val) ->
    update_list(1, N, List, Val, []).

update_list(_M, _N, [], _Val, List) ->
    lists:reverse(List);
update_list(N, N, [_ | T], Val, List) ->
    lists:reverse(List) ++ [Val | T];
update_list(M, N, [I | T], Val, List) ->
    update_list(M + 1, N, T, Val, [I | List]).

text_banned(_Text, []) -> false;
text_banned(Text, [H | T]) ->
    case re:run(Text,
                H,
                [{capture, none}, caseless, unicode])
        of
        match -> true;
        _ -> text_banned(Text, T)
    end.

name_len_valid(Text, Min, Max) ->
    case unicode:characters_to_list(Text) of
        List when is_list(List) ->
            Len = string_width(List),
            Len =< Max andalso Len >= Min;
        _ -> false
    end.

name_valid(Text) ->
    case re:run(Text,
                "[^a-zA-Z0-9\\x{4E00}-\\x{9FA5}_\\x{306E}\\x{2"
                "116}\\x{706c}\\x{4e36}\\x{4e28}\\x{4e3f}\\x{2"
                "573}\\x{256c}\\x{5350}\\x{2103}\\x{0021}]",
                [{capture, none}, caseless, unicode])
        of
        match -> false;
        nomatch -> true
    end.

string_width(String) -> string_width(String, 0).

string_width([], Len) -> Len;
string_width([_H | T], Len) -> string_width(T, Len + 1).

point_in_rect({Sx, Sy}, {X1, Y1}, {X2, Y2}) ->
    max(X1, X2) >= Sx andalso
        min(X1, X2) =< Sx andalso
            max(Y1, Y2) >= Sy andalso min(Y1, Y2) =< Sy.

cross_prod({Ax, Ay}, {Bx, By}, {Cx, Cy}) ->
    (Bx - Ax) * (Cy - Ay) - (By - Ay) * (Cx - Ax).

seg_in_rect({Ax, Ay}, {Bx, By}, {Cx, Cy}, {Dx, Dy}) ->
    max(Ax, Bx) >= min(Cx, Dx) andalso
        max(Cx, Dx) >= min(Ax, Bx) andalso
            max(Ay, By) >= min(Cy, Dy) andalso
                max(Cy, Dy) >= min(Ay, By) andalso
                    cross_prod({Cx, Cy}, {Dx, Dy}, {Ax, Ay}) *
                        cross_prod({Cx, Cy}, {Bx, By}, {Dx, Dy})
                        >= 0
                        andalso
                        cross_prod({Ax, Ay}, {Bx, By}, {Cx, Cy}) *
                            cross_prod({Ax, Ay}, {Dx, Dy}, {Bx, By})
                            >= 0.

-spec printf(T :: atom(), F :: string(),
             A :: list()) -> ok.

printf(Tag, F, A) when is_list(F) ->
    {NewF, NewA} = case
                       string:to_lower(erlang:system_info(otp_release))
                       of
                       R when R > "r16" orelse R > "16" ->
                           case Tag of
                               info ->
                                   {"~s" ++ F ++ "~s",
                                    ["\e[1;32m"] ++ A ++ ["\e[0;38m"]};
                               error ->
                                   {"~s" ++ F ++ "~s",
                                    ["\e[1;31m"] ++ A ++ ["\e[0;38m"]};
                               warning ->
                                   {"~s" ++ F ++ "~s",
                                    ["\e[1;33m"] ++ A ++ ["\e[0;38m"]};
                               purple ->
                                   {"~s" ++ F ++ "~s",
                                    ["\e[35;1m"] ++ A ++ ["\e[0;38m"]}
                           end;
                       _ -> {F, A}
                   end,
    case os:type() of
        {win32, _} ->
            io:format("~ts", [io_lib:format(NewF, NewA)]);
        _ -> io:format("~ts", [io_lib:format(NewF, NewA)])
    end;
printf(_, F, A) ->
    case os:type() of
        {win32, _} -> io:format("~ts", [io_lib:format(F, A)]);
        _ -> io:format("~ts", [io_lib:format(F, A)])
    end.

multi_exec(ArgsList, Fun, ProcNum, Mode, Key) ->
    multi_exec(0,
               ProcNum,
               1,
               ArgsList,
               Fun,
               Mode,
               Key,
               [],
               []).

multi_exec(0, _ProcNum, _Num, [], _Fun, _Mode, _Key,
           RetList, KeyValue) ->
    {RetList, KeyValue};
multi_exec(N, 1, Num, [Args | List], Fun, inc, Key,
           RetList, KeyValue) ->
    Ret = Fun(Num, Args),
    Kv = fun_key(Key, []),
    multi_exec(N,
               1,
               Num + 1,
               List,
               Fun,
               inc,
               Key,
               [Ret | RetList],
               Kv ++ KeyValue);
multi_exec(N, 1, Num, [Args | List], Fun, merge, Key,
           RetList, KeyValue) ->
    Ret = Fun(Num, Args),
    Kv = fun_key(Key, []),
    multi_exec(N,
               1,
               Num + 1,
               List,
               Fun,
               merge,
               Key,
               Ret ++ RetList,
               Kv ++ KeyValue);
multi_exec(N, ProcNum, Num, [Args | List], Fun, Mode,
           Key, RetList, KeyValue)
    when N < ProcNum ->
    Pid = self(),
    spawn(fun () ->
                  Pid !
                      {self(), Pid, catch Fun(Num, Args), fun_key(Key, [])}
          end),
    multi_exec(N + 1,
               ProcNum,
               Num + 1,
               List,
               Fun,
               Mode,
               Key,
               RetList,
               KeyValue);
multi_exec(N, ProcNum, Num, ArgsList, Fun, inc, Key,
           RetList, KeyValue) ->
    Pid = self(),
    receive
        {_FromPid, Pid, Ret, Kv} ->
            multi_exec(N - 1,
                       ProcNum,
                       Num,
                       ArgsList,
                       Fun,
                       inc,
                       Key,
                       [Ret | RetList],
                       Kv ++ KeyValue)
    end;
multi_exec(N, ProcNum, Num, ArgsList, Fun, merge, Key,
           RetList, KeyValue) ->
    Pid = self(),
    receive
        {_FromPid, Pid, Ret, Kv} ->
            multi_exec(N - 1,
                       ProcNum,
                       Num,
                       ArgsList,
                       Fun,
                       merge,
                       Key,
                       Ret ++ RetList,
                       Kv ++ KeyValue)
    end.

multi_exec2(ArgsList, Fun, ProcNum, Mode, Key) ->
    multi_exec2([],
                ProcNum,
                ArgsList,
                Fun,
                Mode,
                Key,
                [],
                []).

multi_exec2([], _ProcNum, [], _Fun, _Mode, _Key,
            RetList, KeyValue) ->
    {RetList, KeyValue};
multi_exec2([], 1, [Arg | L], Fun, inc, Key, RetList,
            KeyValue) ->
    Ret = Fun(Arg),
    Kv = fun_key(Key, []),
    multi_exec2([],
                1,
                L,
                Fun,
                inc,
                Key,
                [Ret | RetList],
                Kv ++ KeyValue);
multi_exec2([], 1, [Arg | L], Fun, merge, Key, RetList,
            KeyValue) ->
    Ret = Fun(Arg),
    Kv = fun_key(Key, []),
    multi_exec2([],
                1,
                L,
                Fun,
                merge,
                Key,
                Ret ++ RetList,
                Kv ++ KeyValue);
multi_exec2([], ProcNum, ArgsList, Fun, Mode, Key,
            RetList, KeyValue) ->
    Pid = self(),
    {Args, L} = lists:split(ProcNum, ArgsList),
    Froms = lists:map(fun (Arg) ->
                              spawn(fun () ->
                                            Pid !
                                                {self(),
                                                 Pid,
                                                 catch Fun(Arg),
                                                 fun_key(Key, [])}
                                    end)
                      end,
                      Args),
    multi_exec2(Froms,
                ProcNum,
                L,
                Fun,
                Mode,
                Key,
                RetList,
                KeyValue);
multi_exec2([FromPid | T], ProcNum, ArgsList, Fun, inc,
            Key, RetList, KeyValue) ->
    Pid = self(),
    receive
        {FromPid, Pid, Ret, Kv} ->
            multi_exec2(T,
                        ProcNum,
                        ArgsList,
                        Fun,
                        inc,
                        Key,
                        [Ret | RetList],
                        Kv ++ KeyValue)
    end;
multi_exec2([FromPid | T], ProcNum, ArgsList, Fun,
            merge, Key, RetList, KeyValue) ->
    Pid = self(),
    receive
        {FromPid, Pid, Ret, Kv} ->
            multi_exec2(T,
                        ProcNum,
                        ArgsList,
                        Fun,
                        merge,
                        Key,
                        Ret ++ RetList,
                        Kv ++ KeyValue)
    end.

fun_key([], Value) -> Value;
fun_key([Key | T], Value) ->
    Name = get(fun_key_name),
    fun_key(T, [{Key, get(Key), Name} | Value]).

-spec list_avg(List :: [integer()]) -> integer().

list_avg(List) -> list_avg(List, 0, 0).

list_avg([], _Sum, 0) -> 0;
list_avg([], Sum, Len) -> erlang:round(Sum / Len);
list_avg([Int | Rest], Sum, Len) when is_integer(Int) ->
    list_avg(Rest, Sum + Int, Len + 1);
list_avg([_H | Rest], Sum, Len) ->
    list_avg(Rest, Sum, Len).

send_after(Time, _, _Lable) when Time >= 4294967295 ->
    logger:error("设定时器时发生异常:时间超时: ~w",
                 [util:get_stacktrace()],
                 util,
                 1139),
    false;
send_after(Time, Atom, Lable) ->
    erlang:send_after(Time, Atom, Lable).

