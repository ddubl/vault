---
id: l1sw8c33dgpgnbbkkeus9ys
title: Ledgedash
desc: ''
updated: 1636985725274
created: 1636972042861
---

#media.vid ![Secrets of the Ledge: An Advanced Guide to TAS Ledgedash Inputs in SSBM](https://www.youtube.com/watch?v=FzOctYnwwuc) ^SLPSA4kHMBjn
^NAME
^URL

smashBox construction has to digitize/buttonize angles
for eg. ledgeDashes ![[#screenShot#T#^102]] #feature [[rich media functions/funclet // extraction capability|Dendron|dendron://dwl/dendron#^Qh3VNS1bVevV]]
certain angles better
yield certain properties:
- jump forward

## jump trajectory vs aerial drift #T^419
?+> #dendron.notation ![[video annotations|dendron://dwl/dendron.notation#^dZwUcEvtXBYW]]
"more impactful" because of input/effect ratio
trajectory technically needs 1f worth of inputs to determine a big action
drift requires continuous input that limits options

drift will be input as a byproduct during ld

## anatomy #T^144
wavedash offstage
-> fastest ledgegrab requires ff (character specific) #T#^172
1st possible ff-frame=3, cannot fastfall earlier
![[fastfall bufferable|dendron://dwl/ssbm#^fastfall,1]] makes this consistent

37f intangibility on CliffCatch #ssbm.char.state
  .CliffCatch 7f inactionable
  .CliffWait1 +f Ledge:Roll/Attack/Jump
  .CliffWait2 +f +Ledge:GetUp/Fall
  .LedgeFall1 +f Jump

why avoid ff?
ff changes airdodge-frames to get ledgeDash
- by not ff get 2 frame airdodge-window

.LedgeFall2 jump with forward trajectory
[?] jump trajectory alter jump-height/jump-time?
jump trajectory and airdodge steepness correlate inversely #!
.LedgeFall3 if not ff -> .dj+3f airdodge

.ledgeFall5 =
.dj3 airdodge
  shallow = safer
  steeper = faster
"choosing galint" #T#^626 isn't really possible.
had to notch controller beforehand to guarantee a certain galint, this digitizes options or carries additional risk

## Stages
easier: bf, dl, fod
harder: fd, ps, ys
differences: wall?
  cannot alter jump trajectory forward

## ECB-Interaction
animation specific
ECB-Freeze/Reset Frames
usually in animation frame 9-10f
if animation change before reset -> renew ECB

11f ledgeFall guarantees ECB-reset
-> practice timings?

### animations
#### beneficial
  doubleJumpPeak
    of 20-22? of doubleJump -> 16 galint ld
#### difficult
  wavedash offstage: +1f to dj

fox: ecb with firefox-resets?
ecb-resets from doubleJumpPeak into others

## optimizations
are there optimal angles? -> interact with other angles (shielddrop)?
situational necessity (how much galint?)
  more than 8 not needed, but less galint requires tighter follow-up
handpositions
motion-chunks
digitize