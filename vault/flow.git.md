---
id: k63kwnmj7liqsblneul9l08
title: Git
desc: ''
updated: 1686147514551
created: 1664713853433
---

\flow follow tags?
\flow declare intent in advance

## env
- sensible global config
  setting user vars
- automation
  commit templates
  hooks

## (cli)tools
- gitui
- tig

sparse checkout
  - init git
    set 'sparse-checkout' to pattern

## nested branch modules
if narrower branch A' of named master branch A:base
  then A' contains only diffs on A:base and needs rebaseing onto A:base to be feature-complete

## dotfile reo
- detached work-tree
- modified base functions:
  pull : rebase 'name:feature' onto master:master

![[dendron://vault/dendron.flow]]
