if [[ `uname` != 'Darwin' ]]; then
    export LANG=C.UTF-8
fi

# Set some useful aliases
#
[ -d "$HOME/.aliases" ] || . $HOME/.aliases

# For ssh logins, install and configure the libpam-umask package.
#
umask 022

# Set PATH so it includes private bin if it exists
#
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Set PATH so it includes font scripts
#
if [ -d "$HOME/Projects/Fonts/Tools" ] ; then
	PATH=$PATH:$HOME/Projects/Fonts/Tools
fi

# Macports
#
if [[ `uname` == 'Darwin' ]]; then
    set -a
    PATH=/opt/local/bin:/opt/local/sbin:$PATH
    MANPATH=/opt/local/share/man:$MANPATH
    set +a
fi

# Go
#
if [[ -d "/usr/local/go/bin" ]]; then
    PATH="$PATH:/usr/local/go/bin"
    GOPATH="/usr/local/go"
fi

# RVM
#
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

