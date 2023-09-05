---
id: xfl5y46iqy0ah2kwruoe8kg
title: Xargs for Grepsedding
desc: ''
updated: 1633199321520
created: 1633199321520
---

grep = global regExp print
sed = stream editor
xargs =? construct arguments list
the same could be achieved using any AWK implementation instead of sed.
the usage of xargs is necessary, because many *nix cli-tools accept stdInput only as arguments. So, xargs is used to construct the argumentsList that is then fed to the command in question.
The ‘@' in 'xargs -I@‘ is just a variable (or alias) for the use of the routine provided to xargs as the argument.
Without the -I flag, the special parameter $@ (hence the @ as variable name), which designates the argument-position, gets
