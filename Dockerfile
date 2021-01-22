FROM adoptopenjdk/openjdk11

ADD elasticsearch-7.10.2-linux-x86_64.tar.gz /opt/

ADD logstash.tar.gz /opt/

RUN useradd -ms /bin/bash elastic

RUN apt-get update && \
    apt-get install vim -y

RUN chown -R elastic:elastic /opt/

ADD indexes.tar.gz /opt/

WORKDIR /opt/

COPY start.sh /opt/start.sh

RUN chmod +x /opt/start.sh

USER elastic

ENTRYPOINT ["/opt/start.sh"]

EXPOSE 9200 9300
