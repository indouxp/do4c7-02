#!/bin/sh
###############################################################################
#
# カレントのhosts内の最終行のIPを取得し、接続
#
###############################################################################

HOST=`grep -v "\[" hosts | awk '{print $1;}'`

scp -i ~/.ssh/id_rsa_do4sakura $@ root@${HOST:?}:/tmp
