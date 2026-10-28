-file("src/lib/flume/thrift_source_protocol_thrift.erl",
      1).

-module(thrift_source_protocol_thrift).

-behaviour(thrift_service).

-file("inc/thrift_source_protocol_thrift.hrl", 1).

-file("inc/flume_types.hrl", 1).

-record('ThriftFlumeEvent',
        {headers = #{} :: #{},
         body :: undefined | string() | binary()}).

-type 'ThriftFlumeEvent'() :: #'ThriftFlumeEvent'{}.

-file("inc/thrift_source_protocol_thrift.hrl", 4).

-file("src/lib/flume/thrift_source_protocol_thrift.erl",
      12).

-export([struct_info/1,
         function_info/2,
         function_names/0]).

struct_info(_) -> erlang:error(function_clause).

function_info(append, params_type) ->
    {struct,
     [{1, {struct, {flume_types, 'ThriftFlumeEvent'}}}]};
function_info(append, reply_type) -> i32;
function_info(append, exceptions) -> {struct, []};
function_info(appendBatch, params_type) ->
    {struct,
     [{1,
       {list, {struct, {flume_types, 'ThriftFlumeEvent'}}}}]};
function_info(appendBatch, reply_type) -> i32;
function_info(appendBatch, exceptions) -> {struct, []};
function_info(_Func, _Info) ->
    erlang:error(function_clause).

function_names() -> [append, appendBatch].

