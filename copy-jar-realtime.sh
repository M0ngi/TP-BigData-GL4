#!/bin/bash

docker cp hadoop-java/tp2_realtime/target/tp2_realtime-1.0-SNAPSHOT.jar hadoop-master:/root/tp2_realtime-spark.jar
# docker exec -it hadoop-master spark-submit  --class com.bigdata.tp2.Stream --master yarn --deploy-mode cluster tp2_realtime-spark.jar
