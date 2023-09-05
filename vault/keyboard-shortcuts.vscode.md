---
id: mfttq9eowbdfvc4izigj069
title: Vscode
desc: ''
updated: 1664715010578
created: 1636248552561
---
uses [[ahk|syntax.ahk]] notation
## key ideas
- default navigation uses vim keybindings
- chord system used to group shortcuts
- same base-ideas shared across dev envs
  + chord-based group navigation like *tmux*
  + editor navigation like *emacs*
conflicting common shortcuts i.e. "ctrl + a" are the chord plus the key itself, so "ctrl+a a"

ctrl + $key reserved for vim:
  ctrl + u : up
  ctrl + d : down
  ctrl + v : insert

## chord bases
ctrl + w : window
ctrl + e : editor
ctrl + d : debug
ctrl + f : find
ctrl + a : focus
  , a : select-all
ctrl + b : debug
ctrl + i : info
ctrl + s : selection/fileSave
  , s : save file
\#+d : dendron
  , r -> rename
  , d -> delete

(nix.# | win.^+)&v      : insert
  , (nix.# | win.^+)&d  : dateTime
  , d                   : date
  , t                   : time
  , (nix.# | win.^+)&t  : timestamp

tmux prefix - ctrl + a used for window management
  -> used for focus management

move macos vscode keyboard shortcuts #+TODO #t
  - toggle primary/secondary sidebars
  - debug
  - info
  - zen-mode toggle to editor chord