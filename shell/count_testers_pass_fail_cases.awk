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
}