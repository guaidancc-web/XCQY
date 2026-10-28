-file("src/lib/beam.erl", 1).

-module(beam).

-export([record_attrs/1, beam_to_source/1]).

record_attrs(Beam) ->
    {ok,
     {_Mod,
      [{abstract_code, {_Version, Forms}}, {"CInf", _CB}]}} =
        beam_lib:chunks(code:which(Beam),
                        [abstract_code, "CInf"]),
    [join_name_field(D)
     || {attribute, _, record, D} <- Forms].

beam_to_source(Beam) ->
    {ok, {_, [{abstract_code, {_, AC}}]}} =
        beam_lib:chunks(code:which(Beam), [abstract_code]),
    io:format("~ts~n",
              [erl_prettypr:format(erl_syntax:form_list(AC))]).

join_name_field({Name, Fs}) ->
    {Name, [element(3, element(3, F)) || F <- Fs]}.

