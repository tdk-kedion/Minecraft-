#!/bin/bash

# Minecraft 列出所有玩家脚本

# 进入所有带有Linux-Minecraft-Scripts的目录
cd "$( dirname $0 )"

# 读取配置文件
source config.cfg

# 列出曾经连接到服务器的所有用户。
cat $minecraftLog | grep "logged in with" | sed 's/[0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]* \[INFO\] //g' | sed 's/\[\/[0-9]*.[0-9]*.[0-9]*.[0-9]*:[0-9]*\].*//g' | sort | uniq
