---
id: cq52y2531sah9kjzlty0jbb
title: macOS
desc: ''
updated: 1656435212570
created: 1656433122774
---


A quick Google search uncovered the simple change. Add the following line to /etc/pam.d/sudo:

auth sufficient pam_tid.so