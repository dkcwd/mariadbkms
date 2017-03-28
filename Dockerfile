FROM ubuntu:xenial
#RUN echo 'deb http://ftp.debian.org/debian xenial main contrib' >> /etc/apt/sources.list
#RUN echo 'deb http://security.debian.org xenial/updates main contrib' >> /etc/apt/sources.list
#RUN echo 'deb-src http://ftp.debian.org/debian xenial main contrib' >> /etc/apt/sources.list
#RUN echo 'deb-src  http://security.debian.org xenial/updates main contrib' >> /etc/apt/sources.list
RUN apt-get -y update && apt-get -y install zip unzip wget && apt-get -y build-dep mysql-server
RUN mkdir maria && cd maria && wget https://github.com/MariaDB/server/archive/10.1.zip
RUN unzip 10.1.zip
RUN BUILD/autorun.sh \
./configure --with-plugin-xtradb \
make dist