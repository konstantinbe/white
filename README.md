White
-----

`white` is a little command line utility to clean up whitespace in source files.

What gets cleaned up?

* Removes white spaces at the end of lines
* Removes blank lines at the end of a file
* Converts tabs to spaces (2 spaces by default)

Backups?

A backup file is saved for every file. By default, this backup files are
automatically removed after the cleanup succeeded.


Installation
------------

Install the `white` ruby gem:

    gem install white

In case you haven't heard of the excellent Ruby Version Manager (RVM), I highly
recommend using it to get rid of `sudo` and manage different ruby versions and
gem sets. Check it out at: <http://rvm.beginrescueend.com/>.


Getting Started
---------------

Clean up one file:

    white my-source-file.rb

Clean up all files in a directory:

    white path/to/source/files/

Exclude certain files:

    white source1.rb source2.rb path/to/sources/ --exclude vendor build tmp *~


Conventions
-----------

* Use dashed notation for directories, files, and URLs: `milk/core-extensions`,
  `date-extensions.coffee`, `http://konstantinbender.com/blog/introducing-the-milk-framework`
* Use dashed notation for XML, HTML and CSS: `person-name`, `table-of-people`,
  `regular-xml-parser`
* No *arbitrary* abbreviations, such as `src`, `mod`, `lib`, `obj`, ...


Changelog
---------

* TODO: document.


License
-------

Released under the MIT license.

Copyright (c) 2010 [Konstantin Bender](https://github.com/konstantinbender).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
