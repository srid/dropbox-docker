# dropbox-docker

A docker image for writing Dropbox-based server apps.

This image provides a single useful feature called post-update hooks. Your app image can provide this hook, which gets run whenever the files under Dropbox is updated. See example/pelican - a static site generator seamlessly using Dropbox.

## quick start

Get yourself a Ubuntu 14.04 machine, and then:

```bash
# install docker
apt-get -y install docker.io make

# make image
make

# first-time setup; add container to your docker account
make shell
root@3951be1e6b1f:~# launch setup
... go to the URL
... Ctrl-c after "This computer is now linked to Dropbox."

# run forever
make run
```

## Experiment log

### Bittorrent Sync failed

btsync seemed like the perfect solution, but I consistently noticed data loss due to timestamps. This has been discussed in the [BT forum](http://forum.bittorrent.com/topic/20104-reproducible-data-loss-same-as-old-file-overwriting-new-files/).

### Dropbox

Dropbox is not perfect either; if an attacker gains access to the server instance, he gets access to all files in your Dropbox (selective sync is no solution here). Dropbox's API is insufficient for our purposs; their Sync API cannot be used from servers, and their Server API doesn't seem to do seamless sync. That's what I gather from my cursory reading of their API documentation.

There is however a workaround, which is what I'm exploring: create a secondary Dropbox account and share the particular folder to that account. This way, if the server instance is compromised, only that particular folder will be vulnerable.

An unintended advantage of using Dropbox is that sync feels much faster (instantaneous) compared to btsync.
