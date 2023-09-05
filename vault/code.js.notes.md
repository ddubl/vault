---
id: i26e5mceptiwmyqvi9d4krm
title: Notes
desc: ''
updated: 1633199321478
created: 1633199321478
---

@(Content)[programming | javascript | npm]

####WebPack2
[Video web pack2](https://www.youtube.com/watch?v=eWmkBNBTbMM): very enlightening: plug out code
 — next topic: flow enabled and config atom.

* Flow
* Content hash
* Cache validation - [invalidation](https://en.wikipedia.org/wiki/Cache_invalidation)
* Lazy loading
* [Ternary Operators JS](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Operators/Conditional_Operator)

###04012017

 ####Teaching:: [ES.next promise not to use promises](https://www.youtube.com/watch?v=H948xd7n6k0)

* Empathy gap - ![subset of knowledge that you remember to have learned recently and still remember the pain of doing so, thus enabling you to feel with the teached]

####mobX - es7 observers

####es6Classes

Syntactic sugar on prototypes: inheritance || prototype: object property
 To create objects we use functions to create constructors for our objects. It is the convention to capitalize functions that are object constructors. Any other functions that are not constructors should start lower case.

```
// ES5 adding a method to the Person prototype
Person.prototype.walk = function() {
  console.log(this.name + ' is walking.');
}

var bob = new Person('Bob');
bob.walk(); // Outputs 'Bob is walking.'
```

ES6 offers us a much more terse and clean syntax to achieve the same goal.

```

// ES6 Class adding a method to the Person prototype
class Person {
    constructor(name) {
        this.name = name;
    }

    walk() {
        console.log(this.name + ' is walking.');
    }
}

let bob = new Person('Bob');
console.log(bob.name);  // Outputs 'Bob is walking’
```

Difference: constructor method on class reserved & run on initialisation.

ES6 set/get with ES6classes

```
// ES6 get and set
class Person {
    constructor(name) {
        this._name = name;
    }

    get name() {
        return this._name.toUpperCase();
    }

    set name(newName) {
        this._name = newName;   // validation could be checked here such as only allowing non numerical values
    }

    walk() {
        console.log(this._name + ' is walking.');
    }
}

let bob = new Person('Bob');
console.log(bob.name);  // Outputs 'BOB'
```

In our class above we have a getter and setter for our name property. We use ‘_’ convention to create a backing field to store our name property. With out this every time get or set is called it would cause a stack overflow. The get would be called and which would cause the get to be called again over and over causing a infinite loop.

Something to note is that our backing field `this._name` is not private. Someone could still access `bob._name` and retrieve the property. To achieve private state on objects you would use ES6 `symbol` and `module` to create true encapsulation and private state. Private methods can be created using `module` or traditional closures using an IIFE. Private properties and functions using symbols and modules will be covered in a follow up post.

— basically double up on the name parameter and only call the one created by the constructed instance, not the constructor method. @privateState[how to encapsulate]

### Using a computed property name

**Note:** Computed properties are experimental technology*,* part of the ECMAScript 6 proposal, and are not widely supported by browsers yet. This will trigger a syntax error in non-supporting environments.

```
var expr = "foo";

var obj = {
  get [expr]() { return "bar"; }
};

console.log(obj.foo); // "bar"
```

### Smart / self-overwriting / lazy getters

Getters give you a way to define a property of an object, but they do not calculate the property's value until it is accessed. A getter defers the cost of calculating the value until the value is needed, and if it is never needed, you never pay the cost.

An additional optimization technique to lazify or delay the calculation of a property value and cache it for later access are **smart or [memoized](https://en.wikipedia.org/wiki/Memoization) getters**. The value is calculated the first time the getter is called, and is then cached so subsequent accesses return the cached value without recalculating it. This is useful in the following situations:

* If the calculation of a property value is expensive (takes much RAM or CPU time, spawns worker thread, retrieves remote file, etc).
* If the value isn't needed just now. It will be used later, or in some case it's not used at all.
* If it's used, it will be accessed several times, and there is no need to re-calculate that value will never be changed, or shouldn't be re-calculated.

Get/set are used for code encapsulation; yet it doesn’t seem to provide that feature.
(image/png)

### The Decorator Pattern

Babel —optional es7.decorators

What the heck are decorators anyway? Well, in Python, decorators provide a very simple syntax for calling [higher-order](https://en.wikipedia.org/wiki/Higher-order_function) functions. A Python decorator is a function that takes another function, extending the behavior of the latter function without explicitly modifying it. The [simplest](http://www.saltycrane.com/blog/2010/03/simple-python-decorator-examples/) decorator in Python could look like this:

(image/png)Decorators are helpful for anything you want to transparently wrap with extra functionality. These include memoization, enforcing access control and authentication,
 instrumentation and timing functions, logging, rate-limiting, and the list goes on.

Object Decorator logic:

Now, before installing the descriptor onto `Cat.prototype`, the engine first invokes the decorator:

(image/png)
(image/png)

#####Decorating a class

Next let’s look at decorating classes. In this case, per the proposed specification, a decorator takes the target constructor. For a fictional `MySuperHero` class, we can define a simple decorator for it as follows using a `@superhero` decoration:

...

####npm
#####scripts
