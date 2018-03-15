umask 022 # for ssh sessions

# Prompt
_ps1_color() { if test $(whoami) != root; then print "\033[94m"; else print "\033[91m"; fi }
PS1="\u@\h $(_ps1_color)\w$(print "\033[00m")\$ "

# oksh
HISTFILE="$HOME/.ksh_history"
HISTSIZE=7777
bind -m '^L'=clear'^J'

# Paths and scripts
test -d /usr/sbin          && export PATH=/usr/sbin:$PATH
test -d /usr/local/sbin    && export PATH=/usr/local/sbin:$PATH
test -d /usr/local/bin     && export PATH=/usr/local/bin:$PATH
test -d "$HOME/.bin"       && export PATH="$HOME/.bin:$PATH"
test -s ~/.rvm/scripts/rvm && . ~/.rvm/scripts/rvm
test -d ~/dotfiles/work    && . ~/dotfiles/work

# Editors
export GIT_EDITOR=vim
export VIM_CRONTAB=true

if which nvim >/dev/null ^/dev/null
then
    alias e="nvim -p"
else
    alias e="vim -p"
fi

# Git 
alias g='git'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gb='git branch | cut -c 3- | selecta | xargs git checkout'
alias ga='git add'
alias gc='git commit'

# Navigation
alias ll='ls -l'
alias la='ls -A'
alias lla='ll -A'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Platform specific
if test "$(uname)" = 'Linux' ; then
    [ -d "/usr/bin/acpi" ] || alias battery='acpi'
    alias ls='ls -hCF --group-directories-first'
    export LANG=C.UTF-8
elif test "$(uname)" = 'Darwin' ; then
    vol() { osascript -e "set volume $1"; }
    alias textedit="open -a textedit"
    alias coteditor="open -a coteditor"
    alias chrome="open -a google\\ chrome"
    alias safari="open -a safari"
fi
