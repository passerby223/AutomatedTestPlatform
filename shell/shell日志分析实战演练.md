### 统计每位测试人员执行用例的总数
```bash
[root@aliyun ~]$ cat case.log                  
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
[root@aliyun ~]$ cat count_testers_cases.awk 
BEGIN{
    printf "%-10s%-10s\n", "tester", "cases"
}
{
    # 声明一个数组，读取文件每1行的第4列，如果遇到重复的key，对应的value就累加1
    USERS[$4]++
}
END{
    for (user in USERS)
        printf "%-10s%-10d\n", user, USERS[user]
}                                                                                   
[root@aliyun ~]$ awk -f count_testers_cases.awk case.log
tester    cases     
小红    3         
小花    11        
小刚    5         
小华    1         
```
### 统计每位tester执行用例成功和失败的总数
```bash
[root@aliyun ~]$ cat case.log                                     
2019-08-14 12:20:58 INFO 小花 Pass 手机号
2019-08-14 12:20:57 INFO 小花 Fail 邮箱
2019-08-14 12:20:51 ERROR 小刚 Pass 手机号
2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
2019-08-14 12:20:19 ERROR 小花 Fail 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 手机号
2019-08-14 12:20:16 ERROR 小花 Fail 手机号
2019-08-14 12:20:58 INFO 小花 Pass 邮箱
2019-08-14 12:20:46 INFO 小花 Pass 邮箱
2019-08-14 12:20:58 ERROR 小红 Fail 邮箱
2019-08-14 12:20:45 INFO 小红 Fail 邮箱
2019-08-14 12:20:18 CRITICAL 小华 Pass 邮箱
2019-08-14 12:20:58 INFO 小红 Fail 手机号
2019-08-14 12:20:48 INFO 小花 Fail 手机号
2019-08-14 12:20:38 INFO 小花 Pass 手机号
2019-08-14 12:20:54 ERROR 小花 Pass 邮箱
2019-08-14 12:20:36 ERROR 小花 Fail 邮箱
2019-08-14 12:20:28 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Fail 邮箱
2019-08-14 12:20:21 INFO 小刚 Pass 手机号%                                             
[root@aliyun ~]$ cat count_testers_pass_fail_cases.awk            
BEGIN{
    printf "%-15s%-15s%-15s\n", "tester", "PassCasesTotal", "FailCasesTotal"
}
{
    if ($5 == "Pass")
    {
        SUCCESS_CASES[$4]++
    }else if ($5 == "Fail")
    {
        FAIL_CASES[$4]++
    }
    USERS[$4]++
}
END{
    for (user in USERS)
        printf "%-15s%-15d%-15d\n", user, SUCCESS_CASES[user], FAIL_CASES[user]
}%                                                                                     
[root@aliyun ~]$ awk -f count_testers_pass_fail_cases.awk case.log
tester         PassCasesTotal FailCasesTotal 
小红         0              3              
小花         6              5              
小刚         4              1              
小华         1              0              
```
### 将前2个需求合并，同时分别统计每位tester执行用例INFO、ERROR日志等级数以及所有tester每项总数
```bash
[root@aliyun ~]$ cat case.log                                     
2019-08-14 12:20:58 INFO 小花 Pass 手机号
2019-08-14 12:20:57 INFO 小花 Fail 邮箱
2019-08-14 12:20:51 ERROR 小刚 Pass 手机号
2019-08-14 12:20:58 ERROR 小刚 Pass 手机号
2019-08-14 12:20:19 ERROR 小花 Fail 手机号
2019-08-14 12:20:58 ERROR 小花 Pass 手机号
2019-08-14 12:20:16 ERROR 小花 Fail 手机号
2019-08-14 12:20:58 INFO 小花 Pass 邮箱
2019-08-14 12:20:46 INFO 小花 Pass 邮箱
2019-08-14 12:20:58 ERROR 小红 Fail 邮箱
2019-08-14 12:20:45 INFO 小红 Fail 邮箱
2019-08-14 12:20:18 ERROR 小华 Pass 邮箱
2019-08-14 12:20:58 INFO 小红 Fail 手机号
2019-08-14 12:20:48 INFO 小花 Fail 手机号
2019-08-14 12:20:38 INFO 小花 Pass 手机号
2019-08-14 12:20:54 ERROR 小花 Pass 邮箱
2019-08-14 12:20:36 ERROR 小花 Fail 邮箱
2019-08-14 12:20:28 ERROR 小刚 Pass 邮箱
2019-08-14 12:20:58 ERROR 小刚 Fail 邮箱
2019-08-14 12:20:21 INFO 小刚 Pass 手机号%                                             
[root@aliyun ~]$ cat count_testers_cases_all.awk            
BEGIN{
    printf "%-15s%-15s%-15s%-15s%-15s\n", "Tester", "InfoTotal", "ErrorTotal", """PassCasesTotal", "FailCasesTotal"
}
{
    if ($5 == "Pass")
    {
        SUCCESS_CASES[$4]++
    }else if ($5 == "Fail")
    {
        FAIL_CASES[$4]++
    }
    if ($3 == "INFO")
    {
        INFO[$4]++
    }else if ($3 == "ERROR")
    {
        ERROR[$4]++
    }
    USERS[$4]++
}
END{
    for (user in USERS)
    # for循环中，如果有多条表达式，需要加大括号
    {
        ALL_INFO+=INFO[user]
        ALL_ERROR+=ERROR[user]
        ALL_SUCCESS_CASES+=SUCCESS_CASES[user]
        ALL_FAIL_CASES+=FAIL_CASES[user]
        printf "%-15s%-15d%-15d%-15d%-15d\n", user, INFO[user], ERROR[user], SUCCESS_CASES[user], FAIL_CASES[user]
    }
    printf "%-15s%-15d%-15d%-15d%-15d\n", "Total", ALL_INFO, ALL_ERROR, ALL_SUCCESS_CASES, ALL_FAIL_CASES
}%                                                                                     
[root@aliyun ~]$ awk -f count_testers_cases_all.awk case.log
Tester         InfoTotal      ErrorTotal     PassCasesTotal FailCasesTotal 
小红         2              1              0              3              
小花         6              5              6              5              
小刚         1              4              4              1              
小华         0              1              1              0              
Total          9              11             11             9              
```