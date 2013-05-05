silicon - simple ncurses text editor
=======

Silicon is a simplistic modal editor, forked from suckless.org's Sandy.

Sandy can be found here: http://tools.suckless.org/sandy

Requirements
------------
In order to build silicon you need the ncurses header files.

Installation
------------
Edit config.mk to match your local setup (silicon is installed into the
/usr/local namespace by default). Optionally, create a config.h file to
further configure the editor at compile time. An examples file is provided as
config.def.h.

Afterwards enter the following command to build and install silicon (use root if
needed):

    make clean install

Running silicon
-------------
Use the following syntax:

silicon [-r] [-S | -s SYNTAX] [-t TABSTOP] [File]

Where:

-a starts with autoindent

-r opens the file read-only

-S use no syntax colors at all.

-s SYNTAX lets you specify the syntax colors for this file

-t TABSTOP sets the tabstop for this instance of silicon


Future
------

Silicon (hopefully) retains all of the functionality of Sandy. In addition, there are a few more planned features:

* Multiple cursors
* Line numbers
* Fuzzy search for commands (possibly via dmenu), similar to SublimeText.
* Bracket matching

