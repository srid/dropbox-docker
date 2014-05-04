FROM ubuntu

RUN apt-get -qy install wget
RUN mkdir /btsync && \
	cd btsync && \
	wget -O - http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable | tar xzf -

VOLUME ["/btsync/data"]
WORKDIR /btsync
