-file("src/lib/thrift/thrift_multiplexed_protocol.erl",
      1).

-module(thrift_multiplexed_protocol).

-behaviour(thrift_protocol).

-file("inc/thrift_constants.hrl", 1).

-record('TApplicationException', {message, type}).

-file("src/lib/thrift/thrift_multiplexed_protocol.erl",
      25).

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

-file("src/lib/thrift/thrift_multiplexed_protocol.erl",
      26).

-file("inc/thrift_protocol_behaviour.hrl", 1).

-spec flush_transport(state()) -> {state(),
                                   ok | {error, _Reason}}.

-spec close_transport(state()) -> {state(),
                                   ok | {error, _Reason}}.

-spec write(state(), any()) -> {state(),
                                ok | {error, _Reason}}.

-spec read(state(), tprot_empty_tag()) -> {state(),
                                           ok | {error, _Reason}};
          (state(), tprot_header_tag()) -> {state(),
                                            tprot_header_val() |
                                            {error, _Reason}};
          (state(), tprot_data_tag()) -> {state(),
                                          {ok, any()} | {error, _Reason}}.

-file("src/lib/thrift/thrift_multiplexed_protocol.erl",
      28).

-export([new/2,
         read/2,
         write/2,
         flush_transport/1,
         close_transport/1]).

-record(protocol, {module, data}).

-type protocol() :: #protocol{}.

-record(multiplexed_protocol,
        {protocol_module_to_decorate :: undefined | atom(),
         protocol_data_to_decorate :: undefined | term(),
         service_name :: undefined | nonempty_string()}).

-type state() :: #multiplexed_protocol{}.

-spec new(ProtocolToDecorate :: protocol(),
          ServiceName :: nonempty_string()) -> {ok,
                                                Protocol :: protocol()}.

new(ProtocolToDecorate, ServiceName)
    when is_record(ProtocolToDecorate, protocol),
         is_list(ServiceName) ->
    State =
        #multiplexed_protocol{protocol_module_to_decorate =
                                  ProtocolToDecorate#protocol.module,
                              protocol_data_to_decorate =
                                  ProtocolToDecorate#protocol.data,
                              service_name = ServiceName},
    thrift_protocol:new(thrift_multiplexed_protocol, State).

flush_transport(State =
                    #multiplexed_protocol{protocol_module_to_decorate =
                                              ProtocolModuleToDecorate,
                                          protocol_data_to_decorate =
                                              State0}) ->
    {State1, ok} =
        ProtocolModuleToDecorate:flush_transport(State0),
    {State#multiplexed_protocol{protocol_data_to_decorate =
                                    State1},
     ok}.

close_transport(State =
                    #multiplexed_protocol{protocol_module_to_decorate =
                                              ProtocolModuleToDecorate,
                                          protocol_data_to_decorate =
                                              State0}) ->
    {State1, ok} =
        ProtocolModuleToDecorate:close_transport(State0),
    {State#multiplexed_protocol{protocol_data_to_decorate =
                                    State1},
     ok}.

write(State =
          #multiplexed_protocol{protocol_module_to_decorate =
                                    ProtocolModuleToDecorate,
                                protocol_data_to_decorate = State0,
                                service_name = ServiceName},
      Message = #protocol_message_begin{name = Name}) ->
    {State1, ok} = ProtocolModuleToDecorate:write(State0,
                                                  Message#protocol_message_begin{name
                                                                                     =
                                                                                     ServiceName
                                                                                         ++
                                                                                         ":"
                                                                                             ++
                                                                                             Name}),
    {State#multiplexed_protocol{protocol_data_to_decorate =
                                    State1},
     ok};
write(State =
          #multiplexed_protocol{protocol_module_to_decorate =
                                    ProtocolModuleToDecorate,
                                protocol_data_to_decorate = State0},
      Message) ->
    {State1, ok} = ProtocolModuleToDecorate:write(State0,
                                                  Message),
    {State#multiplexed_protocol{protocol_data_to_decorate =
                                    State1},
     ok}.

read(State =
         #multiplexed_protocol{protocol_module_to_decorate =
                                   ProtocolModuleToDecorate,
                               protocol_data_to_decorate = State0},
     Message) ->
    {State1, Result} = ProtocolModuleToDecorate:read(State0,
                                                     Message),
    {State#multiplexed_protocol{protocol_data_to_decorate =
                                    State1},
     Result}.

