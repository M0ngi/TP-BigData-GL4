#!/bin/bash

docker cp ./hadoop-java/wordcount/target/wordcount-1.0-SNAPSHOT-jar-with-dependencies.jar hadoop-master:/root/wordcount.jar
docker exec -t hadoop-master chmod 777 /root/wordcount.jar
