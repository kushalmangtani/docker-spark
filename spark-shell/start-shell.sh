#!/usr/bin/env bash
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
/remove_alias.sh # problems with hostname alias, see https://issues.apache.org/jira/browse/SPARK-6680

cd ${SPARK_HOME}
# env variables generated via the --link flag in docker
MASTER_PORT=${SPARK_MASTER_ENV_SPARK_MASTER_PORT}
MASTER_ADDRESS=${SPARK_MASTER_PORT_7077_TCP_ADDR}

# adding total-executor-cores=3 coz by default spark-shell consumes more than 50% cores in the cluster
# spark-shell should be used as a testing bed
./bin/spark-shell \
	--master spark://${MASTER_ADDRESS}:${MASTER_PORT}  \
	-i ${SPARK_LOCAL_IP} \
	--total-executor-cores 3
