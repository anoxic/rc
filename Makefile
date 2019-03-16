.PHONY: all fonts

FILES = bin gitconfig gitmessage vim vimrc config cvsrc profile logout ssh/config hnbrc

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

fonts:
	@case `uname` in \
		Darwin) open priv/*.ttf ;; \
		*) echo sorry, don\'t know how to install a font on `uname` ;; \
	esac

# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
