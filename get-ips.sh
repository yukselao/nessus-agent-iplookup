#!/bin/bash

source function.sh

logfile=$(get_logfile)

echo logfile: $logfile

now=$(date +%s)
fiveminago=$(date +%s -d "5 min ago")


for i in $(seq 1 5); do
	seconds=$(expr $i \* 60)
	searchstring=$(TZ=UTC date '+%d %b %Y %H:%M' -d "$seconds seconds ago")
	echo $searchstring
	grep agentScan /opt/sc/admin/logs/202404.log | grep "$searchstring" | grep 'has acquired Agent Scan' |sed -r "s#.+'(.+?)'.+#\1#" |sort |uniq |while read scanname; do
		echo scanName=$scanname
		scanid=$(./get-agent-group-id.sh $scanname)
		echo scanId=$scanid
		./get-agent-ips.sh $scanid
	done
done
