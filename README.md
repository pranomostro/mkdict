Generate a dictionary from the web
==================================

From Wikipedia, to be exact.
mkdict is a script based on a challenge
by my father who said one could not write
anything complex with shell scripts, like
for example a program analyzing webpages and
generating a dictionary from them. I disagreed
and wrote a first prototype for this in \~15 minutes.

So, if you need a dictionary, just execute
	./mkdict https://en.wikipedia.org/wiki/Main_Page 10000
and wait some time. The resulting dictionary is saved in
the file dict, with the form
FREQUENCY (in wpm (words per million)) WORD.
Then you should run make to clean the logfile and the cached
webpages.

Configuration
=============

At the moment, this is configured for wikipedia.
You can change the configuration by editing some
regular expressions in the source code.

There is also a file called badwords for words
you might not want in your dictionary.

Requirements
============

If you want mkdict working, you need
[skip](https://www.github.com/scharlatan/skip)
installed. mkdict needs it for removing javascript
code and html tags.
Also, a standard unix environment is needed.

Installation
============

mkdict is not really installed in that sense, you just
open the repo, run mkdict, save the dictionary, and
delete it again.

Quirks and Problems
===================

mkdict gets quite slow if you let it download >100000 webpages.
It also fills your harddrive, so you might consider running
`make clean` after generating the dictionary.

I don't really want to write all of this down again,
just look at the manpage.

License
=======

See ./COPYING.
