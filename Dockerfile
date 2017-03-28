FROM ubuntu:xenial
# Note: https://github.com/MariaDB/server/blob/10.1/plugin/aws_key_management/CMakeLists.txt
# Also https://launchpad.net/ubuntu/xenial/+source/curl
# install dependencies, note that I ran into "Could NOT find OpenSSL, try to set the path to OpenSSL root folder in the system variable OPENSSL_ROOT_DIR"
RUN apt-get -y update && apt-get -y install zip unzip wget git clang libcurl4-gnutls-dev pkg-config uuid-dev libssl-dev && apt-get -y build-dep mysql-server
RUN mkdir maria && cd maria && wget https://github.com/MariaDB/server/archive/10.1.zip
RUN cd maria && unzip 10.1.zip
# RUN cd maria/server-10.1 && wget https://github.com/aws/aws-sdk-cpp/archive/1.0.90.zip &&
# to view all options for building MariaDB use:
# cmake . -LH
# // How to build plugin AWS_KEY_MANAGEMENT. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_AWS_KEY_MANAGEMENT:STRING=NO
# cmake . -DPLUGIN_AWS_KEY_MANAGEMENT=DYNAMIC
RUN cd maria/server-10.1 && cmake . -DPLUGIN_AWS_KEY_MANAGEMENT=DYNAMIC -DVERBOSE=true
RUN cd maria/server-10.1 && make
