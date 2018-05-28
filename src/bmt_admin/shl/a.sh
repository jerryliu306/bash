#!/bin/bash
source ../cmn/env.profile

SHELLFILE=$0
LOGDIR=../log
LOGFILE=$LOGDIR"/"$SHELLFILE".log"

START_DATE=`echo $1 |sed 's/-//g'`
END_DATE=`echo $2 |sed 's/-//g'`


START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo $SHELLFILE":Start Time:"$START_TM1

# please run at master or segment node
###### query start
psql -U letl -d uec -e > $LOGFILE 2>&1 <<-!
\timing on
set gp_segments_for_planner=1;



!
###### query end

END_TM1=`date "+%Y-%m-%d %H:%M:%S"`

echo $SHELLFILE'|Start Time         |End Time' >> $LOGFILE
echo $SHELLFILE'|'$START_TM1'|'$END_TM1 >> $LOGFILE

echo $SHELLFILE":End Time  :"$END_TM1

