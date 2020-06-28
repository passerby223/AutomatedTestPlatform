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
