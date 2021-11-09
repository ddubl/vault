---
id: S0TKePyBqHHy7YH5tPlYB
title: Ahk
desc: ''
updated: 1636417567074
created: 1636406624931
---
RShift - RShift/Escape

Hyper
make CapsLK into Prefix:
  generatorFunction for [[CustomCombinations|https://www.autohotkey.com/docs/Hotkeys.htm#combo]]

hype & [0-9] :: \#^[0-9];

Class Game
  HyperKey not in Game
  GroupAdd Game not yet implemented:
    searchable in OBS

## Winkey Shortcuts
\#n notification
\#w news and interest feed
\#z snap layout ::#override empty
\#PrintScreen ScreenShot
\#c cortana/teams ::#override empty
\#w widgets
\#a quicksettings ::#override empty
\#v clipboard history
\#n notification center
\#d desktop
\#x start button ctx menu
\#l lock :: CANNOT OVERRIDE
\#+s partial screen capture (Snip&Sketch)
\#y win mixed reality
\#space languageInput
\#^f find
\#g gameBar
\#e fileExplorer
\#t cycle taskBar Apps ::#override empty
\#s search ::#override empty

## concepts

defining custom combinations makes the first key work as a prefix keys and lose their native function! If subsequent hotkeys use the modifier key, the use hooks