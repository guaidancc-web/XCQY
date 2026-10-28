-file("src/lib/thrift/thrift_processor.erl", 1).

-module(thrift_processor).

-export([init/1]).

-file("inc/thrift_constants.hrl", 1).

-record('TApplicationException', {message, type}).

-file("src/lib/thrift/thrift_processor.erl", 25).

-file("inc/thrift_protocol.hrl", 1).

-record(protocol_message_begin, {name, type, seqid}).

-record(protocol_struct_begin, {name}).

-record(protocol_field_begin, {name, type, id}).

-record(protocol_map_begin, {ktype, vtype, size}).

-record(protocol_list_begin, {etype, size}).

-record(protocol_set_begin, {etype, size}).

-type tprot_header_val() :: #protocol_message_begin{} |
                            #protocol_struct_begin{} |
                            #protocol_field_begin{} |
                            #protocol_map_begin{} |
                            #protocol_list_begin{} |
                            #protocol_set_begin{}.

-type tprot_empty_tag() :: message_end |
                           struct_begin |
                           struct_end |
                           field_end |
                           map_end |
                           list_end |
                           set_end.

-type tprot_header_tag() :: message_begin |
                            field_begin |
                            map_begin |
                            list_begin |
                            set_begin.

-type tprot_data_tag() :: ui32 |
                          bool |
                          byte |
                          i16 |
                          i32 |
                          i64 |
                          double |
                          string.

-type tprot_cont_tag() :: {list, _Type} |
                          {map, _KType, _VType} |
                          {set, _Type}.

-file("src/lib/thrift/thrift_processor.erl", 26).

-record(thrift_processor, {handler, protocol, service}).

init({_Server, ProtoGen, Service, Handler})
    when is_function(ProtoGen, 0) ->
    {ok, Proto} = ProtoGen(),
    loop(#thrift_processor{protocol = Proto,
                           service = Service, handler = Handler}).

loop(State0 = #thrift_processor{protocol = Proto0,
                                handler = Handler, service = Service}) ->
    {Proto1, MessageBegin} = thrift_protocol:read(Proto0,
                                                  message_begin),
    State1 = State0#thrift_processor{protocol = Proto1},
    ErrorHandler = fun (HandlerModules)
                           when is_list(HandlerModules) ->
                           thrift_multiplexed_map_wrapper:fetch("error_handler",
                                                                HandlerModules);
                       (HandlerModule) -> HandlerModule
                   end,
    case MessageBegin of
        #protocol_message_begin{name = Function, type = Type,
                                seqid = Seqid}
            when Type =:= 1; Type =:= 4 ->
            case string:tokens(Function, ":") of
                [ServiceName, FunctionName] ->
                    ServiceModule =
                        thrift_multiplexed_map_wrapper:fetch(ServiceName,
                                                             Service),
                    ServiceHandler =
                        thrift_multiplexed_map_wrapper:fetch(ServiceName,
                                                             Handler),
                    case handle_function(State1#thrift_processor{service =
                                                                     ServiceModule,
                                                                 handler =
                                                                     ServiceHandler},
                                         list_to_atom(FunctionName),
                                         Seqid)
                        of
                        {State2, ok} ->
                            loop(State2#thrift_processor{service = Service,
                                                         handler = Handler});
                        {_State2, {error, Reason}} ->
                            apply(ErrorHandler(Handler),
                                  handle_error,
                                  [list_to_atom(Function), Reason]),
                            thrift_protocol:close_transport(Proto1),
                            ok
                    end;
                _ ->
                    case handle_function(State1,
                                         list_to_atom(Function),
                                         Seqid)
                        of
                        {State2, ok} -> loop(State2);
                        {_State2, {error, Reason}} ->
                            apply(ErrorHandler(Handler),
                                  handle_error,
                                  [list_to_atom(Function), Reason]),
                            thrift_protocol:close_transport(Proto1),
                            ok
                    end
            end;
        {error, timeout = Reason} ->
            apply(ErrorHandler(Handler),
                  handle_error,
                  [undefined, Reason]),
            thrift_protocol:close_transport(Proto1),
            ok;
        {error, closed = Reason} ->
            apply(ErrorHandler(Handler),
                  handle_error,
                  [undefined, Reason]),
            thrift_protocol:close_transport(Proto1),
            exit(shutdown);
        {error, Reason} ->
            apply(ErrorHandler(Handler),
                  handle_error,
                  [undefined, Reason]),
            thrift_protocol:close_transport(Proto1),
            exit(shutdown)
    end.

handle_function(State0 = #thrift_processor{protocol =
                                               Proto0,
                                           handler = Handler,
                                           service = Service},
                Function, Seqid) ->
    InParams = Service:function_info(Function, params_type),
    {Proto1, {ok, Params}} = thrift_protocol:read(Proto0,
                                                  InParams),
    State1 = State0#thrift_processor{protocol = Proto1},
    try Result = Handler:handle_function(Function, Params),
        handle_success(State1, Function, Result, Seqid)
    catch
        Type:Data when Type =:= throw orelse Type =:= error ->
            handle_function_catch(State1,
                                  Function,
                                  Type,
                                  Data,
                                  Seqid)
    end.

handle_function_catch(State = #thrift_processor{service
                                                    = Service},
                      Function, ErrType, ErrData, Seqid) ->
    IsOneway = Service:function_info(Function, reply_type)
                   =:= oneway_void,
    case {ErrType, ErrData} of
        _ when IsOneway ->
            Stack = erlang:get_stacktrace(),
            error_logger:warning_msg("oneway void ~p threw error which must "
                                     "be ignored: ~p",
                                     [Function, {ErrType, ErrData, Stack}]),
            {State, ok};
        {throw, Exception}
            when is_tuple(Exception), size(Exception) > 0 ->
            handle_exception(State, Function, Exception, Seqid);
        {error, Error} ->
            handle_error(State, Function, Error, Seqid)
    end.

handle_success(State = #thrift_processor{service =
                                             Service},
               Function, Result, Seqid) ->
    ReplyType = Service:function_info(Function, reply_type),
    StructName = atom_to_list(Function) ++ "_result",
    case Result of
        {reply, ReplyData} ->
            Reply = {{struct, [{0, ReplyType}]},
                     {StructName, ReplyData}},
            send_reply(State, Function, 2, Reply, Seqid);
        ok when ReplyType == {struct, []} ->
            send_reply(State,
                       Function,
                       2,
                       {ReplyType, {StructName}},
                       Seqid);
        ok when ReplyType == oneway_void -> {State, ok}
    end.

handle_exception(State = #thrift_processor{service =
                                               Service},
                 Function, Exception, Seqid) ->
    ExceptionType = element(1, Exception),
    ReplySpec = Service:function_info(Function, exceptions),
    {struct, XInfo} = ReplySpec,
    true = is_list(XInfo),
    ExceptionList = [case Type of
                         ExceptionType -> Exception;
                         _ -> undefined
                     end
                     || {_Fid, {struct, {_Module, Type}}} <- XInfo],
    ExceptionTuple = list_to_tuple([Function
                                    | ExceptionList]),
    case lists:all(fun (X) -> X =:= undefined end,
                   ExceptionList)
        of
        true ->
            handle_unknown_exception(State,
                                     Function,
                                     Exception,
                                     Seqid);
        false ->
            send_reply(State,
                       Function,
                       2,
                       {ReplySpec, ExceptionTuple},
                       Seqid)
    end.

handle_unknown_exception(State, Function, Exception,
                         Seqid) ->
    handle_error(State,
                 Function,
                 {exception_not_declared_as_thrown, Exception},
                 Seqid).

handle_error(State, Function, Error, Seqid) ->
    Stack = erlang:get_stacktrace(),
    error_logger:error_msg("~p had an error: ~p~n",
                           [Function, {Error, Stack}]),
    Message = case application:get_env(thrift,
                                       exceptions_include_traces)
                  of
                  {ok, true} ->
                      lists:flatten(io_lib:format("An error occurred: ~p~n",
                                                  [{Error, Stack}]));
                  _ -> "An unknown handler error occurred."
              end,
    Reply = {{struct, [{1, string}, {2, i32}]},
             #'TApplicationException'{message = Message, type = 0}},
    send_reply(State, Function, 3, Reply, Seqid).

send_reply(State = #thrift_processor{protocol = Proto0},
           Function, ReplyMessageType, Reply, Seqid) ->
    try {Proto1, ok} = thrift_protocol:write(Proto0,
                                             #protocol_message_begin{name =
                                                                         atom_to_list(Function),
                                                                     type =
                                                                         ReplyMessageType,
                                                                     seqid =
                                                                         Seqid}),
        {Proto2, ok} = thrift_protocol:write(Proto1, Reply),
        {Proto3, ok} = thrift_protocol:write(Proto2,
                                             message_end),
        {Proto4, ok} = thrift_protocol:flush_transport(Proto3),
        {State#thrift_processor{protocol = Proto4}, ok}
    catch
        error:{badmatch, {_, {error, _} = Error}} ->
            {State, Error}
    end.

