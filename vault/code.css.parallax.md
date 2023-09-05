---
id: nytir75uam7xatgylwvlar6
title: Parallax
desc: ''
updated: 1678794224683
created: 1633199319576
---
## Creating Scrolling Parallax Effects with CSS

By [Stefan Judis](http://4waisenkinder.de/) on June 9, 2014
While this solution is elegant on desktop computers, it **does not** function on mobile devices. To create a mobile-compatible pure CSS parallax scrolling effect, [please visit this post by Keith Clark](http://blog.keithclark.co.uk/pure-css-parallax-websites/).

_I generally dislike ESPN because  they're the McDonalds of sports news but they recently did a [piece on Luis Suarez]\(<http://espn.go.com/espn/feature/story/>_/id/10984370/portrait-serial-winner-luis-suarez-soccer-most-beautiful-player) that was eye-catching.  The content itself was great but their use of parallax and imagery was outstanding.  They've employed this technique in a few of their features now and I've been so impressed that I implored my readers to write about how it's done.  The following is a post principally written by Stefan Judis with detail added by myself.  Enjoy!\_

## Introduction

For quite a long time now websites with the so called "parallax" effect have been really popular. In case you have not heard of this effect, it basically includes different layers of images that are moving in different directions or with different speed. This leads to a nice optical effect and keeps the attention of the visitor.

[](https://trackjs.com/?utm_source=davidwalsh&utm_medium=display&utm_content=squashanimate)[View Demo](https://davidwalsh.name/demo/parallax.php)

In web design, the most common way to achieve this is by simply adding a jQuery plugin to a website. Doing this unfortunately has a few disadvantages. These plugins mostly attach an event handler to the `scroll` event of the `window` object. This leads to tons of events being handled via JavaScript (handling the `scroll` event can easily cause performance issues and should be considered carefully). To move the mentioned layers, background positions of images get calculated and set to the depending elements, which then additionally causes a lot of DOM manipulations.

In short: parallax done with JavaScript can decrease the scrolling performance of a website quite quickly.

## `background-position: fixed` to the Rescue

What only a few people may know, is that this effect can be achieved via CSS, too. Check out the example below:

- [HTML](https://codepen.io/stefanjudis/embed/nrzHI?height=268&theme-id=602&slug-hash=nrzHI&default-tab=result&user=stefanjudis#html-box)
- [SCSS](https://codepen.io/stefanjudis/embed/nrzHI?height=268&theme-id=602&slug-hash=nrzHI&default-tab=result&user=stefanjudis#css-box)
- [Result](https://codepen.io/stefanjudis/embed/nrzHI?height=268&theme-id=602&slug-hash=nrzHI&default-tab=result&user=stefanjudis#result-box)

[Edit on](http://codepen.io/stefanjudis/pen/nrzHI)

foo
bar
baz
bazz

## Example for 'background-attachment : fixed'

## [@stefanjudis](https://twitter.com/stefanjudis)

Image by [Matty4z](http://matty4z.deviantart.com/art/mlp-lil-stream-351612016)

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Caption for this beautiful break image, Caption for this beautiful break image, Caption for this beautiful break image, Caption for this beautiful break image.

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

[Rerun](https://codepen.io/stefanjudis/embed/nrzHI?height=268&theme-id=602&slug-hash=nrzHI&default-tab=result&user=stefanjudis#0)

To get this parallax effect, background images have to be placed on different elements. These elements additionally need to have defined `background-attachment: fixed`. By defining `background-attachment` the behavior and positioning of any background image can be changed.

The initial value of the property is `scroll`, which basically means that the image position is fixed to its element. There is nothing fancy about that and we all know this behavior. The user scrolls on a website and elements are moving up and down and so do the background images.

It gets interesting by setting the `background-attachment` to `fixed`. `fixed` defines that the background image position is not fixed to the depending element but rather fixed to the viewport. This means that the image will stay visually on the same position no matter how much scrolling will be done. This leads to the nice visual parallax effect.

Let's have a quick check on the actual implementation:

<!-- Four containers for setting the background images -->

<div class="parallax">
  <div class="bg__foo">foo</div>
  <div class="bg__bar">bar</div>
  <div class="bg__baz">baz</div>
  <div class="bg__bazz">bazz</div>
</div>

// setting base styles to image containers
[class*="bg__"] {
  height: 50vh;

  text-indent: -9999px;

  /_ fix background _/
  background-attachment: fixed;

  /_ center it _/
  background-position: center center;

  /_ Scale it nicely to the element _/
  background-size: cover;

  /_ just make it look a bit better ;) _/
  &:nth-child(2n) {
    box-shadow: inset 0 0 1em #111;
  }
}

.bg\_\_foo {
  background-image: url(
    <https://s3-us-west-2.amazonaws.com/s.cdpn.io/30354/parallax1.jpg>
  );
}

.bg\_\_bar {
  background-image: url(
    <https://s3-us-west-2.amazonaws.com/s.cdpn.io/30354/parallax2.jpg>
  );
}

.bg\_\_baz {
  background-image: url(
    <https://s3-us-west-2.amazonaws.com/s.cdpn.io/30354/parallax3.jpg>
  );
}

.bg\_\_bazz {
  height: 100vh;

  background-image: url(
    <https://s3-us-west-2.amazonaws.com/s.cdpn.io/30354/parallax1.jpg>
  );
}

A quick check regarding [browser support](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Browser_compatibility) on MDN shows almost global compatibility. It is already supported in IE9 and Android 2.1.

[View Demo](https://davidwalsh.name/demo/parallax.php)

## Sum up

I personally prefer CSS solutions to JavaScript solutions and this is a perfect example for my preference. There is no logic and no additional DOM manipulation needed, which makes the whole solution pretty nice. But there is still one thing to remember when dealing with parallax effects.

_Even with this CSS solution there is a lot of stuff to do for the browser._ `background-attachment: fixed` will lead to much more painting that needs to be done by the browser, which can affect the scrolling performance and maybe drop your FPS (remember the 60FPS goal?). So keeping an eye on the FPS meter e.g. in Chrome when doing these kind of things is always a good idea.

Stefan Judis (image/jpeg)

### About Stefan Judis

Stefan is a frontend developer from Berlin. He maintains the projects grunt-phantomas and grunt-photobox. Improving performance, automating everything, visualizing datasets and drinking good coffee are the things he is doing most of the time.

[\_\_4waisenkinder.de](http://4waisenkinder.de/)[\_\_stefanjudis](https://twitter.com/stefanjudis)[\_\_Posts](https://davidwalsh.name/author/stefan)

