#!/usr/bin/env sh
exec /usr/bin/confd -interval 60 -backend rancher -prefix /2015-12-19 > /tmp/confd.log 2>&1 