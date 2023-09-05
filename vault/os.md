---
id: meb3jkdejxrra89cpqgwmsh
title: Os
desc: ''
updated: 1665736224583
created: 1665736224583
---
{{implements os.children}}
function
  browser
  editor
  cli
  fileManager = {finder, explorer}
  packageManager
  tile/windowManager
  launcher
  multiplexer
  server
    dns
    resolver
    setter
    getter

defaults
  editor = vsCode