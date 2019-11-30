FROM debian:buster
MAINTAINER Chinthaka Deshapriya <chinthaka@cybergate.lk>

RUN apt-get update && \ 
  apt-get install -y coturn && \
  apt-get install -y postgresql-client && \
  apt-get install net-tools && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /etc/ssl/le
COPY /run/secure_relay_with_db_psql.sh /secure_relay_with_db_psql.sh
RUN chmod +x secure_relay_with_db_psql.sh

CMD ["/secure_relay_with_db_psql.sh"]
