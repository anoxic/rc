.PHONY: all

FILES = bin gitconfig gitmessage vim vimrc config hyper.js profile aliases

all:
	git submodule init
	git submodule update
	chmod +x bin/*
	@echo
	@for file in $(FILES) ; do \
		[ -s $(HOME)/.$$file ] && rm -rf $(HOME)/.$$file ; \
		echo "Symlink: `pwd`/$$file => $(HOME)/.$$file" ; \
		ln -sf `pwd`/$$file $(HOME)/.$$file ; \
	done


