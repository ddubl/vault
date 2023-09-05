---
id: 735ogxv9xikh02kv9qciwoq
title: Selector
desc: ''
updated: 1661861748917
created: 1661861748917
---


id: Ekrgn7lRPTNZZXLwpMmkx
title: Selector
desc: ''
updated: 1633199319482
created: 1633199319482
---
up vote 2 down vote [favorite](http://stackoverflow.com/questions/16150621/access-the-parent-selector-from-within-a-sass-mixin#)**1**

I have set up a mixin for a button using display:inline-block. I am trying to get to the parent of whatever class that will eventually end up using the mixim, so I can add the font-size: 0px line there to make sure that I don't need to make adjustments to my HTML to avoid unwanted space between each button.

Here's an example... I want the. parent class to receive the font-size: 0px line.

---
```markdown
@mixin button() {
    display:inline-block;
    font-size: 1em;
    //other stuff to make a pretty button
    && { font-size: 0px; }
}

.parent{
    .child {
        @include button();
    }
}
```
---

[sass](http://stackoverflow.com/questions/tagged/sass) [compass-sass](http://stackoverflow.com/questions/tagged/compass-sass) [css](http://stackoverflow.com/questions/tagged/css)

[share](http://stackoverflow.com/q/16150621/5045566)|[edit](http://stackoverflow.com/posts/16150621/edit)

asked Apr 22 '13 at 15:16
[(image/png)](http://stackoverflow.com/users/2307944/macbryce)[MacBryce](http://stackoverflow.com/users/2307944/macbryce)53212

Setting the font-size to 0px is an unreliable way of removing undesirable spaces. If the user has forced a minimum font-size in their browser, there's nothing you can do about it. – [cimmanon](http://stackoverflow.com/users/1652962/cimmanon) [Apr 22 '13 at 15:33](http://stackoverflow.com/questions/16150621/access-the-parent-selector-from-within-a-sass-mixin#comment23076860_16150621)

I've seen it a couple of times to make sure that the inline-blocks do not get extra spaces in between them when there are line breaks in the HTML. What would be a better solution for that problem then? – [MacBryce](http://stackoverflow.com/users/2307944/macbryce) [Apr 22 '13 at 16:43](http://stackoverflow.com/questions/16150621/access-the-parent-selector-from-within-a-sass-mixin#comment23079312_16150621)

I comment out the whitespace in the HTML itself. The only reliable way to do it with CSS is for the element to not be inline (either via float, table-cell, as a flex element via Flexbox, etc). – [cimmanon](http://stackoverflow.com/users/1652962/cimmanon) [Apr 22 '13 at 16:53](http://stackoverflow.com/questions/16150621/access-the-parent-selector-from-within-a-sass-mixin#comment23079636_16150621)

add a comment

## 3 Answers

[active](http://stackoverflow.com/questions/16150621/access-the-parent-selector-from-within-a-sass-mixin?answertab=active#tab-top) [oldest](http://stackoverflow.com/questions/16150621/access-the-parent-selector-from-within-a-sass-mixin?answertab=oldest#tab-top) [votes](http://stackoverflow.com/questions/16150621/access-the-parent-selector-from-within-a-sass-mixin?answertab=votes#tab-top)

up vote 6 down vote accepted

No, this is not possible. You could do something like this, though:

---
```markdown
@mixin button($child: '.child') {
    font-size: 0px;
    //other stuff to make a pretty button

    #{$child} {
        display:inline-block;
        font-size: 1em;
    }
}

.parent{
    @include button();
}
```
---

Output:

---
```markdown
.parent {
  font-size: 0px;
}
.parent .child {
  display: inline-block;
  font-size: 1em;
}
```
---

[share](http://stackoverflow.com/a/16151082/5045566)|[edit](http://stackoverflow.com/posts/16151082/edit)

answered Apr 22 '13 at 15:38
[(image/png)](http://stackoverflow.com/users/1652962/cimmanon)[cimmanon](http://stackoverflow.com/users/1652962/cimmanon)43.3k980113

add a comment

up vote 8 down vote

As of Sass 3.4 this is now possible.

---
```markdown
@mixin parent {

  @each $selector in & {

    $l: length($selector);

    @if ($l == 1) {
      @error "Used parent mixin on a top-level selector";
    } @else {

      $parent: nth($selector,1);
      @for $i from 2 to $l {
        $parent: append($parent,nth($selector,$i));
      }

      @at-root #{$parent} {
        @content;
      }

    }
  }
}

// Use
.grandparent {
  .parent{
      .child {
        font-size: 1em;
          @include parent {
            font-size: 0px;
          }
      }
  }
}

// Result
.grandparent .parent .child {
  font-size: 1em;
}
.grandparent .parent {
  font-size: 0px;
}

// Errors:
.root {
  @include parent {
    content: "Won't work";
  }
}
.grandparent .parent, .root {
  @include parent {
    content: "Also won't work";
  }
}
```
---

[share](http://stackoverflow.com/a/25648134/5045566)|[edit](http://stackoverflow.com/posts/25648134/edit)

answered Sep 3 '14 at 15:23
[(image/png)](http://stackoverflow.com/users/4004392/karol-tomoki-yamazaki)[Karol Tomoki Yamazaki](http://stackoverflow.com/users/4004392/karol-tomoki-yamazaki)15112

add a comment

up vote 2 down vote

There is a XXX! selector in the draft for the CSS 4 spec, which will act as the way you like. It announces the subject of the CSS style declarations, if the selectors match

So if you have this selector

---
```markdown
.a > .b! > .c
```
---

It will match e.g. for this

---
```markdown
<div class="a">
    <div class="b">
        <div class="c">
        </div>
    </div>
</div>
```
---

but the style declarations will not take effect on `.c`, but on `.b`, because I announced by the exclamation mark, that this element should be the subject of the style <http://dev.w3.org/csswg/selectors4/#subject>

You cannot use it right now out of the box. But there is one jQuery plugin, that is a polyfill for that. <http://dev.w3.org/csswg/selectors4/>

See also this stack: [Is there a CSS parent selector?](http://stackoverflow.com/questions/1014861/is-there-a-css-parent-selector/7049832#comment22921973_7049832)

How to apply? Well, I don't know exactly in SASS, but in LESS it would be

---
```markdown
*! > & {
    /* ... */
}
```
---

[share](http://stackoverflow.com/a/16151795/5045566)|[edit](http://stackoverflow.com/posts/16151795/edit)

answered Apr 22 '13 at 16:15
[(image/jpeg)](http://stackoverflow.com/users/476951/herrserker)[HerrSerker](http://stackoverflow.com/users/476951/herrserker)14.4k54073

Thanks! Looking forward to CSS4. – [MacBryce](http://stackoverflow.com/users/2307944/macbryce) [Apr 23 '13 at 12:32](http://stackoverflow.com/questions/16150621/access-the-parent-selector-from-within-a-sass-mixin#comment23109423_16151795)

add a comment

## Your Answer

* Links
* Images
* Styling/Headers
* Lists
* Blockquotes
* Code
* HTML
* [advanced help »](http://stackoverflow.com/editing-help)

## Not the answer you're looking for? Browse other questions tagged [sass](http://stackoverflow.com/questions/tagged/sass) [compass-sass](http://stackoverflow.com/questions/tagged/compass-sass) [css](http://stackoverflow.com/questions/tagged/css) or [ask your own question](http://stackoverflow.com/questions/ask)
