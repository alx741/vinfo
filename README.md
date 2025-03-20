# 1. Introduction

Vinfo is a Vim plugin that allows you to read
[Info documentation files](http://www.gnu.org/software/texinfo/)
right inside a Vim session in a Vim-help fashioned way or from a shell just the
way you would normally use [Info](http://www.gnu.org/software/texinfo/manual/info/info.html#Top)


## Why?

The traditional GNU *Info* program has a 'vi mode', but let's face it, it's just
not good enough; it's very limited and ugly.

That is where *Vinfo* comes in, leveraging Vim's help-files format and
navigation (tags jumping).



# 2. Installation

- Vinfo is [Pathogen](https://github.com/tpope/vim-pathogen)/
[Vundle](https://github.com/gmarik/Vundle.vim) compatible.

- Or install it manually by copying the files to the corresponding locations.


## 2.1 Macos

- requires coreutils
```sh
brew install coreutils
```


```vimscript
let g:vinfo_repo_path = $XDG_CACHE_HOME/vinfo
```

# 3. Configuration

To set a custom location for the doc repo set the `g:vinfo_repo_path` to the custom file location:


# 4. Usage

Vinfo can be used right inside a Vim session or from a shell using an alias.

** For extra details about how to use Vinfo please use `:h Vinfo` **


## 4.1 Use inside Vim

You can use Vinfo inside Vim with:

	:Vinfo doc

Where `doc` is the Info documentation to read.

Example:
Read [Glibc](http://www.gnu.org/software/libc/) Info documentation

	:Vinfo libc



## 4.2 Use outside Vim

When you're not inside a Vim session but in the shell prompt you can invoke
Vinfo as a command by using the following shell script:

		#! /bin/sh
		vim -c "Vinfo $1" -c 'silent only'

Save it in `/usr/bin/` as a file named `vinfo`, give it execution
permission with:

	$ chmod +x /usr/bin/vinfo

Then from your shell you can read a DOC with:

	$ vinfo doc



# 5. FAQ

## 5.1 Why the first time I open an Info doc is too slow

The first time Vinfo will create a repo for that Info doc, convert the text
files to Vim help-file syntax and create the tags.

Don't worry, it's just the very first time. Then it will be ok.


## 5.2 Why the first time I open an Info doc Vim interface freaks out?

Because of the same reason of `4.1`

But again: Don't worry, it's just the very first time. Then it will be ok.


## 5.3 My Info files have been updated but Vinfo is still using the old ones

In Vim execute:

	:VinfoClean


## 5.4 Does Vinfo works in Mac or Windows?

No. It's just for GNU/Linux systems.
[Info is the GNU documentation system](http://www.gnu.org/software/texinfo/manual/info/info.html)
