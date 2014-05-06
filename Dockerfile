FROM ubuntu

RUN apt-get -qy install wget python-minimal inotify-tools make

ENV HOME /data
RUN mkdir /data /image && \
	cd image && \
	wget -q -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

VOLUME ["/data"]
ADD bin /image/bin
RUN cd /image/bin && \
    wget -q "https://www.dropbox.com/download?dl=packages/dropbox.py" -O dropbox.py && \
    chmod a+x dropbox.py && \
    ln -s `pwd`/dropbox.py d

ENV PATH /image/bin:$PATH
ENV DROPBOX_DIR $HOME/Dropbox

WORKDIR /data
CMD ["/image/bin/launch"]
