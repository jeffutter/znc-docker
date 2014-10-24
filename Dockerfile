FROM ubuntu:14.04

RUN apt-get update ;\
    apt-get install -y build-essential libssl-dev libperl-dev pkg-config wget ;\
    rm -rf /var/lib/apt/lists/* 
RUN mkdir -p /usr/src/znc-1.4 ;\
    cd /usr/src/; wget http://znc.in/releases/znc-1.4.tar.gz; tar -xvzf znc-*.tar.gz ;\
    cd /usr/src/znc-1.4; ./configure; make; make install
RUN useradd -m znc ;\
    mkdir -p /home/znc/.znc; chown -R znc:znc /home/znc/.znc

# CMD moves around znc.conf to clear lock and runs znc
CMD ["su", "znc", "-c", "cp ~/.znc/configs/znc.conf ~/.znc/configs/znc.conf.new; rm ~/.znc/configs/znc.conf; mv ~/.znc/configs/znc.conf.new ~/.znc/configs/znc.conf; znc -f"]
