---
id: ommxme51rsjp6lk4p3796e0
title: scopeResolution
desc: ''
updated: 1661861749103
created: 1661861749103
---
id: TXmJvsVlSeJiBlmEIxqVV
title: scopeResolution
desc: ''
updated: 1633199319552

## created: 1633199319552

12%3A Debugging a Program With dbx)

## C++ Double Colon Scope Resolution Operator

Use the double colon operator (::) to qualify a C++ member function, a top level function, or a variable with global scope with:

- An overloaded name (same name used with different argument types)
    
- An ambiguous name (same name used in different classes)
    

You might want to qualify an overloaded function name. If you do not qualify it, dbx displays an overload list so you can choose which function you will navigate. If you know the function class name, you can use it with the double colon scope resolution operator to qualify the name.

(dbx) **func** class**::**function_name (args)

For example, if hand is the class name and draw is the function name, type:

(dbx) **func** **hand::draw**

Measure
Measure

