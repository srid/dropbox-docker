FROM ubuntu

RUN apt-get -qy install wget python-pelican inotify-tools nginx-light make

ENV HOME /data
RUN mkdir /data /data-init && \
	cd data-init && \
	wget -q -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

VOLUME ["/data"]
ADD bin /data-init/bin
RUN cd /data-init/bin && \
    wget -q "https://www.dropbox.com/download?dl=packages/dropbox.py" -O dropbox.py && \
    chmod a+x dropbox.py && \
    ln -s `pwd`/dropbox.py d

ENV PATH /data-init/bin:$PATH
WORKDIR /data
CMD ["/data-init/bin/start"]
