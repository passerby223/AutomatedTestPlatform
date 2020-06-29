#!/bin/bash
# @Time        :2020/6/30 上午12:23
# @Author      :passerby223
# @Description :

# 获取用户输入
read -p "请输入一个数字>>>" num

# 定义数字累加函数
function countNum() {
  num_count=0
  n=1
  while [ $n -lt $(($1 + 1)) ]; do
    num_count=$(($n + $num_count))
    n=$(($n + 1))
  done
  echo "从1累加到$1的结果为：$num_count"
}

# 调用countNum函数并传入用户输入的实参：num
countNum $num