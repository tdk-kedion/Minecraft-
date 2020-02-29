# Linux Minecraft脚本

------

### ！注意：该脚本已停止维护

------

一个自动化管理[Minecraft](http://www.minecraft.net/)服务器的脚本。

可以随时将此存储库克隆到您的服务器环境中，以添加一些急需的功能。

## 设置环境

为了使用这些脚本，您只需要克隆存储库即可。请确保您有`git`，`screen`和`java`安装。

```
git clone https://github.com/cranstonide/linux-minecraft-scripts
```

不要忘记编辑`config.cfg`来满足您的设置。如果您不首先自定义配置文件，则这些脚本将无法正常工作。

## 启动服务器

此存储库中的大多数脚本都要求Minecraft在GNU屏幕内运行。可以使用以下`start.sh`脚本来完成此操作：

```
./start.sh
```

## 停止服务器

您可以使用提供的脚本关闭服务器（并通知他人）。

```
./stop.sh
```

## 访问控制台

如果需要访问Minecraft控制台，可以通过运行以下命令来实现。

```
screen -r minecraft
```

## 笔记

这些脚本可帮助管理在Linux上运行的[Minecraft](http://www.minecraft.net/)服务器。它们是bash脚本；因此，如果不进行一些重大重构，它们将无法在Windows安装上运行。该安装还严重依赖于[GNU Screen](http://www.gnu.org/software/screen/)的正常安装。

*这些脚本未经任何第三方服务器测试。它们可能会起作用，但是您的里程可能会有所不同。*
