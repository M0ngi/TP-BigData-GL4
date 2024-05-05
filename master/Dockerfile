FROM liliasfaxi/hadoop-cluster:latest

# RUN mkdir /var/run/sshd
COPY mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml

COPY purchases.txt /root/

RUN chmod 777 /root/purchases.txt

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
