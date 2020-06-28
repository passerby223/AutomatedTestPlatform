#!/bin/bash
# @Time        :2020/6/28 下午11:57
# @Author      :passerby223
# @Description :
read -p "请输入你的年龄>>>" age
if [ ${age} -gt 60 ]
then
  echo "年龄大了，玩不动游戏了!"
elif [ ${age} -gt 18 ]
then
  echo "成年了，可以去网吧玩游戏了!"
else
  echo "还未成年呢，不可以去网吧玩游戏哦!"
fi
