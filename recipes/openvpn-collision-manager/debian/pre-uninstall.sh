#!/bin/sh
set -e

if [ -z "$1" ] ; then
  name="openvpn-collision-manager"
  /bin/systemctl stop ${name} > /dev/null 2>&1
  /bin/systemctl disable ${name} > /dev/null 2>&1
  /bin/systemctl daemon-reload
fi

exit 0

