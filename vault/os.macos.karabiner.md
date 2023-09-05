---
id: eael4flvq8mdlx8riycw7mf
title: Karabiner
desc: ''
updated: 1680513647673
created: 1680513647674
---

workflow: define:
  typing password via fingerprint scanner:

..additional karabiner rules
{
  "description": "mc := lAlt + rAlt + spc ;; borderline useless without pointer-fixing to cursor",
  "manipulators": [
      {
          "from": {
              "key_code": "spacebar",
              "modifiers": {
                  "mandatory": [
                      "left_alt",
                      "right_alt"
                  ],
                  "optional": [
                      "left_control"
                  ]
              }
          },
          "to": [
              {
                  "lazy": true,
                  "pointing_button": "button1"
              }
          ],
          "type": "basic"
      }
  ]
},
