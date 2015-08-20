#!/bin/bash

# a simple wrapper script for startup
# Note - Since, we are passing the link env variables in SPARK_MASTER_URL. It cannot be passed via the -e flag in docker run.
# Hence, this startup script is required

MASTER_PORT=${SPARK_MASTER_ENV_SPARK_MASTER_PORT}
MASTER_ADDRESS=${SPARK_MASTER_PORT_7077_TCP_ADDR}

export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
export SPARK_MASTER="spark://${MASTER_ADDRESS}:${MASTER_PORT}"

# this cd is required because the app/server_start.sh does some pwd and other current dir calculations 
# Also, "app/server_start.sh" is passed at the ENTRYPOINT
cd /

# '/app/server_start.sh' is passed internally in jobserver image itself
# Note - https://issues.apache.org/jira/browse/SPARK-6680
app/server_start.sh --conf spark.driver.host=${SPARK_LOCAL_IP}