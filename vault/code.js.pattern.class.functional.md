---
id: 4dcbahdso857bng1oihe4gs
title: Functional
desc: ''
updated: 1633199321435
created: 1633199321435
---
## Javascript's Functional Class Pattern

In Ruby, we think of classes as entities that are capable of producing objects handle just one responsibility. For example, in a blogging application you would have a "Post" class that is responsible for creating posts.

In Javascript, the definition of class is very similar.

**What is a Javascript class?**

Put simply, a class in Javascript is any function that is capable of producing of fleet of similar objects--that is, objects with similar properties.

In Ruby, creating a class is simple, and, unlike many other things in Ruby, there's only one way to do it:

```
class Cylon

 def initialize(number, attitude)
   @number = number #cylons don't have names, they 
   have numbers, it makes them much scarier, trust me. 
   @attitude = attitude
 end

 def human_disguise(human_name)
   @human_name = human_name
 end

end
```

The Cylon class is responsible for making new super-intelligent and human-like robots and each robot that it makes will share properties with it's siblings. (That's right, we're back in Battlestar Gallactica land, sorry guys).

In Javascript, there are several ways that you can produce similar objects. Let's take a look at a few before we dive into the functional class pattern.

**Delegation**

In order to write re-usable code and keep our code DRY, it can be necessary to create Javascript objects that share properties.

For example, if you have trying to take over the world (or save it? The end of BSG always really confused me), you need to produce a lot of Cylons. These Cylons need to share at least some of their properties--for example, they must all want to take over the world.

Let's take a look at using delegation to achieve this aim.

The code below creates a variable `cylon` and sets in equal to an object with the properties we need.

```
var numberEleven = {species: "Cylon", attitude: "subdued"} 
```

Now, if we want to create more Cylons, we can use delegation:

```
var numberEight = Object.create(numberEleven)
```

The object stored in the variable `numberEight` now has all of the properties associated with the object stored in the variable `numberEleven`.

This means that when we call `numberEight.species`, the lookup for that value is delegated to `numberEleven`. This delegation is ongoing and it is preformed in real-time, whenever the code is run and that particular line is read.

You can still interact with the `numberEight` object in the same way you would interact with any other object. That is to say that we can give `numberEight` its very own properties. For example:

`numberEight.humanName = "Sharon"`

Now, `console.log(numberEight.humanName)` will output "Sharon" without having to delegate that lookup to the `numberEleven` object.

**Object Decorator Pattern**

So far, we've used delegation to create Javascript objects that share properties. What if we need to have similar objects that have similar functionalities or methods?

For example, all Cylons need to share the ability to lie about the fact that they are Cylons.

In other words, `lie(numberEight)` should output "I'm not a Cylon! I'm a human!" The same should be true of the object stored in `numberEleven`.

Keeping out code DRY, we don't want to define _both_ objects with the same functionality--that would cause us to repeat ourselves every time we create a new Cylon.

Let's abstract out the `lie` functionality:

```
var lie = function(cylon){
      cylon.attitude = "aggressive";
      console.log("I'm not a Cylon! I'm a human!");
}
```

So far, we have a very basic example of a cylon object, one method of producing additional cylons(delegation), and one function that handles cylon objects and adds stuff to them.

There are a few reasons that we're not very happy with our code as it currently stands.

Right now, in order to invoke the `lie` function, we need to pass it an argument of a cylon object. What if we wanted to call `.lie` on a cylon ojbect? In other words, what if we want each Cylon to come with the ability to `lie` right out of the box? That's not possible with our code right now.

Additionally, as our program grows and becomes more complex and as the Cylons come closer and closer to destroying Earth, we may want to be creating Cylon objects that have more complex functionality and additional properties. Our earlier delegation--`var numberEight = Object.create(numberEleven)`--just won't cut it anymore.

Let's step it up a little:

```
var cylonLike = function(obj, number, attitude)

    obj.number = number;
    obj.attitude = attitude;
    return obj;
}
```

Ta-da! We have our very first **decorator**. The `cylonLike` function's job is to take in an object and augment it with the properties needed to be considered a Cylon.

When a function takes in an object and augments that object with additional properties or functionality, that function is considered a **decorator**.

Let's use our decorator to create a new Cylon object with all the attributes that a Cylon needs:

`var numberSeven = cylonLike({}, 7, "subdued")`

We invoke the `cylonLike` function, pass it an empty object, a number and an attitude. Then, `cylonLike` goes to work on that object in the manner defined above.

Decorators are not limited to adding properties to an object. They can also add functionality, i.e. methods.

Our previously defined `lie` function can be added to the `cylonLike` decorator so that all cylon objects passed through our decorator function can have the ability to invoke the lie function and escape human detection to carry out their evil plan.

```
var cylonLike = function(obj, number, attitude)

    obj.number = number;
    obj.attitude = attitude;
    obj.lie = lie;
    return obj;

}
```

We _almost_ have the ability to call `.lie` on a Cylon object. We need to refactor our `lie` function to that it no longer needs to take in an object, but is instead called on one:

```
var lie = function(){
      this.attitude = "aggressive";
      console.log("I'm not a Cylon! I'm a human!");
}
```

This example was simple, and we found ourselves passing an empty object into the `cylonLike` decorator function. Decorator functions are usually used to add some property/functionality to an object that already has properties attached to it.

**The Functional Class Pattern**

Earlier, we defined a class as any function capable of producing a fleet of similar objects. Our decorator function above certainly has that capability. However, we still wouldn't consider that to be a class in the commonly used sense of the term. **A class builds the object its going to augment, while a decorator accepts the object it will augment as an argument.**

Since the objects we decorated above were empty, let's just ask our `cylonLike` function to build Cylons for us in the first place:

```
var Cylon = function(number, attitude){

  var obj = {number: number, attitude: attitude};
  obj.lie = lie;
  return obj;

}
```

And there we have our very first class! The functions that produce our similar objects are called _constructor functions_.

When the constructor function is invoked, it creates an _instance_ of our `Cylon` class:

`var numberThirteen = Cylon(13, "subdued")`

But, what if I want to _add_ methods to instances of the `Cylon` class? Or, what if I in fact _don't_ need _all_ of my Cylons to have the ability to lie? Remember when Sharon didn't even _know_ she was a Cylon? How could she lie about it then? Enter **prototyping.**

**Prototyping**

We already know that any object can be made to delegate its failed property lookups to another object. Currently, however, we're in a bind. If we leave our constructor in its current state, we are aren't being DRY--we're allowing the `lie` method to be read and stored at run-time, every time we make a new Cylon. We only want that to happen when the `lie` method is actually invoked. But, if we take the `lie` method, any other methods, out of the constructor, how can we give our Cylon instances access to it?

We can use the **prototype object** to store shared methods. If we refactor our constructor code slightly, we can give all instances of the Cylon class the ability to delegate failed lookups to methods stored in that object.

First, let's create our prototype object:

```
Cylon.prototype.lie = function(){
  this.attitude = "aggressive";
  console.log("I'm not a Cylon! I'm a human!");
}
```

Now, let's refactor our Cylon constructor:

```
var Cylon = function(number, attitude){

  var obj = Object.create(Cylon.prototype);
  obj.number = number;
  obj.attitude = attitude
  return obj;

}
```

Now, each instance of the `Cylon` class is able to have `.lie()` called on it but the compiler won't read and store that function until it is called by an instance of `Cylon`.

That's all for now! This has been a brief intro to object orientation in Javascript (and Battlestar Gallactica).

