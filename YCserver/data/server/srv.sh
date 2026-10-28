#!/usr/bin/env bash
#-------------------------------------------------
# 服务端相关开发工具
# @author yeahoo2000@gmail.com
#-------------------------------------------------
if [ "" == "$ROOT" ]; then
    echo -e "\e[91m>>\e[0;0m 此脚本必须通过tools/dev.sh调用才能正常工作"
    exit 1
fi

## 多子进程控制
wait_pro(){
    pro_max=$1
    while [ $(jobs -l | wc -l) -ge $pro_max ]; do
        sleep 0.2
    done
}

## 编译指定模块 内部调用
make_mod(){
    path=$1
    if [ -d ${ROOT}/server/$path ]; then
        cd ${ROOT}/server/$path
        params="[debug_info,{hipe, [o3]},{i,\"${ROOT}/server/inc\"},{outdir,\"${ROOT}/server/ebin\"}, ${ERL_MAKE_PARAM}]"
        ${ERL} -pa ${ROOT}/server/ebin -noshell -eval "make:all(${params})" -s c q
    fi
}

# 检查并补全节点配置信息
# 调用前先定义关联数组cfg: declare -A cfg
check_node_cfg(){
    p=$1
    z=$2
    if [ "$p" = "" ] || [ "$z" = "" ]; then
        ERR "参数中需要带有平台标识和区号"
        exit 1
    fi
    if ! is_integer $z; then
        ERR "参数区号必须为小于100的整数"
        exit 1
    fi
    if [ "$z" = "9000" ]; then
        cfg[type]="center"
    elif [ "$z" = "9001" ]; then
        cfg[type]="center"
    elif [ "$z" = "9999" ]; then
        cfg[type]="big_world"
    else
        cfg[type]="zone"
    fi

    cfg[root]=${ZONE_BASE}/${GAME_CODE}_${p}_${z}
    cfg[code_path]="${ROOT}"
    cfg[nodename]="${GAME_CODE}_${p}_${z}@${HOST}"
    cfg[platform]=$p
    cfg[zone_id]=$z
    cfg[host]="${HOST}"
    cfg[port]=$(($PORT_OFFSET+$z))
    cfg[cookie]=${ERL_COOKIE}
    cfg[srv_key]="3vbz881dzoo21zb"
    cfg[zone_name]="${GAME_CODE}开发服${z}"
    cfg[lang]="zh_CN"
    cfg[fcm]="1"
    cfg[open_time]="1420713826"
    cfg[srv_open_time]="1420713826"
    cfg[srv_open_time_test]="0"
    cfg[need_cdkey]="0"
    cfg[merge_time]="0"
    cfg[open_time_test]="0"
    cfg[need_register]="0"
    cfg[website]="http://fswy.syg"
    cfg[ver]=""
    cfg[db_host]=$DB_HOST
    cfg[db_port]=$DB_PORT
    cfg[db_user]=$DB_USER
    cfg[db_pass]=$DB_PASS
    cfg[db_name]=${GAME_CODE}_${p}_${z}
    cfg[db_conn_min]=3
    cfg[db_conn_max]=9
    cfg[is_connect_center]=1
    cfg[center_node]="fswy_local_center_9000@fswy.dev"
    cfg[is_connect_big_world]=1
    cfg[big_world_node]="fswy_local_center_9999@fswy.dev"
    cfg[flume_host_group]=0
}

DOC[server_make]="编译服务端源码"
fun_server_make(){
    INFO "正在编译服务端源码，使用编译参数: \e[92m${ERL_MAKE_PARAM}\e[0;0m (编译参数可在\e[92mcfg.ini\e[0;0m中修改) ..."
    cd ${ROOT}/server || exit 1
    cp -f ${ROOT}/server/cbin/*.beam ${ROOT}/server/ebin/
    local start_time=$(date +%s)
    local paths=$(find src -type d -exec echo \ \ \ \ \ \ \ \ ,\'{}/*\' \;)
    cat > Emakefile <<EOF
{
	[
        'lang/*'
        ,'editor/*'
${paths}
	]
	,[
		{hipe, [o3]}
		%%,encrypt_debug_info
		,debug_info
		,{i, "inc"}
		,{outdir, "ebin"}

        | [${ERL_MAKE_PARAM}]
	]
}.
EOF
    ${ERL} -pa ebin -noshell -make
    INFO "编译服务端源码完成:$(expr `date +%s` - $start_time)"
}

DOC[server_pmake]="多进程编译服务器源码"
fun_server_pmake(){
    INFO "正在编译服务端源码，使用编译参数: \e[92m${ERL_MAKE_PARAM}\e[0;0m (编译参数可在\e[92mcfg.ini\e[0;0m中修改) ..."
    cd ${ROOT}/server || exit 1
    cp -f ${ROOT}/server/cbin ${ROOT}/server/ebin
    local start_time=$(date +%s)
    local paths=$(find src -type d)
    local paths=('lang' 'editor' $paths)
    local pro_max=6
    if $(in_cygwin); then
        pro_max=3
    fi
    for path in ${paths[@]}; do
        make_mod $path &
        wait_pro $pro_max
    done
    wait
    INFO "编译服务端源码完成:$(expr `date +%s` - $start_time)"
}

DOC[server_make_mod]="编译服务器模块, 参数:[mod]"
fun_server_make_mod(){
    INFO "正在编译服务器模块..."
    cd ${ROOT}/server || exit 1
    if [ "$1" = "src" ]; then
        local path="src"
    elif [ "$1" = "tester" ]; then
        local path="tester/src"
    elif [ -d ${ROOT}/server/src/$1 ]; then
        local path="src/$1"
    else
        local path="src/mod/$1"
    fi
    INFO "正在编译服务端源码[$path]，使用编译参数: \e[92m${ERL_MAKE_PARAM}\e[0;0m (编译参数可在\e[92mcfg.ini\e[0;0m中修改) ..."
    local start_time=$(date +%s)
    make_mod $path
    INFO "编译服务端源码完成:$(expr `date +%s` - $start_time)"
}

DOC[server_make_crypt]="编译加密服务器源码"
fun_server_make_crypt(){
    INFO "正在编译服务端源码，使用编译参数: \e[92m${ERL_MAKE_PARAM}\e[0;0m (编译参数可在\e[92mcfg.ini\e[0;0m中修改) ..."
    cd ${ROOT}/server || exit 1
    local paths=$(find src -type d -exec echo \ \ \ \ \ \ \ \ ,\'{}/*\' \;)
    cat > Emakefile <<EOF
{
	[
        'lang/*'
        ,'editor/*'
${paths}
	]
	,[
		{hipe, [o3]}
		,encrypt_debug_info
		,{i, "inc"}
		,{outdir, "ebin"}

        | [${ERL_MAKE_PARAM}]
	]
}.
EOF
    ${ERL} -noshell -make
    INFO "编译服务端源码完成"
}

DOC[server_xref_init]="生成检查代码配置, 参数:[平台] [区号]"
fun_server_xref_init(){
    INFO "正在进行生成代码检查配置..."
    declare -A cfg
    check_node_cfg $@
    cd ${cfg[root]} || exit 1
    pwd
    cat > xref.config <<EOF
[
    {xref, [
        {config, #{dirs => ["${cfg[code_path]}/server/ebin"]}}
        ,{checks, [ undefined_functions
                , undefined_function_calls
                , locals_not_used
                %%, exports_not_used
                , deprecated_function_calls
                , deprecated_functions
              ]}
        ,{xref_default, {verbose}}
        ]
    }
].
EOF
    INFO "生成代码检测配置文件完成"
}

DOC[server_make_tester]="编译服务端测试器"
fun_server_make_tester(){
    INFO "正在编译服务端测试器..."
    cd ${ROOT}/server/tester
    ${ERL} -noshell -make
}

DOC[server_pack]="打包服务端版本"
fun_server_pack(){
    local ver=$1
    local ver_s=${ver/%_*}
    if [ "" = "${ver_s}" ]; then
        INFO ">> [错误]输入的版本号无效"
        exit 1
    fi
    cd ${ROOT}/server
    # 编译并打包
    local PUB_DIR=${ROOT}/release/${ver_s}
    mkdir -p ${PUB_DIR}
    cd ${ROOT} # 需要在上一层操作
    rm -f ${PUB_DIR}/srv.tar.gz && tar zcf ${PUB_DIR}/srv.tar.gz server/ebin/*.beam server/tpl/* server/merge_tools/*
    cp server/tpl/ctl.sh ${PUB_DIR}/ctl.sh
    INFO ">> server打包完成，目标文件存放在:${PUB_DIR}/srv.tar.gz"
    rm -f ${PUB_DIR}/web.tar.gz && tar zcf ${PUB_DIR}/web.tar.gz web/*
    echo ">> web打包完成，目标文件存放在:${PUB_DIR}/web.tar.gz"
}

DOC[server_code_update]="更新指定物理机上的代码库"
fun_server_code_update(){
    local machine=$1
    local ver=$2
    local ver_s=${ver/%_*}

    eval "$(mysql_get_row "select * from oms_machine where id = '${machine}'")"
    if [ "${row['code_path']}" = "" ] || [ "${row['ip']}" = "" ]; then
        echo ">> [错误]无法获取物理机[$machine]的信息"
        return
    fi

    local files=( "srv.tar.gz" "web.tar.gz" )
    local path=${ROOT}/release/${ver_s}
    local f=""
    for v in ${files[@]}; do
        if [ ! -e ${path}/${v} ]; then
            echo ">> [错误]没有找到文件${path}/${v}，请检查是否已经准备好代码库"
            exit 1
        fi
        f="${f} ${path}/${v}"
    done

    echo ">> 正在更新物理机${machine}上的代码库到版本[$ver]:"
    ssh -p${row['ssh_port']} ${row['ssh_user']}@${row['ip_internal']} "mkdir -p ${row['code_path']}/${ver_s}"
    for v in ${files[@]}; do
        scp -P${row['ssh_port']} ${path}/${v} ${row['ssh_user']}@${row['ip_internal']}:${row['code_path']}/${ver_s}/
    done
    for v in ${files[@]}; do
        ssh -p${row['ssh_port']} ${row['ssh_user']}@${row['ip_internal']} "cd ${row['code_path']}/${ver_s}/ && tar zxf ${v} && rm -f ${v}"
    done
    echo ">> 物理机${machine}上的代码库已经更新，请确认是否有错误输出"
}

DOC[server_update_test]="安装或更新指定物理机上的代码库"
fun_server_update_test(){
    local ver=$1
    local ver_s=${ver/%_*}
    local files=( "srv.tar.gz" "web.tar.gz" )
    local path=${ROOT}/release/${ver_s}
    local f=""
    for v in ${files[@]}; do
        if [ ! -e ${path}/${v} ]; then
            echo ">> [错误]没有找到文件${path}/${v}，请检查是否已经准备好代码库"
            exit 1
        fi
        f="${f} ${path}/${v}"
    done
    echo ">> 正在更新测试服上的代码库到版本[$ver]:"
    local dst_path="/data/fswy_code"
    mkdir -p ${dst_path}/${ver_s}
    for v in ${files[@]}; do
        cp ${path}/${v} ${dst_path}/${ver_s}/
    done
    for v in ${files[@]}; do
        cd ${dst_path}/${ver_s}/ && tar zxf ${v} && rm -f ${v}
    done
    echo ">> 测试服上的代码库已经更新，请确认是否有错误输出"
}

fun_server_update_beta(){
    local ver=$1
    local ver_s=${ver/%_*}
    local files=( "srv.tar.gz" "web.tar.gz" )
    local path=${ROOT}/release/${ver_s}
    local f=""
    for v in ${files[@]}; do
        if [ ! -e ${path}/${v} ]; then
            echo ">> [错误]没有找到文件${path}/${v}，请检查是否已经准备好代码库"
            exit 1
        fi
        f="${f} ${path}/${v}"
    done
    echo ">> 正在更新线上测试服上的代码库到版本[$ver]:"
    local dst_path="/data/fswy_code"
    ssh -p2020 root@10.105.44.230 "mkdir -p ${dst_path}/${ver_s}"
    for v in ${files[@]}; do
        scp -P2020 ${path}/${v} root@10.105.44.230:${dst_path}/${ver_s}/
    done
    for v in ${files[@]}; do
        ssh -p2020 root@10.105.44.230 "cd ${dst_path}/${ver_s}/ && tar zxf ${v} && rm -f ${v}"
    done
    echo ">> 线上测试服上的代码库已经更新，请确认是否有错误输出"
}

DOC[server_make_and_update]="编译并热更新服务器，参数:[平台标识] [区号]"
fun_server_make_and_update(){
    INFO "正在编译并热更新服务器..."
    if $(in_cygwin); then
        ERR "cygwin下不支持此命令"
        exit
    fi
    declare -A cfg
    check_node_cfg $@
    cd ${cfg[root]}
    ${ERL} -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} -hidden -pa ${ROOT}/server/ebin -name make_and_update_${cfg[nodename]} -setcookie ${cfg[cookie]} -eval "rpc:call('${cfg[nodename]}', dev, m, [])" -s c q
}

DOC[server_update]="热更新服务器，参数:[平台标识] [区号]"
fun_server_update(){
    if $(in_cygwin); then
        ERR "cygwin下不支持此命令"
        exit
    fi
    declare -A cfg
    check_node_cfg $@
    cd ${cfg[root]}
    ${ERL} -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} -hidden -pa ${ROOT}/server/ebin -name update_${cfg[nodename]} -setcookie ${cfg[cookie]} -eval "rpc:call('${cfg[nodename]}', dev, u, [])" -s c q
}

DOC[server_install]="安装游戏节点，参数:[平台标识] [区号(0区表示中央服节点)]"
fun_server_install(){
    declare -A cfg
    check_node_cfg $@ # 检查并补全节点配置信息
    if [ -e ${cfg[root]} ]; then
        ERR "目标路径\e[92m${cfg[root]}\e[0;0m非空，无法执行安装过程"
        exit 1
    fi

    INFO "\e[93m准备安装游戏节点，请确认以下信息:\e[0;0m"
    INFO "  节点名称: \e[92m${cfg[nodename]}\e[0;0m"
    INFO "  安装路径: \e[92m${cfg[root]}\e[0;0m"
    INFO "  节点类型: \e[92m${cfg[type]}\e[0;0m"
    INFO "      域名: \e[92m${cfg[host]}\e[0;0m"
    INFO "      端口: \e[92m${cfg[port]}\e[0;0m"
    INFO "数据库地址: \e[92m${cfg[db_host]}\e[0;0m"
    INFO "数据库名称: \e[92m${cfg[db_name]}\e[0;0m"
    read -p "[93m=> 是否继续？[0;0m[y/n]" choice
    if [[ $choice != y ]]; then
        exit 0
    fi

    mkdir -p ${cfg[root]} && cd ${cfg[root]}

    INFO "正在处理配置文件..."
    # 处理模板
    local tpls=( 'env_zone.cfg' 'vhost.conf' 'emysql.app' 'main.app' 'env.php' 'zone.sql')
    for v in ${tpls[*]};do
        local file="${ROOT}/server/tpl/${v}"
        if [ ! -e $file ]; then
            ERR "找不到模板文件: ${file}"
            exit 1
        fi
        # 替换模板变量
        local lines=$(<"${file}")
        for k in ${!cfg[@]}; do
            lines=${lines//\{\{$k\}\}/${cfg[$k]}}
        done
        # 替换空变量并生成文件
        echo "${lines}" | sed -e "s/{{.*}}//" > ${v}
    done

    INFO "正在创建数据库..."
    mysql -h${cfg['db_host']} -P${cfg['db_port']} -u${cfg['db_user']} -p${cfg['db_pass']} -e"create database ${cfg['db_name']}"
    if [ $? -ne 0 ]; then
        ERR "创建数据库时发生异常"
        exit 1
    fi

    INFO "正在导入数据库结构..."
    mysql -h${cfg['db_host']} -P${cfg['db_port']} -u${cfg['db_user']} -p${cfg['db_pass']} -D${cfg['db_name']} -e"source ${cfg[root]}/zone.sql"
    if [ $? -ne 0 ]; then
        ERR "导入数据库表结构时发生异常"
        exit 1
    fi

    INFO "正在建立目录和文件..."
    mkdir -p dets var/sess log/pack log_file
    mv env_zone.cfg env.cfg
    ln -s ${ROOT}/web/www .
    ln -s ${ROOT}/server/srv.sh .
    rm -f zone.sql
    chmod -R 777 ${cfg['root']}/var
    INFO "节点安装完成"
}

DOC[server_uninstall]="删除游戏节点，参数:[平台标识] [区号] [角色数量]"
fun_server_uninstall(){
    local n=$3
    declare -A cfg
    check_node_cfg $@

    if [ ! -d ${cfg[root]}/dets ]; then
        ERR "目标路径\e[92m${cfg[root]}\e[0;0m不存在，或者不是游戏节点的安装目录，无法执行删除操作"
        exit 1
    fi

    if is_screen_exists ${cfg[nodename]}; then
        fun_server_stop ${cfg[platform]} ${cfg[zone_id]}
    fi

    local role_num=$(mysql -h${cfg['db_host']} -P${cfg['db_port']} -u${cfg['db_user']} -p${cfg['db_pass']} -D${cfg['db_name']} -ss -e"select count(*) from role")
    if [ $? -ne 0 ]; then
        ERR "访问数据库失败，无法获取角色数量"
        exit 1
    fi

    if [ "$role_num" != "" ] && [ "${role_num//[[:space:]]/}" = "${n//[[:space:]]/}" ]; then
        INFO "正在删除数据库..."
        mysql -h${cfg['db_host']} -P${cfg['db_port']} -u${cfg['db_user']} -p${cfg['db_pass']} -D${cfg['db_name']} -e"drop database ${cfg['db_name']}"
        if [ $? -ne 0 ]; then
            ERR "访问数据库失败，无法删除数据库，如需继续请手动操作"
            exit 1
        fi
        INFO "正在删除安装目录..."
        rm -rf ${cfg[root]}
        INFO "节点\e[92m${cfg[nodename]}\e[0;0m已经删除"
    else
        ERR "参数中必须带有当前节点的角色数量，角色数量为[\e[92m${role_num}\e[0;0m]"
    fi
}

DOC[server_truncate]="清档, 参数:[平台标识] [区号] [角色数量]"
fun_server_truncate(){
    local n=$3
    declare -A cfg
    check_node_cfg $@

    local role_num=$(mysql -h${cfg['db_host']} -P${cfg['db_port']} -u${cfg['db_user']} -p${cfg['db_pass']} -D${cfg['db_name']} -ss -e"select count(*) from role")
    if [ $? -ne 0 ]; then
        ERR "访问数据库失败，无法获取角色数量"
        exit 1
    fi
    if [ "$role_num" != "" ] && [ "${role_num//[[:space:]]/}" = "${n//[[:space:]]/}" ]; then
        if is_screen_exists ${cfg[nodename]}; then
            fun_server_stop ${cfg[platform]} ${cfg[zone_id]}
        fi
        INFO "正在清档中..."
        # 排除列表，注意在排除列表外的所有表将会被清空
        local exclude=( )
        local tabs=( $(mysql -h${cfg['db_host']} -P${cfg['db_port']} -u${cfg['db_user']} -p${cfg['db_pass']} -D${cfg['db_name']} -ss -e"show tables") )
        for v in ${tabs[@]}; do
            local flag=0
            for v1 in ${exclude[@]}; do
                if [ "$v" = "$v1" ]; then
                    flag=1
                fi
            done
            if [ $flag = 0 ]; then
                local sql="${sql} truncate table ${v};"
            fi
        done
        mysql -h${cfg['db_host']} -P${cfg['db_port']} -u${cfg['db_user']} -p${cfg['db_pass']} -D${cfg['db_name']} -ss -e"${sql}"
        if [ $? -ne 0 ]; then
            ERR "访问数据库失败，无法删除数据库，如需继续请手动操作"
            exit 1
        fi
        rm -f ${cfg[root]}/dets/*.dets
        rm -rf ${cfg[root]}/log
        mkdir -p ${cfg[root]}/log/pack
        rm -rf ${cfg[root]}/log_file
        mkdir -p ${cfg[root]}/log_file
        INFO "清档完成..."
    else
        ERR "参数中必须带有当前节点的角色数量，角色数量为[\e[92m${role_num}\e[0;0m]"
    fi
}

DOC[server_start]="启动游戏服务器，参数:[平台标识] [区号]"
fun_server_start(){
    declare -A cfg
    check_node_cfg $@
    if [ ! -d ${cfg[root]}/dets ]; then
        ERR "节点\e[92m${cfg[nodename]}\e[0;0m似乎没有安装，无法启动"
        exit 1
    fi
    cd ${cfg[root]}
    if $(in_cygwin); then
        if [ -z "${WERL}" ]; then
            WERL=werl
        fi
        ${WERL} -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} +P 204800 +K true -smp enable -hidden -pa ${cfg[code_path]}/server/ebin -name ${cfg[nodename]} -s main start -extra ${cfg[type]} &
    else
        if is_screen_exists ${cfg[nodename]}; then
            if has_tty; then
                read -p "[93m=> 节点[92m${cfg[nodename]}[93m在之前已经启动，现在是否直接进入控制台?[0;0m [y/n]" choice
                if [[ $choice =~ y|Y|yes ]]; then
                    screen -r ${cfg[nodename]}
                fi
                exit 0
            else
                INFO "节点[92m${cfg[nodename]}[0;0m在之前已经启动"
            fi
        else
            start_file=${cfg[root]}/start.sh
            CMD="${ERL} +pc unicode -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} +P 204800 +K true -smp enable -hidden -pa ${ROOT}/server/ebin -name ${cfg[nodename]} -s main start -extra ${cfg[type]}"
            cat > ${start_file} <<EOF
#!/bin/bash
cd ${cfg[root]}
ulimit -SHn 102400
${CMD}
EOF
            chmod +x ${start_file}
            screen -dmSL ${cfg[nodename]} -s ${start_file}
            if has_tty; then
                echo "----------------------------------------------------------------------------------------------"
                INFO "节点\e[92m${cfg[nodename]}\e[0;0m正在启动中，启动完成后会直接进入控制台，操作时请注意(\e[92mctrl+a d\e[0;0m退出)。"
                echo "----------------------------------------------------------------------------------------------"
                fun_shell ${p} ${z}
            else
                INFO "节点\e[92m${cfg[nodename]}\e[0;0m正在启动中，如果想要了解启动结果，请查看服务器日志"
            fi
        fi
    fi
}

DOC[server_stop]="关闭游戏服务器，参数:[平台标识] [区号]"
fun_server_stop(){
    if $(in_cygwin); then
        ERR "cygwin下不支持此命令"
        exit
    fi

    declare -A cfg
    check_node_cfg $@
    if [ ! -d ${cfg[root]}/dets ]; then
        ERR "节点\e[92m${cfg[nodename]}\e[0;0m似乎没有安装，无法执行关闭操作"
        exit 1
    fi
    if ! is_screen_exists ${cfg[nodename]}; then
        ERR "节点\e[92m${cfg[nodename]}\e[0;0m似乎没有启动"
        exit 1
    fi
    # 检查锁
    lock=/tmp/stop_${cfg['platform']}_${cfg['zone_id']}.lock
    if [ -f $lock ]; then
        ERR "节点\e[92m${cfg['nodename']}\e[0,0m上有另一个关闭操作正在执行中，需等待该操作完成"
        exit 1
    fi
    touch $lock # 加锁
    cd ${cfg[root]}
    INFO "正在关闭节点\e[92m${cfg[nodename]}\e[0;0m..."
    ${ERL} -noshell -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} -hidden -pa ${cfg[code_path]}/server/ebin -name stop_${cfg[nodename]} -setcookie ${cfg[cookie]} -eval "io:setopts([{encoding,unicode}]), main:stop_from_shell()" -s c q -extra ${cfg[nodename]}
    rm -f $lock # 解锁
}

DOC[server_exec]="在指定节点中执行erlang函数，参数:[平台标识] [区号] [Mod] [Fun] [Args(可选)]"
fun_server_exec(){
    if $(in_cygwin); then
        ERR "cygwin下不支持此命令"
        exit
    fi
    mod=$3
    fun=$4
    args=$5
    if [[ "" == "$args" ]]; then
        args="[]"
    fi
    if [[ "" == "$mod" || "" == "$fun" ]]; then
        ERR "参数不完整，无法执行命令"
        exit 1
    fi
    declare -A cfg
    check_node_cfg $@
    if [ ! -d ${cfg[root]}/dets ]; then
        ERR "节点\e[92m${cfg[nodename]}\e[0;0m似乎没有安装，无法执行命令"
        exit 1
    fi
    if ! is_screen_exists ${cfg[nodename]}; then
        ERR "节点\e[92m${cfg[nodename]}\e[0;0m似乎没有启动"
        exit 1
    fi
    cd ${cfg[root]}
    # 检查锁
    lock=/tmp/exec_${cfg['platform']}_${cfg['zone_id']}.lock
    if [ -f $lock ]; then
        ERR "节点\e[92m${cfg['nodename']}\e[0,0m上有另一个任务\e[92m$(cat $lock)\e[0,0m正在执行中，需等待该任务完成"
        exit 1
    fi
    echo "${mod}:${fun}(${args})" > $lock # 加锁
    INFO "正在节点\e[92m${cfg[nodename]}\e[0;0m上执行:\e[92m$mod:$fun($args)\e[0;0m..."
    ${ERL} -noshell -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} -hidden -pa ${cfg[code_path]}/server/ebin -name exec_${cfg[nodename]} -setcookie ${cfg[cookie]} -eval "io:setopts([{encoding,unicode}]),io:format(\"~w~n\", [rpc:call('${cfg['nodename']}', ${mod}, ${fun}, ${args})])." -s c q
    echo ""
    rm -f $lock # 解锁
}

DOC[server_restart]="重启游戏服务器，参数:[平台标识] [区号]"
fun_server_restart(){
    fun_server_stop $@
    fun_server_start $@
}

DOC[server_clean]="重启游戏服务器，参数:[平台标识] [区号]"
fun_server_clean(){
    INFO "正在清除ebin下所有的beam文件..."
    rm -f ${ROOT}/server/ebin/*.beam
    INFO "清除完毕"
}

DOC[shell]="进入游戏服务器控制台(screen)，参数:[平台标识] [区号]"
fun_shell(){
    if $(in_cygwin); then
        ERR "cygwin下不支持此命令"
        exit
    fi
    declare -A cfg
    check_node_cfg $@
    if ! is_screen_exists ${cfg[nodename]}; then
        ERR "节点\e[92m${cfg[nodename]}\e[0;0m似乎没有启动，无法进入控制台"
        exit 1
    fi
    screen -r ${cfg[nodename]}
}

DOC[remsh]="使用remsh方测试服式进入控制台，参数:[平台标识] [区号] [自定义名称]"
fun_remsh(){
    if $(in_cygwin); then
        ERR "cygwin下不支持此命令"
        exit
    fi
    declare -A cfg
    check_node_cfg $@
    if ! is_screen_exists ${cfg[nodename]}; then
        ERR "节点\e[92m${cfg[nodename]}\e[0;0m似乎没有启动，无法接入控制台"
        exit 1
    fi
    Num=`date "+%H%M%S"`
    INFO "以remsh方式接入节点\e[92m${cfg[nodename]}\e[0;0m..."
    ${ERL} -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} -pa ${cfg[code_path]}/server/ebin -name remsh_${Num}_${cfg[nodename]} -setcookie ${cfg[cookie]} -remsh ${cfg[nodename]}
}

mysql_get_row(){
    local sql="$@ limit 1 "
    IFS=$'\n' && local lines=( $(export MYSQL_PWD=`cat /data/save/mysql_root` && mysql -uroot -ss -D${OMS_DB_NAME} -e"$sql\G" | grep -v "1.row") )
    lines=( ${lines[*]//\**/} ) # 删除分隔符
    lines=( ${lines[*]//:\ /\'\]=\"} ) # 替换等号
    lines=( ${lines[*]/#/tmp\[\'} ) # 替换变量名
    lines=( ${lines[*]/%/\"} ) # 增加尾部双引号
    declare -A tmp row
    eval "$(echo "${lines[*]}")" # 转成关联数组
    # 去除多余空格
    for k in ${!tmp[@]}; do
        row[${k/#* /}]=${tmp[$k]}
    done
    declare -p row
}
