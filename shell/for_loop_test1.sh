#!/bin/bash
# @Time        :2020/6/29 上午12:42
# @Author      :passerby223
# @Description :

# shellcheck disable=SC2045
for i in $(ls /opt); do
  echo "${i}"
done

for i in Python Java GO PHP
do
  echo "${i}"
done
