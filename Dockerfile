FROM ubuntu:trusty-20150427
MAINTAINER docker.frontg8_server@estada.ch

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
  && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
  && apt-get update \
  && apt-get install -y git ca-certificates python3-pip python3-openssl \
  && apt-get install -y libprotobuf-dev protobuf-compiler python-protobuf \
  && pip3 install protobuf3 xmlrunner pycrypto pyelliptic pyOpenSSL npyscreen \
 && rm -rf /var/lib/apt/lists/* # 20150504

RUN mkdir -p /home/toolchain && cd /home/toolchain \
  && git clone https://github.com/llvm-mirror/llvm.git && cd llvm \
    && git checkout release_36 \
    && cd tools && git clone https://github.com/llvm-mirror/clang.git \
      && cd clang && git checkout release_36 \
  && cd projects \
    && git clone https://github.com/llvm-mirror/compiler-rt.git && cd compiler-rt \
      && git checkout release_36 && cd .. \ 
    && git clone https://github.com/llvm-mirror/llvm.git && cd llvm \
      && git checkout release_36 && cd .. \
    && git clone https://github.com/llvm-mirror/libcxxabi.git && cd libcxxabi \
      && git checkout release_36 && cd .. \
      && cd ../.. \
  && mkdir build && cd build \
    && ccmake ../llvm
  
