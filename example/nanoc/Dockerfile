FROM srid/dropbox

RUN apt-get -qy install nginx-light python-pygments
RUN apt-get -qy install ruby ruby-dev
RUN gem install nanoc
ENV NANOC_EXTENSIONS kramdown pygments.rb nokogiri
RUN gem install ${NANOC_EXTENSIONS}

ENV NANOC_DIR ${DROPBOX_DIR}/nanoc
ENV DROPBOX_WATCH_DIR ${NANOC_DIR}
ENV DROPBOX_POST_UPDATE_COMMAND nanoc

ADD start /image/hooks/
