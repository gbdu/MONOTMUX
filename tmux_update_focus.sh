#!/usr/bin/bash

workspaces=($(wmctrl -d | cut -d ' ' -f 13-)) # get desktop name
selected=$(xdotool get_desktop) # currently selected desktop id

tmux select-window -t manage:${workspaces[$selected]} & 
