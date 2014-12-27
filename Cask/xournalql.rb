cask :v1 => 'xournalql' do
  version '0.0.2'
  sha256 :no_check

  url "https://github.com/catch22/XournalQL/releases/download/#{version}/XournalQL.zip"
  homepage 'https://github.com/catch22/XournalQL'
  license :mit

  app 'XournalQL.app'
  qlplugin 'XournalQL.qlgenerator'

  caveats "\e[0;31mXournalQL depends on the 'xoj2html' tool that is part of the Python package 'xournal-converters' (install via: pip install xournal-converters)\e[0;37m"
end
