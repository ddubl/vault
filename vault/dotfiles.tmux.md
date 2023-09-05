---
id: i952tp0f0bundwdllvbwcue
title: Tmu
desc: ''
updated: 1687860211775
created: 1687857611254
---

ref nesting
origin: gpakosz
fork: ddubl
remotes
  dfs/tmux
  origin/master
branches
  tmux:dfs/tmux
  master:origin/master
    dfs/tmux := fork origin/master

flow:
  fetch origin and ddubl
  rebase ddubl onto origin
  -> base head ref in history