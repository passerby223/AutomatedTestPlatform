#!/bin/bash
# @Time        :2020/6/30 上午1:14
# @Author      :passerby223
# @Description :

if [ ! $# -eq 3 ]; then
  echo -e "Usge:\n $0 num1 +|-|*|/ num2"
  exit 1
fi

case $2 in
+)
  echo "$1+$3=$(($1 + $3))"
  ;;
-)
  echo "$1-$3=$(($1 - $3))"
  ;;
\*)
  echo "$1*$3=$(($1 * $3))"
  ;;
/)
  echo "$1/$3=$(($1 / $3))"
  ;;
*)
  echo "输入格式有误!未匹配到运算符!"
  ;;
esac
