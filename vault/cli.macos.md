---
id: o1mbbnqlt6rgh4dvytfusqe
title: macOS
desc: ''
updated: 1688995644470
created: 1676973569828
---

## config
finding bundle identifiers ^find-bundle-id
/usr/libexec/PlistBuddy -c 'CFBundleIdentifier' ${PathName} #flow.os.navigation

## themeing
iterm > zsh > tmux > (z)sh

## colorscheme
ansi color definitions
versions: light/dark

n: neutral
p: primary
s: secondary
f: foreground: neutral
b: background: neutral
\# : nesting : 0=default

0: [b.0] [b.1]
1: [s.-1] [b.2]
2: [p.-1] [p.2=p.s.0]
3: [s.0] [b.3]
4: [p.0] [p.3=p.s.1]
5: [s.1] [n.4]
6: [p.-2] [p.4=p.s.2]
7: [f.0] [n.-1]