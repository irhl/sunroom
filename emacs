#!/bin/sh
exec 2>/dev/null

if [ "$1" = "--restart" ]; then
    pgrep -f 'emacs --daemon' | xargs kill
    sleep 1
fi

if ! pgrep -f 'emacs --daemon' > /dev/null; then
    /bin/emacs --daemon --init-directory="$HOME/.emacs.d/"
fi

#emacsclient -c -e '(switch-to-buffer "*scratch*")'
emacsclient -c -n
