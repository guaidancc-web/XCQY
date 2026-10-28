-module(save_roles).
-export([save_all/0]).

save_all() ->
    Nodes = ['fswy_dev_1@cll', 'fswy_dev_2@cll'],
    lists:foreach(fun save_node/1, Nodes),
    ok.

save_node(Node) ->
    case catch rpc:call(Node, role_query, all_cached_roles, [], 5000) of
        Caches when is_list(Caches) ->
            lists:foreach(fun(Cache) -> save_cache(Node, Cache) end, Caches);
        _ ->
            ok
    end.

save_cache(Node, Cache)
    when is_tuple(Cache), element(1, Cache) =:= role_cache ->
    case element(3, Cache) of
        Pid when is_pid(Pid) ->
            case catch rpc:call(Node, sys, get_state, [Pid], 5000) of
                Role when is_tuple(Role), element(1, Role) =:= role ->
                    catch rpc:call(Node, role_data, local_save, [to_db, Role], 10000),
                    ok;
                _ ->
                    ok
            end;
        _ ->
            ok
    end;
save_cache(_, _) ->
    ok.
