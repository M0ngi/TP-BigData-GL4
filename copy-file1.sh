#!/bin/bash

# Used in TP2

docker cp ./file1.txt hadoop-master:/root/
docker exec -it hadoop-master hdfs dfs -put file1.txt

