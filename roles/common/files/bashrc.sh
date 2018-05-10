#!/bin/sh

NAME=${0##*/}
BASHRC=~/.bashrc

# 変更済みの判断は、ORACLE_BASEのみ
if grep "ORACLE_BASE" ${BASHRC:?} > /dev/null; then
  exit 0
fi

cat <<EOT >> ${BASHRC:?}
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=\${ORACLE_BASE}/product/12.2.0/db_1
export PATH=\${ORACLE_HOME}/bin:\$PATH:\$HOME/bin
export LD_LIBRARY_PATH=\$ORACLE_HOME/lib
export ORACLE_SID=orcl
export NLS_LANG=Japanese_japan.al32utf8
export LC_ALL=ja_JP.utf8
EOT
RC=$?
if [ "${RC:?}" -ne "0" ];then
  logger local0.err "${NAME:?}: cat fail. rc=${RC:?}" 
  exit ${RC:?}
fi
exit 0
