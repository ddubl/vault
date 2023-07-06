---
id: 3kpsuklp50fjc7m2rf4hief
title: UI
desc: ''
updated: 1638052779750
created: 1637079503676
---
general - inverse corr of: ambientBrightness and -timeToRest - avgScreenBrightInMode -> displayMode

\[] darkreader: css minimal contrast

- new color api?
  \#? how to check for new implementations?
  \-- I've seen a chrome-flag...

## dynamic themeing

\-> hook|watchable|callback changes type: associate color or default

- highlighted elements
  \-> material
  most commonly:
    light/dark
    (high) contrast

## generative

palette generation based on viewability

- minimal contrast
- distinguishability of tokens, especially of close
- sparseness of color

## semantic themeing

palette-association is driven by what it applied to
eg. neutral -> background for text-based interfaces

basic heuristic:
if element contains element -> either shade or contrast.min, based on function
estimated function derives from name-gestalt
\-> same tokens, similar element

text-interface semantic monad:

- container
  - background
  - limit
  - highlight
- element
  - neutral

# palettes

## monochrome

  contrast
  differentiation

  parameters?
  chromacity
  contrast
    luminosity

- how do they play with bluelight filters?
- different screens/implementations of palettes
- ambience and ambientBrightness?

## dichrome

### polarized

  semantic colorization
    background
    element
    highlight
    casing

