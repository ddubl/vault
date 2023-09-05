---
id: qypfgo42kq83qqn4bzmxvpb
title: Config
desc: ''
updated: 1681990323042
created: 1665768522736
---
$path:=

default config:
pull in aliases from:
/Users/grimnir/.config/git/alias/gitalias.txt

in git config --global (~/.gitconfig)
add :
```mermaid
  [[config|file://~/.dotfiles]]
  ~[[gitalias]]
```


git templates signing
-> branch protection


dotfile repo
  root dir : starting with .
    but otherwise same name as branch
    and origin.url contains ddubl
    -> current feature branch follows remote ddubl/^.(BRANCHNAME)
    HEAD pointing to

    experimental config
      submodule.propagateBranches = true
        enabling branch support in submodules :
      submodule.recurse = true