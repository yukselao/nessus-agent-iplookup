#!/bin/bash


source function.sh

token="$(curl -s -k -X POST -H "Content-Type: application/json" -d '{"username":"nessusadmin","password":"Tenable123!Tenable123!"}' $(get_url)/session |jq '.token' |tr -d '"')"


curl -s -k -H "Content-Type: application/json" -H 'X-Cookie: token='$token -H "X-APIKey: accesskey=$(get_accesskey); secretkey=$(get_secretkey)" $(get_url)/agent-groups |jq '.groups[] | select(.name == "'$1'") | .id'
