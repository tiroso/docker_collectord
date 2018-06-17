FROM debian:stretch-slim

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get -y install \
    perl \
    libnet-server-perl \
    libusb-1.0-0-dev \
    tzdata \
    wget && \
    apt-get clean && cd / && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
WORKDIR "/opt"

RUN wget https://github.com/mhop/fhem-mirror/raw/master/fhem/contrib/PRESENCE/collectord && \
    chmod +x collectord && \
    chgrp -cR dialout collectord

CMD /usr/bin/perl /opt/collectord
