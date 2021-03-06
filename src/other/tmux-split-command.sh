#!/bin/bash

if [ -z $1 ]; then
    tmux rename-window 'home'
fi

# right page
tmux split-window -h "$1 ; vim readme.md"

tmux split-window -b -l 0 -t 0 "read"
tmux split-window -l 0 -t 1 "read"
tmux split-window -b -l 0 -t 3 "read"
tmux split-window -l 0 -t 4 "read"

# middle
tmux split-window -h -l 12 -t 1 "read"
# left
tmux split-window -bh -l 9 -t 1 "read"
# right
tmux split-window -h -l 9 -t 6 "read"

# left page
tmux split-window -t 2 -l 0 "zsh -is eval \"$1\"" ; tmux select-pane -t 2 ; zsh -is eval "$1"
