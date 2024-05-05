#!/bin/bash

docker cp hadoop-java/realtime/target/realtime-1.0-SNAPSHOT.jar hadoop-master:/root/realtime.jar

docker exec -it hadoop-master spark-submit  --class com.crypto.trading.Stream --master yarn --deploy-mode cluster realtime.jar out-realtime
