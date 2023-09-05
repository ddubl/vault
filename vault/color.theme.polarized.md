---
id: xktenptr3mbrptimmvbrq54
title: Polarized
desc: ''
updated: 1691588873411
created: 1636911874445
---

## palette
### ansi
| pos | light.normal | light.bright | dark.normal | dark.bright |
| --- | ------------ | ------------ | ----------- | ----------- |
| 0   | F9F1CB       | F2E5BC       |             |             |
| 1   |              | CFC4A2       |             |             |
| 2   | 9A7ED4       | A88AE9       |             |             |
| 3   | DBA000       | 969279       |             |             |
| 4   | 8A63C1       | B998FF       |             |             |
| 5   |              |              |             |             |
| 6   | 6745A7       | D5B3FF       |             |             |
| 7   |              |              |             |             |
\### ansi

## === EOF
primary: #8d79b9 := luv:55%
  hsluv: [41%, 58%, 62% || 65%, 79%]
secondary: #34280a := luv:17%
  hsluv: [86%, 82% ||  ]
background:
  light: #FBF1C7
  -> .unfocused: #e5dcb5 -> n.d? unfocused : lower baseElevation
  dark: #292828 -> neutral.d50
  elevation:
    -: ##ede6bc -> .d10
    --: #c8be96 -> .d20
    ++: #FFFFDA -> .l20
surface: #ede6bc -> p.elevation.- // #989ace
surface.alt: #f5f1ff

=> color diff : ansi compatibility

color-studio: {#8d79b9, #f6f3ff, #f9f5e1, #ffffff, #000000, #000000}
=> materialized : pastelled

## palette
-- POLARIZED - PALETTE -----------
theme_polarized_neutral_black       = "#1e1e1e"
theme_polarized_neutral_d50         = "#292828"
theme_polarized_neutral_d20         = "#c8be96"
theme_polarized_neutral             = "#FBF1C7"
theme_polarized_neutral_l20         = "#FFFFDA"
theme_polarized_neutral_white       = "#FFFFF3"
theme_polarized_neutral_container   = "#F6E9C0"
theme_polarized_primary_d20         = "#441e8b"
theme_polarized_primary             = "#764abc"
theme_polarized_primary_l20         = "#a877ef"
theme_polarized_primary_l30         = "#C291FF"
theme_polarized_primary_l40         = "#deb7ff"
theme_polarized_primary_l50         = "#F8D1FF"
theme_polarized_primary_l60         = "#FFEAFF"
theme_polarized_secondary_d20       = "#c59700"
theme_polarized_secondary           = "#fcc73c"
theme_polarized_secondary_l20       = "#F8CA33"
theme_polarized_secondary_l30       = "#FFE44D"
theme_polarized_secondary_l50       = "#FFFF7F"
theme_polarized_tertiary            = "#02fdec"
theme_polarized_tertiary_container  = "#006a61"
theme_polarized_error               = "#ba1b1b"
theme_polarized_error_container     = "#ffdad4"
theme_polarized_surface-primary_d30 = "#968e99"
theme_polarized_surface-primary_d10 = "#D0C6D2"
theme_polarized_surface-primary_s05 = "#e9dfeb"
theme_polarized_surface-primary_l10 = "#FFF9FF"
theme_polarized_surface-neutral     = "$theme_polarized_container"
theme_polarized_surface-error       = "$theme_polarized_error_container"

## colors
#! only color value, not brightness given
background := #292828
secondary := #FFCA28
links:visited #7367f0

## behaviour
float+1 := brighten(1.2)

## elements
## semantic