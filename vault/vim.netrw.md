---
id: m08287m9iea2v34kekz0cjw
title: Netrw
desc: ''
updated: 1665747396792
created: 1664731275083
---
netrw open
Lexplore : netrw in current window over current file, open to side, can toggle
Texplore : toggle netrw (:Te?) // tabNetRw

## navigation
% : create file
p : preview, <C-w>z closes preview
gh : toggle hidden files
R : rename
m
  t : assign target dir
  f : mark file
  c : copy marked files to target
  m : move marked files to target
  x : run external command on marked files
  b : bookmark
D : deletes files/non-empty dirs
d : create dir

gm

m

## additional config
.vimrc autocmd to netrw:

Leader dd: Will open Netrw in the directory of the current file.
Leader da: Will open Netrw in the current working directory.
H: Will "go back" in history.
h: Will "go up" a directory.
l: Will open a directory or a file.
.: Will toggle the dotfiles.
P: Will close the preview window.
L: Will open a file and close Netrw.
Leader dd: Will just close Netrw.

Tab: Toggles the mark on a file or directory.
Shift Tab: Will unmark all the files in the current buffer.
Leader Tab: Will remove all the marks on all files.

ff: Will create a file. But like create it for real. This time, after doing % we use :w<CR> to save the empty file and :buffer #<CR> to go back to Netrw.
fe: Will rename a file.
fc: Will copy the marked files.
fC: We will use this to "skip" a step. After you mark your files you can put the cursor in a directory and this will assign the target directory and copy in one step.
fx: Will move marked files.
fX: Same thing as fC but for moving files.
f;: Will be for running external commands on the marked files.

fl: list of marked files
fq: show target dir, works with :mt

bb: To create a bookmark.
bd: To remove the most recent bookmark.
bl: To jump to the most recent bookmark.

FF: recursively delete