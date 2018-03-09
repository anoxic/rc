# fish rc for anoxic
set -x PATH $PATH /usr/local/bin

# Editors
set -x EDITOR vim
set -x GIT_EDITOR vim
set -x VIM_CRONTAB true
alias v "vim -p"
alias vi "echo"

# Git 
alias g "git"
alias gs "git status"
alias gl "git pull"
alias gp "git push"
alias gd "git diff"
alias gb "git branch | cut -c 3- | selecta | xargs git checkout"
alias ga "git add"
alias gc "git commit"

# Navigation
alias ll "ls -l"
alias la "ls -A"
alias lla "ll -A"

########
# Work #
########

### Server Access

function s -a name -d"connect to a server"
    ~/.bin/s $name
end

### Push Viewer
function push -a id -d"View scheduler log with specified number"
    if test -e /var/www/solidstone/log/push-$id-*
        more /var/www/solidstone/log/push-$id-*
    else
        echo Cannot find /var/www/solidstone/push-$id-\*
    end
end

function push-recent -d"List recent scheduler logs"
    push-all | head
end

function push-all -d"List all scheduler logs"
    ls -t /var/www/solidstone/log/ | grep push-
end

### RePush Viewer
function repush -a id -d"View re-scheduler log with specified number"
    if test -e /var/www/solidstone/log/repush-$id-*
        more /var/www/solidstone/log/repush-$id-*
    else
        echo Cannot find /var/www/solidstone/repush-$id-\*
    end
end

function repush-recent -d"List recent re-scheduler logs"
    repush-all | head
end

function repush-all -d"List all re-scheduler logs"
    ls -t /var/www/solidstone/log/ | grep repush-
end
