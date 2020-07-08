BEGIN{
    FS=":"
    printf "%-20s%-20s\n", "user", "shell"
}
{
    if ($6 ~ "/bin")
        {
            count++; printf "%-20s%-20s\n", $1, $NF
        }
}
END{
printf "%-20s%-20s\n", "Total", count
}
