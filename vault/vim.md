---
id: GduD9p988bMOZ290GlhqJ
title: Vim
desc: ''
updated: 1636840541187
created: 1636203835676
---

matching character = %

#research
next group
  }

## marks
delete all with :delmarks!
issues with global marks

## substitute
\%V constrains to visual selection
:s/\%Vsearch/replace/mod

#q how to regex in ":s//g"?


## surround - vim.surround
:v S(surroundings)
  for brackets/braces, closing braces insert without spaces
:n
  ys(move)(surroundings)
  cs(move)(surroundings)

## search case sensitive
:set smartcase/ignorecase/noignorecase

## remove highlighting
:noh