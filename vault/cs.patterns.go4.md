---
id: oxf38r3mk8sgfl8px5jkm1k
title: Go4
desc: ''
updated: 1633199319654
created: 1633199319654
---
Gang of Four Design Patterns
Design Patterns (image/png)

## Gang of Four Design Patterns

by [Richard Carr](https://profiles.google.com/113882985360066691734), published at <http://www.blackwasp.co.uk/gofpatterns.aspx>

_The Gang of Four are the four authors of the book, "Design Patterns: Elements of Reusable Object-Oriented Software". In this article their twenty-three design patterns are described with links to UML diagrams, source code and real-world examples for each._

## What are Design Patterns?

Design patterns provide solutions to common software design problems. In the case of [object-oriented programming](http://www.blackwasp.co.uk/CSharpObjectOriented.aspx), design patterns are generally aimed at solving the problems of object generation and interaction, rather than the larger scale problems of overall software architecture. They give generalised solutions in the form of templates that may be applied to real-world problems.

Design patterns are a powerful tool for software developers. However, they should not be seen as prescriptive specifications for software. It is more important to understand the concepts that design patterns describe, rather than memorising their exact [classes](http://www.blackwasp.co.uk/CSharpSimpleClass.aspx), [methods](http://www.blackwasp.co.uk/CSharpMethods.aspx) and [properties](http://www.blackwasp.co.uk/CSharpClassProperties.aspx). It is also important to apply patterns appropriately. Using the incorrect pattern for a situation or applying a design pattern to a trivial solution can overcomplicate your code and lead to maintainability issues.

## Who are the Gang of Four?

The _Gang of Four_ are the authors of the book, "[Design Patterns: Elements of Reusable Object-Oriented Software](http://en.wikipedia.org/wiki/Design_Patterns_(book))". This important book describes various development techniques and pitfalls in addition to providing twenty-three object-oriented programming design patterns. The four authors were [Erich Gamma](http://en.wikipedia.org/wiki/Erich_Gamma), [Richard Helm](http://en.wikipedia.org/wiki/Richard_Helm), [Ralph Johnson](http://en.wikipedia.org/wiki/Ralph_Johnson) and [John Vlissides](http://en.wikipedia.org/wiki/John_Vlissides).

## Gang of Four Design Patterns

This section gives a high-level description of the twenty-three design patterns described by the Gang of Four. Each pattern description includes a link to a more detailed article describing the design pattern and including a UML diagram, template source code and a real-world example programmed using [C#](http://www.blackwasp.co.uk/CSharpFundamentals.aspx).

### Creational Patterns

The first type of design pattern is the _creational_ pattern. Creational patterns provide ways to instantiate single objects or groups of related objects. There are five such patterns:

- **[Abstract Factory](http://www.blackwasp.co.uk/AbstractFactory.aspx)**. The abstract factory pattern is used to provide a client with a set of related or dependant objects. The "family" of objects created by the factory are determined at run-time.
- **[Builder](http://www.blackwasp.co.uk/Builder.aspx)**. The builder pattern is used to create complex objects with constituent parts that must be created in the same order or using a specific algorithm. An external class controls the construction algorithm.
- **[Factory Method](http://www.blackwasp.co.uk/FactoryMethod.aspx)**. The factory pattern is used to replace class [constructors](http://www.blackwasp.co.uk/CSharpConstructors.aspx), abstracting the process of object generation so that the type of the object instantiated can be determined at run-time.
- **[Prototype](http://www.blackwasp.co.uk/Prototype.aspx)**. The prototype pattern is used to instantiate a new object by copying all of the properties of an existing object, creating an independent clone. This practise is particularly useful when the construction of a new object is inefficient.
- **[Singleton](http://www.blackwasp.co.uk/Singleton.aspx)**. The singleton pattern ensures that only one object of a particular class is ever created. All further references to objects of the singleton class refer to the same underlying instance.

### Structural Patterns

The second type of design pattern is the _structural_ pattern. Structural patterns provide a manner to define relationships between classes or objects.

- **[Adapter](http://www.blackwasp.co.uk/Adapter.aspx)**. The adapter pattern is used to provide a link between two otherwise incompatible types by wrapping the "adaptee" with a class that supports the interface required by the client.
- **[Bridge](http://www.blackwasp.co.uk/Bridge.aspx)**. The bridge pattern is used to separate the abstract elements of a class from the implementation details, providing the means to replace the implementation details without modifying the abstraction.
- **[Composite](http://www.blackwasp.co.uk/Composite.aspx)**. The composite pattern is used to create hierarchical, recursive tree structures of related objects where any element of the structure may be accessed and utilised in a standard manner.
- **[Decorator](http://www.blackwasp.co.uk/Decorator.aspx)**. The decorator pattern is used to extend or alter the functionality of objects at run-time by wrapping them in an object of a decorator class. This provides a flexible alternative to using [inheritance](http://www.blackwasp.co.uk/Inheritance.aspx) to modify behaviour.
- **[Facade](http://www.blackwasp.co.uk/Facade.aspx)**. The facade pattern is used to define a simplified interface to a more complex subsystem.
- **[Flyweight](http://www.blackwasp.co.uk/Flyweight.aspx)**. The flyweight pattern is used to reduce the memory and resource usage for complex models containing many hundreds, thousands or hundreds of thousands of similar objects.
- **[Proxy](http://www.blackwasp.co.uk/Proxy.aspx)**. The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object. The proxy provides the same public interface as the underlying subject class, adding a level of indirection by accepting requests from a client object and passing these to the real subject object as necessary.

### Behavioural Patterns

The final type of design pattern is the behavioural pattern. Behavioural patterns define manners of communication between classes and objects.

- **[Chain of Responsibility](http://www.blackwasp.co.uk/ChainOfResponsibility.aspx)**. The chain of responsibility pattern is used to process varied requests, each of which may be dealt with by a different handler.
- **[Command](http://www.blackwasp.co.uk/Command.aspx)**. The command pattern is used to express a request, including the call to be made and all of its required [parameters](http://www.blackwasp.co.uk/CSharpMethodParameters.aspx), in a command object. The command may then be executed immediately or held for later use.
- **[Interpreter](http://www.blackwasp.co.uk/Interpreter.aspx)**. The interpreter pattern is used to define the grammar for instructions that form part of a language or notation, whilst allowing the grammar to be easily extended.
- **[Iterator](http://www.blackwasp.co.uk/Iterator.aspx)**. The iterator pattern is used to provide a standard interface for traversing a collection of items in an aggregate object without the need to understand its underlying structure.
- **[Mediator](http://www.blackwasp.co.uk/Mediator.aspx)**. The mediator pattern is used to reduce coupling between classes that communicate with each other. Instead of classes communicating directly, and thus requiring knowledge of their implementation, the classes send messages via a mediator object.
- **[Memento](http://www.blackwasp.co.uk/Memento.aspx)**. The memento pattern is used to capture the current state of an object and store it in such a manner that it can be restored at a later time without breaking the rules of encapsulation.
- **[Observer](http://www.blackwasp.co.uk/Observer.aspx)**. The observer pattern is used to allow an object to publish changes to its state. Other objects subscribe to be immediately notified of any changes.
- [**State**](http://www.blackwasp.co.uk/State.aspx). The state pattern is used to alter the behaviour of an object as its internal state changes. The pattern allows the class for an object to apparently change at run-time.
- **[Strategy](http://www.blackwasp.co.uk/Strategy.aspx)**. The strategy pattern is used to create an interchangeable family of algorithms from which the required process is chosen at run-time.
- **[Template Method](http://www.blackwasp.co.uk/TemplateMethod.aspx)**. The template method pattern is used to define the basic steps of an algorithm and allow the implementation of the individual steps to be changed.
- **[Visitor](http://www.blackwasp.co.uk/Visitor.aspx)**. The visitor pattern is used to separate a relatively complex set of structured data classes from the functionality that may be performed upon the data that they hold.

_For a quick reference to the design patterns featured in this article, see the [Gang of Four Design Patterns Reference Sheet](http://www.blackwasp.co.uk/GangOfFour.aspx)._

22 August 2009

