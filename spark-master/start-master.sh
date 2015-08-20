#!/usr/bin/env bash
export SPARK_MASTER_IP=`awk 'NR==1 {print $1}' /etc/hosts`
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
${SPARK_HOME}/sbin/start-master.sh  -h ${SPARK_LOCAL_IP} 

# sleeping for 2 secs so that spark-process if up!
sleep 2

# check if java process(i.e spark) is running
while true;
do
	if [ `ps -ef | grep -c [j]ava` -eq 1 ]
	then
		# sleep for 5 sec and check again!	
		sleep 5 
	else
		break;	
	done;	
done		

