FROM debian:buster

RUN apt-get update \
  && apt-get -y install git-core gcc g++ make \
  && cd /tmp \
  && git clone https://github.com/sippy/rtpproxy.git \
  && git -C rtpproxy submodule update --init --recursive \
  && cd rtpproxy \
  && ./configure \
  && make \
  && make install \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /usr/local/bin/rtpproxy -F -f -m 10000 -M 20000 -s udp:*:7722
