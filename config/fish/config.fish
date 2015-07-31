# my fish rc file

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
