---
id: zv2gzufoeq2oyropiarifsw
title: Theme
desc: ''
updated: 1688124970745
created: 1636911172910
---


ansi-colors
* Black: \u001b[30m.
* Red: \u001b[31m.
* Green: \u001b[32m.
* Yellow: \u001b[33m.
* Blue: \u001b[34m.
* Magenta: \u001b[35m.
* Cyan: \u001b[36m.
* White: \u001b[37m.

#feature
[MaterialUI](https://material.io/design/color/the-color-system.html#color-usage-and-palettes) dynamic color accross modalities
min/max contrast

define color map
color :: (hue, chroma, tone) -> [Material Design](https://m3.material.io/theme-builder#/dynamic)
functions
  category: light/dark, high-contrast
  neutral :: polarized.neutral.dark || polarized.neutral.light
  primary
  secondary
  ..

  functionality
    fore
      accent :: more contrast
    back
      base
      elevation
        indent
        extrude
