#!/bin/bash

function get_url {
cat config.ini | grep url |awk -F'=' '{print $2}'
}
function get_username {
cat config.ini | grep username |awk -F'=' '{print $2}'
}
function get_password {
cat config.ini | grep password |awk -F'=' '{print $2}'
}
function get_accesskey {
cat config.ini | grep accesskey |awk -F'=' '{print $2}'
}
function get_secretkey {
cat config.ini | grep secretkey |awk -F'=' '{print $2}'
}

function get_logfile {
	cd /opt/sc/admin/logs/
	echo /opt/sc/admin/logs/$(ls -t1 |egrep '^[0-9]+' |head -1)
}
