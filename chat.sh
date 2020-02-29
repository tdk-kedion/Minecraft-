#!/bin/bash

# 我的世界查看玩家现场查看聊天文件脚本

# 进入所有带有Linux-Minecraft-Scripts的目录
cd "$( dirname $0 )"

# 读取配置文件
source config.cfg

# 您想从多远开始？（按行）
# 更大的数字可能会导致屏幕闪烁
lines=500

# 显示最近的聊天和实时聊天，直到按CTRL + C为止。
tail -n $lines -F $minecraftLog | grep "[0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]* \[INFO\] <[a-zA-Z0-9_]*> [^@].*"

