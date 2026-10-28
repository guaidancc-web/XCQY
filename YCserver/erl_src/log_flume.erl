-file("src/lib/log_flume.erl", 1).

-module(log_flume).

-export([test/0, submit_test/0]).

-export([init/0, submit/2, submit/1, close/1]).

-file("inc/thrift_constants.hrl", 1).

-record('TApplicationException', {message, type}).

-file("src/lib/log_flume.erl", 16).

-file("inc/flume_types.hrl", 1).

-record('ThriftFlumeEvent',
        {headers = #{} :: #{},
         body :: undefined | string() | binary()}).

-type 'ThriftFlumeEvent'() :: #'ThriftFlumeEvent'{}.

-file("src/lib/log_flume.erl", 17).

init() ->
    {FlumeHost, FlumePort, FlumeHost2, FlumePort2} = case
                                                         env:get(flume_host_group)
                                                         of
                                                         1 ->
                                                             {"flume.cloudera.shiyuegame.com",
                                                              60000,
                                                              "flume.cloudera.shiyuegame.com",
                                                              60000};
                                                         2 ->
                                                             {"flume.cloudera.shiyuegame.com",
                                                              60000,
                                                              "flume.cloudera.shiyuegame.com",
                                                              60000};
                                                         _ ->
                                                             {"flume.game.shiyuegame.com",
                                                              60000,
                                                              "192.168.1.110",
                                                              60000}
                                                     end,
    case thrift_client_util:new(FlumeHost,
                                FlumePort,
                                thrift_source_protocol_thrift,
                                [{protocol, compact},
                                 {framed, true},
                                 {connect_timeout, 5000},
                                 {recv_timeout, 30000}])
        of
        {ok, C1} -> {ok, C1};
        _ ->
            thrift_client_util:new(FlumeHost2,
                                   FlumePort2,
                                   thrift_source_protocol_thrift,
                                   [{protocol, compact},
                                    {framed, true},
                                    {connect_timeout, 5000},
                                    {recv_timeout, 30000}])
    end.

submit(Client, Logs) ->
    Events = [#'ThriftFlumeEvent'{headers =
                                      #{"type" => Type},
                                  body =
                                      unicode:characters_to_binary(json:encode({struct,
                                                                                maps:to_list(Log)}))}
              || Log = #{"header_type" := Type} <- Logs],
    catch thrift_client:call(Client, appendBatch, [Events]).

submit(Logs) ->
    case init() of
        {ok, C0} -> submit(C0, Logs);
        Else -> Else
    end.

close(undefined) -> ok;
close(C0) -> thrift_client:close(C0).

-file("/usr/local/lib/erlang/lib/eunit-2.2.7/include"
      "/eunit.hrl",
      1).

-file("src/lib/log_flume.erl", 67).

submit_test() ->
    {ok, Client} = init(),
    A = #{"account_id" => <<"22">>,
          "career" => <<230, 136, 152, 229, 188, 147>>,
          "channel_name" => 0, "chr_id" => 1, "chr_level" => 1,
          "chr_name" => <<"中文"/utf8>>,
          "date_time" => <<"2017-5-24 2017:5:24">>,
          "device_id" => <<"virtual_1486264380_3058"/utf8>>,
          "device_type" => 0, "gameserver_no" => 1,
          "gender" => <<231, 148, 183>>, "ip" => <<"127.0.0.1">>,
          "log_id" => 13, "platform_name" => <<"local">>,
          "product_name" => <<"xiuxian">>,
          "session_id" => <<"1local1_1495596366"/utf8>>,
          "type" => <<"logout">>},
    #{"type" := Type} = A,
    Event = #'ThriftFlumeEvent'{headers = #{"type" => Type},
                                body =
                                    unicode:characters_to_binary(json:encode({struct,
                                                                              maps:to_list(A)}))},
    catch thrift_client:call(Client, append, [Event]).


test() -> eunit:test(log_flume).