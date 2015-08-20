# spark-master
docker run -d --name spark-master --hostname spark-master -p 7077:7077 -p 18080:18080 spark-master:0.1 

# spark-workers
for i in [1..2];do
    docker run -d --name spark-worker-${i} --hostname spark-master-${i} --link spark-master:spark-master spark-worker:0.1
done

# spark-shell
docker run -d --name spark-client --hostname spark-client --link spark-master:spark-master spark-client:0.1

    
