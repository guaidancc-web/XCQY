-file("src/lib/flume/flume_types.erl", 1).

-module(flume_types).

-file("inc/flume_types.hrl", 1).

-record('ThriftFlumeEvent',
        {headers = #{} :: #{},
         body :: undefined | string() | binary()}).

-type 'ThriftFlumeEvent'() :: #'ThriftFlumeEvent'{}.

-file("src/lib/flume/flume_types.erl", 10).

-export([struct_info/1,
         struct_info_ext/1,
         enum_info/1,
         enum_names/0,
         struct_names/0,
         exception_names/0]).

struct_info('ThriftFlumeEvent') ->
    {struct, [{1, {map, string, string}}, {2, string}]};
struct_info(_) -> erlang:error(function_clause).

struct_info_ext('ThriftFlumeEvent') ->
    {struct,
     [{1, required, {map, string, string}, headers, #{}},
      {2, required, string, body, undefined}]};
struct_info_ext(_) -> erlang:error(function_clause).

struct_names() -> ['ThriftFlumeEvent'].

enum_info('Status') ->
    [{'OK', 0},
     {'FAILED', 1},
     {'ERROR', 2},
     {'UNKNOWN', 3}];
enum_info(_) -> erlang:error(function_clause).

enum_names() -> ['Status'].

exception_names() -> [].

