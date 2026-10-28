-file("src/mod/over_seas/over_seas.erl", 1).

-module(over_seas).

-export([init/0]).

-file("inc/over_seas.hrl", 1).

-record(m_over_seas, {ver = 0}).

-file("src/mod/over_seas/over_seas.erl", 11).

init() -> #m_over_seas{}.

