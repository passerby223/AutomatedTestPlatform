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
		[root@root-aliyun ~]$ username="小花花"
		[root@root-aliyun ~]$ echo $username
		小花花
		[root@root-aliyun ~]$ powerful='the best powerful man is $username'
		[root@root-aliyun ~]$ echo $powerful
		# 当变量值使用单引号时，不会引用变量值中所引用的变量的值(即所进及所得)
		the best powerful man is $username
		```
* 方式二
	* `变量名="变量值"`
		```bash
		[root@root-aliyun ~]$ username="小花花"
		[root@root-aliyun ~]$ echo $username
		小花花
		[root@root-aliyun ~]$ handsome="the best handsome person is $username"
		[root@root-aliyun ~]$ echo $handsome
		the best handsome person is 小花花
		```
* 方式三
    * `变量名=$(Linux命令)`，**比较常用**
    ```bash
    [root@root-aliyun ~]$ output=$(ll /opt)
    [root@root-aliyun ~]$ echo $output     
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
        [root@root-aliyun ~]$ username="小花"  
        [root@root-aliyun ~]$ echo "$username" 
        小花
        ```
* 方式二(**在终端bash界面中最常用**)
    * `echo $变量名`
        ```bash
        [root@root-aliyun ~]$ username="熊二"
        [root@root-aliyun ~]$ echo $username
        熊二
        ```
* 方式三(在终端bash界面可以使用**但在写bash脚本时必须用这种方式**)
    * `echo "${变量名}"`
        ```bash
        [root@root-aliyun ~]$ username="熊大"
        [root@root-aliyun ~]$ echo "${username}"
        熊大
        ```
## 内置变量
* `$0`:获取当前执行的shell脚本文件名,包括脚本路径。
* `$n`:获取当前执行的shell脚本的第n个参数值，`n=1—>9`，如果`n>9`就要用大括号`{}`括起来，如接收第10个参数应该写为`${10}`。
* `$#`:获取当前shell命令行中参数的总个数
* `$*`:获取当前shell脚本的所有命令行参数
* `$?`:获取执行上一个指令的返回值(0为成功，非0为失败)
    * `0`为`成功`
        ```bash
        [root@root-aliyun ~]$ ls log 
        Deepin-QQ.log  kill.sh.log  run.sh.log
        [root@root-aliyun ~]$ echo "$?"
        0
        ```
    * `非0`即为`失败`
        ```bash
        [root@root-aliyun ~]$ cat haha.txt
        cat: haha.txt: 没有那个文件或目录
        [root@root-aliyun ~]$ echo "$?"   
        1
        ```
* `$USER`
    * `echo "$USER"`：获取当前登录用户
* `$PWD`
    * `echo "$PWD"`：获取当前目录的路径
* `$HOME`
    * `echo "$HOME"`：获取当前家目录的路径
* `$SHELL`
    * `echo "$SHELL"`：获取`shell`的路径
# 数值运算
## 支持的运算符
支持`+`,`-`,`*`,`/`,`%`,`<`,`<=`,`>`,`>=`,`=`,`!=`运算
## 数值运算表达式
* 表达式一(**最常用**)
    * `$((算术表达式))`，算术表达式中引用的变量前面的`$`可选
        ```bash
        [root@root-aliyun ~]$ echo "$((2 * 3))"
        6
        [root@root-aliyun ~]$ num1=60
        [root@root-aliyun ~]$ num2=30
        [root@root-aliyun ~]$ echo "$(($num1 / $num2))"
        2
        [root@root-aliyun ~]$ echo "$((num1 / num2))" 
        2
        ```
* 表达式二
    * `expr` 算术表达式
        ```bash
        [root@root-aliyun ~]$ echo "$num1"                  
        60
        [root@root-aliyun ~]$ echo "$num2"                  
        30
        [root@root-aliyun ~]$ echo "$(expr $num1 \* $num2)" 
        1800
        [root@root-aliyun ~]$ echo "$(expr $num1 \+ $num2)" 
        90
        [root@root-aliyun ~]$ echo "$(expr $num1 \- $num2)" 
        30
        [root@root-aliyun ~]$ echo "$(expr $num1 \% $num2)" 
        0
        ```
# 条件表达式
使用`[ 条件表达式 ]`来定义，条件表达式与`[]`两侧必须用**空格**隔开
## 返回值
* 条件`成立`，返回`0`
    ```bash
    [root@root-aliyun ~]$ [ 1 == 1 ]
    [root@root-aliyun ~]$ echo "$?"
    0
    ```
* 条件`不成立`，返回`1`
    ```bash
    [root@root-aliyun ~]$ [ 1 == 15 ]
    [root@root-aliyun ~]$ echo "$?"
    1
    ```
## 逻辑表达式
* `&&`和`||`:`&&`相当于Python逻辑表达式中的`and`，`||`相当于Python逻辑表达式中的`or`。
    ```bash
    [root@root-aliyun ~]$ [ 5 == 5 ] && echo "true"
    true
    [root@root-aliyun ~]$ [ 5 == 5 ] || echo "true"
    [root@root-aliyun ~]$ [ 5 == 15 ] || echo "false"
    false
    [root@root-aliyun ~]$ [ 5 == 5 ] && echo "true" || echo "false"
    true
    [root@root-aliyun ~]$ [ 5 == 6 ] && echo "true" || echo "false"
    false
    [root@root-aliyun ~]$ [ 5 != 6 ] && echo "true" || echo "false"
    true
    [root@root-aliyun ~]$ user="熊大"
    [root@root-aliyun ~]$ [ "${user}" == "熊大" ] && echo "YES" || echo "NO"
    YES
    [root@root-aliyun ~]$ [ "${user}" == "熊二" ] && echo "YES" || echo "NO"
    NO
    [root@root-aliyun ~]$ [ "${user}" != "熊二" ] && echo "YES" || echo "NO"
    YES
    ```
## 文件表达式
* `-f`:判断输入内容是否是一个文件
    ```bash
    [root@root-aliyun ~]$ ll
    总用量 20
    -rw-rw-r-- 1 root root 7566 6月  26 11:19 a.txt
    -rw-rw-r-- 1 root root  924 6月  26 12:40 case.log
    drwxrwxr-x 2 root root 4096 6月  27 19:15 haha
    -rw-rw-r-- 1 root root   47 6月  26 13:13 language.txt
    [root@root-aliyun ~]$ [ -f "language.txt" ] && echo "是文件" || echo "不是文件"
    是文件
    [root@root-aliyun ~]$ [ -f "haha/" ] && echo "是文件" || echo "不是文件"
    不是文件
    [root@root-aliyun ~]$ [ -f "haha" ] && echo "是文件" || echo "不是文件"
    不是文件
    [root@root-aliyun ~]$ 
    ```
* `-d`:判断输入内容是否是一个目录
    ```bash
    [root@root-aliyun ~]$ ll
    总用量 20
    -rw-rw-r-- 1 root root 7566 6月  26 11:19 a.txt
    -rw-rw-r-- 1 root root  924 6月  26 12:40 case.log
    drwxrwxr-x 2 root root 4096 6月  27 19:15 haha
    -rw-rw-r-- 1 root root   47 6月  26 13:13 language.txt
    [root@root-aliyun ~]$ [ -d "haha" ] && echo "是一个目录" || echo "不是一个目录"
    是一个目录
    [root@root-aliyun ~]$ [ -d "language.txt" ] && echo "是一个目录" || echo "不是一个目录"
    不是一个目录
    ```
* `-x`:判断输入内容是否可执行
    ```bash
    [root@root-aliyun ~]$ ll
    总用量 20
    -rw-rw-r-- 1 root root 7566 6月  26 11:19 a.txt
    -rw-rw-r-- 1 root root  924 6月  26 12:40 case.log
    drwxrwxr-x 2 root root 4096 6月  27 19:15 haha
    -rw-rw-r-- 1 root root   47 6月  26 13:13 language.txt
    [root@root-aliyun ~]$ [ -x "haha" ] && echo "有可执行权限" || echo "没有可执行 权限"
    有可执行权限
    [root@root-aliyun ~]$ [ -x "language.txt" ] && echo "有可执行权限" || echo "没 有可执行权限"
    没有可执行权限
    [root@root-aliyun ~]$
    ```
* `-e`:判断文件是否存在
    ```bash
    [root@root-aliyun ~]$ ls
    a.txt  case.log  language.txt  test.txt
    [root@root-aliyun ~]$ [ -e "test.txt" ] && echo "文件存在" || echo "文件不存在"
    文件存在
    [root@root-aliyun ~]$ rm -rf test.txt 
    [root@root-aliyun ~]$ [ -e "test.txt" ] && echo "文件存在" || echo "文件不存在"
    文件不存在
    ```
## 数值操作符
* `n1 -eq n2`:判断`n1`和`n2`是否相等
    ```bash
    [root@root-aliyun ~]$ num1=45
    [root@root-aliyun ~]$ num2=45
    [root@root-aliyun ~]$ [ "${num1}" -eq "${num2}" ] && echo "num1==num2:"${num1}"=="${num2}"" || echo "num1!=num2:"${num1}"!="${num2}""
    num1==num2:45==45
    ```
* `n1 -gt n2`:判断`n1`是否大于`n2`
    ```bash
    [root@root-aliyun ~]$ num1=45
    [root@root-aliyun ~]$ [ "${num1}" -gt 15 ] && echo "num1>15:"${num1}">15" || echo "num1<15:"${num1}"<15"
    num1>15:45>15
    ```
* `n1 -lt n2`:判断`n1`是否小于`n2`
    ```bash
    [root@root-aliyun ~]$ num3=10
    [root@root-aliyun ~]$ num1=45
    [root@root-aliyun ~]$ [ "${num3}" -lt "${num1}" ] && echo "num3<num1:"${num3}"<"${num1}"" || echo "num3>num1:"${num3}">"${num1}""
    num3<num1:10<45
    [root@root-aliyun ~]$ num3=100
    [root@root-aliyun ~]$ [ "${num3}" -lt "${num1}" ] && echo "num3<num1:"${num3}"<"${num1}"" || echo "num3>num1:"${num3}">"${num1}""
    num3>num1:100>45
    ```
* `n1 -ne n2`:判断`n1`是否不等于`n2`
    ```bash
    [root@root-aliyun ~]$ num3=100
    [root@root-aliyun ~]$ num1=45
    [root@root-aliyun ~]$ [ "${num3}" -ne "${num1}" ] && echo "num3!=num1:"${num3}"!="${num1}"" || echo "num3==num1:"${num3}"=="${num1}""
    num3!=num1:100!=45
    [root@root-aliyun ~]$ num3=45
    [root@root-aliyun ~]$ [ "${num3}" -ne "${num1}" ] && echo "num3!=num1:"${num3}"!="${num1}"" || echo "num3==num1:"${num3}"=="${num1}""
    num3==num1:45==45
    ```
## 字符串比较
* `str1 == str2`:判断`str1`和`str2`的字符串内容是否一致
    ```bash
    [root@root-aliyun ~]$ str1="haha"
    [root@root-aliyun ~]$ str2="haha"
    [root@root-aliyun ~]$ [ "${str1}" == "${str2}" ] && echo "str1==str2:"${str1}"=="${str2}"" || echo "str1!=str2:"${str1}"!="${str2}""
    str1==str2:haha==haha
    [root@root-aliyun ~]$ str2="lala"
    [root@root-aliyun ~]$ [ "${str1}" == "${str2}" ] && echo "str1==str2:"${str1}"=="${str2}"" || echo "str1!=str2:"${str1}"!="${str2}""
    str1!=str2:haha!=lala
    ```
* `str1 != str2`:判断`str1`和`str2`的字符串内容是否不一致
    ```bash
    [root@root-aliyun ~]$ str1="haha"
    [root@root-aliyun ~]$ str2="lala"
    [root@root-aliyun ~]$ [ "${str1}" != "${str2}" ] && echo "str1!=str2:"${str1}"!="${str2}"" || echo "str1==str2:"${str1}"=="${str2}""
    str1!=str2:haha!=lala
    [root@root-aliyun ~]$ str2="haha"
    [root@root-aliyun ~]$ [ "${str1}" != "${str2}" ] && echo "str1!=str2:"${str1}"!="${str2}"" || echo "str1==str2:"${str1}"=="${str2}""
    str1==str2:haha==haha
    ```
# shell脚本格式
## 格式要求
* 在`shell`脚本文件**首行**指定执行`shell`的程序以及相关说明
    ```bash
    #!/bin/bash
    # @Time        :2020/6/27 下午8:08
    # @Author      :passerby223
    # @Description :
    ```
* `shell`脚本**文件后缀**，建议命令为`.sh`
* 脚本执行失败时，使用`exit`返回**非零值**，来退出程序。
* 默认缩进4个空格
* `shell`脚本的命名简单，有意义
## 注释
* 单行注释
    ```bash
    # 这是单行注释
    ```
* 多行注释
    ```bash
    echo "start"
    :<<!
    shell中用`:<<`后面跟上任意字符来注释多行。
    echo "哈哈"
    !
    echo "stop"
    ```
# 函数
## 定义
* 格式一
    ```bash
    函数名()
    {
        command1
        command2
        ...
    }   
    ```
    ```bash
    [root@root-aliyun ~]$ cat greet.sh      
    #!/bin/bash
    # @Time        :2020/6/28 下午10:21
    # @Author      :passerby223
    # @Description :
    
    # 声明函数，可以省略函数关键字：function
    greet() {
      # 使用`-e`对`\n`进行转义，否则输出不会换行。
      echo -e "Hello, ${LOGNAME}.\nToday is $(date)"
    }
    # 调用函数
    greet
    [root@root-aliyun ~]$ /bin/bash greet.sh
    Hello, wenbin.
    Today is 2020年 06月 28日 星期日 22:26:49 CST
    ```
* 格式二
    ```bash
    function 函数名()
    {
        command1
        command2
        ...
    }
    ```
    ```bash
    [root@root-aliyun ~]$ cat function1.sh 
    #!/bin/bash
    # @Time        :2020/6/28 下午10:07
    # @Author      :passerby223
    # @Description :
    
    # 声明函数
    function func1() {
      # 打印`HelloWord!`
      echo "HelloWorld!"
    }
    # 调用函数
    func1
    [root@root-aliyun ~]$ /bin/bash function1.sh 
    HelloWorld!
    ```
## 函数带参数
* 函数体调用参数
    ```bash
    函数名()
    {
        函数体 $n
    }
    ```
* 调用函数给函数体传参数
    ```bash
    函数名 参数
    ```
代码示例
```bash
[root@root-aliyun ~]$ cat command_params.sh 
#!/bin/bash
# @Time        :2020/6/28 下午10:59
# @Author      :passerby223
# @Description :

info() {
  # 此处的`$1 $2 $3`接受的是函数调用时`info $1 $2 $3`中传递过来的三个参数(也就是函数形参)，在方法体内，如果接收到的参数个数>9,就要用大括号`{}`括起来，如接收第10个参数应该写为`${10}`
  echo -e "我的名字是:$1\n我的性别是:$2\n我的年龄是:$3"
}
echo -e "当前shell脚本名为:$0\n当前shell脚本命令行参数个数为:$#\n当前shell脚本的所有命令行参数为:$*"
echo "***********************************分割线***********************************"
# 此处的`$1 $2 $3`接收的是命令行传过来的三个参数
info $1 $2 $3
[root@root-aliyun ~]$ bash command_params.sh 小花花 男 18
当前shell脚本名为:command_params.sh
当前shell脚本命令行参数个数为:3
当前shell脚本的所有命令行参数为:小花花 男 18
***********************************分割线***********************************
我的名字是:小花花
我的性别是:男
我的年龄是:18
```
## 函数使用`read`获取用户输入
* `read`
* `read value`
* `read -p prompt value`
```bash
[root@root-aliyun ~]$ cat command_input.sh 
#!/bin/bash
# @Time        :2020/6/28 下午11:33
# @Author      :passerby223
# @Description :

# 使用`read`设置用户输入，使用`-p`打印提示信息,`read`命令后边跟变量来保存用户输入
read -p "请输入姓名>>>" name
read -p "请输入年龄>>>" age
read -p "请输入性别>>>" gender
echo "***********************************分割线***********************************"
echo "当前shell脚本名为:$0, 当前shell脚本命令行参数个数为:$#, 当前shell脚本的所有命令行参数为:$*"
echo "***********************************分割线***********************************"
greet() {
  echo -e "你好,我的名字是$1,年龄是$2,性别是$3.\n当前shell脚本名为:$0, 当前greet()方法接收到的实参个数为:$#个, 当前greet()方法接收到的实参分别为:$*"
}
# 调用函数并传参
greet ${name} ${age} ${gender}
[root@root-aliyun ~]$ bash command_input.sh
请输入姓名>>>小花花
请输入年龄>>>18
请输入性别>>>女
***********************************分割线***********************************
当前shell脚本名为:command_input.sh, 当前shell脚本命令行参数个数为:0, 当前shell脚本的所有命令行参数为:
***********************************分割线***********************************
你好,我的名字是小花花,年龄是18,性别是女.
当前shell脚本名为:command_input.sh, 当前greet()方法接收到的实参个数为:3个, 当前greet()方法接收到的实参分别为:小花花 18 女
```
# 流程控制
## `if`语句
### 定义
```bash
if [ 条件 ]; then{
}

}    
fi
```