#!/usr/bin/env bash
cd ${SPARK_HOME}
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`

# env variables generated via the --link flag in docker
MASTER_PORT=${SPARK_MASTER_ENV_SPARK_MASTER_PORT}
MASTER_ADDRESS="SPARK_MASTER_PORT_${MASTER_PORT}_TCP_ADDR"

./bin/spark-class org.apache.spark.deploy.worker.Worker \
	spark://${MASTER_ADDRESS}:${MASTER_PORT} \
	-h ${SPARK_LOCAL_IP}

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
		# java process must have died,so should the container.
		break;	
	done;	
done		

