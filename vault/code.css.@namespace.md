---
id: 1e8h6n8if77hq8n0x7batp7
title: '@Namespace'
desc: ''
updated: 1633199319578
created: 1633199319578
---
1. [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)

- [Edit__](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace$edit)

## @namespace

[In This Article](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace#toc)

1. [Syntax](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace#Syntax)
   1. [Formal syntax](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace#Formal_syntax)
2. [Specifications](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace#Specifications)
3. [Browser compatibility](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace#Browser_compatibility)

**`@namespace`** is an [at-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule) that defines [XML namespaces](https://developer.mozilla.org/en-US/docs/Namespaces) to be used in a [CSS](https://developer.mozilla.org/en-US/docs/Glossary/CSS) [style sheet](https://developer.mozilla.org/en-US/docs/Web/API/StyleSheet). The defined namespaces can be used to restrict the [universal](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors), [type](https://developer.mozilla.org/en-US/docs/Web/CSS/Type_selectors), and [attribute](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors) [selectors](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Selectors) to only select elements within that namespace. The `@namespace` rule is generally only useful when dealing with documents containing multiple namespaces-such as HTML5 with inline SVG or MathML, or XML that mixes multiple vocabularies.

```
@namespace url(http://www.w3.org/1999/xhtml);
@namespace svg url(http://www.w3.org/2000/svg);

/* This matches all XHTML <a> elements, as XHTML is the default unprefixed namespace */
a {}

/* This matches all SVG <a> elements */
svg|a {}

/* This matches both XHTML and SVG <a> elements */
*|a {}
```

Any `@namespace` rules must follow all [@charset](https://developer.mozilla.org/en-US/docs/Web/CSS/%40charset) and [@import](https://developer.mozilla.org/en-US/docs/Web/CSS/%40import) rules, and precede all other at-rules and [style declarations](https://developer.mozilla.org/en-US/docs/Web/API/CSSStyleDeclaration) in a style sheet.

`@namespace` can be used to define the **default namespace** for the style sheet. When a default namespace is defined, all universal and type selectors (but not attribute selectors, see note below) apply only to elements in that namespace.

The `@namespace` rule can also be used to define a **namespace prefix**. When a universal, type, or attribute selector is prefixed with a namespace prefix, then that selector only matches if the namespace _and_ name of the element or attribute matches.

In [HTML5](https://developer.mozilla.org/en-US/docs/Glossary/HTML5), known [foreign elements](https://html.spec.whatwg.org/#foreign-elements) will be automatically be assigned namespaces. This means that HTML elements will act as though they are in the XHTML namespace (`http://www.w3.org/1999/xhtml`), even if there is no `xmlns` attribute anywhere in the document, and the [<svg>](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/svg) and [<math>](https://developer.mozilla.org/en-US/docs/Web/MathML/Element/math) elements will be assigned their proper namespaces (`http://www.w3.org/2000/svg` and `http://www.w3.org/1998/Math/MathML`).



**Note:** In XML, unless a prefix is defined directly on an attribute (_e.g._, `xlink:href`), that attribute has no namespace. In other words, attributes do not inherit the namespace of the element they're on. To match this behaviour, the default namespace in CSS does not apply to attribute selectors.

## Syntax[__Edit](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace$edit#Syntax)

```
/* Default namespace */
@namespace url(XML-namespace-URL);
@namespace "XML-namespace-URL";

/* Prefixed namespace */
@namespace prefix url(XML-namespace-URL);
@namespace prefix "XML-namespace-URL";2468101214
```

### Formal syntax

@namespace [<namespace-prefix>](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace#namespace-prefix)[?](https://developer.mozilla.org/en-US/docs/CSS/Value_definition_syntax#Question_mark_()) [\[\](https://developer.mozilla.org/en-US/docs/CSS/Value_definition_syntax#Brackets) \[<string>\](https://developer.mozilla.org/en-US/docs/Web/CSS/string) \[|\](https://developer.mozilla.org/en-US/docs/CSS/Value_definition_syntax#Single_bar) \[<url>\](https://developer.mozilla.org/en-US/docs/Web/CSS/url) \[\]](https://developer.mozilla.org/en-US/docs/CSS/Value_definition_syntax#Brackets);

where
`<namespace-prefix> = [<ident>](https://developer.mozilla.org/en-US/docs/Web/CSS/ident)`

## Specifications[__Edit](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace$edit#Specifications)

Specification

Status

Comment

[CSS Namespaces Module
The definition of '@namespace' in that specification.](https://drafts.csswg.org/css-namespaces-3/#declaration)

RECRecommendation

Initial definition

## Browser compatibility[__Edit](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace$edit#Browser_compatibility)

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

1.0

(Yes)

1.0 (1.7 or earlier)

9.0

8.0

1.0

Namespace selector (|)

1.0

(Yes)

1.0 (1.7 or earlier)

9.0

8.0

3.0

## Document Tags and Contributors

__ **Tags:**

- [At-rule](https://developer.mozilla.org/en-US/docs/tag/At-rule)
- [CSS](https://developer.mozilla.org/en-US/docs/tag/CSS)
- [Layout](https://developer.mozilla.org/en-US/docs/tag/Layout)
- [Reference](https://developer.mozilla.org/en-US/docs/tag/Reference)
- [Web](https://developer.mozilla.org/en-US/docs/tag/Web)

__ **Contributors to this page:** [wbamberg](https://developer.mozilla.org/en-US/profiles/wbamberg), [erikadoyle](https://developer.mozilla.org/en-US/profiles/erikadoyle), [Tigt](https://developer.mozilla.org/en-US/profiles/Tigt), [fscholz](https://developer.mozilla.org/en-US/profiles/fscholz), [Sebastianz](https://developer.mozilla.org/en-US/profiles/Sebastianz), [soluml](https://developer.mozilla.org/en-US/profiles/soluml), [vtsatskin](https://developer.mozilla.org/en-US/profiles/vtsatskin), [kscarfone](https://developer.mozilla.org/en-US/profiles/kscarfone), [Np](https://developer.mozilla.org/en-US/profiles/Np)
__ **Last updated by:** [wbamberg](https://developer.mozilla.org/en-US/profiles/wbamberg), Aug 16, 2017, 10:38:06 PM

See also

1. **[CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)**
2. **[CSS Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)**
3. **[CSS Namespaces](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Namespaces)**
4. [\***\*At-Rules**](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace#)
   1. _`@namespace`_

## Learn the best of web development

Get the latest and greatest from MDN delivered straight to your inbox.

E-mail

