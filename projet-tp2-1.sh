#!/bin/bash

docker cp ./data hadoop-master:/root/data
docker exec -t hadoop-master chmod -R 777 /root/data

docker exec -t hadoop-master hdfs dfs -put "/root/data/bitcoincash.csv"

docker cp hadoop-java/demo/target/demo-1.0-SNAPSHOT.jar hadoop-master:/root/demo.jar

# docker exec -it hadoop-master spark-submit  --class spark.batch.tp21.WordCountTask --master local wordcount-spark.jar input/purchases.txt out-spark-test
docker exec -it hadoop-master spark-submit  --class com.crypto.trading.SessionTransformer --master yarn --deploy-mode cluster demo.jar bitcoincash.csv out-demo
