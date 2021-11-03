---
id: naLuk6jq1W7wfnc4Xwmfw
title: root
desc: ''
updated: 1635876538839
created: 1635866824965
project: null
priority: 00
---

urgency: [0-4], importance [0-4], priority = urgency ∘ importance: [[0-4][0-4]]

spawn: generated todos while doing

atomicity:
  actionable: singular, actionable unit
  compound: multiple actionable units
  planning: possibly multiple abstract units
    reverse
    : actionable chunk priority. No specific date of completion

started:
  hold
  sub
  postponed({reason})
  autohold

history:
  some git command collecting state

date:
  due
  recurrence
    recurrenceType:
      strict
      cumulative
      subtractive/failcase
      customLogic
  projected
