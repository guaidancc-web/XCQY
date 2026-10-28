-file("src/lib/thrift/thrift_multiplexed_map_wrapper"
      ".erl",
      1).

-module(thrift_multiplexed_map_wrapper).

-export([new/0, store/3, find/2, fetch/2]).

-type service_handler() :: nonempty_string().

-type module_() :: atom().

-type service_handler_map() :: [{ServiceHandler ::
                                     service_handler(),
                                 Module :: module_()}].

-spec new() -> service_handler_map().

new() -> orddict:new().

-spec store(ServiceHandler, Module,
            Map) -> NewMap when ServiceHandler :: service_handler(),
                                Module :: module_(),
                                Map :: service_handler_map(),
                                NewMap :: service_handler_map().

store(ServiceHandler, Module, Map) ->
    orddict:store(ServiceHandler, Module, Map).

-spec find(ServiceHandler, Map) -> {ok, Module} |
                                   error when ServiceHandler ::
                                                  service_handler(),
                                              Module :: module_(),
                                              Map :: service_handler_map().

find(ServiceHandler, Map) ->
    orddict:find(ServiceHandler, Map).

-spec fetch(ServiceHandler,
            Map) -> Module when ServiceHandler :: service_handler(),
                                Module :: module_(),
                                Map :: service_handler_map().

fetch(ServiceHandler, Map) ->
    orddict:fetch(ServiceHandler, Map).

