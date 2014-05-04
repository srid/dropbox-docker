syncweb
=======

Experiments in btsync, docker, static site hosting

Bittorrent Sync failed
----------------------

btsync seemed like the perfect solution, but I consistently noticed data loss due to timestamps. This has been discussed in the [BT forum](http://forum.bittorrent.com/topic/20104-reproducible-data-loss-same-as-old-file-overwriting-new-files/).

Dropbox
-------

Dropbox is not perfect either; if an attacker gains access to the server instance, he gets access to all files in your Dropbox (selective sync is no solution here). Dropbox's API is insufficient for our purposs; their Sync API cannot be used from servers, and their Server API doesn't seem to do seamless sync. That's what I gather from my cursory reading of their API documentation.

There is however a workaround, which is what I'm exploring: create a secondary Dropbox account and share the particular folder to that account. This way, if the server instance is compromised, only that particular folder will be vulnerable.
