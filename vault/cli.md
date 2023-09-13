---
id: skudrqzkcvrrcgxykwfwe2h
title: CLI
desc: ''
updated: 1694008770578
created: 1636904252349
---

removed automatic tmux attach
```bash
tmux attach -t base || tmux new -A -s base
```

as a rule, keep defaults unless very necessary
eg. tmux default prefix
#feature normal-mode history navigation -> fzf popup

## navigation
cli-encompassing leader-navigation
  vi-mode normal : space = leader
  \-> vi-style tmux/tab navigation

### vim mode
tmux
  window
  tab
  pane
vim
  split
  tab
  buffer
emacs

## discovery
navigate/find commands bash/zsh
- apropos
- (rip)grep

## pager
- less/more
  make separators newlines etc?

tr: translate char
pr: print
(g)awk

## upgrades
[n] ls : lsd

## escape sequences
2>&1

OSC(OperatingSystemControl), OSI, ESI, \\e#######, ESC]]I, onFocus: windowFocusReporting: ]]ESC #?
\[] vim-mode escaping, hyper-keys

VT100 xterm control sequence
  CSI PS SC q
ESC := \e \033 \x1b
CSI(C) := \e
BEL := \007 ESC\\

### Control Codes
[C0 control codes](https://en.wikipedia.org/wiki/ANSI_escape_code#:~:text=popular%20c0%20control%20codes%20(not%20an%20exhaustive%20list))
| ^  |  C0  | Abbr |      Name       |                                                                       Effect                                                                        |
|----|------|------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| ^G | 0x07 | BEL  |      Bell       |                                                               Makes an audible noise.                                                               |
| ^H | 0x08 |  BS  |    Backspace    |                                   Moves the cursor left (but may "backwards wrap" if cursor is at start of line).                                   |
| ^I | 0x09 |  HT  |       Tab       |                                                    Moves the cursor right to next multiple of 8.                                                    |
| ^J | 0x0A |  LF  |    Line Feed    | Moves to next line, scrolls the display up if at bottom of the screen. Usually does not move horizontally, though programs should not rely on this. |
| ^L | 0x0C |  FF  |    Form Feed    | Move a printer to top of next page. Usually does not move horizontally, though programs should not rely on this. Effect on video terminals varies.  |
| ^M | 0x0D |  CR  | Carriage Return |                                                          Moves the cursor to column zero.                                                           |
| ^[ | 0x1B | ESC  |     Escape      |                                                           Starts all the escape sequences                                                           |
#iss shorten table to 80 chars

## modal cli
### vi tmux
[tmux vi cursor](https://superuser.com/questions/685005/tmux-in-zsh-with-vi-mode-toggle-cursor-shape-between-normal-and-insert-mode)
zsh-vi-mode omz plugin
tmux integration

#issue
tmux not displaying vi-mode cursor shapes
#resolved by --HEAD updating zsh-vi-mode omz plugin

#f modal tmux
#f per pane history
#f tmux : currently busy panes/windows | iterm integration: finished output

#### line wrapping
tput -> cut screen content
  pager defaults
  ie. less -D -S

### themeing
follow system theme
  escaping
make current state clear
  un/focus