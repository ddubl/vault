---
id: uuwb2okb9odu4k1v7w22398
title: Basics
desc: ''
updated: 1633199319524
created: 1633199319524
---
Top highlight

[![codeburst](https://cdn-images-1.medium.com/letterbox/120/56/50/50/1*LC0hwOq4FY2CG5F9W7R34Q.png?source=logoAvatar-lo_e8b64fe153e3---61061eb0c96b)](https://codeburst.io/?source=logo-lo_e8b64fe153e3---61061eb0c96b)

Follow
[](https://twitter.com/codeburstio)[](https://twitter.com/codeburstio)[](https://facebook.com/codeburst)[](https://facebook.com/codeburst) [](https://twitter.com/codeburstio)[](https://facebook.com/codeburst)[](https://facebook.com/codeburst) [](https://twitter.com/codeburstio)[](https://facebook.com/codeburst)[](https://facebook.com/codeburst)

[Sign up](https://medium.com/m/signin?redirect=https://codeburst.io/explaining-value-vs-reference-in-javascript-647a975e12a0?source=userActivityShare-8b9e4d929a2-1499500919)

- [Home](https://codeburst.io/)
- [JavaScript](https://codeburst.io/tagged/javascript)
- [Learn Web Development](https://codeburst.io/best-udemy-courses-for-learning-full-stack-web-development-45e2bd3ec28b)
- [Write for Us](https://codeburst.io/write/home)
- [Get Weekly Emails](https://goo.gl/NWJbz4)
  [](https://codeburst.io/search)[](https://codeburst.io/search) [](https://codeburst.io/search)[](https://codeburst.io/search)

[Go to the profile of Arnav Aggarwal (image/jpeg)](https://codeburst.io/@arnav_aggarwal?source=post_header_lockup)[Arnav Aggarwal](https://codeburst.io/@arnav_aggarwal?source=post_header_lockup)BlockedUnblockFollowFollowingFull-Stack Developer
Jul 1

* * *

## Explaining Value vs. Reference in Javascript

## A look at computer memory reveals what’s happening

(image/jpeg) (image/jpeg)

Javascript has 5 data types that are passed by **_value_**: `Boolean`, `null`, `undefined`, `String`, and `Number`. We’ll call these **primitive types**.

Javascript has 3 data types that are passed by **_reference_**: `Array`, `Function`, and `Object`. These are all technically Objects, so we’ll refer to them collectively as **Objects**.

### Primitives

If a primitive type is assigned to a variable, we can think of that variable as _containing_ the primitive value.

var x = 10;
var y = 'abc';
var z = null;

`x` _contains_ `10`. `y` _contains_ `'abc'`. To cement this idea, we’ll maintain an image of what these variables and their respective values look like in memory.

(image/png)

When we assign these variables to other variables using `=`, we **copy** the value to the new variable. They are copied by value.

var x = 10;
var y = 'abc';

var a = x;
var b = y;

console.log(x, y, a, b); // -> 10, 'abc', 10, 'abc'

Both `a` and `x` now contain `10`. Both `b` and `y` now contain `'abc'`. They’re separate, as the values themselves were copied.

(image/png)

Changing one does not change the other. Think of the variables as having no relationship to each other.

var x = 10;
var y = 'abc';

var a = x;
var b = y;

a = 5;
b = 'def';

console.log(x, y, a, b); // -> 10, 'abc', 5, 'def'

### Objects

This will feel confusing, but bear with me and read through it. Once you get through it, it’ll seem easy.

Variables that are assigned a non-primitive value are given a _reference_ to that value. That reference points to the object’s location in memory. The variables don’t actually contain the value.

Objects are created at some location in your computer’s memory. When we write `arr = []`, we’ve created an array in memory. What the variable `arr` receives is the address, the location, of that array.

Let’s pretend that `address` is a new data type that is passed by value, just like `number` or `string`. An `address` points to the location, in memory, of a value that is passed by reference. Just like a string is denoted by quotation marks (`''` or `""`), an `address` will be denoted by arrow brackets, `<>`.

When we assign and use a reference-type variable, what we write and see is:

1) var arr = \[];
2) arr.push(1);

A representation of lines 1 and 2 above in memory is:

1.

(image/png)

2.

(image/png)

Notice that the value, the address, contained by the variable `arr` is static. The array in memory is what changes. When we use `arr` to do something, such as pushing a value, the Javascript engine goes to the location of `arr` in memory and works with the information stored there.

#### Assigning by Reference

When a reference type value, an object, is copied to another variable using `=`, the address of that value is what’s actually copied over as if it were a primitive. **Objects are copied by reference** instead of by value.

var reference = [1];
var refCopy = reference;

The code above looks like this in memory.

(image/png)

Each variable now contains a reference to the _same array_. That means that if we alter `reference`, `refCopy` will see those changes:

reference.push(2);
console.log(reference, refCopy); // -> [1, 2], [1, 2]

(image/png)

We’ve pushed `2` into the array in memory. When we use `reference` and `refCopy`, we’re pointing to that same array.

#### Reassigning a Reference

Reassigning a reference variable replaces the old reference.

var obj = { first: 'reference' };

In memory:

(image/png)

When we have a second line:

var obj = { first: 'reference' };
obj = { second: 'ref2' }

The address stored in `obj` changes. The first object is still present in memory, and so is the next object:

(image/png)

When there are no references to an object remaining, as we see for the address `#234` above, the Javascript engine can perform garbage collection. This just means that the programmer has lost all references to the object and can’t use the object any more, so the engine can go ahead and safely delete it from memory. In this case, the object `{ first: 'reference' }` is no longer accessible and is available to the engine for garbage collection.

### Passing Parameters through Functions

When we pass primitive values into a function, the function copies the values into its parameters. It’s effectively the same as using `=`.

var hundred = 100;
var two = 2;

function multiply(x, y) {
    // PAUSE
    return x \* y;
}

var twoHundred = multiplyByTwo(hundred, two);

In the example above, we give `hundred` the value `100`. When we pass it into `multiply`, the variable `x` gets that value, `100`. The value is copied over as if we used an `=` assignment. Again, the value of `hundred` is not affected. Here is a snapshot of what the memory looks like right at the PAUSE comment line in `multiply`.

(image/png)

We refer to functions that don’t affect anything in the outside scope as _pure functions_. As long as a function only takes primitive values as parameters and doesn’t use any variables in its surrounding scope, it can’t affect anything in the outside scope.

A function that takes in an Object, however, can mutate the state of its surrounding scope. If a function takes in an array reference and alters the array that it points to, perhaps by pushing to it, variables in the surrounding scope that reference that array see that change. The array has been mutated and affects information present outside the function. This can cause undesired side effects that can be difficult to track down.

Many popular array functions, including `Array.map` and `Array.filter`, are therefore written as pure functions. They take in an array reference and internally, they copy the array and work with the copy instead of the original. This makes it so the original is untouched, our outer scope is unaffected, and we’re returned a reference to a brand new array.

#### That’s it. Go write some code.

— — — — — — — — — — — — — — — — — — — — — — — — — — — — — —

#### If this article helped, please hit the heart on the left and feel free to subscribe and check out my other recent publications.

[**The Simple Rules to ‘this’ in Javascript**](https://codeburst.io/the-simple-rules-to-this-in-javascript-35d97f31bde3)[](https://codeburst.io/the-simple-rules-to-this-in-javascript-35d97f31bde3)
[**Learn how Array.map & Array.filter work by writing them yourself**](https://medium.com/@arnav_aggarwal/array-functions-map-filter-18a6e5f75da1)[](https://medium.com/@arnav_aggarwal/array-functions-map-filter-18a6e5f75da1)
[**React Ecosystem Setup — Step-By-Step Walkthrough**
_Understand what React, Webpack, and Babel are doing and how to configure them yourself_](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)[](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)

[](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)
[](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)[](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)[](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)[](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)

[](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)\* [](https://codeburst.io/react-ecosystem-setup-step-by-step-walkthrough-721ff45a7fc1)[JavaScript](https://codeburst.io/tagged/javascript?source=post)

- [Web Development](https://codeburst.io/tagged/web-development?source=post)
- [Software Development](https://codeburst.io/tagged/software-development?source=post)
- [Software](https://codeburst.io/tagged/software?source=post)
- [Coding](https://codeburst.io/tagged/coding?source=post)

64

3

- BlockedUnblockFollowFollowing[Go to the profile of Arnav Aggarwal (image/jpeg)](https://codeburst.io/@arnav_aggarwal?source=footer_card)

  ### [Arnav Aggarwal](https://codeburst.io/@arnav_aggarwal)

    Full-Stack Developer

- Follow[codeburst (image/png)](https://codeburst.io/?source=footer_card)

  ### [codeburst](https://codeburst.io/?source=footer_card)

    bursts of code to power through your day

Responses

Conversation with [Arnav Aggarwal](https://medium.com/@arnav_aggarwal).

[Go to the profile of Roger Howell (image/png)](https://medium.com/@MysterAitch)[Roger Howell](https://medium.com/@MysterAitch?source=responses---------0-----------)[Jul 7
](https://medium.com/@MysterAitch/a-really-useful-and-helpful-read-as-it-helps-to-clarify-ive-known-about-but-didn-t-know-the-full-77432b10f527?source=responses---------0-----------)

\[

* * *

A really useful and helpful read as it helps to clarify I’ve known about but didn’t know the full details about, thank you!!

Any chance of adding one final section or a follow up article to cover closures in the same style of description? This is one topic where there are practical and very common issues arising from the…

](<https://medium.com/@MysterAitch/a-really-useful-and-helpful-read-as-it-helps-to-clarify-ive-known-about-but-didn-t-know-the-full-77432b10f527?source=responses---------0----------->)
Read more…
[1 response](https://medium.com/@MysterAitch/a-really-useful-and-helpful-read-as-it-helps-to-clarify-ive-known-about-but-didn-t-know-the-full-77432b10f527?source=responses---------0-----------#--responses)

[Go to the profile of Arnav Aggarwal (image/jpeg)](https://medium.com/@arnav_aggarwal)[Arnav Aggarwal](https://medium.com/@arnav_aggarwal?source=responses---------0-----------)[Jul 7
](https://medium.com/@arnav_aggarwal/thanks-im-glad-you-found-it-useful-f63f158f2dc3?source=responses---------0-----------)

\[

* * *

Thanks, I’m glad you found it useful! I’ll consider writing a separate article on closures and scoping. I’m always looking for more topics to write about. Thanks for the recommendation.

](<https://medium.com/@arnav_aggarwal/thanks-im-glad-you-found-it-useful-f63f158f2dc3?source=responses---------0----------->)

Show all responses

- Share
- 64

Open in app
64

3

