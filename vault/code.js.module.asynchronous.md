---
id: 8v5nu8xqlb448jh59m450l4
title: Asynchronous
desc: ''
updated: 1633199319506
created: 1633199319506
---
## Asynchronous module definition

From Wikipedia, the free encyclopedia
Jump to: [navigation](https://en.wikipedia.org/wiki/Asynchronous_module_definition#mw-head), [search](https://en.wikipedia.org/wiki/Asynchronous_module_definition#p-search)
[(image/png)](https://en.wikipedia.org/wiki/File:Asynchronous_Module_Definition_overview_vector.svg)[](https://en.wikipedia.org/wiki/File:Asynchronous_Module_Definition_overview_vector.svg)Instead of loading files one after the other, AMD can load them all separately, even when they are dependent on each other.

**Asynchronous module definition** (**AMD**) is a [specification](https://en.wikipedia.org/wiki/Specification_(technical_standard)) for the programming language [JavaScript](https://en.wikipedia.org/wiki/JavaScript). It defines an [application programming interface](https://en.wikipedia.org/wiki/Application_programming_interface) (API) that defines code modules and their [dependencies](https://en.wikipedia.org/wiki/Coupling_(computer_programming)), and loads them asynchronously if desired. Implementations of AMD provide the following benefits:

- Website performance improvements. AMD implementations load smaller JavaScript files, and then only when they are needed.
- Fewer page errors. AMD implementations allow developers to define dependencies that must load before a module is executed, so the module does not try to use outside code that is not available yet.

In addition to loading multiple JavaScript files at runtime, AMD implementations allow developers to encapsulate code in smaller, more logically-organized files, in a way similar to other programming languages such as [Java](https://en.wikipedia.org/wiki/Java_(programming_language)). For production and deployment, developers can [concatenate](https://en.wikipedia.org/wiki/Concatenation) and [minify](https://en.wikipedia.org/wiki/Minification_(programming)) JavaScript modules based on an AMD API into one file, the same as traditional JavaScript.

The AMD specification is implemented by [Dojo Toolkit](https://en.wikipedia.org/wiki/Dojo_Toolkit), RequireJS, and ScriptManJS.

## References\[[edit](https://en.wikipedia.org/w/index.php?title=Asynchronous_module_definition&action=edit&section=1)]

- [AMD API wiki](https://github.com/amdjs/amdjs-api/wiki/AMD)
- [Why AMD? (Require.js)](http://requirejs.org/docs/whyamd.html)
- [Dojo Introduction to AMD](http://dojotoolkit.org/documentation/tutorials/1.10/modules/)
- [Writing Modular JavaScript With AMD, CommonJS & ES Harmony (Addy Osmani)](http://addyosmani.com/writing-modular-js/)

\[[hide](https://en.wikipedia.org/wiki/Asynchronous_module_definition#)]

- [v](https://en.wikipedia.org/wiki/Template:ECMAScript) ·
- [t](https://en.wikipedia.org/wiki/Template_talk:ECMAScript) ·
- [e](https://en.wikipedia.org/w/index.php?title=Template:ECMAScript&action=edit)

[ECMAScript](https://en.wikipedia.org/wiki/ECMAScript)

Dialects

- [ActionScript](https://en.wikipedia.org/wiki/ActionScript) ·
- [Caja](https://en.wikipedia.org/wiki/Caja_project) ·
- [JavaScript](https://en.wikipedia.org/wiki/JavaScript)
  - ([engines](https://en.wikipedia.org/wiki/JavaScript_engine) ·
  - [asm.js](https://en.wikipedia.org/wiki/Asm.js))

    ·
- [JScript](https://en.wikipedia.org/wiki/JScript) ·
- [JScript .NET](https://en.wikipedia.org/wiki/JScript_.NET) ·
- [QtScript](https://en.wikipedia.org/wiki/QtScript) ·
- [TypeScript](https://en.wikipedia.org/wiki/TypeScript) ·
- [WMLScript](https://en.wikipedia.org/wiki/WMLScript)

[Engines](https://en.wikipedia.org/wiki/List_of_ECMAScript_engines)
([comparison](https://en.wikipedia.org/wiki/Comparison_of_layout_engines_(ECMAScript)))

- [Carakan](https://en.wikipedia.org/wiki/Presto_(layout_engine)#JavaScript_engines) ·
- [Futhark](https://en.wikipedia.org/wiki/Presto_(layout_engine)#JavaScript_engines) ·
- [InScript](https://en.wikipedia.org/wiki/InScript_(JavaScript_engine)) ·
- [JavaScriptCore](https://en.wikipedia.org/wiki/WebKit#JavaScriptCore) ·
- [JScript](https://en.wikipedia.org/wiki/JScript) ·
- [KJS](https://en.wikipedia.org/wiki/KJS_(software)) ·
- [Linear B](https://en.wikipedia.org/wiki/Presto_(layout_engine)#ECMAScript_engines) ·
- [Narcissus](https://en.wikipedia.org/wiki/Narcissus_(JavaScript_engine)) ·
- [QtScript](https://en.wikipedia.org/wiki/QtScript) ·
- [Rhino](https://en.wikipedia.org/wiki/Rhino_(JavaScript_engine)) ·
- [SpiderMonkey](https://en.wikipedia.org/wiki/SpiderMonkey)
  - ([TraceMonkey](https://en.wikipedia.org/wiki/SpiderMonkey#TraceMonkey) ·
  - [JägerMonkey](https://en.wikipedia.org/wiki/SpiderMonkey#J.C3.A4gerMonkey))

    ·
- [Tamarin](https://en.wikipedia.org/wiki/Tamarin_(software)) ·
- [V8](https://en.wikipedia.org/wiki/V8_(JavaScript_engine)) ·
- [ChakraCore](https://en.wikipedia.org/wiki/Chakra_(JavaScript_engine))
  - ([Chakra](https://en.wikipedia.org/wiki/Chakra_(JScript_engine)))

    ·
- [JScript .NET](https://en.wikipedia.org/wiki/JScript_.NET) ·
- [Nashorn](https://en.wikipedia.org/wiki/Nashorn_(JavaScript_engine))

[Frameworks](https://en.wikipedia.org/wiki/Software_framework)

[Client-side](https://en.wikipedia.org/wiki/Client-side_JavaScript)

- [Ample SDK](https://en.wikipedia.org/wiki/Ample_SDK) ·
- [Chaplin.js](https://en.wikipedia.org/wiki/Chaplin.js) ·
- [Dojo](https://en.wikipedia.org/wiki/Dojo_Toolkit) ·
- [Echo](https://en.wikipedia.org/wiki/Echo_(framework)) ·
- [Ext JS](https://en.wikipedia.org/wiki/Ext_JS) ·
- [Google Web Toolkit](https://en.wikipedia.org/wiki/Google_Web_Toolkit) ·
- [jQuery](https://en.wikipedia.org/wiki/JQuery) ·
- [Lively Kernel](https://en.wikipedia.org/wiki/Lively_Kernel) ·
- [midori](https://en.wikipedia.org/wiki/Midori_JavaScript_Framework) ·
- [MochiKit](https://en.wikipedia.org/wiki/MochiKit) ·
- [MooTools](https://en.wikipedia.org/wiki/MooTools) ·
- [Prototype](https://en.wikipedia.org/wiki/Prototype_JavaScript_Framework) ·
- [Pyjs](https://en.wikipedia.org/wiki/Pyjs) ·
- [qooxdoo](https://en.wikipedia.org/wiki/Qooxdoo) ·
- [Rialto](https://en.wikipedia.org/wiki/Rialto_Toolkit) ·
- [Rico](https://en.wikipedia.org/wiki/Rico_(Ajax)) ·
- [script.aculo.us](https://en.wikipedia.org/wiki/Script.aculo.us) ·
- [SmartClient](https://en.wikipedia.org/wiki/SmartClient) ·
- [SproutCore](https://en.wikipedia.org/wiki/SproutCore) ·
- [Spry](https://en.wikipedia.org/wiki/Spry_framework) ·
- [Wakanda Framework](https://en.wikipedia.org/wiki/Wakanda_(software)) ·
- [YUI Library](https://en.wikipedia.org/wiki/YUI_Library)

[Server-side](https://en.wikipedia.org/wiki/Server-side_JavaScript)

- [AppJet](https://en.wikipedia.org/wiki/AppJet) ·
- [Jaxer](https://en.wikipedia.org/wiki/Jaxer#Aptana_Jaxer) ·
- [Node.js](https://en.wikipedia.org/wiki/Node.js) ·
- [WakandaDB](https://en.wikipedia.org/wiki/Wakanda_(software))

Multiple

- [Cappuccino](https://en.wikipedia.org/wiki/Cappuccino_(application_development_framework))
  - ([Objective-J](https://en.wikipedia.org/wiki/Objective-J))

    ·
- [PureMVC](https://en.wikipedia.org/wiki/PureMVC)

[Libraries](https://en.wikipedia.org/wiki/JavaScript_library)

- [Backbone.js](https://en.wikipedia.org/wiki/Backbone.js) ·
- [SWFObject](https://en.wikipedia.org/wiki/SWFObject) ·
- [SWFAddress](https://en.wikipedia.org/wiki/SWFAddress) ·
- [Underscore.js](https://en.wikipedia.org/wiki/Underscore.js)

People

- [Brendan Eich](https://en.wikipedia.org/wiki/Brendan_Eich) ·
- [Douglas Crockford](https://en.wikipedia.org/wiki/Douglas_Crockford) ·
- [John Resig](https://en.wikipedia.org/wiki/John_Resig) ·
- [Scott Isaacs](https://en.wikipedia.org/wiki/Scott_Isaacs)

Other

- [DHTML](https://en.wikipedia.org/wiki/Dynamic_HTML) ·
- [Ecma International](https://en.wikipedia.org/wiki/Ecma_International) ·
- [JSDoc](https://en.wikipedia.org/wiki/JSDoc) ·
- [JSGI](https://en.wikipedia.org/wiki/JSGI) ·
- [JSHint](https://en.wikipedia.org/wiki/JSHint) ·
- [JSLint](https://en.wikipedia.org/wiki/JSLint) ·
- [JSON](https://en.wikipedia.org/wiki/JSON) ·
- [JSSS](https://en.wikipedia.org/wiki/JavaScript_Style_Sheets) ·
- [Sputnik](https://en.wikipedia.org/wiki/Sputnik_(JavaScript_conformance_test)) ·
- [SunSpider](https://en.wikipedia.org/wiki/Browser_speed_test#SunSpider) ·
- Asynchronous module definition ·
- [CommonJS](https://en.wikipedia.org/wiki/CommonJS)

List-Class article (image/png)Lists:

[JavaScript libraries](https://en.wikipedia.org/wiki/List_of_JavaScript_libraries) ·

[Ajax frameworks](https://en.wikipedia.org/wiki/List_of_Ajax_frameworks#JavaScript) ·

List-Class article (image/png)Comparisons:

[JavaScript frameworks](https://en.wikipedia.org/wiki/Comparison_of_JavaScript_frameworks) ·

[server-side JavaScript](https://en.wikipedia.org/wiki/Comparison_of_server-side_JavaScript_solutions)

[Stub icon (image/png)](https://en.wikipedia.org/wiki/File:HelloWorld.svg)

_This [programming-language](https://en.wikipedia.org/wiki/Programming_language)-related article is a [stub](https://en.wikipedia.org/wiki/Wikipedia:Stub). You can help Wikipedia by [expanding it](https://en.wikipedia.org/w/index.php?title=Asynchronous_module_definition&action=edit)._

[Categories](https://en.wikipedia.org/wiki/Help:Category):

- [JavaScript](https://en.wikipedia.org/wiki/Category:JavaScript)
- [Application programming interfaces](https://en.wikipedia.org/wiki/Category:Application_programming_interfaces)
- [Web development](https://en.wikipedia.org/wiki/Category:Web_development)
- [Programming language topic stubs](https://en.wikipedia.org/wiki/Category:Programming_language_topic_stubs)

