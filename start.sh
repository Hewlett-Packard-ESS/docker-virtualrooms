#!/bin/bash
uid=${uid:-1000}
gid=${uid:-1000}
DISPLAY=${DISPLAY:-:0}
export uid=$uid gid=$gid DISPLAY=$DISPLAY http_proxy=$http_proxy https_proxy=$https_proxy
sudo chown ${uid}:${gid} -R /home/developer
sudo su root -c 'echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd'
sudo su root -c 'echo "developer:x:${uid}:" >> /etc/group'

echo "Starting virtual rooms on X$DISPLAY"
/opt/hpvirtualrooms/hpvirtualrooms
