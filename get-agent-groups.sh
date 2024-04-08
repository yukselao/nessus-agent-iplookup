#!/bin/bash


source function.sh

token="$(curl -s -k -X POST -H "Content-Type: application/json" -d '{"username":"'$(get_username)'","password":"'$(get_password)'"}' $(get_url)/session |jq '.token' |tr -d '"')"


curl -s -k -H "Content-Type: application/json" -H 'X-Cookie: token='$token -H "X-APIKey: accesskey=$(get_accesskey); secretkey=$(get_secretkey)" $(get_url)/agent-groups |jq
