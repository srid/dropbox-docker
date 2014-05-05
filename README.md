# syncweb

Experiments in dropbox, docker, static site hosting.

Aiming to make Dropbox based static blog hosting seamless.

## Getting started

Get yourself a Ubuntu 14.04 VM, followed by:

```
# install docker
apt-get -y install docker.io make

# add the path to your pelican site directory in Dockerfile as
# PELICAN_PATH. for example, if your pelican dir exists as
# ~/Dropbox/mysites/myblog, set PELICAN_PATH to "mysites/myblog"
vi Dockerfile

# build the image
make

# initial one-time setup: add ourself as a computer to dropbox
make shell
...
root@3951be1e6b1f:~# syncweb-start
# after you run 'syncweb-start' in the container, Dropbox will prompt
# you to navigate to a URL and authorize this
# container^Wcomputer. once that is done, exit from shell and:

# start the container
make run

```

At this point, you can access the [Pelican](http://blog.getpelican.com/) static site as http://IPADDR:8080. The port 8080 can be configured in Makefile.

## Experiment log

### Bittorrent Sync failed

btsync seemed like the perfect solution, but I consistently noticed data loss due to timestamps. This has been discussed in the [BT forum](http://forum.bittorrent.com/topic/20104-reproducible-data-loss-same-as-old-file-overwriting-new-files/).

### Dropbox

Dropbox is not perfect either; if an attacker gains access to the server instance, he gets access to all files in your Dropbox (selective sync is no solution here). Dropbox's API is insufficient for our purposs; their Sync API cannot be used from servers, and their Server API doesn't seem to do seamless sync. That's what I gather from my cursory reading of their API documentation.

There is however a workaround, which is what I'm exploring: create a secondary Dropbox account and share the particular folder to that account. This way, if the server instance is compromised, only that particular folder will be vulnerable.

An unintended advantage of using Dropbox is that sync feels much faster (instantaneous) compared to btsync.
