#!/bin/bash
for i in {0..61}
do
#echo "https://ninghao.net/blog?page=$i"
echo $i
sleep 1
curl -s "https://ninghao.net/blog?page=$i"  | grep -E "node-title|dateTime" | sed -n 'N;s/\n//p' | awk -F '[<>]' '{gsub("\"", "",$6);gsub("a href=","https://ninghao.net",$6);print "- [ " $7"]("$6") " substr($13,1,10)}' >> blog.md
done
