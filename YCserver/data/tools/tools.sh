#!/usr/bin/env bash
#-------------------------------------------------
# 公共开发工具
# @author yeahoo2000@gmail.com
#-------------------------------------------------
if [ "" == "$ROOT" ]; then
    echo -e "\e[91m>>\e[0;0m 此脚本必须通过tools/dev.sh调用才能正常工作"
    exit 1
fi

# 生成配置文件模板
DOC[gen_cfg]="生成配置文件模板"
fun_gen_cfg(){
    local file=$ROOT/cfg.ini
    if [ -f $file ]; then
        read -p "[93m=> 配置文件已经存在，是否生成新文件并覆盖它？[0;0m[y/n]" choice
        if [[ $choice != "y" ]]; then
            exit 0
        fi
    fi
    cat > $file <<EOF
[default]
;=== 公共配置 ==========================================
; 游戏代号
GAME_CODE=fswy

;=== 服务端配置(如不需要，无需理会) ==========================
; 域名
HOST=fswy.dev
; erl执行程序所在路径
ERL=erl
; erlang节点通讯cookie
ERL_COOKIE=6bc1t325xjo21c1
; erl节点间连接端口范围
ERL_PORT_MIN=40001
; erl节点间连接端口范围
ERL_PORT_MAX=44000
; erl文件编译参数
ERL_MAKE_PARAM="{d, dbg_tester}, {d, debug}, {d, disable_auth}, {d, enable_gm_cmd}"
; 游戏节点对外端口偏移，例：如果设为8000，区号为10的节点端口为8000+10
PORT_OFFSET=8000
; 数据库配置
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASS=123456
; oms数据库名
OMS_DB_NAME="mgame_center_80000"

; 如果在cygwin下工作请设置以下两个变量
; ROOT=d:/wy.dev
; ZONE_BASE=d:/wy.dev/zone
; DOCS="d:/fswy.dev/docs/配置文件"

;=== AndroidApi相关配置(如不需要，无需理会) ==========================
; 项目ID
PROJECT_ID=AndroidApi
; 应用ID
APP_ID=com.shiyuegame.fswy

;=== 客户端配置(如不需要，无需理会) ==========================
;unity安装目录
;UNITY=C:/Program\ Files\ \(x86\)/Unity/Editor/Unity.exe
UNITY=/Applications/Unity/Unity.app/Contents/MacOS/Unity
;应用名称
APP_NAME=fswy
EOF

    INFO "已经生成配置文件: $file"
}

DOC[unity]="打开新的UnityEditor"
fun_unity(){
    check_unity_editor
    local path=$1
    if [[ "" != "$path" ]] && [[ ! -d $path ]]; then
        ERR "unity项目目录不存在: ${path}"
        exit 1
    fi
    if [ "" == "$path" ]; then
        ${UNITY} -projectPath ./ &
    else
        path=$(realpath $path)
        ${UNITY} -projectPath ${path} &
    fi
}

DOC[pull]="更新所有的源码仓库"
fun_pull(){
    for v in ${ROOT}/*; do
        if [ -d $v/.git ]; then
            echo ---------------------------------------------
            INFO "正在更新源码库: \e[92m$(basename $v)\e[0;0m"
            echo ---------------------------------------------
            cd $v && git pull
        elif [ -d $v/.svn ]; then
            echo ---------------------------------------------
            INFO "正在更新源码库: \e[92m$(basename $v)\e[0;0m"
            echo ---------------------------------------------
            cd $v && svn update
        fi
    done
}

DOC[status]="查看所有源码仓库的状态信息"
fun_status(){
    for v in ${ROOT}/*; do
        if [ -d $v/.git ]; then
            echo ---------------------------------------------
            INFO "源码库\e[92m$(basename $v)\e[0;0m的状态信息:"
            echo ---------------------------------------------
            cd $v && git status
        elif [ -d $v/.svn ]; then
            echo ---------------------------------------------
            INFO "源码库\e[92m$(basename $v)\e[0;0m的状态信息:"
            echo ---------------------------------------------
            cd $v && svn info
        fi
    done
}

DOC[make_logger]="编译Logger.dll文件"
fun_make_logger(){
    local path=${ROOT}/tools/dll_builder
    cd $path || exit 1
    INFO "正在编译Logger.dll文件..."
    mcs -define:UNITY_WEBPLAYER -r:/Applications/Unity/Unity.app/Contents/Frameworks/Managed/UnityEngine.dll -t:library Logger.cs
    INFO "编译完成: ${path}/Logger.dll"
}

DOC[gen_proto]="生成协议相关文件"
fun_gen_proto(){
    INFO "正在生成协议相关文件..."
    home=${ROOT}/tools/gen_proto

    # 处理服务端生成
    if [ -d ${ROOT}/server ]; then
        if [ ! -d $home ]; then
            ERR "协议配置目录不存在"
        fi
        cd ${home}
        mkdir -p ebin
        mkdir -p ${home}/cli
        $ERL -noshell -pa "${ROOT}/tools/ebin" -pa "./ebin" -eval "make:all()" -eval "main:compile(all)" -s c q
    fi
    if [ -d ${ROOT}/data/lua ]; then
        INFO "data_protocol.lua 更新成功"
        cp -f ${ROOT}/tools/gen_proto/cli/data_protocol.lua ${ROOT}/data/lua
    fi
}

DOC[gen_map]="生成地图数据文件"
fun_gen_map(){
    INFO "正在生成地图数据文件..."
    # 处理服务端生成
    if [ -d ${ROOT}/server ]; then
        cd ${ROOT}/tools/gen_map
        $ERL -noshell -pa "${ROOT}/tools/ebin" -pa "./ebin" -eval "make:all(),main:make()" -s c q
    fi

    if [ ! -d ${ROOT}/data ]; then
        mkdir ${ROOT}/data
    fi
    if [ ! -d ${ROOT}/data/map ]; then
        mkdir ${ROOT}/data/map
    fi
    # 打包客户端使用的地图数据
    if [ -d ${ROOT}/resources ]; then
        mapdata="${ROOT}/docs/地图数据/客户端"
        if [ ! -d ${ROOT}/docs/地图数据/客户端 ]; then
            ERR "找不到地图数据目录: ${mapdata}"
            exit 1
        fi

        bin=${ROOT}/tools/bin/map.py
        if [ ! -f $bin ]; then
            ERR "找不到地图打包工具: $bin"
        fi

        cd $mapdata
        for file in *; do
            python $bin ${ROOT} $file
        done
    fi
    if [ -d ${ROOT}/data/lua ]; then
        INFO "data_map.lua 更新成功"
        mkdir -p ${ROOT}/data/lua
        cp -f ${ROOT}/tools/gen_map/cli/data_map.lua ${ROOT}/data/lua
    fi
}
