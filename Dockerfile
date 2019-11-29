FROM debian:buster
MAINTAINER Chinthaka Deshapriya <chinthaka@cybergate.lk>

RUN apt-get update && \ 
  apt-get install -y coturn && \
  apt-get install -y postgresql-client && \
  apt-get install -y mariadb-client && \
  apt-get install net-tools && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV TURN_PORT 3478
ENV TURN_PORT_START 10000
ENV TURN_PORT_END 20000
ENV TURN_SECRET  cybersecret
ENV TURN_SERVER_NAME coturn
ENV TURN_REALM cybergate.lk

ADD start_coturn.sh start_coturn.sh
RUN chmod +x start_coturn.sh

CMD ["./start_coturn.sh"]
