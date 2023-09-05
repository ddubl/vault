---
id: vedufg97aj5kyb5bedea7zn
title: Destructuring
desc: ''
updated: 1633199319593
created: 1633199319593
---
## Destructuring assignment

The **destructuring assignment** syntax is a JavaScript expression that makes it possible to unpack values from arrays, or properties from objects, into distinct variables.

## Syntax

```
var a, b, rest;
[a, b] = [10, 20];
console.log(a); // 10
console.log(b); // 20

[a, b, ...rest] = [10, 20, 30, 40, 50];
console.log(a); // 10
console.log(b); // 20
console.log(rest); // [30, 40, 50]

({a, b} = {a: 10, b: 20});
console.log(a); // 10
console.log(b); // 20

// Stage 3 proposal
({a, b, ...rest} = {a: 10, b: 20, c: 30, d: 40});
```

## Description

The object and array literal expressions provide an easy way to create _ad hoc_ packages of data.

```
var x = [1, 2, 3, 4, 5];
```

The destructuring assignment uses similar syntax, but on the left-hand side of the assignment to define what values to unpack from the sourced variable.

```
var x = [1, 2, 3, 4, 5];
var [y, z] = x;
console.log(y); // 1
console.log(z); // 2
```

This capability is similar to features present in languages such as Perl and Python.

## Array destructuring

### Basic variable assignment

```
var foo = ['one', 'two', 'three'];

var [one, two, three] = foo;
console.log(one); // "one"
console.log(two); // "two"
console.log(three); // "three"
```

### Assignment separate from declaration

A variable can be assigned its value via destructuring separate from the variable's declaration.

```
var a, b;

[a, b] = [1, 2];
console.log(a); // 1
console.log(b); // 2
```

### Default values

A variable can be assigned a default, in the case that the value unpacked from the array is `undefined`.

```
var a, b;

[a=5, b=7] = [1];
console.log(a); // 1
console.log(b); // 7
```

### Swapping variables

Two variables values can be swapped in one destructuring expression.

Without destructuring assignment, swapping two values requires a temporary variable (or, in some low-level languages, the [XOR-swap trick](https://en.wikipedia.org/wiki/XOR_swap_algorithm)).

```
var a = 1;
var b = 3;

[a, b] = [b, a];
console.log(a); // 3
console.log(b); // 1
```

### Parsing an array returned from a function

It's always been possible to return an array from a function. Destructuring can make working with an array return value more concise.

In this example, `f()` returns the values `[1, 2]` as its output, which can be parsed in a single line with destructuring.

```
function f() {
  return [1, 2];
}

var a, b;
[a, b] = f();
console.log(a); // 1
console.log(b); // 2
```

### Ignoring some returned values

You can ignore return values that you're not interested in:

```
function f() {
  return [1, 2, 3];
}

var [a, , b] = f();
console.log(a); // 1
console.log(b); // 3
```

You can also ignore all returned values:

```
[,,] = f();
```

### Assigning the rest of an array to a variable

When destructuring an array, you can unpack and assign the remaining part of it to a variable using the rest pattern:

```
var [a, ...b] = [1, 2, 3];
console.log(a); // 1
console.log(b); // [2, 3]
```

Note that a [`SyntaxError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError) will be thrown if a trailing comma is used on the left-hand side with a rest element:

```
var [a, ...b,] = [1, 2, 3];
// SyntaxError: rest element may not have a trailing comma
```

### Unpacking values from a regular expression match

When the regular expression `[exec()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec)` method finds a match, it returns an array containing first the entire matched portion of the string and then the portions of the string that matched each parenthesized group in the regular expression. Destructuring assignment allows you to unpack the parts out of this array easily, ignoring the full match if it is not needed.

```
var url = 'https://developer.mozilla.org/en-US/Web/JavaScript';

var parsedURL = /^(\w+)\:\/\/([^\/]+)\/(.*)$/.exec(url);
console.log(parsedURL); // ["https://developer.mozilla.org/en-US/Web/JavaScript", "https", "developer.mozilla.org", "en-US/Web/JavaScript"]

var [, protocol, fullhost, fullpath] = parsedURL;

console.log(protocol); // "https"
```

## Object destructuring

### Basic assignment

```
var o = {p: 42, q: true};
var {p, q} = o;

console.log(p); // 42
console.log(q); // true
```

### Assignment without declaration

A variable can be assigned its value with destructuring separate from its declaration.

```
var a, b;

({a, b} = {a: 1, b: 2});
```

The `( .. )` around the assignment statement is required syntax when using object literal destructuring assignment without a declaration.

`{a, b} = {a: 1, b: 2}` is not valid stand-alone syntax, as the `{a, b}` on the left-hand side is considered a block and not an object literal.

However, `({a, b} = {a: 1, b: 2})` is valid, as is `var {a, b} = {a: 1, b: 2}`

`NOTE: Your ( ..) expression needs to be preceded by a semicolon or it may be used to execute a function on the previous line.`

### Assigning to new variable names

A property can be unpacked from an object and assigned to a variable with a different name than the object property.

```
var o = {p: 42, q: true};
var {p: foo, q: bar} = o;

console.log(foo); // 42
console.log(bar); // true
```

### Default values

A variable can be assigned a default, in the case that the value unpacked from the object is `undefined`.

```
var {a = 10, b = 5} = {a: 3};

console.log(a); // 3
console.log(b); // 5
```

### Assigning to new variables names and providing default values

A property can be both 1) unpacked from an object and assigned to a variable with a different name and 2) assigned a default value in case the unpacked value is `undefined`.

```
var {a:aa = 10, b:bb = 5} = {a: 3};

console.log(aa); // 3
console.log(bb); // 5
```

### Setting a function parameter's default value

#### ES5 version

```
function drawES5Chart(options) {
  options = options === undefined ? {} : options;
  var size = options.size === undefined ? 'big' : options.size;
  var cords = options.cords === undefined ? {x: 0, y: 0} : options.cords;
  var radius = options.radius === undefined ? 25 : options.radius;
  console.log(size, cords, radius);
  // now finally do some chart drawing
}

drawES5Chart({
  cords: {x: 18, y: 30},
  radius: 30
});
```

#### ES2015 version

```
function drawES2015Chart({size = 'big', cords = {x: 0, y: 0}, radius = 25} = {}) {
  console.log(size, cords, radius);
  // do some chart drawing
}

drawES2015Chart({
  cords: {x: 18, y: 30},
  radius: 30
});
```

In the function signature for **`drawES2015Chart`** above, the destructured left-hand side is assigned to an empty object literal on the right-hand side: `{size = 'big', cords = {x: 0, y: 0}, radius = 25} = {}`. You could have also written the function without the right-hand side assignment. However, if you leave out the right-hand side assignment, the function will look for at least one argument to be supplied when invoked, whereas in its current form, you can simply call `**drawES2015Chart()**` without supplying any parameters. The current design if useful if you want to be able to call the function without supplying any parameters, the other can be useful when you want to ensure an object is passed to the function.

### Nested object and array destructuring

```
var metadata = {
    title: 'Scratchpad',
    translations: [
       {
        locale: 'de',
        localization_tags: [],
        last_edit: '2014-04-14T08:43:37',
        url: '/de/docs/Tools/Scratchpad',
        title: 'JavaScript-Umgebung'
       }
    ],
    url: '/en-US/docs/Tools/Scratchpad'
};

var {title: englishTitle, translations: [{title: localeTitle}]} = metadata;

console.log(englishTitle); // "Scratchpad"
console.log(localeTitle);  // "JavaScript-Umgebung"
```

### For of iteration and destructuring

```
var people = [
  {
    name: 'Mike Smith',
    family: {
      mother: 'Jane Smith',
      father: 'Harry Smith',
      sister: 'Samantha Smith'
    },
    age: 35
  },
  {
    name: 'Tom Jones',
    family: {
      mother: 'Norah Jones',
      father: 'Richard Jones',
      brother: 'Howard Jones'
    },
    age: 25
  }
];

for (var {name: n, family: {father: f}} of people) {
  console.log('Name: ' + n + ', Father: ' + f);
}

// "Name: Mike Smith, Father: Harry Smith"
// "Name: Tom Jones, Father: Richard Jones"
```

### Unpacking fields from objects passed as function parameter

```
function userId({id}) {
  return id;
}

function whois({displayName, fullName: {firstName: name}}) {
  console.log(displayName + ' is ' + name);
}

var user = {
  id: 42,
  displayName: 'jdoe',
  fullName: {
      firstName: 'John',
      lastName: 'Doe'
  }
};

console.log('userId: ' + userId(user)); // "userId: 42"
whois(user); // "jdoe is John"
```

This unpacks the `id`, `displayName` and `firstName` from the user object and prints them.

### Computed object property names and destructuring

Computed property names, like on [object literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#Computed_property_names), can be used with destructuring.

```
let key = 'z';
let {[key]: foo} = {z: 'bar'};

console.log(foo); // "bar"
```

### Rest in Object Destructuring

The [Rest/Spread Properties for ECMAScript](https://github.com/tc39/proposal-object-rest-spread) proposal (stage 3) adds the [rest](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) syntax to destructuring. Rest properties collect the remaining own enumerable property keys that are not already picked off by the destructuring pattern.

```
let {a, b, ...rest} = {a: 10, b: 20, c: 30, d: 40}
a; // 10
b; // 20
rest; // { c: 30, d: 40 }
```

### Invalid JavaScript identifier as a property name

Destructuring can be used with property names that are not valid JavaScript [identifiers](https://developer.mozilla.org/en-US/docs/Glossary/Identifier) by providing an alternative identifer that is valid.

```
const foo = { 'fizz-buzz': true };
const { 'fizz-buzz': fizzBuzz } = foo;

console.log(fizzBuzz); // "true"
```

## Specifications

## Browser compatibility

- Desktop
- Mobile

Feature

Chrome

Edge

Firefox (Gecko)

Internet Explorer

Opera

Safari

Basic support

49.0

14

[2.0](https://developer.mozilla.org/en-US/Firefox/Releases/2) (1.8.1)

No support

(Yes)

7.1

Computed property names

49.0

14

[34](https://developer.mozilla.org/en-US/Firefox/Releases/34) (34)

No support

(Yes)

No support

Rest in arrays

49.0

12[1]

[34](https://developer.mozilla.org/en-US/Firefox/Releases/34) (34)

?

?

?

Rest in objects

60.0

No support

[55](https://developer.mozilla.org/en-US/Firefox/Releases/55) (55)

No support

No support

No support

[1] Requires "Enable experimental Javascript features" to be enabled under `about:flags`

## Firefox-specific notes

- Firefox provided a non-standard language extension in [JS1.7](https://developer.mozilla.org/en-US/docs/Web/JavaScript/New_in_JavaScript/1.7) for destructuring. This extension has been removed in Gecko 40 (Firefox 40 / Thunderbird 40 / SeaMonkey 2.37). See [bug 1083498](https://bugzilla.mozilla.org/show_bug.cgi?id=1083498).
- Starting with Gecko 41 (Firefox 41 / Thunderbird 41 / SeaMonkey 2.38) and to comply with the ES2015 specification, parenthesized destructuring patterns, like `([a, b]) = [1, 2]` or `({a, b}) = { a: 1, b: 2 }`, are now considered invalid and will throw a [`SyntaxError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError). See [Jeff Walden's blog post](http://whereswalden.com/2015/06/20/new-changes-to-make-spidermonkeys-and-firefoxs-parsing-of-destructuring-patterns-more-spec-compliant/) and [bug 1146136](https://bugzilla.mozilla.org/show_bug.cgi?id=1146136) for more details.

## See also

