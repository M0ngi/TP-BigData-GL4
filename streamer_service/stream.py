import sys
from confluent_kafka import Producer
import requests
import time


def acked(err, msg):
    if err is not None:
        print(f"Failed to deliver message: {str(msg)}: {str(err)}", file=sys.stderr)
    else:
        print(f"Message produced: {str(msg)}",  file=sys.stderr)


conf = {
    'bootstrap.servers': "hadoop-master:9092",
    'acks': 'all',
    'retries': 0,
    'batch.size': 16384,
    'buffer.memory': 33554432,
    'key.serializer': 'org.apache.kafka.common.serialization.StringSerializer',
    'value.serializer': 'org.apache.kafka.common.serialization.StringSerializer'
}

producer = Producer(**conf)

while True:
    try:
        resp = requests.get("https://api.coincap.io/v2/rates/bitcoin")
        body = resp.json()
        print(body)
        
        producer.produce("Crypto-Kafka", value=str(body), callback=acked)
        
        time.sleep(1)
    except KeyboardInterrupt:
        print("Exiting...")
        break
