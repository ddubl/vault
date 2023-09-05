---
id: suayolcbp07xrp4bqm72ohg
title: Tmux
desc: ''
updated: 1689000163238
created: 1636903106989
---

mvp: default layout book
#f print pane history

indicate marked pane #todo
#f marks / jumps
  implemented in iterm: tighter integration

ephemeral windows
nested workflows -> backflow
\if namedSession ?? viewPortOrientation {
  ephemerals open perpendicular to bigger screen orientation direction
} -> orientation window: shows nesting of sessions

#? quickswap current pane/window to pane/window
-> :swapp -s -t
#? current tmux does not allow nesting panes in windows?

tmux settings:
define leader as $cmd

#todo #todo.done <C-a ?> display cmds correctly
-> leader definition resolves

#todo integrations
- term, $os.mac: iterm
  - themeing: semantic, dynamic
- emacs
- vim
- tmux
-> navigation

:understanding pane/window/tab nesting in iterm
add attach sth to pane/window
breaking pane -> window as inverse 'breaking up the tree' of window -> pane

## theme
color functions
#t fix status line
- [w] #fix theme #extend
  - [x] colorscheme ![[dendron://vault/cli.macos#colorscheme]]
  - [x] status line colors
  - [d] format
    - [i] trimming character replacement in windows status
  - [w] highlight line colour #todo.current

#i send to all panes
  Ctrl-b :setw synchronize-panes on
    cmd
    sync-panes off
[[~/.tmux.conf]]
