---
id: P3Uzv4gcnrcvEnVwO3ziZ
title: JS
desc: ''
updated: 1633199321437
created: 1633199321437
stub: true
---
[javascript promises](https://developers.google.com/web/fundamentals/getting-started/primers/promises)

`A promise is defined as an object that has a function as the value for the property then`

Events aren't always the best way [ **By** [Jake](https://developers.google.com/web/resources/contributors#jakearchibald) [](https://developers.google.com/web/resources/contributors#jakearchibald) [Archibald](https://developers.google.com/web/resources/contributors#jakearchibald)]

Events are great for things that can happen multiple times on the same object—keyup, touchstart etc. With those events you don't really care about what happened before you attached the listener. But when it comes to async success/failure, ideally you want something like this:

img1.callThisIfLoadedOrWhenLoaded(function() {
  // loaded

}).orIfFailedCallThis(function() {

  // failed

});

// and…

whenAllTheseHaveLoaded([img1, img2]).callThis(function() {

  // all loaded

}).orIfSomeFailedCallThis(function() {

  // one or more failed
});

img1.ready().then(function() {

  // loaded

}, function() {

  // failed

});

// and…

Promise.all([img1.ready(), img2.ready()]).then(function() {

  // all loaded

}, function() {

  // one or more failed

});

At their most basic, promises are a bit like event listeners except:

* A promise can only succeed or fail once. It cannot succeed or fail twice, neither can it switch from success to failure or vice versa.
* If a promise has succeeded or failed and you later add a success/failure callback, the correct callback will be called, even though the event took place earlier.

This is extremely useful for async success/failure, because you're less interested in the exact time something became available, and more interested in reacting to the outcome.

Promise terminology

Overview and Operational Definitions

States

Promises have three possible mutually exclusive states: fulfilled, rejected, and pending.

* A promise is *fulfilled* if promise.then(f) will call f "as soon as possible."
* A promise is *rejected* if promise.then(undefined, r) will call r "as soon as possible."
* A promise is *pending* if it is neither fulfilled nor rejected.

We say that a promise is *settled* if it is not pending, i.e. if it is either fulfilled or rejected. Being settled is not a state, just a linguistic convenience.

Fates

Promises have two possible mutually exclusive fates: resolved, and unresolved.

* A promise is *resolved* if trying to resolve or reject it has no effect, i.e. the promise has been "locked in" to either follow another promise, or has been fulfilled or rejected.
* A promise is *unresolved* if it is not resolved, i.e. if trying to resolve or reject it will have an impact on the promise.

A promise can be "resolved to" either a promise or thenable, in which case it will store the promise or thenable for later unwrapping; or it can be resolved to a non-promise value, in which case it is fulfilled with that value.

Relating States and Fates

A promise whose fate is resolved can be in any of the three states:

* Fulfilled, if it has been resolved to a non-promise value, or resolved to a thenable which will call any passed fulfillment handler back as soon as possible, or resolved to another promise that is fulfilled.
* Rejected, if it has been rejected directly, or resolved to a thenable which will call any passed rejection handler back as soon as possible, or resolved to another promise that is rejected.
* Pending, if it has been resolved to a thenable which will call neither handler back as soon as possible, or resolved to another promise that is pending.

A promise whose fate is unresolved is necessarily pending.

Note that these relations are recursive, e.g. a promise that has been resolved to a thenable which will call its fulfillment handler with a promise that has been rejected is itself rejected.

Relation to the Spec

A promise's state is reflected in its [[PromiseState]] internal slot.

A promise's fate is stored implicitly as part of its "resolving functions."

##Why the jQuery implementation is broken: On deferreds and the 'Promise-Type'

###The commonJS Promise/A
     [...] To fix this and other problems (as we’ll see) with callbacks style of code, a specification has been proposed and it is known under the name CommonJS Promises/A. Let’s see what it says:
A promise represents the eventual value returned from the single completion of an operation. A promise may be in one of the three states, unfulfilled, fulfilled, and failed. The promise may only move from unfulfilled to fulfilled, or unfulfilled to failed. Once a promise is fulfilled or failed, the promise’s value MUST not be changed, just as a values in JavaScript, primitives and object identities, can not change (although objects themselves may always be mutable even if their identity isn’t). The immutable characteristic of promises are important for avoiding side-effects from listeners that can create unanticipated changes in behavior and allows promises to be passed to other functions without affecting the caller, in same way that primitives can be passed to functions without any concern that the caller’s variable will be modified by the callee.
[…]

in [Domenic]'s Words: Promises are a software abstraction that makes working with asynchronous operations much more pleasant. In the most basic definition, your code will move from continuation-passing style:

<code>getTweetsFor("domenic", function (err, results) {
  // the rest of your code goes here.});
</code>
to one where your functions return a value, called a promise, which represents the eventual results of that operation.

var promiseForTweets = getTweetsFor("domenic");

This is powerful since you can now treat these promises as first-class objects, passing them around, aggregating them, and so on, instead of inserting dummy callbacks that tie together other callbacks in order to do the same.

What Is the Point of Promises?

The thing is, promises are not about callback aggregation. That’s a simple utility. Promises are about something much deeper, namely providing a direct correspondence between synchronous functions and asynchronous functions.

What does this mean? Well, there are two very important aspects of synchronous functions:

- They return values
- They throw exceptions

Both of these are essentially about composition. That is, you can feed the return value of one function straight into another, and keep doing this indefinitely. More importantly, if at any point that process fails, one function in the composition chain can throw an exception, which then bypasses all further compositional layers until it comes into the hands of someone who can handle it with a catch.

Now, in an asynchronous world, you can no longer return values: they simply aren’t ready in time. Similarly, you can’t throw exceptions, because nobody’s there to catch them. So we descend into the so-called “callback hell,” where composition of return values involves nested callbacks, and composition of errors involves passing them up the chain manually, and oh by the way you’d better never throw an exception or else you’ll need to introduce something crazy like domains.

The point of promises is to give us back functional composition and error bubbling in the async world.They do this by saying that your functions should return a promise, which can do one of two things:
- Become fulfilled by a value
- Become rejected with an exception

And, if you have a correctly implemented then function that follows Promises/A, then fulfillment and rejection will compose just like their synchronous counterparts, with fulfillments flowing up a compositional chain, but being interrupted at any time by a rejection that is only handled by someone who declares they are ready to handle it.

In other words, the following asynchronous code:

getTweetsFor("domenic") // promise-returning function
  .then(function (tweets) {
  var shortUrls = parseTweetsForUrls(tweets);
  var mostRecentShortUrl = shortUrls[0];
  return expandUrlUsingTwitterApi(mostRecentShortUrl); // promise-returning function
  })
  .then(httpGet) // promise-returning function
  .then(
  function (responseBody) {
  console.log("Most recent link text:", responseBody);
  },
  function (error) {
  console.error("Error with the twitterverse:", error);
  }
  );

parallels* the synchronous code:

try {
  var tweets = getTweetsFor("domenic"); // blocking
  var shortUrls = parseTweetsForUrls(tweets);
  var mostRecentShortUrl = shortUrls[0];
  var responseBody = httpGet(expandUrlUsingTwitterApi(mostRecentShortUrl)); // blocking x 2
  console.log("Most recent link text:", responseBody);} catch (error) {
  console.error("Error with the twitterverse: ", error);}

Note in particular how errors flowed from any step in the process to our catch handler, without explicit by-hand bubbling code. And with the upcoming ECMAScript 6 revision of JavaScript, plus some party tricks, the code becomes not only parallel but almost identical.

###Promises/A+ Spec

An open standard for sound, interoperable JavaScript promises—by implementers, for implementers.

A promise represents the eventual result of an asynchronous operation. The primary way of interacting with a promise is through its then method, which registers callbacks to receive either a promise's eventual value or the reason why the promise cannot be fulfilled.

This specification details the behavior of the then method, providing an interoperable base which all Promises/A+ conformant promise implementations can be depended on to provide. As such, the specification should be considered very stable. Although the Promises/A+ organization may occasionally revise this specification with minor backward-compatible changes to address newly-discovered corner cases, we will integrate large or backward-incompatible changes only after careful consideration, discussion, and testing.

Historically, Promises/A+ clarifies the behavioral clauses of the earlier Promises/A proposal, extending it to cover de facto behaviors and omitting parts that are underspecified or problematic.

Finally, the core Promises/A+ specification does not deal with how to create, fulfill, or reject promises, choosing instead to focus on providing an interoperable then method. Future work in companion specifications may touch on these subjects.

Terminology

- "promise" is an object or function with a then method whose behavior conforms to this specification.
- "thenable" is an object or function that defines a then method.
- "value" is any legal JavaScript value (including undefined, a thenable, or a promise).
- "exception" is a value that is thrown using the throw statement[The throw statement throws a user-defined exception. Execution of the current function will stop (the statements after throw won't be executed), and control will be passed to the first catch block in the call stack. If no catch block exists among caller functions, the program will terminate.]
- "reason" is a value that indicates why a promise was rejected.

Requirements

Promise States

A promise must be in one of three states: pending, fulfilled, or rejected.

- When pending, a promise:
  - may transition to either the fulfilled or rejected state.
- When fulfilled, a promise:
  - must not transition to any other state.
  - must have a value, which must not change.
- When rejected, a promise:
  - must not transition to any other state.
  - must have a reason, which must not change.

Here, "must not change" means immutable identity (i.e. ===), but does not imply deep immutability.

The then Method

A promise must provide a then method to access its current or eventual value or reason.

A promise's then method accepts two arguments:

promise.then(onFulfilled, onRejected)

- Both onFulfilled and onRejected are optional arguments:

  - If onFulfilled is not a function, it must be ignored.
  - If onRejected is not a function, it must be ignored.

- If onFulfilled is a function:

  - it must be called after promise is fulfilled, with promise's value as its first argument.
  - it must not be called before promise is fulfilled.
  - it must not be called more than once.

- If onRejected is a function,

  - it must be called after promise is rejected, with promise's reason as its first argument.
  - it must not be called before promise is rejected.
  - it must not be called more than once.

- onFulfilled or onRejected must not be called until the execution context stack contains only platform code. [3.1].

- onFulfilled and onRejected must be called as functions (i.e. with no this value). [3.2]

- then may be called multiple times on the same promise.

  - If/when promise is fulfilled, all respective onFulfilled callbacks must execute in the order of their originating calls to then.
  - If/when promise is rejected, all respective onRejected callbacks must execute in the order of their originating calls to then.

- then must return a promise [3.3].

- promise2 = promise1.then(onFulfilled, onRejected);

  - If either onFulfilled or onRejected returns a value x, run the Promise Resolution Procedure [[Resolve]](promise2, x).
  - If either onFulfilled or onRejected throws an exception e, promise2 must be rejected with e as the reason.
  - If onFulfilled is not a function and promise1 is fulfilled, promise2 must be fulfilled with the same value as promise1.
  - If onRejected is not a function and promise1 is rejected, promise2 must be rejected with the same reason as promise1.

The Promise Resolution Procedure

The promise resolution procedure is an abstract operation taking as input a promise and a value, which we denote as [[Resolve]](promise, x). If x is a thenable, it attempts to make promise adopt the state of x, under the assumption that x behaves at least somewhat like a promise. Otherwise, it fulfills promise with the value x.

This treatment of thenables allows promise implementations to interoperate, as long as they expose a Promises/A+-compliant then method. It also allows Promises/A+ implementations to "assimilate" nonconformant implementations with reasonable then methods.

To run [[Resolve]](promise, x), perform the following steps:

- If promise and x refer to the same object, reject promise with a TypeError as the reason.
- If x is a promise, adopt its state [3.4]:
  - If x is pending, promise must remain pending until x is fulfilled or rejected.
  - If/when x is fulfilled, fulfill promise with the same value.
  - If/when x is rejected, reject promise with the same reason.
- Otherwise, if x is an object or function,
  - Let then be x.then. [3.5]
  - If retrieving the property x.then results in a thrown exception e, reject promise with e as the reason.
  - If then is a function, call it with x as this, first argument resolvePromise, and second argument rejectPromise, where:
  - If/when resolvePromise is called with a value y, run [[Resolve]](promise, y).
  - If/when rejectPromise is called with a reason r, reject promise with r.
  - If both resolvePromise and rejectPromise are called, or multiple calls to the same argument are made, the first call takes precedence, and any further calls are ignored.
  - If calling then throws an exception e,
  - If resolvePromise or rejectPromise have been called, ignore it.
  - Otherwise, reject promise with e as the reason.
  - If then is not a function, fulfill promise with x.
- If x is not an object or function, fulfill promise with x.

If a promise is resolved with a thenable that participates in a circular thenable chain, such that the recursive nature of [[Resolve]](promise, thenable) eventually causes [[Resolve]](promise, thenable) to be called again, following the above algorithm will lead to infinite recursion. Implementations are encouraged, but not required, to detect such recursion and reject promise with an informative TypeError as the reason. [3.6]
