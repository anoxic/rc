.PHONY: all fonts st

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

st:
	cd src/st; \
	test `uname` = Darwin && git apply ../../patches/st-darwin-0.8.1.diff; \
	git apply ../../patches/st-my-ui-0.8.1.diff; \
	make; \
	`command -v doas >/dev/null 2>&1 && echo doas || echo sudo` make install; \
	make clean

# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
