Docker container for spark stand alone cluster
=================================

This repo is a customized fork of [epahomov/docker-spark](https://github.com/epahomov/docker-spark)

Configuration
-------------

For updating the spark-version, just update this [ENV variable](https://github.com/kushalmangtani/docker-spark/blob/master/spark-base/Dockerfile#L9)

Build
-----

```
bash build.sh
```


Run
---

Update the no of [spark-workers](https://github.com/kushalmangtani/docker-spark/blob/master/run.sh#L5) and run 'run.sh'

```
bash run.sh

```


If you execute these images without scripts mentioned above, please:
* Remeber to name master container as spark_master for correct working on linkage.
* Read [documentation](http://sometechshit.blogspot.ru/2015/04/running-spark-standalone-cluster-in.html) to understand what's going on.

I also recommend you to use [Zeppelin](https://zeppelin.incubator.apache.org/) instead of spark shell for working with data. It has pleasant GUI and IPython like functionality. Please use docker [container](https://registry.hub.docker.com/u/epahomov/docker-zeppelin/) for that.
