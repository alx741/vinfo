1. Introduction
===============

Vinfo is a Vim plugin that allows you to read
[ Info documentation files ]( http://www.gnu.org/software/texinfo/ ) right inside a
Vim session in a Vim-help fashioned way or from a shell just the way you normally use
[ Info ]( http://www.gnu.org/software/texinfo/manual/info/info.html#Top )



2. Installation
===============

- Vinfo is [Pathogen](https://github.com/tpope/vim-pathogen)/
[Vundle](https://github.com/gmarik/Vundle.vim) compatible.

- Or install it manually by copying the files to the corresponding locations.



3. Usage
========

Vinfo can be used right inside a Vim session or from a shell using an alias.


3.1 Use inside Vim
------------------

You can use Vinfo inside Vim with:

    :Vinfo doc

Where `doc` is the Info documentation to read.

Example:
Read [Glibc](http://www.gnu.org/software/libc/) Info documentation

    :Vinfo libc



3.2 Use outside Vim
-------------------

TODO: fill this section



4. FAQ
======

4.1 Why the first time I open a Info doc is too slow
----------------------------------------------------

The first time Vinfo will create an repo for that Info doc, convert the text
files to Vim help-file syntax and create the tags.

Don't worry, it's just the very first time. Then it will be ok.


4.2 My Info files has been updated but Vinfo is still using the old ones
------------------------------------------------------------------------

In Vim execute:

    :VinfoClean


4.3 Does Vinfo works in Mac or Windows?
---------------------------------------

No. It's just for GNU/Linux systems.
[Info is the GNU documentation system](http://www.gnu.org/software/texinfo/manual/info/info.html)
