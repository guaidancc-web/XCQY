#!/bin/bash
ROOT=$(cd "$(dirname "$0")/../.." && pwd)
ERL=$ROOT/tmp/erlang19/bin/erl.exe
EBIN=$ROOT/YCserver/data/server/ebin

start_node() {
  name=$1
  dir=$2
  type=$3
  cd "$ROOT/YCserver/run/$dir" || exit 1
  nohup "$ERL" +pc unicode -kernel inet_dist_listen_min 40001 -kernel inet_dist_listen_max 44000 +P 204800 -smp enable -hidden -pa "$EBIN" -sname "$name" -noshell -noinput -s main start -extra "$type" > "$ROOT/YCserver/run/$dir.out" 2>&1 &
  echo $! > "$ROOT/YCserver/run/$dir.pid"
  echo "started $name pid $!"
}

start_node fswy_dev_9000 center9000 center
sleep 3
start_node fswy_dev_9999 center9999 big_world
sleep 3
start_node fswy_dev_1 zone1 zone
sleep 1
start_node fswy_dev_2 zone2 zone
sleep 6
