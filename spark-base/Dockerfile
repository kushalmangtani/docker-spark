FROM debian:jessie
MAINTAINER Kushal Mangtani <kushalmangtani88@gmail.com>

# Install some linux utilities
RUN apt-get update && apt-get install -y wget curl git python-pip openjdk-7-jdk supervisor python-dev libffi-dev vim openssh-server

# Install Spark
# Using a 'spark-without-hadoop' dist
ENV SPARK_VERSION 1.4.1
RUN curl -s http://www.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.6.tgz | tar -zx -C /usr/local/
RUN (cd /usr/local && ln -s spark-${SPARK_VERSION}-bin-hadoop2.6 spark)
ENV SPARK_HOME /usr/local/spark

# spark-default.conf
COPY ./spark-defaults.conf ${SPARK_HOME}/conf/spark-defaults.conf

# SPARK_OPTS (Might be not needed,since they are already passed in spark-defaults.conf)
ENV SPARK_MASTER_OPTS="-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"
ENV SPARK_WORKER_OPTS="-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

# ENV variables.
# Note - If you wanna update the ports, update the ENV variables below and rebuild the image. 
# They are being used in start-worker.sh && start-shell.sh scripts
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 18080
ENV SPARK_WORKER_PORT 7078
ENV SPARK_WORKER_WEBUI_PORT 18081

# EXPOSE everything
EXPOSE 7001 7002 7003 7004 7005 7006 7077 4040 7078 18080 18081  
