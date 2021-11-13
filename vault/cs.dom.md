---
id: hVhNWp9d0sQ4VV6Ohn6qB
title: Dom
desc: ''
updated: 1633199319600
created: 1633199319600
stub: true
---
[« Previous](https://developer.mozilla.org/en-US/docs/XUL_Tutorial/Broadcasters_and_Observers)[Next »](https://developer.mozilla.org/en-US/docs/XUL_Tutorial/Modifying_a_XUL_Interface)

The Document Object Model (DOM) can be used with XUL elements to get information about them or modify them.

### DOM Introduction[(image/svg)Section](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Tutorial/Document_Object_Model#DOM_Introduction)

The [Document Object Model](https://developer.mozilla.org/en/DOM) (DOM) is used to store the tree of XUL nodes. When an XUL file is loaded, the tags are parsed and converted into a hierarchical document structure of nodes, one for each tag and block of text. The DOM structure may be examined and modified using various methods provided for this purpose. Specific XUL elements also provide additional functions which may be used.

Each XUL file that is loaded will have its own document displayed in a window or frame. Although there is only ever one document associated with a window at a time, you may load additional documents using various methods.

In Mozilla, the [DOM](https://developer.mozilla.org/en/DOM) may be accessed and manipulated using [JavaScript](https://developer.mozilla.org/en/JavaScript). The various DOM objects have functions which may be accessed in script, however, it is important to note that the DOM is an API that is accessible by JavaScript. JavaScript itself is just a scripting language that can access these objects because Mozilla provides these objects for use.

In [JavaScript](https://developer.mozilla.org/en/JavaScript), there is always a single global object that is always available. You can refer to the properties and methods of the global object without having to qualify them with an object. For example, if the global object has a 'name' property, you can change the name with the code 'name = 7', without having to specify any object to use. In a browser context, the window is the global object, and the same is also true for XUL. Naturally, this global object will be different for each window. Each frame will also have a separate window object.

The window is often referred to using the [`window` property](https://developer.mozilla.org/en/DOM/window.window), although this is optional. Sometimes, this is done just to clarify the scope of the method you are referring to. For example, the following two lines which open a new window are functionally equivalent:

```
window.open("test.xul","_new");
open("test.xul","_new");12
```

When you declare a function or a variable at the top level of a script, that is outside another function, you are actually declaring a property of the global object. In XUL, each function you declare will be set as a property of the window object. For example, the following code will display the text 'Message' in an [alert](https://developer.mozilla.org/en/DOM/window.alert) twice.

```
function getText(){
  return "Message";
}

alert(getText());
alert(window.getText());123456
```

Thus, if you want to access variables or call a function declared in a script used by another window, you just need to access it using the other window's `[window](https://developer.mozilla.org/en/DOM/window)` object. For example, if we combined the last two examples into a single file, we might want to call the getText() function from within the other window (for example, the test.xul window). To do this, we can do the following:

```
alert(window.opener.getText());1
```

Each window has an `[opener](https://developer.mozilla.org/en/DOM/window.opener)` property which holds the window object that opened this one. In this example, we retrieve the opener window and call the getText() function declared in a script used there. Note that we qualified the property with the 'window' identifier just to be clearer.

The window's `[open()](https://developer.mozilla.org/en/DOM/window.open)` method also returns a reference to the new window so you can call functions of the new window from the `[opener](https://developer.mozilla.org/en/DOM/window.opener)`. It is important to note, however, that the `[open()](https://developer.mozilla.org/en/DOM/window.open)` method returns before the window has fully loaded, so functions will not typically be available yet.

The window object isn't defined by any DOM specification, but in Mozilla is sometimes considered part of [DOM Level 0](https://developer.mozilla.org/Special:Tags?tag=DOM_0&language=en), a name used by some developers to refer to the DOM-like functions before they were added to specifications. The actual document displayed in a window can be retrieved using the window's `[document](https://developer.mozilla.org/en/DOM/window.document)` property. Since it is one of the most commonly referenced properties of the window, the `[document](https://developer.mozilla.org/en/DOM/window.document)` property is usually referenced without the 'window.' qualifier.

Mozilla provides several different document objects depending on the kind of document. The three main documents are [HTMLDocument](http://www.xulplanet.com/references/objref/HTMLDocument.html), [XMLDocument](http://www.xulplanet.com/references/objref/XMLDocument.html), and [XULDocument](http://www.xulplanet.com/references/objref/XULDocument.html), for [HTML](https://developer.mozilla.org/en/HTML), [XML](https://developer.mozilla.org/en/XML) and [XUL](https://developer.mozilla.org/en/XUL) documents respectively. Obviously, it is this latter type of document used for XUL. The three document types are very similar, in fact they all share the same base implementation. However, there are a few functions that are specific to one document type or the other.

### Retrieving Elements[(image/svg)Section](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Tutorial/Document_Object_Model#Retrieving_Elements)

The most common method to retrieve an element in a document is to give the element an `[id](https://developer.mozilla.org/en/DOM/element.id)` attribute and the use the document's `[getElementById()](https://developer.mozilla.org/en/DOM/document.getElementById)` method. We've added the `id` attribute to a number of elements in the find file dialog. For example, we could get the state of a check box by using the code below:

```
var state = document.getElementById('casecheck').checked;1
```

The value `casecheck` corresponds to the `id` of the case sensitive [checkbox](https://developer.mozilla.org/en/XUL_Tutorial/Input_Controls#Checkboxes_and_Radio_Buttons). Once we have an indication of whether it is checked or not, we can use the state to perform the search. We could do something similar for the other check box, or any other element that has an `id`. We'll need to get the text in the input field for example.

#### Our find files example

It doesn't make sense to have the [progress bar](https://developer.mozilla.org/en/XUL_Tutorial/Progress_Meters) and the dummy [tree data](https://developer.mozilla.org/en/XUL_Tutorial/Trees) displayed when the find files dialog is first displayed. These were added so that we could see them. Let's take them out now and have them displayed when the Find button is pressed. First, we need to make them initially invisible. The `` `[hidden](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/hidden)` `` attribute is used to control whether an element is visible or not.

We'll change the progress meter so that its initially hidden. Also, we'll add an `` `[id](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/id)` `` attribute so that we can refer to it in a script to show and hide it. While we're at it, let's also hide the [splitter](https://developer.mozilla.org/en/XUL_Tutorial/Splitters) and results tree as we only need to show them after a search is performed.

```
<tree id="results" hidden="true" flex="1">
  .
  .
  .
<splitter id="splitbar" resizeafter="grow" hidden="true"/>

<hbox>

  <progressmeter id="progmeter" value="50%"
    style="margin: 4px;" hidden="true"/>12345678910
```

We've added the `` `[hidden](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/hidden)` `` attribute and set the value to `true`. This causes the element to be hidden when it first appears.

Next, let's add a function that is called when the Find button is pressed. We'll put scripts in a separate file findfile.js. In the [last section](https://developer.mozilla.org/en/XUL_Tutorial/Adding_Event_Handlers), we added the `` `[script](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/script)` `` element in the XUL file. If you haven't done this, do that now, as shown below. An `` `[oncommand](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/oncommand)` `` handler will also be added to the Find button.

```
<script src="findfile.js"/>
  .
  .
  .
<button id="find-button" label="Find"
   oncommand="doFind();"/>123456
```

Now, create another file called findfile.js in the same directory as findfile.xul. We'll add the doFind() function is this file. The script tag does allow code to be contained directly inside of it. However, for various reasons, including better performance, you should always put scripts in separate files, except for short fragments which can be put directly in the event handler.

```
function doFind(){
  var meter = document.getElementById('progmeter');
  meter.hidden = false;
}1234
```

This function first gets a reference to the progress meter using its id, `progmeter`. The second line of the function body changes the hidden state so that the element is visible again.

Finally, let's have an alert box pop up that displays what will be searched for. Of course, we wouldn't want this in the final version but we'll add it to reassure us that something would happen.

```
function doFind(){
  var meter=document.getElementById('progmeter');
  meter.hidden = false;
  var searchtext=document.getElementById('find-text').value;
  alert("Searching for \"" + searchtext + "\"");
}123456
```

Now, with that alert box in there, we know what should happen when we click the Find button. We could add additional code to get the selections from the drop-down boxes too.

### XUL Element DOM[(image/svg)Section](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Tutorial/Document_Object_Model#XUL_Element_DOM)

Every XUL element has a set of attributes, a set of properties and a set of children.

* The attributes are declared in the source, for example, flex="1", is a `` `[flex](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/flex)` `` attribute set to the value `1`.
* Properties are available in JavaScript using the dot syntax. For example, element.hidden refers to the hidden property of an element.
* The children are the child tags of the element and will be nested inside the element in the source.

It is possible to manipulate the attributes, properties and children of an element dynamically using DOM methods.

It is important to note that attributes and properties are separate things. Just because there is an attribute with a given name does not mean that there is a corresponding property with the same name. However, it will often be the case that such a property will exist. For example, to get the flex of an element, you can use the flex property. In this case, the underlying code just returns the value of the attribute. For other properties, XUL will perform more complex calculations.

You can manipulate the attributes of an element using any of the following methods:

[getAttribute](https://developer.mozilla.org/en/DOM/element.getAttribute) ( name )

Return the value of the attribute with the given name.

[hasAttribute](https://developer.mozilla.org/en/DOM/element.hasAttribute) ( name )

Return true if the attribute with the given name has a value.

[setAttribute](https://developer.mozilla.org/en/DOM/element.setAttribute) ( name , value )

Set the value of the attribute with the given name to the given value.

[removeAttribute](https://developer.mozilla.org/en/DOM/element.removeAttribute) ( name )

Remove the attribute with the given name.

These functions allow you to get and change the value of an attribute at any time. For example, to use the value of the flex attribute, you might use code like the following:

```
var box = document.getElementById('somebox');
 var flex = box.getAttribute("flex");

 var box2 = document.getElementById('anotherbox');
 box2.setAttribute("flex", "2");12345
```

However, the `` `[flex](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/flex)` `` attribute has a [corresponding script property](https://developer.mozilla.org/en/XUL/Property/flex) which can be used instead. It isn't any more efficient, but it does mean slightly less typing. The following example accomplishes the same as above using the flex property instead.

```
var box = document.getElementById('somebox');
 var flex = box.flex;

 var box2 = document.getElementById('anotherbox');
 box2.flex = 2;12345
```

Once you have a reference to an element, you can call the properties of that element. For example, to get the `` `[hidden](https://developer.mozilla.org/en-US/docs/XUL/Property/hidden)` `` property for an element, you can use the syntax `*element*.hidden` where 'element' is a reference to the element. You might note that most of the properties listed in the reference correlate to common attributes on elements. There are differences, of course, for example, while **getAttribute("hidden") will return the string 'true'** for a hidden element, whereas the hidden **property returns a boolean true value**. In this case, the type conversion is done for you so the property is more convenient.

As with each document, there is a different element object for XUL elements as for [HTML](https://developer.mozilla.org/en/HTML) and [XML](https://developer.mozilla.org/en/XML) elements. Every XUL element implements the [XULElement](http://www.xulplanet.com/references/objref/XULElement.html) (reference broken) interface. A XUL element is any element declared with the XUL namespace. So, XUL elements will have that interface even if added to other XML documents, and non-XUL elements will not have that interface. The XULElement interface has a number of properties and methods specific to XUL elements, many inherited from the generic DOM Element interface.

A namespace is a URI which specifies the kind of element. Here are some examples:

```
<button xmlns="http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul"/>
<button xmlns="http://www.w3.org/1999/xhtml"/>
<html:button xmlns:html="http://www.w3.org/1999/xhtml"/>
<html:button xmlns:html="http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul"/>1234
```

Namespaces are specified using the `xmlns` attribute.

* The first button is a XUL element as it has been placed in the XUL namespace.
* The second element is an XHTML element as it has been given the XHTML namespace.
* In the third example, the prefix 'html' is mapped to the namespace 'http://www.w3.org/1999/xhtml'. You can also use the prefix syntax with a colon to use a specific namespace . This is used when you are using several namespaces in a document and you need to be more precise with which namespace is meant. This causes an XHTML button to be created for this case.
* The fourth button is a little confusing, but might clarify that it is the URI that is important and not the prefix. The fourth example is a XUL button, not an HTML button, despite what the prefix might say.

This is an important distinction. In fact, the actual text used for the prefix is irrelevant when determining what kind of element is used.

The DOM provides a number of namespace related functions similar to the non-namespace ones. For example, the `[getAttributeNS()](https://developer.mozilla.org/en/DOM/element.getAttributeNS)` function is similar to the the `[getAttribute()](https://developer.mozilla.org/en/DOM/element.getAttribute)` function except an additional argument may be supplied to specify an attribute in a specific namespace.

Many XUL elements have their own properties that are unique to that element. Refer to the [element reference](https://developer.mozilla.org/en/XUL_Reference) for a full guide to the attributes and properties available for an element.

### Navigating the DOM[(image/svg)Section](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Tutorial/Document_Object_Model#Navigating_the_DOM)

The DOM is a tree structure with a single root node with children. You can get a reference to the root node using the document's `[documentElement](https://developer.mozilla.org/en/DOM/document.documentElement)` property. The root node is always an element, but this is not the case for other nodes in the tree. An element corresponds to a tag is the XUL source, but you may also find text nodes, comment nodes and a few other types in a document tree. In the case of XUL, the root element will be the `` `[window](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/window)` `` tag in the XUL document. Each node in the tree may have children and those children may have child nodes of their own. Since the DOM is a tree structure, you can navigate through the tree using a variety of properties. Some common properties are listed below:

[firstChild](https://developer.mozilla.org/En/DOM/Node.firstChild)

reference to the first child node of an element

[lastChild](https://developer.mozilla.org/En/DOM/Node.lastChild)

reference to the last child node of an element

[childNodes](https://developer.mozilla.org/En/DOM/Node.childNodes)

holds a list of the children of an element

[parentNode](https://developer.mozilla.org/En/DOM/Node.parentNode)

reference to the parent of an node

[nextSibling](https://developer.mozilla.org/En/DOM/Node.nextSibling)

reference to the next sibling in sequence

[previousSibling](https://developer.mozilla.org/En/DOM/Node.previousSibling)

reference to the previous sibling in sequence

These properties allow you to navigate through a document is various ways. For example, you might get the first child of an element using the `[firstChild](https://developer.mozilla.org/En/DOM/Node.firstChild)` property and then navigate through the children using the `[nextSibling](https://developer.mozilla.org/En/DOM/Node.nextSibling)` property. Or, you might accomplish the same thing by iterating through the items in the `[childNodes](https://developer.mozilla.org/En/DOM/Node.childNodes)` list. In Mozilla, the latter method is more efficient.

The following example shows how to iterate over the children of the root node:

```
var childNodes = document.documentElement.childNodes;
for (var i = 0; i < childNodes.length; i++) {
  var child = childNodes[i];
  // do something with child
}12345
```

The `[childNodes](https://developer.mozilla.org/En/DOM/Node.childNodes)` variable will hold the children of the document root element. We then use a for loop to iterate over the children, accessing each item using an array-like notation.

Find files example so far: [Source](https://developer.mozilla.org/samples/xultu/examples/findfile/findfile-dom.xul.txt) [View](https://developer.mozilla.org/samples/xultu/examples/findfile/findfile-dom.xul)

### See also[(image/svg)Section](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Tutorial/Document_Object_Model#See%20also)

* [A re-introduction to JavaScript](https://developer.mozilla.org/en/JavaScript/A_re-introduction_to_JavaScript)
* [JavaScript reference](https://developer.mozilla.org/En/Core_JavaScript_1.5_Reference)

Next we'll learn how to [modify the DOM](https://developer.mozilla.org/en/XUL_Tutorial/Modifying_a_XUL_Interface).

[« Previous](https://developer.mozilla.org/en-US/docs/XUL_Tutorial/Broadcasters_and_Observers)[Next »](https://developer.mozilla.org/en-US/docs/XUL_Tutorial/Modifying_a_XUL_Interface)
