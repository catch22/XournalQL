.PHONY: release

release:
	rm -rf /tmp/XournalQL
	mkdir -p /tmp/XournalQL
	cp -R ~/Library/QuickLook/XournalQL.qlgenerator /tmp/XournalQL
	cp -R XournalQL.app /tmp/XournalQL
	cd /tmp/XournalQL && zip -r XournalQL.zip XournalQL.qlgenerator XournalQL.app
	### Upload /tmp/XournalQL/XournalQL.zip ###
