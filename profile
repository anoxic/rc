_cmd () {
    command -v $1 >/dev/null 2>&1
}

# ssh
umask 022

if test -z "$SSH_AUTH_SOCK"
then
    if test "$(uname)" = 'Darwin'
    then
        eval "$(ssh-agent -s)" && ssh-add -K
    else
        eval "$(ssh-agent -s -t 86400)" && ssh-add
        trap 'ssh-add -D && ssh-agent -k' EXIT
    fi
fi

# oksh
test -s $HOME/.bin/git-ksh/git-completion.ksh \
    && . $HOME/.bin/git-ksh/git-completion.ksh
HISTFILE="$HOME/.ksh_history"
HISTSIZE=7777
bind -m '^L'=clear'^J' 2>/dev/null

# Prompt
_colorize () {
    sha=`( _cmd sha512 && echo 'sha512' ) || ( _cmd shasum && echo 'shasum -a 224' )`
    set -A colors -- 91 92 93 94 95 96
    print ${colors[$((0x$(echo $1 | $sha | cut -c1) % 6))]}
}
_pwd () {
    pwd | sed -E -e "s;^$HOME;~;" -e 's;([^/])[^/]+/;\1/;g'
}

test "$(whoami)" = root && _sigil=\# || _sigil=%
PS1='$(__git_complete)\h \[\e['$(_colorize $(hostname -s))'m\]$(_pwd)\[\e[0m\]$_sigil '

# Paths and scripts
test -d /usr/sbin          && export PATH=/usr/sbin:$PATH
test -d /usr/local/sbin    && export PATH=/usr/local/sbin:$PATH
test -d /usr/local/bin     && export PATH=/usr/local/bin:$PATH
test -d "$HOME/.bin"       && export PATH="$HOME/.bin:$PATH"
test -d "$HOME/.rvm/bin"   && export PATH="$HOME/.rvm/bin:$PATH"
#test -s $HOME/.rvm/scripts/rvm && . $HOME/.rvm/scripts/rvm
test -s $HOME/.bin/__work  && . $HOME/.bin/__work

# Editors
export EDITOR=`_cmd nvim && echo "nvim -p" || _cmd vim && echo "vim -p" || echo ed`
export VIM_CRONTAB=`_cmd nvim || _cmd vim && echo true`
export GIT_EDITOR=$EDITOR
alias e=$EDITOR

# Git 
alias g='git'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gd..='git diff master...'
alias gdc='git diff --cached'
alias gb='git branch | cut -c 3- | selecta | xargs git checkout'
alias ga='git add'
alias gaa='git add --all'
alias gap='git add -p'
alias gc='git commit'
alias gcp='git commit -p'

# Processes
alias %='fg %-'

# Navigation
alias ll='ls -l'
alias la='ls -A'
alias lla='ll -A'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Platform specific
if test "$(uname)" = 'Linux'
then
    [ -d "/usr/bin/acpi" ] || alias battery='acpi'
    alias ls='ls -hCF --group-directories-first'
    export LANG=C.UTF-8
elif test "$(uname)" = 'Darwin'
then
    vol() { osascript -e "set volume $1"; }
    alias textedit="open -a textedit"
    alias coteditor="open -a coteditor"
    alias chrome="open -a google\\ chrome"
    alias safari="open -a safari"
fi
