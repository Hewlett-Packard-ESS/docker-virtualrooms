FROM hpess/base:latest 
MAINTAINER Karl Stoney <karl.stoney@hp.com>

RUN yum -y install glibc-2.14.90-24 libXi.so.6 libSM.so.6 libXi.so.6 libXrender.so.1 libXrandr.so.2 libz.so.1 libglib-2.0.so.0 libXfixes.so.3 libasound.so.2 libfontconfig.so.1 libpng12.so.0 libGLU.so.1 xorg-x11-fonts-Type1 && \
    yum -y clean all

RUN cd /opt && \
    wget https://www.rooms.hp.com/vRoom_Cab/hpvirtualrooms-install64-F4-8.0.0.4346.tar.gz && \
    tar -xzf hpvirtualrooms-install64-F4-8.0.0.4346.tar.gz && \
    mv hpvirtualrooms-install hpvirtualrooms && \
    rm -f hpvirtualrooms-install64-F4-8.0.0.4346.tar.gz

RUN useradd developer -G wheel && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER developer
ENV HOME /home/developer

ADD start.sh /home/developer/start.sh
ENTRYPOINT ["/home/developer/start.sh"]
