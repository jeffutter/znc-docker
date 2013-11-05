FROM ubuntu

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libperl-dev pkg-config wget
RUN mkdir -p /usr/src/znc-1.2
RUN cd /usr/src/; wget http://znc.in/releases/znc-1.2.tar.gz; tar -xvzf znc-*.tar.gz
RUN cd /usr/src/znc-1.2; ./configure
RUN cd /usr/src/znc-1.2; make
RUN cd /usr/src/znc-1.2; make install
