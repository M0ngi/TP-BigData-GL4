#!/bin/bash

docker cp hadoop-java/wordcounttask/target/wordcounttask-1.0-SNAPSHOT.jar hadoop-master:/root/wordcount-spark.jar

# docker exec -it hadoop-master spark-submit  --class spark.batch.tp21.WordCountTask --master local wordcount-spark.jar input/purchases.txt out-spark-test
# docker exec -it hadoop-master spark-submit  --class spark.batch.tp21.WordCountTask --master yarn --deploy-mode cluster wordcount-spark.jar input/purchases.txt out-spark2
