#!/usr/bin/env bash
cd ${SPARK_HOME}
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`

# env variables generated via the --link flag in docker
# Note - linked container should be named 'spark-master'. env variables are based on that
MASTER_PORT=${SPARK_MASTER_ENV_SPARK_MASTER_PORT}
# Note - 7077 should be resolved via the ${MASTER_PORT}. However,my double substition were failing. Hence,hardcoded
MASTER_ADDRESS=${SPARK_MASTER_PORT_7077_TCP_ADDR}


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
	fi	
done		

