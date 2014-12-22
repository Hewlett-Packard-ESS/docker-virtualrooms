#!/bin/bash
uid=${uid:-1000}
gid=${uid:-1000}
DISPLAY=${DISPLAY:-:0}
export uid=1000 gid=1000
sudo chown ${uid}:${gid} -R /home/developer
sudo su root -c 'echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd'
sudo su root -c 'echo "developer:x:${uid}:" >> /etc/group'

echo "Starting virtual rooms on X$DISPLAY"
DISPLAY=$DISPLAY /opt/hpvirtualrooms/hpvirtualrooms
