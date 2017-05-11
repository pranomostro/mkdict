Generate a dictionary from the web
==================================

mkdict downloads, crawls and parses webpages to generate a wordlist
with frequencies.

If you need a dictionary, execute

	./mkdict https://en.wikipedia.org/wiki/Main_Page 10000

and wait some time. The resulting dictionary is saved in the file dict,
each line containing the frequency of the word in words per million and the word.

Requirements
------------

* 	the rc shell, available with
	[plan9port](https://swtch.com/plan9port/),
	[9base](http://tools.suckless.org/9base)
	or [standalone](https://www.github.com/rakitzis/rc).
* 	[skip](https://www.github.com/pranomostro/skip).
*	utilities not defined by POSIX: curl, stdbuf

License
-------

See ./LICENSE.
