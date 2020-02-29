#!/bin/bash

# Minecraft 时间设定器

# 进入所有带有Linux-Minecraft-Scripts的目录
cd "$( dirname $0 )"

# 读取配置文件
source config.cfg

# 确保在脚本中传递了一个参数
if [ $# -eq 0 ]
then
    echo "您没有指定将服务器设置为."
    echo "用法: ./time.sh TIME"
    exit $E_NO_ARGS
fi

# 确保用户实际输入了一个数字
if ! [[ "$1" =~ ^[0-9]+$ ]]
then
    echo "应为整数，已接收 $1."
    echo "用法: ./mc-time.sh TIME"
    exit 1
fi

# 确保传递的数字不要太大。
# 负数由上述条件处理（它们不是整数，而是字符串。）
if [ $1 -gt 18000 ]
then
    echo "时间太大. 范围是 0~18000."
    exit 1
fi

# 发送时间设置命令到
screen -p 0 -S minecraft -X eval "stuff \"time set $1\"\015"

# （可选）告诉玩家时间已经改变。
# screen -p 0 -S minecraft -X eval "stuff \"say 时间已被设置为 $1.\"\015"

