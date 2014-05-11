# nanoc on Dropbox

This app runs a [nanoc](http://nanoc.ws) based static site (behind nginx) based on the content stored in Dropbox.

## getting started

Customize your `NANOC_DIR` in Dockerfile and generated the image:

    make

Now, add to dropbox using (followed by Ctrl-c):

    make shell
    ...
    > launch setup
    # see parent README for details

Run forever:

    make run
