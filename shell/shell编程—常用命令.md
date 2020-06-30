# 查看命令帮助信息
* `command --help` 比如`cat --help`
# head
* `head a.txt` **默认获取文件前10行并打印**
* `head -n 15 a.txt` **打印文件前15行并打印**
* `head -c 10 a.txt` **打印文件前10个字节的内容**
# tail
* `tail a.txt` **默认获取文件后10行并打印**
* `tail -n 15 a.txt` **打印文件后15行并打印**
* `tail -c 10 a.txt` **打印文件后10个字节的内容**
# head和tail组合使用
## 使用`管道|`获取任意行数的文件内容
* `head -n 40 a.txt | tail -n 9` **获取文件`32行~40行`的内容并打印**
* `head -n 6 a.txt | tail -n 1 | wc -L` **获取文件第6行内容的字节数**
# clear
* `clear` **清屏(快捷键`Ctrl + l`)**
# cut
* **取出文本中指定的列**
* **默认以`tab`键进行分割(不支持不规则的空格)**
	* `cut -f 2,4 test.txt` 查看文件中**每行**通过`tab`键分割后的**第2,4列内容**并打印出来。
* 选项
	* `-d 指定分隔符`
	* `-f 指定获取的列号`
* `cut -d ":" -f 1,3,5 /etc/passwd` 查看文件中**每行**通过`:`分割后的**第1,3,5列内容**并打印出来。
# sort
**用于将文本文件内容加以排序，sort可针对文本文件的内容，以**行**为单位来排序。**
* 选项
	* `-n` 以数值大小进行排序
	* `-r` 倒序
	* `-t` 指定分隔符，默认为空格
## 测试文件内容如下(测试文件中没有可进行比较的数字字符串)
```bash
2019-08-14 12:20:58 INFO 小花 Pass 手机号
2019-08-14 12:20:58 INFO 小花 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 手机号
2019-08-14 12:20:58 INFO 小花 Pass 邮箱
2019-08-14 12:20:58 INFO 小花 Pass 邮箱
2019-08-14 12:20:58 ERROR 小红 Pass 邮箱
2019-08-14 12:20:58 INFO 小红 Pass 邮箱
2019-08-14 12:20:58 CRITICAL 小华 Pass 邮箱
2019-08-14 12:20:58 INFO 小红 Pass 手机号
2019-08-14 12:20:58 INFO 小花 Pass 手机号
2019-08-14 12:20:58 INFO 小花 Pass 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 邮箱
2019-08-14 12:20:58 ERROR 小花 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:58 INFO 小刚 Pass 手机号
```
* **测试文件中没有可进行比较的数字字符串时，对文本的内容进行排序，则默认以字符的ASCII码数值从小到大进行排序**
	```bash
	[root@aliyun ~]$ sort case.log 
	2019-08-14 12:20:58 CRITICAL 小华 Pass 邮箱
	2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
	2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
	2019-08-14 12:20:58 ERROR 小刚 Pass 邮箱
	2019-08-14 12:20:58 ERROR 小刚 Pass 邮箱
	2019-08-14 12:20:58 ERROR 小红 Pass 邮箱
	2019-08-14 12:20:58 ERROR 小花 Pass 手机号
	2019-08-14 12:20:58 ERROR 小花 Pass 手机号
	2019-08-14 12:20:58 ERROR 小花 Pass 手机号
	2019-08-14 12:20:58 ERROR 小花 Pass 邮箱
	2019-08-14 12:20:58 ERROR 小花 Pass 邮箱
	2019-08-14 12:20:58 INFO 小刚 Pass 手机号
	2019-08-14 12:20:58 INFO 小红 Pass 手机号
	2019-08-14 12:20:58 INFO 小红 Pass 邮箱
	2019-08-14 12:20:58 INFO 小花 Pass 手机号
	2019-08-14 12:20:58 INFO 小花 Pass 手机号
	2019-08-14 12:20:58 INFO 小花 Pass 手机号
	2019-08-14 12:20:58 INFO 小花 Pass 邮箱
	2019-08-14 12:20:58 INFO 小花 Pass 邮箱
	2019-08-14 12:20:58 INFO 小花 Pass 邮箱
	```
## 测试文件内容如下(测试文件中有可进行比较的数字字符串)
```bash
2019-08-14 12:20:58 INFO 小花 Pass 手机号
2019-08-14 12:20:57 INFO 小花 Pass 邮箱
2019-08-14 12:20:51 ERROR 小刚 Pass 手机号
2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
2019-08-14 12:20:19 ERROR 小花 Pass 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 手机号
2019-08-14 12:20:16 ERROR 小花 Pass 手机号
2019-08-14 12:20:58 INFO 小花 Pass 邮箱
2019-08-14 12:20:46 INFO 小花 Pass 邮箱
2019-08-14 12:20:58 ERROR 小红 Pass 邮箱
2019-08-14 12:20:45 INFO 小红 Pass 邮箱
2019-08-14 12:20:18 CRITICAL 小华 Pass 邮箱
2019-08-14 12:20:58 INFO 小红 Pass 手机号
2019-08-14 12:20:48 INFO 小花 Pass 手机号
2019-08-14 12:20:38 INFO 小花 Pass 手机号
2019-08-14 12:20:54 ERROR 小花 Pass 邮箱
2019-08-14 12:20:36 ERROR 小花 Pass 邮箱
2019-08-14 12:20:28 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:21 INFO 小刚 Pass 手机号
```
* 测试文件中**有可进行比较的数字字符串**时，对文本的内容进行排序，则默认**以数字字符的数值大小**从小到大进行排序(**此时与使用`sort -n case.log `命令排序的结果一致，都是`以数字字符串数值大小`来进行排序，只不过`sort case.log `是默认排序效果，`sort -n case.log `是手动指定`以数字字符串数值大小`来进行排序**)
	```bash
	[root@aliyun ~]$ sort case.log 
	2019-08-14 12:20:16 ERROR 小花 Pass 手机号
	2019-08-14 12:20:18 CRITICAL 小华 Pass 邮箱
	2019-08-14 12:20:19 ERROR 小花 Pass 手机号
	2019-08-14 12:20:21 INFO 小刚 Pass 手机号
	2019-08-14 12:20:28 ERROR 小刚 Pass 邮箱
	2019-08-14 12:20:36 ERROR 小花 Pass 邮箱
	2019-08-14 12:20:38 INFO 小花 Pass 手机号
	2019-08-14 12:20:45 INFO 小红 Pass 邮箱
	2019-08-14 12:20:46 INFO 小花 Pass 邮箱
	2019-08-14 12:20:48 INFO 小花 Pass 手机号
	2019-08-14 12:20:51 ERROR 小刚 Pass 手机号
	2019-08-14 12:20:54 ERROR 小花 Pass 邮箱
	2019-08-14 12:20:57 INFO 小花 Pass 邮箱
	2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
	2019-08-14 12:20:58 ERROR 小刚 Pass 邮箱
	2019-08-14 12:20:58 ERROR 小红 Pass 邮箱
	2019-08-14 12:20:58 ERROR 小花 Pass 手机号
	2019-08-14 12:20:58 INFO 小红 Pass 手机号
	2019-08-14 12:20:58 INFO 小花 Pass 手机号
	2019-08-14 12:20:58 INFO 小花 Pass 邮箱
	```
## 倒序排序
```bash
[root@aliyun ~]$ sort -r case.log 
2019-08-14 12:20:58 INFO 小花 Pass 邮箱
2019-08-14 12:20:58 INFO 小花 Pass 手机号
2019-08-14 12:20:58 INFO 小红 Pass 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 手机号
2019-08-14 12:20:58 ERROR 小红 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
2019-08-14 12:20:57 INFO 小花 Pass 邮箱
2019-08-14 12:20:54 ERROR 小花 Pass 邮箱
2019-08-14 12:20:51 ERROR 小刚 Pass 手机号
2019-08-14 12:20:48 INFO 小花 Pass 手机号
2019-08-14 12:20:46 INFO 小花 Pass 邮箱
2019-08-14 12:20:45 INFO 小红 Pass 邮箱
2019-08-14 12:20:38 INFO 小花 Pass 手机号
2019-08-14 12:20:36 ERROR 小花 Pass 邮箱
2019-08-14 12:20:28 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:21 INFO 小刚 Pass 手机号
2019-08-14 12:20:19 ERROR 小花 Pass 手机号
2019-08-14 12:20:18 CRITICAL 小华 Pass 邮箱
2019-08-14 12:20:16 ERROR 小花 Pass 手机号
```
# uniq
* 去除重复内容，**必须先使用`sort`排序后再使用`uniq`才会去重成功**
	* 测试文件如下
		```bash
		Python
		Java
		Java
		C
		Python
		JavaScript
		Go
		Go
		PHP
		```
		* 使用`uniq`去重后
			```bash
			[root@aliyun ~]$ sort language.txt | uniq
			C
			Go
			Java
			JavaScript
			PHP
			Python
			```
* 选项
	* `-d` 仅打印有重复(duplicate)的元素
		```bash
		[root@aliyun ~]$ sort language.txt | uniq -d
		Go
		Java
		Python
		```
	* `-c` 打印重复元素的个数
		```bash
		[root@aliyun ~]$ sort language.txt | uniq -d -c
			2 Go
			2 Java
			2 Python
		[root@aliyun ~]$ sort language.txt | uniq -c
			1 C
			2 Go
			2 Java
			1 JavaScript
			1 PHP
			2 Python
		```
## 进阶使用
### 测试文件如下
```bash
2019-08-14 12:20:58 INFO 小花 Pass 手机号
2019-08-14 12:20:57 INFO 小花 Pass 邮箱
2019-08-14 12:20:51 ERROR 小刚 Pass 手机号
2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
2019-08-14 12:20:19 ERROR 小花 Pass 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 手机号
2019-08-14 12:20:16 ERROR 小花 Pass 手机号
2019-08-14 12:20:58 INFO 小花 Pass 邮箱
2019-08-14 12:20:46 INFO 小花 Pass 邮箱
2019-08-14 12:20:58 ERROR 小红 Pass 邮箱
2019-08-14 12:20:45 INFO 小红 Pass 邮箱
2019-08-14 12:20:18 CRITICAL 小华 Pass 邮箱
2019-08-14 12:20:58 INFO 小红 Pass 手机号
2019-08-14 12:20:48 INFO 小花 Pass 手机号
2019-08-14 12:20:38 INFO 小花 Pass 手机号
2019-08-14 12:20:54 ERROR 小花 Pass 邮箱
2019-08-14 12:20:36 ERROR 小花 Pass 邮箱
2019-08-14 12:20:28 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:21 INFO 小刚 Pass 手机号
```
打印以上**日志文件中`1~15行`中**的用户(**注意这里需要先对1-15行出现的用户名进行去重操作，进行去重操作前还还需要进行排序操作**)
```bash
[root@aliyun ~]$ head -n 15 case.log | cut -d " " -f 4 | sort | uniq
小刚
小红
小花
小华
```
# wc(word count)
* 计算文本数量
* 选项
	* `wc -l` **打印行数**
		```bash
		[root@aliyun ~]$ wc -l case.log 
		20 case.log
		```
	* `wc -w` **打印单词数量**
		```bash
		[root@aliyun ~]$ wc -w case.log 
		120 case.log
		```
	* `wc -c` **打印字节数**
		```bash
		[root@aliyun ~]$ wc -c case.log 
		924 case.log
		```
	* `wc -L` **打印最长行的字节数**
		```bash
		[root@aliyun ~]$ wc -L case.log 
		43 case.log
		```