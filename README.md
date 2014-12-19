# HP Virtual Rooms
This is a docker version of the HP Virtual Rooms client available at https://www.rooms.hp.com/resources

As they only support a limited number of operating systems (mine not being one of them) I have created this container which has all the dependencies required to run the stand alone client.

## Use
You need to share your X11 socket with the container as a volume:
```
docker run -ti --rm -v /tmp/.X11-unix:/tmp/.X11-unix hpess/virtualrooms
```
Running that should pop up a nice shiney virtual room client.

## X Server not on :0
If your xserver isn't on :0, start it like this:
```
docker run -ti --rm -e DISPLAY:$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix hpess/virtualrooms
```
## Warnings
This is by no means a piece of software supported by Hewlett-Packard, or HPVR, you use it at your own risk and by using the HPVR software you're subject to their licence terms and conditions too.
