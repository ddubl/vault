---
id: s6ds72aa6zgo92mlfdrxhwv
title: macOS
desc: ''
updated: 1694095288361
created: 1637504771424
---

## repository
check symlink
    current filedir
    updater resolves
      pull from origin
      apply change-tree fforward
        -> tree application commutative

system update mechanics:
cli: update all

setting locations:
  iterm
  zsh
    ~/
    .zsh.before
    .zshrc
    .zshenv
    .zsh.prompts
    .zsh.after
    .zprofile
    .zhistory
    .zsh_history
    .zsh_sessions

  oh-my-zsh

  vi(m)
    ~/
    .vimrc
  emacs
    ~/.doom.d

nvim
  ~/
  .config/nvim

  packer
(nvim conf|<https://github.com/jdhao/nvim-config/>)
  zsh env vars
  deps
    pip
      , pynvim
      ,'python-lsp-server[all]' pylsp-mypy pyls-isort
      ,
    npm : vim-language-server
    git
    node
    ctags
    linters
      , pylint
      , flake8
      , vint

## backup locations
~/.dotfiles.backup

## update locations
DSC-esque
### gitDirs
### apps
appStore
#### cli
oh-my-zsh
powershell-modules
emacs
  doom

### package managers
homebrew
luaRocks
pip
  pip install --upgrade pip #autoupdate
### app managers
jetbrainsToolbox
VisualStudio
### games
steam
epic
battleNet
### scripts
powershell
### buildchains
rust
go
haskell
npm
js/node
js/deno

## hooks
- small
- idle

## running custom appleScripts/Javascript
osascript util

- greedy homebrew update
brew update && brew outdated --greedy && brew upgrade --greedy && brew cleanup

- cache cleanup
brew cleanup --prune=all

- check `brew --cache` size afterwards
-> du[diskUsage] -sch $(brew --cache)

- forced cache cleanup
rm -rf `brew --cache`
