# .profile for brian

pkgsrc () {
	PATH=/usr/pkg/bin:/usr/pkg/sbin:$PATH
	MANPATH=/usr/pkg/man:$MANPATH
	PKG_PATH="ftp://ftp.NetBSD.org/pub/pkgsrc/packages/OPSYS/ARCH/VERSIONS/All"
}
macports () {
	PATH=/opt/local/bin:/opt/local/sbin:$PATH
	MANPATH=/opt/local/share/man:$MANPATH
}
homebrew () {
	export PATH=/Users/brian/brew/homebrew/bin:$PATH
	export MANPATH=/Users/brian/brew/homebrew/share/man:$MANPATH
}
fink () {
	test -r /sw/bin/init.sh #&& #. /sw/bin/init.sh
	source /sw/bin/init.sh
}
fdk () {
	# Initialization for FDK command line tools.Wed Oct 13 01:04:52 2010
	FDK_EXE=/Users/brian/bin/FDK/Tools/osx:$PATH
	export PATH=/Users/brian/bin/FDK/Tools/osx:$PATH
}

#set -a
#macports
#set +a
# .profile for brian



# set some useful aliases
#
[ -d "$HOME/.aliases" ] || . $HOME/.aliases

# for ssh logins, install and configure the libpam-umask package.
#
umask 022

# set PATH so it includes private bin if it exists
#
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes font scripts
#
if [ -d "$HOME/Projects/Fonts/Tools" ] ; then
	PATH=$PATH:$HOME/Projects/Fonts/Tools
fi
