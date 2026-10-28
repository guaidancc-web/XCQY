#!/bin/bash
cd /data/zone/fswy_dev_9999
ulimit -SHn 102400
erl +pc unicode -kernel inet_dist_listen_min 40001 -kernel inet_dist_listen_max 44000 +P 204800 +K true -smp enable -hidden -pa /data/server/ebin -name fswy_dev_9999@42.192.118.16 -s main start -extra big_world
