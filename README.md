Silicon - simple ncurses text editor
=======

Silicon is a simple modal editor, forked from suckless.org's Sandy.

Sandy can be found here: http://tools.suckless.org/sandy

Requirements
------------
In order to build Silicon you need the ncurses header files.

Installation
------------
Edit config.mk to match your local setup (Silicon is installed into the
/usr/local namespace by default). Optionally, create a config.h file to
further configure the editor at compile time. An example file is provided as
config.def.h.

Afterwards enter the following command to build and install Silicon (use root if
needed):

    make clean install

Running Silicon
-------------
Use the following syntax:

si [-a] [-r] [-S | -s SYNTAX] [-t TABSTOP] [File]

Where:

-a starts with autoindent

-r opens the file read-only

-S use no syntax colors at all.

-s SYNTAX lets you specify the syntax colors for this file

-t TABSTOP sets the tabstop for this instance of Silicon


Future
------

Silicon (hopefully) retains all of the functionality of Sandy. In addition, there are a few more planned features (in no particular order):

* Multiple cursors
* Line numbers
* Fuzzy search for commands (via dmenu?)
* Bracket matching
* Number modifier
* Chorded keysequences, e.g. vim's r, f, d, etc.
