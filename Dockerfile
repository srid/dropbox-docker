FROM ubuntu

RUN apt-get update
RUN apt-get dist-upgrade -yq
RUN apt-get -qy install wget python-minimal inotify-tools make
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

ENV HOME /data
ENV WGET wget --no-check-certificate -q
RUN mkdir /data /image && \
	cd image && \
	$WGET -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

VOLUME ["/data"]
ADD bin /image/bin
RUN cd /image/bin && \
    $WGET "https://www.dropbox.com/download?dl=packages/dropbox.py" -O dropbox.py && \
    chmod a+x dropbox.py && \
    ln -s `pwd`/dropbox.py d

ENV PATH /image/bin:$PATH
ENV DROPBOX_DIR $HOME/Dropbox

WORKDIR /data
CMD ["/image/bin/launch"]
