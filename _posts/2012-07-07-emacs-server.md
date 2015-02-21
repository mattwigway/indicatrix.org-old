---
author: mattwigway
layout: post
title: Running an Emacs Server
---

I've just begun running an Emacs Server process on my computer; now, instead of having many emacs processes running when I'm editing code, I have just one. Each emacs window can access the buffers in every other one. Also, emacs now starts much more quickly than it did before (because it's actually already running). Here's how it's done.

The first thing to do is to add this line at the end of your .emacs:

`(server-start)`

When emacs finishes initializing, it will be in server mode. The emacsclient program will be able to connect to it. The next step is to have emacs start automatically when you turn on your computer. What I did was to add the following command to my GNOME startup applications (Ubuntu button -> search for "Startup Applications", then click add):

`emacs --iconic`

That starts up emacs with an iconified window. Theoretically, using the `-nw` option would work better, however GNOME won't start a non-graphical application in the startup applications, it seems. This is the next-best thing (suggestions welcome of course).

The last step is to set it up so that this setup is transparent. I put this in my `.bashrc`:

`alias emacs='emacsclient -d $DISPLAY -c'`

That means that I can type `emacs <filename>` and have a new window open on the current display (`-d $DISPLAY`) in a new frame (`-c`), rather than in the existing (iconified) window. It's almost transparent, except that emacs starts up with impressive speed and my buffers are shared. Of course, since it's a shell alias, you'll have to use other techniques where the shell does not process the command.

There are a few downsides:

* If you do a lot of ELisp programming (especially in `.emacs`), and you need to restart emacs frequently, this makes it much harder to do that.
* If you have an older computer, you may not want the overhead imposed by emacs at all times.
* Since all your emacs sessions are linked, an unsaved buffer anywhere will cause emacs to block logout.
