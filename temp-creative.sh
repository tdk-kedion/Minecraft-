#!/bin/bash

# Minecraft 临时启用创造性模式脚本（只是为了好玩）

# 在运行此脚本之前备份是个好主意。它自己做备份，
# 但特别是在你的第一运行这个脚本的时候，最好做好完整的备份。

############################################
# 脚本设置#
# (注意-路径上没有尾随的斜线) #
############################################

# 在哪里运行?
minecraftDir="/home/user/minecraft"

# 您要将临时文件存储在哪里？
tempDir="/home/user/temp-minecraft"

# 此模式应持续多长时间（以分钟为单位）？
min=10

############################################
# 设置结束；不要在下面修改     #
############################################

# 提醒玩家服务器将要切换到TNT模式。
screen -p 0 -S minecraft -X eval "stuff \"say Server will be entering TNT mode shortly.\"\015"
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Shutting down to backup in 10 seconds.\"\015"
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Please exit crafting blocks, dispensers, trades, chests and furnaces.\"\015"

# 等待片刻，然后停止服务器进行备份。
sleep 10
screen -p 0 -S minecraft -X eval "stuff \"stop\"\015"
sleep 10

# 将服务器备份到一个临时位置。
rm -rvf $tempDir/
mkdir $tempDir/
cp -rvf $minecraftDir/ $tempDir/

# 服务器现在正在其临时模式下运行。
./start.sh
sleep 10
screen -p 0 -S minecraft -X eval "stuff \"say The server is now in TNT mode.\"\015"
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Please tell other players.\"\015"
sleep 1

# 在接下来的$ min分钟内，显示倒计时。
for ((c=$min; c>=0; c--))
do
sleep 60

############################################
# 创意模式操作从这里开始 #
############################################

   # 此部分ID仍在开发中。
   # 给每个人TNT
   for ((d=0; d<=4; d++))
   do
     while read line
     do
        screen -p 0 -S minecraft -X eval "stuff \"give $line 46 64\"\015"
        screen -p 0 -S minecraft -X eval "stuff \"give $line 76 64\"\015"
     done < /home/mark/minecraft/white-list.txt

   done

############################################
# 创意模式操作在这里结束 #
############################################

# 这是倒计时。
screen -p 0 -S minecraft -X eval "stuff \"say TNT mode will last for another $c minutes.\"\015"
done

# 娱乐和游戏结束了。让我们将服务器重置为其原始状态。
screen -p 0 -S minecraft -X eval "stuff \"say TNT Mode is over. Hope you had fun.\"\015"
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Restoring original (pre-TNT) map.\"\015"
sleep 10
screen -p 0 -S minecraft -X eval "stuff \"stop\"\015"
sleep 10

# 删除临时世界（仅在$ minecraft目录中的那个）
rm -rvf $minecraftDir

# 将backupDir重命名为minecraftDir，以使服务器恢复正常。.
mv $tempDir $minecraftDir

# 重新启动服务器。这次，正常。
./start.sh
