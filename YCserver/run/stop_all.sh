#!/bin/bash
ROOT=$(cd "$(dirname "$0")/../.." && pwd)
taskkill //F //IM erl.exe >/dev/null 2>&1
"$ROOT/tmp/mariadb/mariadb-10.6.28-winx64/bin/mysqladmin.exe" -uroot -p123456 -h127.0.0.1 shutdown >/dev/null 2>&1
pid=$(netstat -ano | grep LISTENING | grep ':8081' | awk '{print $5}' | head -1)
if [ -n "$pid" ]; then
  taskkill //PID "$pid" //F >/dev/null 2>&1
fi
echo "stopped: erlang nodes, mariadb, http"
