-file("src/mod/chat/chat_ver.erl", 1).

-module(chat_ver).

-export([do_sns_msg/1, do_sns_voice/1]).

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

-file("src/mod/chat/chat_ver.erl", 14).

do_sns_msg({TRid,
            TP,
            TZ,
            Rid,
            P,
            Z,
            Name,
            Face,
            Sex,
            Lev,
            Classes,
            GuildName,
            Msg}) ->
    Special = [],
    do_sns_msg({TRid,
                TP,
                TZ,
                Rid,
                P,
                Z,
                Name,
                Face,
                Sex,
                Lev,
                Classes,
                GuildName,
                Msg,
                Special});
do_sns_msg({TRid,
            TP,
            TZ,
            Rid,
            P,
            Z,
            Name,
            Face,
            Sex,
            Lev,
            Classes,
            GuildName,
            Msg,
            Special}) ->
    {TRid,
     TP,
     TZ,
     Rid,
     P,
     Z,
     Name,
     Face,
     Sex,
     Lev,
     Classes,
     GuildName,
     Msg,
     Special};
do_sns_msg(_) -> false.

do_sns_voice({Rid,
              P,
              Z,
              Name,
              Face,
              Sex,
              Lev,
              Classes,
              GuildName,
              CacheId,
              VoiceTime,
              VoiceText}) ->
    Special = [],
    do_sns_voice({Rid,
                  P,
                  Z,
                  Name,
                  Face,
                  Sex,
                  Lev,
                  Classes,
                  GuildName,
                  CacheId,
                  VoiceTime,
                  VoiceText,
                  Special});
do_sns_voice({Rid,
              P,
              Z,
              Name,
              Face,
              Sex,
              Lev,
              Classes,
              GuildName,
              CacheId,
              VoiceTime,
              VoiceText,
              Special}) ->
    {Rid,
     P,
     Z,
     Name,
     Face,
     Sex,
     Lev,
     Classes,
     GuildName,
     CacheId,
     VoiceTime,
     VoiceText,
     Special};
do_sns_voice(_) -> false.

