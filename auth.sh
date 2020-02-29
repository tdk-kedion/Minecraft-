#!/bin/bash

#查看Minecraft服务器的所有身份验证的脚本

# 使用所有Linux Minecraft脚本进入目录
cd "$( dirname $0 )"

# 读取配置文件
source config.cfg

#你想在哪里开始？（按行）
#较大的数字可能会导致屏幕闪烁。
lines=1500

# 显示输入行数最近的身份验证数，并显示所有新的身份验证，直到按下CTRL+C。
tail -n $lines -F $minecraftLog | grep -E "[0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]* \[INFO\] [^/ ]"

# 重写正则表达式的新的更新
