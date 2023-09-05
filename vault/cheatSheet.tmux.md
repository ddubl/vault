---
id: 82ilb7iqbud3mzfun9ihb0t
title: tmux
desc: ''
updated: 1685725866657
created: 1633199321516
---
## A tmux cheat sheet

By Alvin Alexander. Last updated: June 3 2016
I just started using [tmux](http://tmux.sourceforge.net/) last week, and
created a cheat sheet to help me remember the basic tmux commands, and I
thought I'd share that here.
The cheat sheet has a few things that are specific to my configuration file,
so to begin with, here is my ~/.tmux.conf file:

## use | and - to split the windows

bind-key | split-window -h
bind-key - split-window -v

## make the first window number start at 1

set -g base-index 1

## from <http://endot.org/2011/12/06/my-tmux-configuration/>

## keybindings to make resizing easier

bind -r C-h resize-pane -L
bind -r C-j resize-pane -D
bind -r C-k resize-pane -U
bind -r C-l resize-pane -R

close window| ^d or ^b x
kill window| ^b &
next window| ^b n
previous window| ^b p
rename window| ^blist all windows| ^b w
move to window number| ^b [number]
| split window vertically| ^b %
split window horizontally| ^b "
next pane| ^b o
previous pane| ^b ;
show pane numbers| ^b q
move pane left| ^b {
move pane right| ^b {
swap pane locations| ^b ^o| resize pane down| ^b ^j or ^b : resize-pane XX
resize pane up| ^b ^k or ^b : resize-pane -U XX
resize pane left| ^b ^h or ^b : resize-pane -L
resize pane right| ^b ^j or ^b : resize-pane -R
| re-attach a detached session| tmux attach
list sessions| ^b s or tmux ls
| start scroll mode| ^b \[
exit scroll mode| q

