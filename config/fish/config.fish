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

# System
function psg
  ps wwwaux | egrep "($argv|%CPU)" | grep -v grep
end

# Navigation
alias ll "ls -l"
alias la "ls -A"
alias lla "ll -A"

########
# Work #
########

### Server Access

function s -a name -d"connect to a server"
    function _mosh -a port -a host
        if type -p mosh >/dev/null ^/dev/null
           mosh $host --ssh "ssh -p $port"
        else
           ssh $host -p $port
        end
    end

    switch $name
        case lava ; _mosh 2319 lava2.cps.direct
        case ftp1 ; _mosh 22   ftp1.cps.direct
        case onyx ; _mosh 2319 onyx.cps.direct
        case sse1 ; _mosh 2319 solidstone-e1.cps.direct
        case sse2 ; _mosh 2319 solidstone-e2.cps.direct
        case ssc1 ; _mosh 2319 solidstone-c1.cps.direct
        case w1   ; ssh quarry-w1.cps.direct -p2319
        case w2   ; _mosh 2319 quarry-w2.cps.direct
        case e1   ; ssh quarry-e1.cps.direct -p2319
        case e2   ; ssh quarry-e2.cps.direct -p2319
        case a adna z zick ; _mosh 22 adna.zick.io
        case faith ; ssh -p3389 brian@faith.datazap.net
        case '*'  ; echo No connection by that name
    end
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
