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
}