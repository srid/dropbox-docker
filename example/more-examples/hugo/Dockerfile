FROM srid/dropbox

ENV HUGO_VERSION 0.10

ENV HUGO_BASENAME hugo_${HUGO_VERSION}_linux_amd64
ENV HUGO_URL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BASENAME}.tar.gz
ENV PATH /${HUGO_BASENAME}:$PATH
RUN cd / && wget -q ${HUGO_URL} && \
    tar zxvf ${HUGO_BASENAME}.tar.gz && \
    rm ${HUGO_BASENAME}.tar.gz && \
    ln -s /${HUGO_BASENAME}/${HUGO_BASENAME} /${HUGO_BASENAME}/hugo

RUN apt-get -qy install nginx-light python-pygments

ADD start /image/hooks/

ENV HUGO_DIR ${DROPBOX_DIR}/Hugo
ENV DROPBOX_WATCH_DIR ${HUGO_DIR}
ENV DROPBOX_POST_UPDATE_COMMAND hugo