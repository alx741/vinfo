1. Introduction
===============

Vinfo is a Vim plugin that allows you to read
[ Info documentation files ]( http://www.gnu.org/software/texinfo/ ) right inside a
Vim session in a Vim-help fashioned way or from a shell just the way you normally use
[ Info ]( http://www.gnu.org/software/texinfo/manual/info/info.html#Top )


Why?
----

The traditional GNU *Info* program has a 'vi mode', but lets face it, it is just
not good enough; it's very limited and ugly. There are good alternatives though,
as *Pinfo* but is still not comfortable enough and lacking most of the Vim power.

There is where **Vinfo** comes in to allow reading Info documentation in Vim
so we have all the power we need to read and explore in such a comfortable way
and with the beauty and power off Vim help-files.



2. Installation
===============

- Vinfo is [Pathogen](https://github.com/tpope/vim-pathogen)/
[Vundle](https://github.com/gmarik/Vundle.vim) compatible.

- Or install it manually by copying the files to the corresponding locations.



3. Usage
========

Vinfo can be used right inside a Vim session or from a shell using an alias.

** For extra details about how to use Vinfo please use `:h Vinfo` **


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

When your are not inside a Vim session but in the shell prompt you can invoke
Vinfo as a command by using the following shell script:

        #! /bin/sh
        vim -c "Vinfo $1" -c 'silent only'

Save it in `/usr/bin/` as a file named `vinfo`, give it execution
permission with:

    $ chmod +x /usr/bin/vinfo

Then from your shell you can read a DOC with:

    $ vinfo doc



4. FAQ
======

4.1 Why the first time I open an Info doc is too slow
-----------------------------------------------------

The first time Vinfo will create an repo for that Info doc, convert the text
files to Vim help-file syntax and create the tags.

Don't worry, it's just the very first time. Then it will be ok.


4.2 Why the first time I open an Info doc Vim interface freaks out?
-------------------------------------------------------------------

Because of the same reason of `4.1`

But again: Don't worry, it's just the very first time. Then it will be ok.


4.3 My Info files has been updated but Vinfo is still using the old ones
------------------------------------------------------------------------

In Vim execute:

    :VinfoClean


4.4 Does Vinfo works in Mac or Windows?
---------------------------------------

No. It's just for GNU/Linux systems.
[Info is the GNU documentation system](http://www.gnu.org/software/texinfo/manual/info/info.html)



5. MISC
=======

5.1 How it looks
----------------

Reading `Glibc` Info documentation


With traditional *Info*:

![Info](http://i.imgur.com/tDvvj6r.png)


With *Vinfo*:

![Vinfo](http://i.imgur.com/eJCf9K2.png)
