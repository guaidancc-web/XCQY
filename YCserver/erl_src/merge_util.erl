-file("src/merge/merge_util.erl", 1).

-module(merge_util).

-export([dbsrc/2,
         all_server/0,
         batch_insert_offset/2,
         batch_insert_offset/3,
         delete_expire/2,
         dets_merge/5,
         dets_merge/6]).

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

-file("src/merge/merge_util.erl", 21).

-file("inc/merge.hrl", 1).

-record(merge_table,
        {name = <<>>,
         table = <<>>,
         dao,
         server,
         next_key = 0,
         process = merge_main_proc,
         state,
         new_srv_id,
         old_srv_id}).

-record(merge_server,
        {platform = "",
         zone_id = 1,
         data_source,
         schema,
         target_schema,
         index = 0,
         size = 0}).

-record(merge_role_name,
        {key = {0, <<>>, 0},
         name = <<>>,
         lev = 0,
         exp = 0,
         data_source}).

-file("src/merge/merge_util.erl", 22).

dbsrc(Platform, ZoneId) ->
    {ok, DataSource} = util:string_to_term("data_source_" ++
                                               util:to_list(Platform) ++
                                                   util:to_list(ZoneId)),
    DataSource.

all_server() ->
    {ok, SrcList} = application:get_env(merge_src_list),
    {ok,
     [_DbHost,
      _DbPort,
      _DbUser,
      _DbPass,
      DbName,
      _DbEncode,
      _DbConnMinNum,
      _DbConnMaxNum]} =
        application:get_env(merge_target),
    Size = length(SrcList),
    all_server(SrcList, Size, 1, DbName).

all_server([], _, _, _) -> [];
all_server([{Platform,
             ZoneId,
             _DbHost,
             _DbPort,
             _DbUser,
             _DbPass,
             DbName,
             _DbEncode,
             _DbConnMinNum,
             _DbConnMaxNum}
            | T],
           Size, Index, TargetSchema) ->
    [#merge_server{platform = Platform, zone_id = ZoneId,
                   data_source = dbsrc(Platform, ZoneId),
                   schema = list_to_bitstring(DbName), size = Size,
                   index = Index, target_schema = TargetSchema}
     | all_server(T, Size, Index + 1, TargetSchema)].

batch_insert_offset(Table = #merge_table{table =
                                             TableName,
                                         server =
                                             #merge_server{schema = Schema,
                                                           target_schema =
                                                               TargetSchema}},
                    undefined) ->
    Sql =
        util:flist("insert into ~ts.~ts select * from ~ts.~ts",
                   [TargetSchema, TableName, Schema, TableName]),
    case merge_db:exec(merge_target, Sql, []) of
        ok -> {ok, [], Table};
        {error, Reason} -> {error, Reason}
    end;
batch_insert_offset(Table = #merge_table{table =
                                             TableName,
                                         server =
                                             #merge_server{schema = Schema,
                                                           target_schema =
                                                               TargetSchema}},
                    Cloumns) ->
    Sql = util:flist("insert into ~ts.~ts(~ts) select ~ts "
                     "from ~ts.~ts",
                     [TargetSchema,
                      TableName,
                      Cloumns,
                      Cloumns,
                      Schema,
                      TableName]),
    case merge_db:exec(merge_target, Sql, []) of
        ok -> {ok, [], Table};
        {error, Reason} -> {error, Reason}
    end.

batch_insert_offset(Table = #merge_table{table =
                                             TableName,
                                         server =
                                             #merge_server{schema = Schema,
                                                           target_schema =
                                                               TargetSchema}},
                    Cloumns, Where) ->
    Sql = util:flist("insert into ~ts.~ts(~ts) select ~ts "
                     "from ~ts.~ts ~ts",
                     [TargetSchema,
                      TableName,
                      Cloumns,
                      Cloumns,
                      Schema,
                      TableName,
                      Where]),
    case merge_db:exec(merge_target, Sql, []) of
        ok -> {ok, [], Table};
        {error, Reason} -> {error, Reason}
    end.

delete_expire(_Table = #merge_table{table = TableName},
              Cloumns) ->
    Time = date:unixtime(zero) - 86400 * 15,
    Sql =
        util:flist("delete from ~ts where (~ts) in (select "
                   "id, platform, zone_id from role where "
                   "lev < 5 and login_time < ~w)",
                   [TableName, Cloumns, Time]),
    case merge_db:exec(merge_target, Sql, []) of
        ok -> ok;
        {error, Reason} -> {error, Reason}
    end;
delete_expire(role, undefined) ->
    Time = date:unixtime(zero) - 86400 * 15,
    Sql =
        util:flist("delete from role where lev < 5 and login_time "
                   "< ~w",
                   [Time]),
    case merge_db:exec(merge_target, Sql, []) of
        ok -> ok;
        {error, Reason} -> {error, Reason}
    end.

dets_merge(DetsName, DetsFileName, DetsType, DetsKeyPos,
           ConvertFun) ->
    dets_merge(DetsName,
               DetsFileName,
               DetsType,
               DetsKeyPos,
               ConvertFun,
               all).

dets_merge(DetsName, DetsFileName, DetsType, DetsKeyPos,
           ConvertFun, Num)
    when is_integer(Num) ->
    SrvList = merge_util:all_server(),
    Length = length(SrvList),
    NewList = case Num >= Length of
                  true -> [lists:nth(Length, SrvList)];
                  _ when Num == 0 ->
                      [H | _] = SrvList,
                      [H];
                  _ -> [lists:nth(Num, SrvList)]
              end,
    do_dets_merge(DetsName,
                  DetsFileName,
                  DetsType,
                  DetsKeyPos,
                  ConvertFun,
                  NewList);
dets_merge(DetsName, DetsFileName, DetsType, DetsKeyPos,
           ConvertFun, all) ->
    SrvList = merge_util:all_server(),
    do_dets_merge(DetsName,
                  DetsFileName,
                  DetsType,
                  DetsKeyPos,
                  ConvertFun,
                  SrvList).

do_dets_merge(DetsName, DetsFileName, DetsType,
              DetsKeyPos, Convert,
              [Server = #merge_server{platform = Platform,
                                      zone_id = ZoneId}
               | T]) ->
    First = util:to_list(util:flist("~ts_~w",
                                    [Platform, ZoneId])),
    dets:open_file(DetsName,
                   [{file, "../dets/" ++ DetsFileName},
                    {type, DetsType},
                    {keypos, DetsKeyPos}]),
    dets:delete_all_objects(DetsName),
    DetsStrName = util:term_to_string(DetsName),
    {ok, DetsFstName} = util:string_to_term(DetsStrName ++
                                                "_first"),
    dets:open_file(DetsFstName,
                   [{file, "../dets/" ++ First ++ "/" ++ DetsFileName},
                    {type, DetsType},
                    {keypos, DetsKeyPos}]),
    {InitFun, ConvertFun, EndFun} =
        handle_convert_fun(Convert),
    handle_fun(InitFun),
    Return = case dets:first(DetsFstName) of
                 '$end_of_table' ->
                     logger:info("~ts 目录下没有需要合并的数据 [~w]",
                                 [First, DetsName],
                                 merge_util,
                                 108),
                     [];
                 _ ->
                     dets:traverse(DetsFstName,
                                   fun (Data) ->
                                           case is_function(ConvertFun) of
                                               true ->
                                                   case convert_fun(ConvertFun,
                                                                    Data,
                                                                    Server)
                                                       of
                                                       {ok, NewData} ->
                                                           dets:insert(DetsName,
                                                                       NewData),
                                                           continue;
                                                       _Err ->
                                                           logger:error("合并~w时失败:~w",
                                                                        [DetsName,
                                                                         _Err],
                                                                        merge_util,
                                                                        121),
                                                           {done, false}
                                                   end;
                                               false ->
                                                   dets:insert(DetsName, Data),
                                                   continue
                                           end
                                   end)
             end,
    case Return of
        [] ->
            Back = do_dets_merge_other(T,
                                       DetsName,
                                       DetsStrName,
                                       DetsFileName,
                                       DetsType,
                                       DetsKeyPos,
                                       ConvertFun),
            handle_fun(EndFun),
            dets:close(DetsName),
            dets:close(DetsFstName),
            Back;
        _ -> throw({error, util:flist("合并~w失败", [DetsName])})
    end.

do_dets_merge_other([], _, _, _, _, _, _) -> ok;
do_dets_merge_other([Server = #merge_server{platform =
                                                Platform,
                                            zone_id = ZoneId}
                     | T],
                    DetsName, DetsStrName, DetsFileName, DetsType,
                    DetsKeyPos, ConvertFun) ->
    PlatformZone = util:to_list(util:flist("~ts_~w",
                                           [Platform, ZoneId])),
    {ok, DetsFlag} = util:string_to_term(DetsStrName ++
                                             PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/" ++ DetsFileName},
                    {type, DetsType},
                    {keypos, DetsKeyPos}]),
    Return = case dets:first(DetsFlag) of
                 '$end_of_table' ->
                     logger:info("~ts 目录下没有需要合并的数据 [~w]",
                                 [PlatformZone, DetsName],
                                 merge_util,
                                 149),
                     [];
                 _ ->
                     dets:traverse(DetsFlag,
                                   fun (Data) ->
                                           case is_function(ConvertFun) of
                                               true ->
                                                   case convert_fun(ConvertFun,
                                                                    Data,
                                                                    Server)
                                                       of
                                                       {ok, NewData} ->
                                                           dets:insert(DetsName,
                                                                       NewData),
                                                           continue;
                                                       _Err ->
                                                           logger:error("合并~w时失败:~w",
                                                                        [DetsName,
                                                                         _Err],
                                                                        merge_util,
                                                                        162),
                                                           {done, false}
                                                   end;
                                               false ->
                                                   dets:insert(DetsName, Data),
                                                   continue
                                           end
                                   end)
             end,
    dets:close(DetsFlag),
    case Return of
        [] ->
            do_dets_merge_other(T,
                                DetsName,
                                DetsStrName,
                                DetsFileName,
                                DetsType,
                                DetsKeyPos,
                                ConvertFun);
        _ ->
            throw({error,
                   PlatformZone,
                   util:flist("合并~w失败", [DetsName])})
    end.

handle_convert_fun(undefined) ->
    {undefined, undefined, undefined};
handle_convert_fun(Convert) when is_function(Convert) ->
    {undefined, Convert, undefined};
handle_convert_fun({InitFun, ConvertFun, EndFun}) ->
    {InitFun, ConvertFun, EndFun}.

convert_fun(Fun, Data, MergeServer) ->
    case erlang:is_function(Fun, 1) of
        true -> handle_fun({Fun, [Data]});
        false -> handle_fun({Fun, [Data, MergeServer]})
    end.

handle_fun(undefined) -> handle_fun_rtn(ok, undefined);
handle_fun(Fun) when is_function(Fun) ->
    handle_fun_rtn(catch Fun(), Fun);
handle_fun(Fun = {F, A})
    when is_function(F) andalso is_list(A) ->
    case catch erlang:is_function(F, length(A)) of
        true -> handle_fun_rtn(catch erlang:apply(F, A), Fun);
        Err ->
            logger:error("未知的函数调用:~w, Err:~w",
                         [Fun, Err],
                         merge_util,
                         208),
            {false, "未知的函数调用"}
    end;
handle_fun(Fun = {Mod, F, A}) when is_list(A) ->
    case catch erlang:function_exported(Mod, F, length(A))
        of
        true ->
            handle_fun_rtn(catch erlang:apply(Mod, F, A), Fun);
        Err ->
            logger:error("未知的函数调用:~w, Err:~w",
                         [Fun, Err],
                         merge_util,
                         216),
            {false, "未知的函数调用"}
    end;
handle_fun(Unknow) ->
    logger:error("未知的函数调用:~w", [Unknow], merge_util, 220),
    {false, "未知的函数调用"}.

handle_fun_rtn(ok, _Fun) -> ok;
handle_fun_rtn({ok, Rtn}, _Fun) -> {ok, Rtn};
handle_fun_rtn(Unknow, Fun) ->
    logger:error("执行~w时得到错误的返回:~w",
                 [Fun, Unknow],
                 merge_util,
                 228),
    {false, "错误的返回"}.

