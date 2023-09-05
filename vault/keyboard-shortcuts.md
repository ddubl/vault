---
id: xxsvvucb6nfl3k703jlclrh
title: Keyboard Shortcuts
desc: ''
updated: 1681216817784
created: 1665736224570
---
## layouts

macos - extended Logical
\\therefore

## shortcuts

## keys

  follows [[ahk syntax|vault://syntax.ahk]]
ctrl
shift
alt = opt
cmd = win

hypr = right {ctrl, opt, cmd}, and/or separate virtual modifier
lock/modal keys

## level hierarchy

os
  app launcher : &lt;#hypr(key)
    default functions per [[os.function]]

app
  cmd(key)

modal
  subapp
    \+#($key)
  function
  meta
    hypr
      .navigation

key-duplication
  \#? while key held: space = duplicated input if release key later than space
  \-> shift + space
  #derive chord-mode
    \-> if mod held : chord-mode

