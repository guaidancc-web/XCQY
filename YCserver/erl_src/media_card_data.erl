-file("src/data/media_card_data.erl", 1).

-module(media_card_data).

-export([list_all/0, get_card/1]).

list_all() -> ["XCQY8888"].

get_card("XCQY8888") ->
    #{card_num => "XCQY8888",
      reward => [{20034, 3}, {20052, 5}, {90000, 500000}],
      limit_plat => [12], start_time => 1583683200,
      end_time => 1593532799};
get_card(_) -> false.

