FROM velvia/spark-jobserver:0.5.2
MAINTAINER Kushal Mangtani <kushal.mangtani@viasat.com>

# Add the job-server.conf file
ADD ./jobserver.conf /app/docker.conf
RUN chmod -R 755 /app

# copy the  spark-defaults.conf file passed
COPY spark-defaults.conf ${SPARK_HOME}/conf/spark-defaults.conf
RUN chmod -R 755 ${SPARK_HOME}/conf

# create spark eventLog dir (#HACK - spark-eventLOg dir is set in ./spark-defaults.conf. They need to be consistent with the spark-defaults.conf )
#RUN mkdir -p /tmp/spark-eventLog

# Expose ports
EXPOSE 7001 7002 7003 7004 7005 7006 4040 8090

# add SPARK_LOCAL_IP and SPARK_PUBLIC_DNS change
#RUN echo "export SPARK_LOCAL_IP=`hostname`" >> ${SPARK_HOME}/conf/spark-env.sh
#RUN echo "export SPARK_PUBLIC_DNS=${SPARK_LOCAL_IP}" >> ${SPARK_HOME}/conf/spark-env.sh

# set spark-jobserver log4j to debug
#RUN sed 's/log4j.rootLogger=INFO/log4j.rootLogger=DEBUG/' /app/log4j-server.properties


# expose
#EXPOSE 8090
#EXPOSE 30000-60000

# Env variables
ENV SPARK_JOBSERVER_VERSION 0.5.2

# startup script
COPY jobserver_start.sh /app/jobserver_start.sh
CMD ["/app/jobserver_start.sh"]
