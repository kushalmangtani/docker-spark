# build spark-base
cd ./spark-base
docker build -t spark-base:0.1 .

# spark-master
cd ./../spark-master
docker build -t spark-master:0.1 .

# spark-master
cd ./../spark-worker
docker build -t spark-worker:0.1 .

# spark-client
cd ./../spark-shell
docker build -t spark-client:0.1 .

# jobserver
cd ./../spark-jobserver
docker build -t spark-jobserver:0.1 .
