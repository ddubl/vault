---
id: h3i401cll7bkozip8ued8yl
title: Git
desc: ''
updated: 1687857163155
created: 1636845109860
---

updating refs
git update-ref -d…: deletes ref

## flow
find <rev.y> that introduced changes to <rev.x>

## nested repositories
use case: dotfile management
### issue
nested repo depends on upstream off-project source, but has significant changes that warrant commit histories, but are still only minor changes in the grand scheme.

+ dotfiles
+-+ upstream/sub
  | downstream/changes : fetches from both remotes/own|other, merge-rebases on top of


## rewriting history
commonly over git.rebase or resetting HEAD to <revision> and reapplying

### roots
merge-branch or rebase --root

## git alias
### find aliases
git config --get-regexp REGEX

## notions |glossary
#? sub-branches

[attributes](https://devdocs.io/git/gitattributes) #l.mem
