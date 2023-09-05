---
id: ndehw3501obcnl0mhuquuv7
title: Flow
desc: ''
updated: 1688651254754
created: 1638022787958
---

tag | backlink notes as log
task.semantic := git.squash.semantic
:: (taskRef, todoItem || node.task, git.log)

footnotes in frontmatter
-> alternate way to handle footnotes

tag -> typeClass

linking prepends #f

ephemerals/buffer -> ?emacs and git tags
-> discard history unless referenced
: dataPod : injectable

handlebars schema

readability in raw
generate footnotes with links #f

[linking to fragment syntax](https://wicg.github.io/scroll-to-text-fragment/#syntax)
#:~:text=[prefix-,]start[,end][,-suffix]
          context  |--match--|  context

frontmatter tag expansion
{{fm.tag.tagName}}

queries
?[[<Expression> -> <Expression>]]
  Data: Pods
  DataScript | Prolog [[dendron.rfc]]

frontmatter variable - pointer to .dib result

trails - navigation with link to navigation
-> easily done in refactoring, slightly less so while taking notes

#experiment of transclusions
- linking to first todo-item

git templates - autoconfigure signing
  follows frontmatter tags

#todo
adding assets via link in buffer? -> symlinks?

text search notes -> vscode fulltext search : vscode.searchEditors()

## git-hook (?)
[m]^2n either fully automate git.add(), git.commit() or leave as is.
-> using keyboard shortcuts on dendron default hook 'workspace: add and commit'

#+TODO couple subtask status to task/note
task title := note title

- [traits via lifecycle hooks](https://docs.dendron.so/notes/d2f8fe67-36c7-4600-b745-c22bdcb5b2cf/#execacommandcommand-options)
#i trait rendering / schema data via [[vscode.annotations]]
trait doctoring

integrating notebooks into dendaron workflows:
  #issue linking to cell via vscode.dev resolves via browser
  -> x-url resolver? // vscode//browser settings

## doctor: redo markdown header nesting
search regex: \#+\s and replace with \#$&

## task management
element nesting
  meta-definition in project-related todos
  x-vault tags
    tags:[todo,to,t] - #flow different behaviour from other tags