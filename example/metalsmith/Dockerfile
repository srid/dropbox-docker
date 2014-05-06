FROM srid/dropbox

RUN apt-get -qy install nginx-light python-pygments
RUN apt-get -qy install npm git
RUN ln -s /usr/bin/nodejs /usr/local/bin/node

ENV METALSMITH_PLUGINS \
    metalsmith@^0.7.0 \
    metalsmith-templates@^0.1.0 \
    metalsmith-markdown@^0.2.1 \
    metalsmith-permalinks@^0.1.1 \
    handlebars@^2.0.0-alpha.2
RUN npm -g install ${METALSMITH_PLUGINS}
ENV METALSMITH_DIR ${DROPBOX_DIR}/Metalsmith
ENV DROPBOX_WATCH_DIR ${METALSMITH_DIR}
ENV DROPBOX_POST_UPDATE_COMMAND metalsmith

ADD start /image/hooks/