#!/usr/bin/bash
tail -n $1 $2 | grep /app/createOrder | perl -pe 's/\%(\w\w)/chr hex $1/ge' | grep -o 'data\\x22:\\x22[A-Za-z0-9+/]\{2,\}=\{0,2\}' | awk '{print substr($1,14)}' | base64 -d   #/app/createOrder

tail -n $1 $2 | grep /payCallback/appleCallback | perl -pe 's/\%(\w\w)/chr hex $1/ge' | grep -o 'data=[A-Za-z0-9+/]\{2,\}=\{0,2\}'| awk '{print substr($1,6)}'| base64 -d      #/payCallback/appleCallback

#urldecode解码   perl -pe 's/\%(\w\w)/chr hex $1/ge'
#提取data数据    grep -o 'data\\x22:\\x22[A-Za-z0-9+/]\{2,\}=\{0,2\}' | awk '{print substr($1,14)}'
