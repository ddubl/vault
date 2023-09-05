---
id: woubyrmyv8igo3tiev12vmw
title: Switch
desc: ''
updated: 1633199319501
created: 1633199319501
---
they be? · Issue #308 · kriskowal/q

## Are switches/branches possible in promise chains? Should they be? #308

Closed

[Redsandro](https://github.com/Redsandro) opened this Issue on Jun 3, 2013 · 19 comments

### Assignees

No one assigned

### Labels

None yet

Hello clever people,

Is there, or should there be, a way to switch chains (or 'branches') for a promise?

Code is so very pretty when you have your promise chain separate from your functions, e.g.

getPromise()
.then(someFunc)
.then(someFoo)
.then(someBar)
// ...
.done();

It's almost as gratifying as separating layout from content. But I find myself having functions that become `if` statements to include different promise chains, e.g.

someBaz(val) {
    var promise = q.fcall(trySomething, val) // trySomething will return a promise or purposely throw error if it knows it can't make any promises
    .fail(
        function (err) {
            if (err.message == 'This was to be expected.')
                return someBazBazBaz(val); // Try alternative function to return the promise

```
        // If this was not the expected error, then it must be a serious error.
        throw err;
    }
);

return promise;
```

}

However, this is purely chain switching, so it would be nice if we could keep that in the chain part, without using so much code that will prevent the promise chain from looking sexy.

Do you know some trickery to make this short and nice to make this fit in the chain? Should there be a switching function? E.g.:

getPromise()
.then(someFunc)
.then(someFoo)
.if(compareFunction, 
    function(promise){ // value is already promise in this chain, making code shorter
        // true
        return promise
        .then(bakeCookies);
    }, 
    function(promise){
        // false
        return promise
        .then(buyCookies);
    }
)
.then(someCookieFun) // continues with whichever branch was followed above
// ...
.done(someBaz)

Maybe it can be even shorter. I've seen some nifty tricks.

PS - I am not sure if I asked something like this before, or if I was just playing with the thought. I cannot find it back, so it was probably in my head.

In the interest of preventing bloat and keeping a focused scope, I’m not inclined to virtualize `if` blocks.

[@Redsandro](https://github.com/Redsandro) you can have a simple combinator for this in a separate library, this doesn't need to be in Q core:

function pif(promise, test, consequent, alternate) {
  return promise.then(function(value) {
    return test(value)? consequent(value) : alternate(value)
  })
}

function identity(a){ return a }

function when(promise, test, f) {
  return pif(promise, test, f, identity)
}

function unless(promise, test, f) {
  return pif(promise, test, identity, f)
}

Then use it:

pif(promise, isZero, doX, doY)
when(promise, isZero, doX)
unless(promise, isZero, doY)

Collaborator

[@killdream](https://github.com/killdream) Thanks! This sort of wrappery is exactly what I mean. I am just not sure about the reason for `identity`, but I will play around with it tomorrow. Does `nodejs` provide means of extending `require`d modules so that I can prototype this to promises?

[@kriskowal](https://github.com/kriskowal) I understand, although I think this is very useful. If it's in the core, it will encourage people to take a bite of sammich that is separation of promiseflow and actual code magic and say 'mmm-mmm'.

[@Redsandro](https://github.com/Redsandro) JS itself is a very dynamic language, you can change the shape of any object at all. Again, I disagree this should be in Q-core, since it's easy to provide a generic module with this particular feature that would work for any Promises/A+ implementation.

I assume you're not familiar with Lambda Calculus combinators? `Identity` is a core combinator that just returns its argument, without doing anything to it. It's useful for composing things where you don't want to apply any transformation on the value, but the operation still expects you to provide a function. In this case, `pif` always takes two functions, `consequent`, which is ran if the predicate passes, and `alternate`, which is ran if it isn't. Since `when` and `unless` are just concerned about applying transformations in the promised value in one of the cases, `identity` fits perfectly as the "look, just keep the value as-is" function :3

Collaborator

No, I was raised atheist and was told not to listen to what churches write. So I never really took a look at the inventions of Alonzo Church.

J/k, never heard about Lambda Calculus combinators. I got to know anonymous functions as Lambda-style functions (in PHP) and that's it. Thanks for the explanation.

I understand you disagree and you're probably right. In my personal opinion, having a complete solution adds so much value to a module, and I would not consider something bloat if it adds many possibilities (promise trees in stead of promise chains) with just a handful of code. I remember some other module that decided to include `prototype.js` one day. Adding ~170K for some functionality, that would be bloat in my book.

Just my POV, I am perfectly happy adding it manually. :)

Btw, if non-bloat, plain, slim and clean is really paramount, I still suggest changing core functions like `post`, `tickle` and `robot` to something more sensible like `mcall` `mapply` and `nmcall` as I suggested here: [#235](https://github.com/kriskowal/q/pull/235)
Because I have to look them up in the documentation _all the time_.

2 cents. :)

Collaborator

I am trying to put conditional functionality in a separate module `qtree` which extends Q and share it for people who are interested. But I cannot seem to extend the promise methods. Is this at all possible? Here, to illustrate what I am trying to do, I am importing this module in stead of Q:

var q = require('q');

module.exports = q;

q.makePromise.prototype.if = function (testFunc, thenFunc, elseFunc, throwBool) {
    return switchIf(this, testFunc, thenFunc, elseFunc, throwBool);
};

/var/test/qtree-test.js:93
        .if(function(){return true}, function(val){return val;})
     ^
TypeError: Object [object Promise] has no method 'if'

I want to add some extra prototypes to promises in a separate module with a Q dependency.

Collaborator

Different approach, same problem:

Object.defineProperty(q.makePromise.prototype, 'if', {
    enumerable  :   false,
    value       :   function(testFunc, thenFunc, elseFunc, throwBool) {
                        return switchIf(this, testFunc, thenFunc, elseFunc, throwBool);
                    }
});

Object.defineProperty(q.makePromise.prototype, 'if', {
       ^
TypeError: Cannot define property:if, object is not extensible.

Collaborator

[@Redsandro](https://github.com/Redsandro) are you using the latest version of Q? The non-extensibility was removed a while ago.

Collaborator

I did a quick search for `preventExtensions` and `isExtensible` and didn't find any in `Q`, I thought it would be extensible by default. Either way, you're right, I don't have the latest version on my development server. Will fetch it and try again.

Collaborator

You are right, `0.9.4` is less stubborn! What sourcery is this? How does one change extensibility without using the letters `extens*` in code?

(Also, `q.makePromise.prototype` and `Object.defineProperty(q.makePromise.prototype` both work. I don't know which is preferred or if I should care.)

Collaborator

`Object.freeze` is a superset of `Object.preventExtensions`, and we used to do that.

As to which is preferred, technically most methods should be defined with `Object.defineProperty`and `configurable: true`, and probably `writable: true`. `enumerable: false` is the default so you don't need to explicitly state that.

BUT, Q itself doesn't use `Object.defineProperty` since Q maintains IE8-compatibility, so using just assignment is fine and possibly better since it fits with Q's existing practice.

Collaborator

In case anyone is interested, I put this small piece of code that adds the `if()` method to promises in a repo. I hope to expand on it in the future.

<https://github.com/Redsandro/qtree>

I am trying to make promises [aware of their switched state](https://github.com/Redsandro/qtree#future-wishes), so I can have daisychained conditionals.

Is it clever to extend `Q` internal functions (e.g. `when()`) with a wrapper function by overriding the prototype (e.g. `then()`)? Or is there a better (smarter) way to do this?

(you can skip the rest, just some examples to show what I mean)

* * *

E.g. In order to do branch-aware promises:

getPromise()
.case('someValue')
    .then(someBazBaz) // No break, continues with next case
.case('otherValue')
    .then(someBarBar)
    .break() // Break, skips to esac()
.default() // When no case is matched
    .then(someFooBaz)
.esac() // Promise no longer needs to be branch-aware.

I need to add a 'secret' property to promises to notify them to skip `then()`s under certain conditions, but I want to be as non-invasive as possible so every `Q` update won't break `qtree`.

E.g. hypothetical code: `Q.when` is still used, but wrapped in `qtree.newWhen`:

q.makePromise.prototype.then = function (fulfilled, rejected, progressed) {
    return newWhen(this, fulfilled, rejected, progressed);
};

newWhen = function(promise, fulfilled, rejected, progressed) {
    if (promise.secretProperty) // some wizardry TBD
        return promise; // Ignore this then()
    else
        return q.when(promise, fulfilled, rejected, progressed);

I don't think that's a good idea at all. Just use something like:

promise
  .case('foo', doBar)
  .case('baz', compose(doBaz, doBar))
  .case('qux', doSomethingElse)

Ideally I'd like to wrap _all_ promise-accepting `Q` functions in one _single_ wrapper function. The wrapper would either execute/return the original function, or return the promise immediately.

I'm not sure if that's possible in javascript. But OTOH, you have this clever `array_reduce` trick for batch-adding functions to a prototype. Maybe there is a clever hook type trick I can do for batch-wrapping?

* * *

**[@killdream](https://github.com/killdream):** _Why_ do you think it's not a good idea? I think it's an excellent idea. I think your POV is too close to the promises as they are. Extend your frame of reference a bit and this will be awesome. You don't have to like it right away though. ;) It doesn't touch `Q` anyway. But before attempting it my way, I just like to verify if the clever Q people over here know of a better way to extend `Q` than I am about to try.

_"Because the promise chain provides such a nice overview of the order in which your code is executed, it is beneficial to be able to make promise trees in stead of promise chains."_ _"The goal is to have more control over the flow of promises."_

The alternative you provided has no improvement over the `if()` statement, except for semantics which contradict the functionality of your typical `case` statement. ( _Note:_ I am following `Bash` here because it uses a short and simple linear chain of commands like I am trying to implement. Javascript would call this a `switch` statement which encloses the `case` switches.)

1. On first `case` statement, `promise` must remember he's in a case statement (i.e. be _branch-aware_) because:
   - It must skip `then`s when `case` condition is not met;
   - It must stop doing `case`s and skip the chain to `esac` when `break` is encountered;
   - It must stop being branch-aware when `esac` is encountered.

Anyway, daisychaining `if`s is also on my todo-list, but in order to do so, the question remains exactly the same because promises still need to be aware.

It's a bad idea because it breaks compositionality and introduces mutable global state, which are two things we've been trying to avoid throughout all the story of programming.

As an example:

var foo = promise.case('foo').then(baz)
var baz = doSomething(foo)
// now `foo` is not just a value, it has state, and state is evil,
// and breaks compositionality, thus you can't pass
// it around as easily as you would be able to
// if your promises are pure, sweet and simple values.

Not really.

1. Promises already have states. 2) And having the (secret hidden helper) state of the promise defined by the previous `case` is the _definition_ of compositionality. 3) These states are not global.

var foo = promise.then(baz)
var baz = doSomething(foo)
// Same difference. The biggest showstoppers are the unknown functions `baz()` and `doSomething()`.

As for the consequence of the missing `esac` statement - the unexpected effect this has on consecutive `then` statements is not weirder than executing `onFulfilled` callbacks after `onRejected` when the promise clearly cannot have the value expected by `onFulfilled`.

I can best illustrate this by showing you the module when it's ready. The first lines before the

* * *

break in my previous (edited) post illustrate the real technical question.

This functionality would really be useful as part of core. It looks like a basic functionality that i run into often.

I often use [these if-switches I hacked together](https://github.com/Redsandro/qtree) based on **killdream** s suggestion. Our lives would be easier if we could create entire case-chains, but I am too stupid to implement those.

I'd love to see these clever guys implement something like this in core, and although I disagree with most arguments against it, **kriskowal** has expressed an understandable wish to keep things simple and focused.

Attach files by dragging & dropping, selecting them, or pasting from the clipboard. (image/gif)

