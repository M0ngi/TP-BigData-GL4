#!/bin/bash

docker cp hadoop-java/kafka_wordcounter/target/kafka_wordcounter-1.0-SNAPSHOT.jar hadoop-master:/root/kafka_wordcounter-spark.jar

spark-submit --packages org.apache.spark:spark-streaming-kafka-0-10_2.12:3.2.0,org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.0 --class com.kafka.wordcounter.SparkKafkaWordCount --master local kafka_wordcounter-spark.jar localhost:9092 Hello-Kafka mySparkConsumerGroup >> out