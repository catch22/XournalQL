XournalQL
=========

QuickLook plugin for Xournal documents.

Manual Installation
-------------------

1.  Install [xournal-converters](https://github.com/catch22/xournal-converters) by following the instructions on its homepage.
    At the moment, XournalQL expects `xoj2html` to be available at `/usr/local/bin`.

2.  Download the [latest release](https://github.com/catch22/XournalQL/releases).

3.  Using the Finder, copy `XournalQL.app` to `/Applications`.

4.  Using the Finder, copy `XournalQL.qlgenerator` to `~/Library/QuickLook`.
    Create this folder if it does not exist.
    Possibly run `qlmanage -r` to reload the QuickLook infrastructure.

This package might at some point be available on [homebrew-cask](https://github.com/caskroom/homebrew-cask).
