#!/bin/bash
ROOT=$(cd "$(dirname "$0")/../.." && pwd)
cd "$ROOT/local_server" || exit 1
ENABLE_TCP=0 HTTP_PORT=8081 PUBLIC_HOST=127.0.0.1 nohup python server.py > "$ROOT/YCserver/run/http.log" 2>&1 &
echo $! > "$ROOT/YCserver/run/http.pid"
echo "http started pid $!"
