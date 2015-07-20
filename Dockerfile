FROM fmorgner/cxx14_network:latest
MAINTAINER docker.frontg8_server@estada.ch

EXPOSE 10000

RUN mkdir -p /home/frontg8 /opt/frontg8/data && cd /home/frontg8 \
  && git clone https://source.arknet.ch/fmorgner/frontg8d.git \
  && cd /home/frontg8/frontg8d/build && ./build
  
VOLUME /opt/frontg8/data

WORKDIR /home/frontg8/frontg8d/build/debug/bin
ENTRYPOINT rm -rf /opt/frontg8/data || mkdir -p /opt/frontg8/data && echo $(dd if=/dev/urandom bs=1 count=42 | sha512sum | base64 --wrap 0) $(dd if=/dev/urandom bs=1 count=42 | sha512sum | base64 --wrap 0) | ./frontg8d 
