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