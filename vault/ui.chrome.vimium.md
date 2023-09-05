---
id: dz67ode4acbawi4uj07d2g8
title: Vimium
desc: ''
updated: 1637271191897
created: 1637086395138
---

[backup](assets/files/vimium.backup.css)
[new](assets/files/vimium.css)

#css lighting/darkening color in css, by embedding custom-vars in rgb-format into rgba format, or add "filter: brightness" property
#css houdini-api exposes base-apis
#css #? assign css-function-syntax to property

css-vars; the current scheme is intended to be semantic.
[[material3|https://material-foundation.github.io/material-theme-builder/]] with adaptive themes released, they generate [[tokens|assets/files/m3.tokens.json]]

generate base-color [[modalities|https://www.cssfontstack.com/oldsites/hexcolortool/]]
```CSS
:root {
  --theme-color-background-active: color: #292828; /* #? material design float colorDiff? */
  --theme-color-background: color: #434242;
  --theme-color-container: color: #292828;
  --theme-color-accent: color: #CB63FF;
  --theme-color-text: color: #f0ede0;
}
```
the material3 themes have 3 key colors, a neutral color and a neutral inverse

-> want more [[concise naming|https://medium.com/eightshapes-llc/naming-tokens-in-design-systems-9e86c7444676]]

variables leverage adaptability, no bijective mapping necessary
variables still semantic
#? combining colors in CSS?
-> surface 1 in md-light is neutral with 5% opacity of key color
/math can make ring color?
#? can I generate/map md-color-tokens to semantic tokens dynamically?
#! compacting naming by choosing class-based names that imply higher level
  dichrome -> theme, allows to cut obsolete levels, makes searchability more difficult/needs schemas
Material :: Theme => Neutral * Key -> Surface
```CSS
/* listing colors from m3.tokens */
--md-dichrome-primary-light
--md-dichrome-primary
```
-> JSON extraction / notebook api

generate meta-description of chrome userinterface:
- background
- surface
- material

last named variable callable with modalities
- light

```CSS
@prefers-color-scheme light {
  --dichrome-base-background: { var(--md-dichrome-neutral); }
  --dichrome-base-text: { var(--md-dichrome-onNeutral); }
  --dichrome-base-separator: { var(--md-dichrome-onNeutral); }
  --dichrome-base-outline: { var(--md-dichrome-onNeutral); }
  --dichrome-base-listElement: { var(--md-dichrome-onNeutral); }
  --dichrome-surface1-background: { var(--md-dichrome-neutral); }
  --dichrome-surface1-text: { var(--md-dichrome-onNeutral); }
  --dichrome-surface1-separator: { var(--md-dichrome-onNeutral); }
  --dichrome-surface1-outline: { var(--md-dichrome-onNeutral); }
  --dichrome-surface1-listElement: { var(--md-dichrome-onNeutral); }
  --dichrome-surface2-background: { var(--md-dichrome-neutral); }
  --dichrome-surface2-text: { var(--md-dichrome-onNeutral); }
  --dichrome-surface2-separator: { var(--md-dichrome-onNeutral); }
  --dichrome-surface2-outline: { var(--md-dichrome-onNeutral); }
  --dichrome-surface2-listElement: { var(--md-dichrome-onNeutral); }
}
```
functional changes: eg. neutral -> warmer