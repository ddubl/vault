---
id: 0vn43o8cma8w7qvcf5eodan
title: macOS
desc: ''
updated: 1686227854835
created: 1664534342607
---

fn : to_if_alone = <escape> #todo

fn : touchpad.absolute #todo

|-> custom keyboard layout : SGE

window next focused app : !(+)§

hypr key bindings : #os.macos.ext karabiner.complex #os.macos
  empty(hypr) : backspace
  \#hypr
    c : console (iterm2)
    t : todoist #os.func.todo
      (^!a add task)
    b : browser (safari) #os.func.browser
    e : editor (vscode) #os.func.editor
    n : editor.notation (workspace:dendron)
    f : finder (gui.explorer)
    m : mail
    s : \^(+)tab
    $ : tracking.time (toggl)
      (#!$ show/hide)
      (#$ start/stop tracking)
    a : airtable
    o : devdocs

  hypr
    (+)s : tab

window-manager(rectangle)/modal/hammerspoon | yabai?
ctrl alt d,f,g : left,mid,right third
  g, t : left, right 2 thirds
