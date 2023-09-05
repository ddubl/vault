---
id: og3vuoq04p0xb0ff13jyanq
title: Elm
desc: ''
updated: 1633199321434
created: 1633199321434
---

Reading Types · An Introduction to Elm

___
To really understand why there are two arrows in the type of divide, it helps to convert the definition to use anonymous functions. divide x y = x / yfunction : Float - Float - Float divide x = \y - x / yfunction : Float - Float - Float divide = \x - (\y - x / y)function : Float - Float - FloatAll of these are totally equivalent. We just moved the arguments over, turning them into anonymous functions one at a time. So when we run an expression like divide 3 2 we are actually doing a bunch of evaluation steps:

—

I think this to be highly unorthodox but strangely efficient. This means that all functions are automatically curryable and possibly - yet to determine - partially applicable.

@LangDesign.
 This is probably a good Idea to import.

* * *

Sep 12 2017 · This note was created with LINER By Daniel Kohler

Highlighted Source : http://lnr.li/DHY6x/
Original Source : https://guide.elm-lang.org/types/reading_types.html
