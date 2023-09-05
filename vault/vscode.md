---
id: hvxhhasrdnnzcy29lw5ezqw
title: vscode
desc: ''
updated: 1688561659510
created: 1636733565597
---

## flows
- shft space: vim: insert space esc insert || insert space leftarrow
- inline fold unwieldy constructions
- md: create bullet point in nesting depth
  ? folding, step over
  : #s.hack fold: create, move line to EoB

### task management
navigating to nesting depth

## search-replace
replace with unicode?
-> regex \n

### in selection
I was able to get it to work but the workflow is poor: [^1]

1. control + H to open Find/Replace
2. Select your line of text
3. Click the "Find in selection" icon to the right Alt L or ⎇⌘L on macOS)
4. Enter your find and replace characters in their inputs
5. Click the Replace all icon

It works but you have to go through the workflow all over again for each new selection (except for CTR + H of course). BTW I have the exact same behavior in Sublime Text.
Could you go with a regExp to find your lines? Do they contain only .'s and 1's? [/^1]
#? maximize to custom scaling

#implement autofold footer in .md
#issue remove autofold in yaml and json files
#implement autofold footer/header in .md

#issue custom tab indent with spaces
#issue maximize-toggle, non-customizable, mode:focus #?
#issue vim gf -> context dependent: dendron goToFile ->

[^1]:https://stackoverflow.com/questions/44335619/find-and-replace-in-visual-studio-code
