---
id: 5gtzt21orfsa59jkd0601yf
title: Repo
desc: ''
updated: 1687518305886
created: 1678969581091
---

changed dotfiles for dotfiles
[sneakyCobra's solution](https://news.ycombinator.com/item?id=11071754)
 git init --bare $HOME/.dotfiles
    alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    config config status.showUntrackedFiles no

To complete the description of the workflow (for others), you can replicate your home directory on a new machine using the following command:
   git clone --separate-git-dir=~/.dotfiles /path/to/repo ~

For posterity, note that this will fail if your home directory isn't empty. To get around that, clone the repo's working directory into a temporary directory first and then delete that directory,
    git clone --separate-git-dir=$HOME/.dotfiles /path/to/repo $HOME/dotfiles-tmp
    cp ~/dotfiles-tmp/.gitmodules ~  # If you use Git submodules
    rm -r ~/dotfiles-tmp/
    alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'