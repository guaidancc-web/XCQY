-file("src/dev.erl", 1).

-module(dev).

-export([get_all_erl/0,
         file_list/2,
         m/0,
         m/1,
         u/0,
         u/1,
         u/2,
         edoc/0]).

-file("/usr/local/lib/erlang/lib/kernel-3.0.1/includ"
      "e/file.hrl",
      1).

-record(file_info,
        {size :: undefined | non_neg_integer(),
         type ::
             undefined |
             device |
             directory |
             other |
             regular |
             symlink,
         access :: undefined | read | write | read_write | none,
         atime ::
             undefined | file:date_time() | non_neg_integer(),
         mtime ::
             undefined | file:date_time() | non_neg_integer(),
         ctime ::
             undefined | file:date_time() | non_neg_integer(),
         mode :: undefined | non_neg_integer(),
         links :: undefined | non_neg_integer(),
         major_device :: undefined | non_neg_integer(),
         minor_device :: undefined | non_neg_integer(),
         inode :: undefined | non_neg_integer(),
         uid :: undefined | non_neg_integer(),
         gid :: undefined | non_neg_integer()}).

-record(file_descriptor,
        {module :: undefined | module(),
         data :: undefined | term()}).

-file("src/dev.erl", 21).

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

-file("src/dev.erl", 22).

-spec m() -> ok.

m() ->
    m(main),
    m(tester),
    m(data).

m(main) -> make(main, []);
m(tester) -> make(tester, []);
m(data) -> make(data, []);
m(battle) -> make(battle, []);
m(data_and_battle) ->
    make(data, []),
    make(battle, []).

-spec make(atom() | string(), list()) -> ok.

make(main, Param) -> make(env:get(code_path), Param);
make(data, Param) ->
    make(env:get(code_path) ++ "/src/data", Param);
make(battle, Param) ->
    make(env:get(code_path) ++ "/src/battle", Param);
make(tester, Param) ->
    make(env:get(code_path) ++ "/tester", Param);
make(Path, Param) ->
    util:cn("### 正在编译(~ts)，参数:~w~n", [Path, Param]),
    file:set_cwd(Path),
    case make:all(Param) of
        up_to_date -> do_up([], false);
        _ -> ignore
    end,
    file:set_cwd(env:get(root)).

-spec u() -> ok.

u() -> do_up([], false).

-spec u(Options) -> ok when Options :: force | [atom()].

u(force) -> do_up([], true);
u(ModList) when is_list(ModList) ->
    do_up(ModList, false).

-spec u([atom()], F :: force) -> ok.

u(ModList, force) when is_list(ModList) ->
    do_up(ModList, true).

-spec edoc() -> ok.

edoc() ->
    {ok, Cwd} = file:get_cwd(),
    Dir = Cwd ++ "/src",
    case file_list(Dir, ".erl") of
        {error, _Why} -> ignore;
        {ok, L} ->
            edoc:files(do_edoc(L, []),
                       [{new, true}, {dir, Cwd ++ "/doc"}])
    end,
    ok.

-spec get_all_erl() -> FileList |
                       {error, term()} when FileList :: [{FileName, FilePath}],
                                            FileName :: string(),
                                            FilePath :: string().

get_all_erl() ->
    {ok, Cwd} = file:get_cwd(),
    Dir = Cwd ++ "src",
    case file:list_dir(Dir) of
        {ok, L} -> {ok, file_filter(L, Dir, ".erl", [])};
        _Other -> {error, _Other}
    end.

-spec file_list(Dir, Ext) -> {ok, FileList} |
                             {error, Why} when Dir :: string(), Ext :: string(),
                                               FileList :: [{FilePath,
                                                             FileName}],
                                               Why :: term(),
                                               FilePath :: string(),
                                               FileName :: string().

file_list(Dir, Ext) ->
    case file:list_dir(Dir) of
        {error, Reason} -> {error, Reason};
        {ok, L} -> {ok, file_filter(L, Dir, Ext, [])}
    end.

do_up(L, F) ->
    util:cn("--- 正在热更新节点: ~w ---~n", [node()]),
    Args = case {L, F} of
               {[], false} -> [];
               {[], true} -> [force];
               {[_H | _T], false} -> [L];
               {[_H | _T], true} -> [L, force]
           end,
    print_up(apply(sys_code, up, Args)).

print_up([]) ->
    case os:type() of
        {win32, _} ->
            io:format("~ts", [io_lib:format("~n", [])]);
        _ -> io:format("~ts", [io_lib:format("~n", [])])
    end;
print_up([{M, ok} | T]) ->
    util:cn("# 加载模块成功: ~p~n", [M]),
    print_up(T);
print_up([{M, {error, Reason}} | T]) ->
    util:cn("* 加载模块失败[~p]: ~p~n", [M, Reason]),
    print_up(T).

do_edoc([], L) -> L;
do_edoc([{M, F} | T], L) ->
    case util:text_banned(M,
                          ["proto_.*",
                           ".*_data",
                           "sup_.*",
                           ".*_rpc",
                           "mysql.*"])
        of
        true -> do_edoc(T, L);
        false -> do_edoc(T, [F | L])
    end.

file_filter([], _Dir, _Ext, List) -> List;
file_filter([H | T], Dir, Ext, List) ->
    F = Dir ++ "/" ++ H,
    NewList = case file:read_file_info(F) of
                  {ok, I} ->
                      if I#file_info.type =:= directory ->
                             case file:list_dir(F) of
                                 {ok, L} ->
                                     D = Dir ++ "/" ++ H,
                                     List ++ file_filter(L, D, Ext, []);
                                 _Err ->
                                     io:format("error in list directory:~p~n",
                                               [_Err]),
                                     List
                             end;
                         I#file_info.type =:= regular ->
                             case filename:extension(F) =:= Ext of
                                 true ->
                                     List ++
                                         [{filename:basename(filename:rootname(F)),
                                           F}];
                                 false -> List
                             end;
                         true -> List
                      end;
                  _Other ->
                      io:format("error in read_file_info:~p ~w~n",
                                [F, _Other]),
                      List
              end,
    file_filter(T, Dir, Ext, NewList).

