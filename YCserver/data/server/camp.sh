#!/usr/bin/env bash
#-------------------------------------------------
# 活动关开发工具
# @author active43@126.com
#-------------------------------------------------

ERL=erl

## 帮助
func_help()
{
    case $2 in 
        dump)
            echo ">> 使用方法"
            echo "----------------------------------------------------------"
            echo "./camp.sh dump";;
        *)
            echo "----------------------------------------------------------"
            echo "dump              拉测试服的活动"
            echo "dump ip databases 拉指定服务器的活动"
            echo "insert            拉回来的活动入库"
            echo "insert plat zone  拉回来的活动入指定库"
    esac
}

func_dump()
{
    if  [ ! -n "$2" ] ;then
        ip=182.254.155.64
        database=fswy_test_5
    else
        ip="$2"
        database="$3"
    fi
    rm -rf /tmp/camp_web.sql
    rm -rf /tmp/camp_web_ico.sql
    ssh -p 2020 root@$ip "mysqldump -uroot -p\`cat /data/save/mysql_root\` --no-create-info $database  camp_web" > /tmp/camp_web.sql
    ssh -p 2020 root@$ip "mysqldump -uroot -p\`cat /data/save/mysql_root\` --no-create-info $database  camp_web_ico" > /tmp/camp_web_ico.sql
    echo "----------------------------------------------------------"
}

func_insert()
{
    if  [ ! -n "$2" ] ;then
        p=dev
        z=1
    else
        p="$2"
        z="$3"
    fi
    mysql -uroot -p`cat /data/save/mysql_root` fswy_"$p"_$z -e "delete from camp_web"
    mysql -uroot -p`cat /data/save/mysql_root` fswy_"$p"_$z -e "delete from camp_web_ico"
    mysql -uroot -p`cat /data/save/mysql_root` fswy_"$p"_$z < /tmp/camp_web.sql
    mysql -uroot -p`cat /data/save/mysql_root` fswy_"$p"_$z < /tmp/camp_web_ico.sql
}

## 脚本执行入口
case $1 in
    dump) 
        func_dump $@;;
    insert) 
        func_insert $@;;
    help) 
        func_help $@;;
    *)
    echo "未知命令${1}，请使用以下有效命令"
    func_help
    exit 1
    ;;
esac
echo ""
exit 0
