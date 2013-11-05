FROM ubuntu

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libperl-dev pkg-config wget
RUN mkdir -p /usr/src/znc-1.2
RUN cd /usr/src/; wget http://znc.in/releases/znc-1.2.tar.gz; tar -xvzf znc-*.tar.gz
RUN cd /usr/src/znc-1.2; ./configure; make; make install
RUN useradd -m znc
RUN mkdir -p /home/znc/.znc; chown -R znc:znc /home/znc/.znc

# CMD moves around znc.conf to clear lock and runs znc
CMD ["su", "znc", "-c", "cp ~/.znc/configs/znc.conf ~/.znc/configs/znc.conf.new; rm ~/.znc/configs/znc.conf; mv ~/.znc/configs/znc.conf.new ~/.znc/configs/znc.conf; znc -f"]
