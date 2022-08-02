#!/bin/sh
#
# See the LICENSE file for copyright and license details. 
#

xidfile="$HOME/tmp/tabbed-surf.xid"
uri="https://lite.duckduckgo.com/lite&kp=-2&kz=-1&kc=-1&kn=1&kf=-1&kd=-1&kh=1&kg=p&ku=1&ko=-2&k1=-1&kam=osm"

if [ "$#" -gt 0 ];
then
	uri="$1"
fi

runtabbed() {
	tabbed -dn tabbed-surf -r 2 surf -e '' "$uri" >"$xidfile" \
		2>/dev/null &
}

if [ ! -r "$xidfile" ];
then
	runtabbed
else
	xid=$(cat "$xidfile")
	xprop -id "$xid" >/dev/null 2>&1
	if [ $? -gt 0 ];
	then
		runtabbed
	else
		surf -e "$xid" "$uri" >/dev/null 2>&1 &
	fi
fi

