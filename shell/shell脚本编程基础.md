# 变量
## 变量分类
* 本地变量
* 全局变量
* 内置变量
## 变量定义
* `变量名=变量值`
	* **变量**值必须是**一个整体**，中间**没有特殊字符**。
	* **等号`=`两侧**不能有**空格**。
* 方式一
	* `变量名='变量值'`
		* 变量值使用`''`单引号时，**所进即所得**
		```bash
		➜  ~ username="小花花"
		➜  ~ echo $username
		小花花
		➜  ~ powerful='the best powerful man is $username'
		➜  ~ echo $powerful
		# 当变量值使用单引号时，不会引用变量值中所引用的变量的值(即所进及所得)
		the best powerful man is $username
		```
* 方式二
	* `变量名="变量值"`
		```bash
		➜  ~ username="小花花"
		➜  ~ echo $username
		小花花
		➜  ~ handsome="the best handsome person is $username"
		➜  ~ echo $handsome
		the best handsome person is 小花花
		```
* 方式三
    * `变量名=$(Linux命令)`，**比较常用**
    ```bash
    ➜  ~ output=$(ll /opt)
    ➜  ~ echo $output     
    总用量 44K
    drwxr-xr-x 6 root root 4.0K 2月  14  2018 allure-2.6.0
    drwxrwxr-x 5 root root 4.0K 4月  12 14:27 baidunetdisk
    drwxr-xr-x 4 root root 4.0K 10月 24  2019 cisco
    drwx--x--x 4 root root 4.0K 12月  2  2019 containerd
    drwxr-xr-x 4 root root 4.0K 10月 22  2019 deepinwine
    drwxrwxr-x 6 root root 4.0K 4月   3 20:59 electron-ssr
    drwxr-xr-x 3 root root 4.0K 10月 21  2019 google
    drwxr-xr-x 5 root root 4.0K 6月  17 23:52 ieaseMusic
    drwxr-xr-x 3 root root 4.0K 10月 21  2019 kingsoft
    drwxr-xr-x 3 root root 4.0K 10月 23  2019 netease
    drwxr-xr-x 4 root root 4.0K 6月  21 12:48 teamviewer
    ```
* 上述三种方式定义的**变量**均为**本地变量**
## 全局变量
* 通过`env`命令查看环境变量(只显示全局变量)
    * env命令用于显示系统中已存在的环境变量，以及在定义的环境中执行指令。该命令只使用"-"作为参数选项时，隐藏了选项"-i"的功能。若没有设置任何选项和参数时，则直接显示当前的环境变量。
    ```bash
    [root@aliyun ~]$ env
    XDG_SESSION_ID=10559
    HOSTNAME=aliyun
    SHELL=/bin/bash
    ......
    ```
* 定义全局变量
    * 方法一
        ```bash
        变量=值
        export 变量
        ```
    * 方法二(**最常用**)
        ```bash
        export 变量=值
        ```
    * 方法三(这种方法创建的环境变量在任何时刻都有效)
        * 把`export 变量=值`添加到`~/.bashrc`配置文件的末尾，然后使用`source ~/.bashrc`激活配置文件。
        * `~/bashrc`:为每一个运行`bash shell`的用户`执行此文件`。当`bash shell`被打开时,**该文件被读取**。
        ```bash
        # 将下边这句export语句添加到~/.bashrc文件的末尾
        export GOROOT=/usr/local/go #GOROOT是系统上安装Go软件包的位置。
        # 激活配置文件的配置
        source ~/.bashrc
        ```
## 查看变量
* 方式一(**在终端bash界面中最常用**)
    * `echo "$变量名"`
        ```bash
        ➜  ~ username="小花"  
        ➜  ~ echo "$username" 
        小花
        ```
* 方式二(**在终端bash界面中最常用**)
    * `echo $变量名`
        ```bash
        ➜  ~ username="熊二"
        ➜  ~ echo $username
        熊二
        ```
* 方式三(在终端bash界面可以使用**但在写bash脚本时必须用这种方式**)
    * `echo "${变量名}"`
        ```bash
        ➜  ~ username="熊大"
        ➜  ~ echo "${username}"
        熊大
        ```
## 内置变量
* `$0`:获取当前执行的shell脚本文件名,包括脚本路径。
* `$n`:获取当前执行的shell脚本的第n个参数值，n=1—>9，如果n>9就要用大括号括起来。
* `$#`:获取当前shell命令行中参数的总个数
* `$?`:获取执行上一个指令的返回值(0为成功，非0为失败)
* `$USER`
    * `echo "$USER"`：获取当前登录用户
* `$PWD`
    * `echo "$PWD"`：获取当前目录的路径
* `$HOME`
    * `echo "$HOME"`：获取当前家目录的路径
* `$SHELL`
    * `echo "$SHELL"`：获取`shell`的路径