---
id: ku29hh8l8o9ax91ihkfbvwn
title: fundamentalProblem
desc: ''
updated: 1633199319652
created: 1633199319652
---
## Fundamental Theorem of Algebra

### Statement and Significance

We already [discussed](http://www.cut-the-knot.org/do_you_know/fundamental.shtml) the history of the development of the concept of a number. Here I would like to undertake a more formal approach. Thus, in the beginning there was counting. But soon enough people got concerned with equation solving. (If I saw 13 winters and my tribe's law allows a maiden to marry after her 15th winter, how many winters should I wait before being allowed to marry the gorgeous hunter who lives on the other side of the mountain?) The Fundamental Theorem of Algebra is a theorem about equation solving. It states that every polynomial equation over the field of [complex numbers](http://www.cut-the-knot.org/arithmetic/algebra/ComplexNumbers.shtml) of degree higher than 1 has a complex solution. Polynomial equations are in the form

P(x) = anxn + an-1xn-1 + ... + a1x + a0 = 0,

where an is assumed non-zero (for why to mention it otherwise?), in which case n is called the _degree_ of the polynomial P and of the equation above. ai's are known coefficients while x is an unknown number. A number a is a solution to the equation P(x) = 0 if substituting a for x renders it [identity](http://www.cut-the-knot.org/do_you_know/add_eq.shtml#identity): P(a) = 0. The coefficients are assumed to belong to a specific set of numbers where we also seek a solution. The polynomial form is very general but often studying P(x) = Q(x) is more convenient.

To see how this works let's start with the [counting numbers](http://www.cut-the-knot.org/do_you_know/few_words.shtml#whole) (the set N of numbers 1,2,3,...), and the simplest equation x + a = b. For example, x + 5 = 12 has a solution x = 12 - 5 = 7. Also, x + 4 = 20 has a solution x = 20 - 4 = 16. Further, x + 20 = 4 has a solution x = 4 - 20 = ?. Oops, there is a problem. What is 4-20 among the counting numbers? No number exists such that when added to 20 gives 4. We say that the set of counting numbers is not _algebraically closed_. Introduction of negative numbers (note: I do not explain here how to do this) eases the problem:

Any equation x + a = b where a,b∈N has a solution x∈Z, where Z is the set of _integers_ numbers (plus, minus whole numbers and zero).

Actually, we get a little more than expected. For, once we accepted the negatives, we have a stronger result:

Any equation x + a = b where a,b∈Z has a solution x∈Z.

Even if the coefficients are allowed to be negative, the equation still has a solution in Z. Now let's consider other equations over Z: 5x - 10 = 0. x = 10/5 = 2. Also, 11x + 132 = 0. x = -132/11 = -12. Further, 5x - 11 = 0. x = 11/5 = ?. You see? This happened again. Is there an integer such that when multiplied by 5 gives 11? No, Z is not algebraically closed either. However, introduction of rational numbers Q seems to solve the problem:

Any equation ax + b = 0 where a,b∈Z has a solution x∈Q

Moreover, we again get a stronger result, viz.:

Any equation ax + b = 0 where a,b∈Q has a solution x∈Q

Even when the coefficients are taken to be rational the equation still has a rational solution. However, Q is still not algebraically closed. For there are equations with rational coefficients (e.g., [x2 = 2](http://www.cut-the-knot.org/proofs/sq_root.shtml)) that have no rational solution. This leads to the set R of real numbers. R is a big field but not yet algebraically closed: the innocently looking equation x2 + 1 = 0 with real coefficients has no real solution. So eventually we introduce complex number field P. We expect that polynomial equations with real coefficients unsolvable among reals will have complex solutions. This is indeed so. But the Fundamental Theorem of Algebra states even more. It states that our perseverance paid off handsomely. Not only equations with real coefficients have complex solutions. Every polynomial equation with complex coefficients has at least one complex solution. In other words, the field of complex numbers is algebraically closed!

Finally! Complex numbers are really _perfect_ for solving equations.

(image/gif)(image/gif)

### Complex Numbers

(image/gif)

[|Contact|](http://www.cut-the-knot.org/MailNotificationPage.shtml) [|Front page|](http://www.cut-the-knot.org/front.shtml) [|Contents|](http://www.cut-the-knot.org/content.shtml) [|Algebra|](http://www.cut-the-knot.org/algebra.shtml) [|Store|](http://astore.amazon.com/ctksoftwareinc)

Copyright © 1996-2015 [Alexander Bogomolny](http://www.cut-the-knot.org/index.shtml)

