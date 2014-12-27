XournalQL
=========

QuickLook plugin for Xournal documents.

![](https://raw.githubusercontent.com/catch22/XournalQL/master/Screenshot.png "XournalQL Screenshot")


Installation via Homebrew-Cask
------------------------------

There is a preliminary [Cask](https://github.com/caskroom/homebrew-cask) file that can be used to install XournalQL.

1.  Install [xournal-converters](https://github.com/catch22/xournal-converters) by running `pip install xournal-converters`.

2.  Download [xournalql.rb](https://github.com/catch22/XournalQL/tree/master/Cask/xournalql.rb) and run `brew cask install xournalql.rb`.


Manual Installation
-------------------

1.  Install [xournal-converters](https://github.com/catch22/xournal-converters) by running `pip install xournal-converters`.

2.  Download the [latest release](https://github.com/catch22/XournalQL/releases).

3.  Using the Finder, copy `XournalQL.app` to `/Applications`.

4.  Using the Finder, copy `XournalQL.qlgenerator` to `~/Library/QuickLook`.
    Create this folder if it does not exist.
    Possibly run `qlmanage -r` to reload the QuickLook infrastructure.


Technical Remarks
-----------------

At the moment, XournalQL expects `xoj2pdf` to be available at `/usr/local/bin`.
