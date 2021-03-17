.PHONY: all fonts st oksh macos

FILES = bin gitconfig gitmessage vim vimrc config cvsrc profile logout ssh/config hnbrc

DO := $(shell command -v doas >/dev/null 2>&1 && echo doas || echo sudo)

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

macos:
	@case `uname` in \
		Darwin) \
			cp macos/launchd/io.zick.RemoveLocalAdobeDaemons.plist ~/Library/LaunchAgents; \
			$(DO) cp macos/launchd/io.zick.RemoveGlobalAdobeDaemons.plist /Library/LaunchDaemons \
			;; \
		*) echo only intended to run on Darwin ;; \
	esac

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
	$(DO) make install; \
	make clean

oksh:
	cd src/oksh && ./configure && make && \
	$(DO) make install && \
	grep `which oksh` /etc/shells || echo `which oksh` | $(DO) tee -a /etc/shells && \
	chsh -s `which oksh`; \
	make clean

# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
