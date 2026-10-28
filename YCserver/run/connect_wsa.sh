#!/bin/bash
ROOT=$(cd "$(dirname "$0")/../.." && pwd)
ADB="$ROOT/tools/platform-tools/adb.exe"
"$ADB" connect 127.0.0.1:58526
"$ADB" reverse tcp:8001 tcp:8001
"$ADB" reverse tcp:8081 tcp:8081
"$ADB" reverse --list
