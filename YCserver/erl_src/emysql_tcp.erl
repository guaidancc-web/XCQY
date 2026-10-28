-file("src/lib/emysql/emysql_tcp.erl", 1).

-module(emysql_tcp).

-export([send_and_recv_packet/3,
         recv_packet/1,
         response/2]).

-file("inc/emysql.hrl", 1).

-record(pool,
        {pool_id,
         user,
         password,
         host,
         port,
         database,
         encoding,
         available = queue:new(),
         locked = gb_trees:empty(),
         waiting = queue:new(),
         max_conn_num = 0,
         min_conn_num = 0}).

-record(emysql_connection,
        {id,
         pool_id,
         encoding,
         socket,
         version,
         thread_id,
         caps,
         language,
         prepared = gb_trees:empty(),
         locked_at,
         alive = true}).

-record(greeting,
        {protocol_version,
         server_version,
         thread_id,
         salt1,
         salt2,
         caps,
         caps_high,
         language,
         status,
         seq_num,
         plugin}).

-record(field,
        {seq_num,
         catalog,
         db,
         table,
         org_table,
         name,
         org_name,
         type,
         default,
         charset_nr,
         length,
         flags,
         decimals}).

-record(packet, {size, seq_num, data}).

-record(ok_packet,
        {seq_num,
         affected_rows,
         insert_id,
         status,
         warning_count,
         msg}).

-record(error_packet, {seq_num, code, status, msg}).

-record(eof_packet, {seq_num, status, warning_count}).

-record(result_packet,
        {seq_num, field_list, rows, extra}).

-file("src/lib/emysql/emysql_tcp.erl", 32).

send_and_recv_packet(Sock, Packet, SeqNum) ->
    case gen_tcp:send(Sock,
                      <<(size(Packet)):24/little, SeqNum:8, Packet/binary>>)
        of
        ok -> ok;
        {error, Reason} ->
            exit({failed_to_send_packet_to_server, Reason})
    end,
    case response_list(Sock, 8) of
        [Record] -> Record;
        List -> List
    end.

response_list(_, 0) -> [];
response_list(Sock, 8) ->
    {Response, ServerStatus} = response(Sock,
                                        recv_packet(Sock)),
    [Response | response_list(Sock, ServerStatus band 8)].

recv_packet(Sock) ->
    {PacketLength, SeqNum} = recv_packet_header(Sock),
    Data = recv_packet_body(Sock, PacketLength),
    #packet{size = PacketLength, seq_num = SeqNum,
            data = Data}.

response(_Sock,
         #packet{seq_num = SeqNum, data = <<0:8, Rest/binary>>} =
             _Packet) ->
    {AffectedRows, Rest1} =
        emysql_util:length_coded_binary(Rest),
    {InsertId, Rest2} =
        emysql_util:length_coded_binary(Rest1),
    <<ServerStatus:16/little, WarningCount:16/little,
      Msg/binary>> =
        Rest2,
    {#ok_packet{seq_num = SeqNum,
                affected_rows = AffectedRows, insert_id = InsertId,
                status = ServerStatus, warning_count = WarningCount,
                msg = unicode:characters_to_list(Msg)},
     ServerStatus};
response(_Sock,
         #packet{seq_num = SeqNum, data = <<254:8>>} =
             _Packet) ->
    {#eof_packet{seq_num = SeqNum}, 0};
response(_Sock,
         #packet{seq_num = SeqNum,
                 data =
                     <<254:8, WarningCount:16/little,
                       ServerStatus:16/little>>} =
             _Packet) ->
    {#eof_packet{seq_num = SeqNum, status = ServerStatus,
                 warning_count = WarningCount},
     ServerStatus};
response(_Sock,
         #packet{seq_num = SeqNum,
                 data =
                     <<255:8, ErrNo:16/little, "#", SQLState:5/binary-unit:8,
                       Msg/binary>>} =
             _Packet) ->
    {#error_packet{seq_num = SeqNum, code = ErrNo,
                   status = SQLState, msg = binary_to_list(Msg)},
     0};
response(_Sock,
         #packet{seq_num = SeqNum,
                 data = <<255:8, ErrNo:16/little, Msg/binary>>} =
             _Packet) ->
    {#error_packet{seq_num = SeqNum, code = ErrNo,
                   status = 0, msg = binary_to_list(Msg)},
     0};
response(Sock,
         #packet{seq_num = SeqNum, data = Data} = _Packet) ->
    {FieldCount, Rest1} =
        emysql_util:length_coded_binary(Data),
    {Extra, _} = emysql_util:length_coded_binary(Rest1),
    {SeqNum1, FieldList} = recv_field_list(Sock,
                                           SeqNum + 1),
    if length(FieldList) =/= FieldCount ->
           exit(query_returned_incorrect_field_count);
       true -> ok
    end,
    {SeqNum2, Rows, ServerStatus} = recv_row_data(Sock,
                                                  FieldList,
                                                  SeqNum1 + 1),
    {#result_packet{seq_num = SeqNum2,
                    field_list = FieldList, rows = Rows, extra = Extra},
     ServerStatus}.

recv_packet_header(Sock) ->
    Timeout = emysql_app:default_timeout(),
    case gen_tcp:recv(Sock, 4, Timeout) of
        {ok,
         <<PacketLength:24/little-integer, SeqNum:8/integer>>} ->
            {PacketLength, SeqNum};
        {ok, Bin} when is_binary(Bin) ->
            exit({bad_packet_header_data, Bin});
        {error, Reason} ->
            exit({failed_to_recv_packet_header, Reason})
    end.

recv_packet_body(Sock, PacketLength) ->
    recv_packet_body(Sock, PacketLength, []).

recv_packet_body(Sock, PacketLength, Acc) ->
    Timeout = emysql_app:default_timeout(),
    if PacketLength > 1460 ->
           case gen_tcp:recv(Sock, 1460, Timeout) of
               {ok, Bin} ->
                   recv_packet_body(Sock,
                                    PacketLength - 1460,
                                    [Bin | Acc]);
               {error, Reason1} ->
                   exit({failed_to_recv_packet_body, Reason1})
           end;
       true ->
           case gen_tcp:recv(Sock, PacketLength, Timeout) of
               {ok, Bin} ->
                   iolist_to_binary(lists:reverse([Bin | Acc]));
               {error, Reason1} ->
                   exit({failed_to_recv_packet_body, Reason1})
           end
    end.

recv_field_list(Sock, SeqNum) ->
    recv_field_list(Sock, SeqNum, []).

recv_field_list(Sock, _SeqNum, Acc) ->
    case recv_packet(Sock) of
        #packet{seq_num = SeqNum1,
                data =
                    <<254, _WarningCount:16/little,
                      _ServerStatus:16/little>>} ->
            {SeqNum1, lists:reverse(Acc)};
        #packet{seq_num = SeqNum1, data = <<254, _/binary>>} ->
            {SeqNum1, lists:reverse(Acc)};
        #packet{seq_num = SeqNum1, data = Data} ->
            {Catalog, Rest2} =
                emysql_util:length_coded_string(Data),
            {Db, Rest3} = emysql_util:length_coded_string(Rest2),
            {Table, Rest4} = emysql_util:length_coded_string(Rest3),
            {OrgTable, Rest5} =
                emysql_util:length_coded_string(Rest4),
            {Name, Rest6} = emysql_util:length_coded_string(Rest5),
            {OrgName, Rest7} =
                emysql_util:length_coded_string(Rest6),
            <<_:1/binary, CharSetNr:16/little, Length:32/little,
              Rest8/binary>> =
                Rest7,
            <<Type:8/little, Flags:16/little, Decimals:8/little,
              _:2/binary, Rest9/binary>> =
                Rest8,
            {Default, _} = emysql_util:length_coded_binary(Rest9),
            Field = #field{seq_num = SeqNum1, catalog = Catalog,
                           db = Db, table = Table, org_table = OrgTable,
                           name = Name, org_name = OrgName, type = Type,
                           default = Default, charset_nr = CharSetNr,
                           length = Length, flags = Flags, decimals = Decimals},
            recv_field_list(Sock, SeqNum1, [Field | Acc])
    end.

recv_row_data(Sock, FieldList, SeqNum) ->
    recv_row_data(Sock, FieldList, SeqNum, []).

recv_row_data(Sock, FieldList, _SeqNum, Acc) ->
    case recv_packet(Sock) of
        #packet{seq_num = SeqNum1,
                data =
                    <<254, _WarningCount:16/little,
                      ServerStatus:16/little>>} ->
            {SeqNum1, lists:reverse(Acc), ServerStatus};
        #packet{seq_num = SeqNum1, data = <<254, _/binary>>} ->
            {SeqNum1, lists:reverse(Acc), 0};
        #packet{seq_num = SeqNum1, data = RowData} ->
            Row = decode_row_data(RowData, FieldList, []),
            recv_row_data(Sock, FieldList, SeqNum1, [Row | Acc])
    end.

decode_row_data(<<>>, [], Acc) -> lists:reverse(Acc);
decode_row_data(Bin, [Field | Rest], Acc) ->
    {Data, Tail} = emysql_util:length_coded_string(Bin),
    decode_row_data(Tail,
                    Rest,
                    [type_cast_row_data(Data, Field) | Acc]).

type_cast_row_data(undefined, _) -> undefined;
type_cast_row_data(Data, #field{type = Type})
    when Type == 15; Type == 253; Type == 254 ->
    unicode:characters_to_list(Data);
type_cast_row_data(Data, #field{type = Type})
    when Type == 249;
         Type == 250;
         Type == 251;
         Type == 252 ->
    Data;
type_cast_row_data(Data, #field{type = Type})
    when Type == 1;
         Type == 2;
         Type == 3;
         Type == 8;
         Type == 9;
         Type == 13 ->
    list_to_integer(binary_to_list(Data));
type_cast_row_data(Data,
                   #field{type = Type, decimals = _Decimals})
    when Type == 0; Type == 246; Type == 4; Type == 5 ->
    {ok, [Num], _Leftovers} = case io_lib:fread("~f",
                                                binary_to_list(Data))
                                  of
                                  {error, _} ->
                                      case io_lib:fread("~d",
                                                        binary_to_list(Data))
                                          of
                                          {ok, [_], []} = Res -> Res;
                                          {ok, [X], E} ->
                                              io_lib:fread("~f",
                                                           lists:flatten(io_lib:format("~w~s~s",
                                                                                       [X,
                                                                                        ".0",
                                                                                        E])))
                                      end;
                                  Res -> Res
                              end,
    Num;
type_cast_row_data(Data, #field{type = Type})
    when Type == 10 ->
    case io_lib:fread("~d-~d-~d", binary_to_list(Data)) of
        {ok, [Year, Month, Day], _} ->
            {date, {Year, Month, Day}};
        {error, _} -> binary_to_list(Data);
        _ -> exit({error, bad_date})
    end;
type_cast_row_data(Data, #field{type = Type})
    when Type == 11 ->
    case io_lib:fread("~d:~d:~d", binary_to_list(Data)) of
        {ok, [Hour, Minute, Second], _} ->
            {time, {Hour, Minute, Second}};
        {error, _} -> binary_to_list(Data);
        _ -> exit({error, bad_time})
    end;
type_cast_row_data(Data, #field{type = Type})
    when Type == 7; Type == 12 ->
    case io_lib:fread("~d-~d-~d ~d:~d:~d",
                      binary_to_list(Data))
        of
        {ok, [Year, Month, Day, Hour, Minute, Second], _} ->
            {datetime,
             {{Year, Month, Day}, {Hour, Minute, Second}}};
        {error, _} -> binary_to_list(Data);
        _ -> exit({error, datetime})
    end;
type_cast_row_data(Data, #field{type = Type})
    when Type == 16 ->
    case Data of
        <<1>> -> 1;
        <<0>> -> 0
    end;
type_cast_row_data(Data, _) -> Data.

