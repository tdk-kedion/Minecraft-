#!/bin/bash

# 我的世界更新脚本

# 进入所有带有Linux-Minecraft-Scripts的目录
cd "$( dirname $0 )"

# 读取配置文件
source config.cfg

# 备份服务器
source backup.sh

# 停止服务器
source stop.sh

# 删除旧的jar文件，下载新的jar文件。
rm -vf $minecraftDir/$minecraftJar
wget --output-document=$minecraftDir/$minecraftJar $updateUrl

# 启动服务器
source start.sh
