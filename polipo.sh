#!/bin/sh
NAME=polipo
CONFIG_FILE=/etc/polipo/config
PIDFILE=/var/run/$NAME/$NAME.pid

### from /etc/init.d/polipo
# Make sure /var/run/polipo exists.
if [ ! -e /var/run/$NAME ] ; then
        mkdir -p /var/run/$NAME
        chown proxy:proxy /var/run/$NAME
        chmod 755 /var/run/$NAME
fi

exec /sbin/setuser proxy /usr/bin/polipo  -c $CONFIG_FILE daemonise=false
