---
id: homt5jcoc4k6tvazcnzhy7j
title: Stylus
desc: ''
updated: 1642878866890
created: 1637110638998
---

```CSS
/* general */
:root {
  --color-polarized-primary: #764abc;
  --color-polarized-secondary:#c59700;
  --darkreader-selection-text: #fbf1c7 !important;
  --darkreader-link-unvisited: #a65fe3 !important;
  --darkreader-inline-bgcolor: #5a489f;
  --no-own-theme: true;

  /* toucan: dark-mode fix */
}
:root .tou-body div[role="tooltip"] .MuiBox-root {
  background-color: #422d64 !important;
}
:link {
  color: #896EB1 !important;
  text-decoration-color: #896EB1 !important;
}
:visited {
  color: #a9a3e5 !important;
  text-decoration-color: #a9a3e5 !important;
}
:root .vimvixen-hint {
    background-color: #422d64 !important;
    border-color: #c59d00 !important;
    color: #fbf1c7 !important;
}
::placeholder {
    opacity: 0.5 !important;
}
.tou-body .MuiBox-root {
  background-color: #323232 !important;
}

/* Scrollbar */
::-webkit-scrollbar {
  height: 2px;
  width: 2px;
  border-radius: 1px;
  background: #CBCDD1;
}
::-webkit-scrollbar-track {
  background: #CBCDD1;
}
::-webkit-scrollbar-corner {
  background: #CBCDD1;
}
::-webkit-scrollbar-thumb {
  background: #896EB1;
}
@media (prefers-color-scheme: dark) {
  ::-webkit-scrollbar {
    background: #292828;
  }
  ::-webkit-scrollbar-corner {
    background: #292828;
  }
  ::-webkit-scrollbar-track {
    background: #292828;
  }
  :link {
    color: #a9a3e5 !important;
    text-decoration-color: #a9a3e5 !important;
  }
  :visited {
    color: #7367f0 !important;
    text-decoration-color: #7367f0 !important;
  }
}
```