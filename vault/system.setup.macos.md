---
id: w4yr1klrpvj5ndepbpxs7gh
title: macOS
desc: ''
updated: 1685701566529
created: 1656433122774
---

autoupdate function
  generate: subcommand of name : manager.installed
    :: verb -> manager.installed(verb) -> ledger.noun.verb
    #intent find submanager
  empty: add last run command to autoupdate chain
  query url
  default { //^system.manager
    {system.package.manager}
    pip
    node
    pnpm
    npm
  }

location
  dotfile

  A quick Google search uncovered the simple change. Add the following line to /etc/pam.d/sudo:

auth sufficient pam_tid.so

updater services
    most applications self-update
  tex live
  homebrew
  jetbrains