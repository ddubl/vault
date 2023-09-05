---
id: 5kkpv8vaomhqizcko1qec05
title: Floatilla
desc: ''
updated: 1638046786945
created: 1636921386367
---

interactively change NSPanel/NSWindow properties
spec and [[reasoning|https://developer.apple.com/design/human-interface-guidelines/macos/app-architecture/fullscreen-mode/#:~:text=Enable%20full-screen,into%20other%20locations.]] for implementation differences

inject [[NS::FullScreenAuxiliary|https://developer.apple.com/documentation/appkit/nswindow/collectionbehavior/1419617-fullscreenauxiliary]]

generate new NSPanel containing a space? ^si4lCheYIrHi

## functionality
- maximizeable
- clickThrough
- floating
- opacity

#r #sub #lang.p.swift
scriptable reflection library

- create/mutate panel/window/popup to NS::FullscreenAuxiliary