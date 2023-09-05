---
id: h7lw67waurdmeiu7a9q8dsf
title: Tmux
desc: ''
updated: 1677062193245
created: 1662984125300
---

### -- POLARIZED - PALETTE -----------
-> background.neutral inherit from terminal
[Xterm Control Sequences](https://www.xfree86.org/current/ctlseqs.html)
ESC = ^[ = \033
OSC = ESC]
[Proprietary Escape Codes - Documentation - iTerm2 - macOS Terminal Replacement](https://iterm2.com/documentation-escape-codes.html)

#### light
background = OSC 4 ; -2; ? ST = \033]4;-2;?\033\\ = \033]P

##### theme_polarized
neutral_black = #1e1e1e
neutral_d50 = #282828
neutral_d20 = #c8be96
neutral = #F9F1CB : ANSI background : color-2
neutral_l20 = #FFFFDA : ANSI white : color8
neutral_white = #fffff3 : ANSI white bright : color16

themeing
  ansi[2...5], red[1] and cyan[6] are highlight-colors
  black[0] and white [7] are bg and fg in [dark], white => reverse
  normal -> bg
  bright -> fg
  taking colors from: <[[leonardo - gruvbox material-like|dendron://dwl/design.ui.color.theme.polarized#leonardo---gruvbox-material-like]]>

primary_iso -> highest prima

neutral_container = #F6E9C0
tmux_conf_theme_polarized_primary_container=${theme_polarized_primary_container:-#3B2960}
tmux_conf_theme_polarized_primary_d20=${theme_polarized_primary_d20:-#441e8b}
tmux_conf_theme_polarized_primary=${theme_polarized_primary:-#764abc}
tmux_conf_theme_polarized_primary_l20=${theme_polarized_primary_l20:-#a877ef}
tmux_conf_theme_polarized_primary_l30=${theme_polarized_primary_l30:-#C291FF}
tmux_conf_theme_polarized_primary_l40=${theme_polarized_primary_l40:-#deb7ff}
tmux_conf_theme_polarized_primary_l50=${theme_polarized_primary_l50:-#F8D1FF}
tmux_conf_theme_polarized_primary_l60=${theme_polarized_primary_l60:-#FFEAFF}
tmux_conf_theme_polarized_secondary_d20=${theme_polarized_secondary_d20:-#c59700}
tmux_conf_theme_polarized_secondary=${theme_polarized_secondary:-#fcc73c}
tmux_conf_theme_polarized_secondary_l20=${theme_polarized_secondary_l20:#F8CA33}
tmux_conf_theme_polarized_secondary_l30=${theme_polarized_secondary_l30:-#FFE44D}
tmux_conf_theme_polarized_secondary_l50=${theme_polarized_secondary_l50:-#FFFF7F}
tmux_conf_theme_polarized_tertiary=${theme_polarized_tertiary:-#02fdec}
tmux_conf_theme_polarized_tertiary_container=${theme_polarized_tertiary_container:-#006a61}
tmux_conf_theme_polarized_error=${theme_polarized_error:-#ba1b1b}
tmux_conf_theme_polarized_error_container=${theme_polarized_error_container:-#ffdad4}
tmux_conf_theme_polarized_surface_primary_d30=${theme_polarized_surface_primary_d30:-#968e99}
tmux_conf_theme_polarized_surface_primary_d10=${theme_polarized_surface_primary_d10:-#D0C6D2}
tmux_conf_theme_polarized_surface_primary_s05=${theme_polarized_surface_primary_s05:-#e9dfeb}
tmux_conf_theme_polarized_surface_primary_l10=${theme_polarized_surface_primary_l10:-#FFF9FF}
tmux_conf_theme_polarized_surface_neutral=${theme_polarized_surface_neutral:$theme_polarized_container}
tmux_conf_theme_polarized_surface_error=${theme_polarized_surface_error=$theme_polarized_error_container}