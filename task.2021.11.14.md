---
id: RjNBbpvkXNy9W4fCDfVRG
title: '14'
desc: ''
updated: 1636927516122
created: 1636913971394
status: ''
due: ''
priority: ''
owner: ''
TODO: '14'
---

tmux system-theme aware
. polarized_dual theme
    [x] in iterm2
#+STARTED
chrome links colour
  visited links are /color
  unvisited links colour unset
  #hack
  chrome extension coloring
  [f] via darkreader
  darkreader ![[CSS|dendron://dwl/css]] addin
  :root {
    --darkreader-selection-text: #e8e6e3
    --darkreader-link-unvisited: #5A489F
  [h] via darkreader and css pseudo elements (:link)
}
[href]:not[href=""] {
            color: var(--darkreader-link-unvisited)
}
[f] darkreader text-selection option unavailable
  cannot inject variable-definition via darkreader

[] stream video embed from chrome to other application
-> proxy/forward packets
  [x] available chromeextenstions / tampermonkeyScripts
  #+RESULTS
  not available

simple ? implementation
  listen to same port via vlc?
=> being able to have [[floating panels over fullscreen apps|dev.project.floatilla]]

dendron/vim generate wikilinks from selection and link in clipboard
  [x] vim -> ![[vim.surround|dendron://dwl/vim#reselect-visual,1]]

#dendron
[] wikilinks distinguish non-wikilink hashCombs
