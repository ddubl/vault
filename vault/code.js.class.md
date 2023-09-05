---
id: fl0c4k3ac8gh7fdnxbza6sk
title: Class
desc: ''
updated: 1633199319628
created: 1633199319628
---

Declaring a class creates a function object that is the constructor for the class, using the code provided for constructor within the class body, and for named classes, with the same name as the class.
The class constructor function has a normal prototype object from which class instances inherit properties in normal JavaScript fashion. Instance methods defined within the class body are added to this prototype.
ES6 does not provide a means to declare class instance default property values (i.e. values which are not methods) within the class body to be stored on the prototype and inherited. To initialize instance value you can either set them as local, non inherited properties within the constructor, or manually add them to the class constructor's prototype object outside the class definition in the same fashion as for ordinary constructor functions. (I am not arguing the merits or otherwise of setting up inherited properties for JavaScript classes).
Static methods declared within the class body are added as properties of the class constructor function. Avoid using static class method names that compete with standard function properties and methods inherited from Function.prototype such as call, apply or length.
Less sugary is that class declarations and methods are always executed in strict mode, and a feature that gets little attention: the .prototype property of class constructor functions is read only: you can't set it to some other object you've created for some special purpose.
Some interesting stuff happens when you extend a class:
* the prototype object property of the extended class constructor is automatically prototyped on the prototype object of the class being extended. This is not particularly new and the effect can be duplicated using Object.create.
* the extended class constructor function (object) is automatically prototyped on the constructor function of the class being extended, not Function. While it may be possible to replicate the effect on an ordinary constructor function using Object.setPrototypeOf or even childClass.__proto__ = parentClass, this would be an extremely unusual coding practice and is often advised against in JavaScript documentation.
There are other differences such as class objects not being hoisted in the manner of named functions declared using the function keyword.
I believe it could be naive to think that Class declarations and expressions will remain unaltered in all future versions of ECMA Script and it will be interesting to see if and when developments occur. Arguably it has become a fad to associate "syntactical sugar" with classes introduced in ES6 (ECMA-262 standard version 6) but personally I try to avoid repeating it.
