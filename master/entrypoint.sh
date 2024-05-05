#!/bin/bash

# /usr/sbin/sshd -D -e
service ssh start

/root/start-hadoop.sh
# /root/start-kafka-zookeeper.sh

# chmod 777 -R /root/purchases.txt

sleep 30

hdfs dfs -mkdir -p input
hdfs dfs -put /root/purchases.txt input
hdfs dfs -ls input
hdfs dfs -tail input/purchases.txt

echo "DONE"
tail -f /dev/null