---
id: 2j47worrc27rwxxrfo8q74w
title: Chain
desc: ''
updated: 1633199321481
created: 1633199321481
---

interesting problem:
out of a general dislike and mainly a cosmetic reason, I write async/await code without assignments, generally.
This leads to this:

const puppeteer = require('puppeteer');
let _browser;
let _page;

puppeteer.launch()
 .then(browser => (_browser = browser))
 .then(browser => (_page = browser.newPage()))
 .then(page => page.goto('https://example.com'))

 .then(() => _page)
 .then(page => page.screenshot({ path: 'example.png' }))
 .then(() => _browser.close());

Why the indirection around _page?

How do promise chains work?
pass a function: executor with resolve,reject paramters according to whether you want to resolve or reject the promise. All promises immediately resolve this function, thus when you resolve it into another promise, the chain goes on.
why the escalation to 'global' objects or objects in a higher block, because the return chain implied by the thenables of the promises does not coincide automatically with what we want to pass to the next thenable. If we want the operations to continue to work as side-effects on an object in the same context, we just have to pass explicitly.
Remember that arrow-functions return the expression in the body implicitly!

-> little schemer/lisper

js implementation of all combinators
-> little scripter
