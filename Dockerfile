FROM ubuntu:trusty-20150427
MAINTAINER docker.frontg8_server@estada.ch

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && apt-get install -y git ca-certificates \
 && rm -rf /var/lib/apt/lists/* # 20150504