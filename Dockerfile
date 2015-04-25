# Following instructions at http://www.datastax.com/documentation/cassandra/2.0/webhelp/index.html#cassandra/install/installDeb_t.html

# Base operating system image
FROM centos

ADD src/datastax.repo /etc/yum.repos.d/datastax.repo
ADD src/start.sh /usr/local/bin/start.sh

RUN yum install -y java-1.7.0-openjdk-devel.x86_64 which && \
    yum install -y dsc20 && \
    mkdir -p /home/cassandra && \
    chown cassandra:cassandra /home/cassandra && \
    usermod --home /home/cassandra cassandra 

ENV HOME /home/cassandra

EXPOSE 9160 7000 7001 9042 7199

USER cassandra
CMD start.sh
