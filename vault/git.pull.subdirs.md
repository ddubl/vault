---
id: e94mp42j30bq2n8qq7drxic
title: Subdirs
desc: ''
updated: 1633199319516
created: 1633199319516
---

Run the following from the parent directory, `plugins` in this case:

`find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;` 

To clarify:

* `find .` searches the current directory
* `-type d` to find directories, not files
* `-depth 1` for a maximum depth of one sub-directory
* `-exec {} \;` runs a custom command for every find
* `git --git-dir={}/.git --work-tree=$PWD/{} pull` git pulls the individual directories

To play around with find, I recommend using `echo` after `-exec` to preview, e.g.:

`find . -type d -depth 1 -exec echo git --git-dir={}/.git --work-tree=$PWD/{} status \;` 

Note: if the `-depth 1` option is not available, try `-mindepth 1 -maxdepth 1`.
