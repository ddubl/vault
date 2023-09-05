---
id: 6ieykfpj6yqd5mtb1uybmvb
title: Pwa
desc: ''
updated: 1633199319638
created: 1633199319638
---
## Exploring Progressive Web Applications

April 5, 2017 by

Over the past few years, the web applications I’ve worked on have increasingly taken a mobile-first design approach. This is great from a presentation standpoint, providing the users with a practical interface for their device, but does not really help deal with flaky mobile networks. Progressive Web Applications provide a way to optimize for [connectivity issues](https://developers.google.com/web/fundamentals/performance/poor-connectivity/).

## What is a Progressive Web Application?

At their core, Progressive Web Applications are simply web applications. They’re a combination of HTML, CSS, and JavaScript. They use Progressive Enhancement to implement features such as caching and background sync if and _only_ if the browser supports the proper APIs. With browser support, the Progressive Web Application can behave much like a native application. It loads instantly, works offline, and can be installed as if it were a native application.

In order to better understand Progressive Web Apps, I set out to build a simple one. I wanted to avoid using frameworks and libraries to make sure I was dealing with the core concepts and technologies, rather than someone’s abstraction or a framework that added a layer of magic. I did make one notable exception in using Jake Archibald’s [idb](https://github.com/jakearchibald/idb) to wrap IndexedDB’s interface in [Promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise). Service Workers make heavy use of Promises, and the library helped simplify the interface. I’ll explain more about how IndexedDB fits into all of this when I get to the _really_ interesting bits involving Background Sync.

[pwa_diagram2 (image/png)](https://www.e-gineering.com/wp-content/uploads/2017/04/pwa_diagram2.png)_Standard web applications make direct requests to the server. PWAs use Service Worker as a proxy and programmatic cache._

### The Pieces of a PWA

#### Web App Manifest

The [Web App Manifest](https://developer.mozilla.org/en-US/docs/Web/Manifest) is a JSON file that describes the application. It is used by by devices to install the web app as an application (typically on the home screen). It defines an app icon, how to launch the app (standalone, fullscreen, in the browser, etc), and related information.

#### App Shell

The app shell is pretty simple. It is simply the collection of files that need to be present in order for the application to start. The app shell _could_ be as simple as a single HTML file, but is more likely to be a small collection of HTML, CSS, JavaScript, and image files.

#### Service Worker

The key to Progressive Web Applications and the offline experience is the [service worker](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API). The Service Worker is JavaScript code that runs separately from the page, behind the scenes. It behaves very much like a network proxy. And it is fully programmable! Because of the Service Worker’s ability to manipulate the requests and responses, the application _must_ be served over HTTPS to keep the data secure. Luckily, there _is_ an exception for `localhost`, allowing developers to easily work with the application in a local dev environment.

The service worker provides the mechanism to cache the app shell, allowing the application to start even when offline. It also provides a programmatic cache for the non-essential resources, which may include other files or dynamic data. It is interesting to note that the service worker caches the actual response, including all headers, rather than just the response _data_. This means that your application can simply make network requests and process the response without having any code specific to handling the cache. However, if you’re caching dynamic data, it may be a good idea to display something so the user knows the freshness of the data (using the value from the “Date” header, for example).

["Add to Homescreen" prompt and running as a standalone application. (image/png)](https://www.e-gineering.com/wp-content/uploads/2017/04/Installing.png)_“Add to Homescreen” prompt and running as a standalone application._

## Writing the Application

I decided to write one of the most ubiquitous (and useless) of all sample applications – a “to do” app! The result is not a particularly useful app. It’s not even a decent “to do” app. However, it _did_ allow me to explore some very interesting ideas and possibilities of Progressive Web Applications. The “to do” data is stored in a database on a server, and that data can be changed by multiple clients. If you’d like to skip ahead and just dig into the code, [the full code is on GitHub](https://github.com/egineering-llc/todoPWA).

### The Server

The server uses a _very simple_ node server and a Mongo database with a single “todos” collection. The API exposed is pretty basic:

- GET /todos/[username] – returns a list of “to do” items for the user
- POST /todo – creates a new item
- GET /todo/[id] – returns the specified item
- PUT /todo/[id] – updates the specified item
- DELETE /todo/[id] – deletes the specified item

Since I’ve worked with node and Mongo in the past, setting this up only took me a couple of hours.

### The Client

The client is simple as well. I opted to avoid any frontend frameworks and build an extremely spartan interface with plain old JavaScript, HTML, and CSS. It really only does three things:

1. Allows the user to log on
2. Shows a list of “to do” items for the user
3. Add / Update “to do” items

For server communication, the client uses the good old fashioned XMLHttpRequest object. Like the server, setting up this very basic client application only took a few hours. I wanted to spend my time working on the service worker script and exploring what it can do.

### The Service Worker

The service worker is where most of the magic of a Progressive Web Application lives. There is one small bit of code needed in the web application to register the service worker. A simple example is below:

1
2
3

`if` ```(``'serviceWorker'``` `in` `navigator) {`
```navigator.serviceWorker.register(``'./serviceworker.js'``);```
`}`

That’s really all you need to add to the application! If the browser doesn’t support Service Workers, it won’t attempt to register the service worker script, and it will work as a standard web application.

#### Caching the App Shell

The first task in making this little app into a PWA was to cache the app shell. This was a fairly trivial task, but did need to be coded in the service worker script. At the simplest, it looks something like this:

1
2
3
4
5
6
7

```self.addEventListener(``'install'``,``` ```function``(e) {```
`e.waitUntil(`
```caches.open(``'myAppCache'``).then(``function``(cache) {```
`return` ```cache.addAll([``'index.html'``,``` ```'app.js'``,``` ```'style.css'``]);```
`})`
`);`
`});`

During the ‘install’ phase, the service worker will retrieve and cache all of the static files. To return the cached files, implement a ‘fetch’ listener. In this case, it is a simple matter of looking for the file (given by the `e.request` object) in the cache available to the service worker. If the item isn’t in cache, it will make a network request. I also added some basic boilerplate code to listen for the ‘activate’ event. This simply clears any data that may already exist in the caches.

1
2
3
4
5
6
7
8
9

```self.addEventListener(``'fetch'``,``` ```function``(e) {```
`e.respondWith(`
```caches.match(e.request).then(``function``` `(response) {`
`// In the case that item isn't in cache, make a network request.`
`// We could add that response to cache.`
`return` `response || fetch(e.request);`
`})`
`);`
`});`

This was all that was necessary to make the simple app a Progressive Web Application. Pretty cool, but not particularly _exciting_. It’s great for applications with static resources and data, but it only goes so far when you’re building an application that relies on dynamic data.

[With the app shell cached by the Service Worker, subsequent visits to the app retrieve the resources from the service worker. (image/png)](https://www.e-gineering.com/wp-content/uploads/2017/04/fromServiceWorker.png)_With the app shell cached by the Service Worker, subsequent visits to the app retrieve the resources from the service worker._

#### Caching Dynamic Data

The next step was to cache dynamic data. In my case, the list “to do” items stored in the Mongo database. To cache dynamic data, I needed to update the `fetch` listener. In the below example, I check if the requested URL matches the “/todos/” path. If so, I make the network request, clone the response, and add the cloned response to cache. Cloning the response is necessary because the response body is a readable stream, and can only be read once. I also added a `catch` block. If the network request fails (because the user has no data connection, the server cannot be contacted due to various network issues, or the server is down), the service worker will look for a match in cache.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34

```self.addEventListener(``'fetch'``,``` ```function``(e) {```
`var` ```pathToCache = /\/todos\``//;```
`var` `url         = e.request.url;`
`if` `(e.request.method ===` ```'GET'``) {```
`if` `(pathToCache.test(url)) {`
`e.respondWith(`
```caches.open(``'myAppDataCache'``).then(``function``` `(cache) {`
`// first make a network request`
`return` `fetch(e.request)`
`// When we get a response, cache a clone, then return the response`
```.then(``function``` `(response) {`
`cache.put(e.request, response.clone());`
`return` `response;`
`//  An error! Return older response from cache`
```}).``catch``(``function``` `() {`
`return` `cache.match(e.request);`
`});`
`})`
`);`
`}` `else` `{`
`// this is the old code, for returning the static files from cache`
`e.respondWith(`
```caches.match(e.request).then(``function``` `(response) {`
`return` `response || fetch(e.request);`
`})`
`);`
`}`
`}`
`});`

The above example uses a network-first strategy for handling the network requests. This strategy is fitting for volatile data, when you want the user to have the most up-to-date info possible. However, if the user has network connectivity but the service cannot be reached, this code will only return cached data once the request times out. That’s certainly not an optimal experience. There are better ways to handle it. I recommend reading [Jake Archibald’s Offline Cookbook](https://jakearchibald.com/2014/offline-cookbook/) for an excellent overview of strategies, complete with code samples.

The service worker does not need to use the same strategy for everything. Since the full request object is available to the service worker, you can use that request information (most likely the URL) to decide what strategy to use. If your application has some data that rarely changes once it’s entered, looking in cache first is an excellent strategy.

[When offline, the static resources and cached data are returned via the service worker. (image/png)](https://www.e-gineering.com/wp-content/uploads/2017/04/offlineFromServiceWorker.png)_When offline, the static resources and cached data are returned via the service worker._

##### An experiment in pre-fetching

My “to do” app initially retrieves a list of items and caches that list. Each time the user opens an item, the app makes a request to the server for that specific item. That’s pretty pointless in my app, since the list response already contains the full item to be edited. A better app would just use the data the application has already received! However, if a list view contains only _summary_ data (a display name and ID, for example), that application would need to retrieve the _full_ item in order to edit. I decided to pretend my app really fit that latter scenario. In order to retrieve and cache the individual items, I added one more step within the block that handles the list request. It calls a function to parse the list response and then fetch and cache each item in the list. I’ve simply chained a step to the Promise to call the `cacheAllItems` function.

1
2
3

```cache.put(e.request, response.clone()).then(``function``` `() {`
`cacheAllItems(e.request);`
`});`

This function will retrieve a copy of the list response from the cache, get the JSON data, and for each item request and
cache the the response.

1
2
3
4
5
6
7
8
9
10
11
12
13

`var` `cacheAllItems =` `function` `cacheAllItems(request) {`
```caches.open(``'myAppDataCache'``).then(``function``(cache) {```
```cache.match(request).then(``function``` `(cachedResponse) {`
```cachedResponse.json().then(``function``` `(json) {`
`var` `itemsToCache = [];`
```json.forEach(``function``` `(item) {`
```itemsToCache.push(``'/todo/'``` `+ item._id);`
`});`
`return` `cache.addAll(itemsToCache);`
`});`
`});`
`});`
`};`

This worked beautifully! After successfully retrieving the list of items from the server, the service worker then requested and cached each individual item. Afterward, the service worker’s `fetch` listener returned the cached item when requested. I didn’t have to change anything at all in the application itself.

### Using Background Sync

Using the service worker to cache static and dynamic resources is relatively simple and only requires a minimal change to the actual application to register the service worker. However, that only goes so far. It’s great for applications that are heavy on presenting data, but doesn’t help much when the application is truly _interactive_. Background sync can help since the service worker can retry requests that fail.

This is where things got interesting. And complicated. Adding background sync required changes to the application itself. In the case of my app, I needed to add a different handler for submitting the add/update form. It also opens up the difficulties in _what_ to show in the user interface. A “to do” app is a good candidate for an [Optimistic UI](https://uxplanet.org/optimistic-1000-34d9eefe4c05) (which assumes the network requests will _eventually_ succeed, so show that expected state to the user), but more complex applications may need to take a different route.

Changing the submit handler was fairly easy, but using background sync opened up the necessity to persist the information for the transactions. After some research, I found recommendations to store the data to be transferred within [IndexedDB](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API). It can store all of the data necessary, the service worker has access to the data, and it allows for the ability to queue multiple requests. This is where the previously-mentioned `idb` library came in handy.

The code below checks that the browser supports background sync, and then adds an event handler for submitting the “to do” form. When the user submits the form, the handler creates a message object and places it in IndexedDB, then registers a sync event with the service worker, and then just goes back to the list view. It also attaches a more standard handler when the browser does not support service workers or background sync.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39

`if` ```(``'serviceWorker'``` `in` `navigator) {`
```navigator.serviceWorker.register(``'./serviceworker.js'``)```
```.then(``function``(registration) {```
`if` ```(``'sync'``` `in` `registration) {`
```app.todoForm.addEventListener(``'submit'``,``` ```function``(event) {```
`event.preventDefault();`
`var` `method =` ```'POST'``;```
`var` `url    =` ```'/todo'``;```
`// if it has an _id prop, change to 'PUT'`
`if` `(app.todoId.value) {`
`method =` ```'PUT'``;```
`url    =` `'/todo/'` `+ app.todoId.value;`
`}`
`var` `message = {`
`method : method,`
`url    : url,`
`item   : app.getItem()`
`};`
```store.outbox(``'readwrite'``).then(``function``(outbox) {```
`return` `outbox.put(message);`
```}).then(``function``() {```
`// register the sync so that service worker can process`
`return` ```registration.sync.register(``'outbox'``);```
```}).then(``function``() {```
`app.showTodoList();`
`})`
`});`
`}` `else` `{`
`// the browser doesn't support background sync, so just attach a plain old handler`
```app.todoForm.addEventListener('submit``', app.todoSubmitHandler);```
`}`
`});`
`} else {`
```// the browser doesn'``t support serviceWorker, so we just need a plain old handler```
```app.todoForm.addEventListener(``'submit'``, app.todoSubmitHandler);```
`}`

The service worker needs to have a ‘sync’ event listener. This event fires when the application registers the ‘sync’ event. Ah, but the _timing_ of the service worker’s handling of the event is rather unreliable. It _usually_ happens immediately, but if the service worker has gone idle, it could take a few minutes. In my event handler, I initially followed some examples and wrote something like the following:

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29

```self.addEventListener(``'sync'``,``` ```function``(event) {```
`if` `(event.tag ===` ```'outbox'``) {```
`event.waitUntil(`
```store.outbox(``'readonly'``).then(``function``` `(outbox) {`
`return` `outbox.getAll();`
```}).then(``function``` `(messages) {`
`return` ```Promise.all(messages.map(``function``` `(message) {`
`return` `fetch(message.url, {`
`credential :` ```'include'``,```
`method     : message.method,`
`body       : JSON.stringify(message.item),`
`headers    : {`
`'Accept'`           `:` ```'application/json'``,```
`'X-Requested-With'` `:` ```'XMLHttpRequest'``,```
`'Content-Type'`     `:` `'application/json'`
`}`
```}).then(``function``` `(response) {`
`return` `response.json();`
```}).then(``function``` `(data) {`
`// Clear the message from the outbox so it doesn't get processed again.`
`return` ```store.outbox('readwrite').then(``function``` `(outbox) {`
`return` ```outbox.``delete``(message.id);```
`});`
`});`
`}));`
`})`
`);`
`}`
`});`

This handler will retrieve all of the messages in the outbox and process each of them. When a request is successful, the code will remove the entry from IndexedDB. If _any_ of the requests fail, the service worker will try again in the background.

When I initially added this piece to the application, it did not seem to work. I would go offline (in Chrome dev tools, check the “offline” box in the “Network” tab), add or update an item, and confirm that the request failed due to a network error. Then, I unchecked the “offline” box. I _expected_ to see an immediate network request, but I didn’t. I kept changing my code and trying again and again, not understanding what I had done wrong. It turns out that I had _not_ done something wrong. I just had the wrong idea about how background sync would work!

The “eureka” moment came when I decided to walk away and take a break. When I got back, I noticed my server console had logged a rather mysterious “PUT” request. Where did that come from? I had gone outside for a walk. That request came from the service worker! I had navigated away from my app (I think I searched for “why won’t this thing work?”) before leaving, and that was the key. The service worker does not automatically retry once the browser has a network connection. Instead, it only retries once the user has gone on to do something else – such as navigating to some other website. Even then, the timing is unpredictable and often takes a few minutes.

At this point I had a basic progressive web application, but there were some real problems with it. The strategy used for caching the dynamic data and handling requests was not ideal, but it was good enough for this exercise. The more problematic piece related to the requests waiting for background sync and the state of the UI.

I didn’t want to focus much on the actual UI for this application. So, to illustrate what was going on with the pending updates, I added a section to the “to do” list showing the pending updates in IndexedDB. If I update an item titled “Convert it into a plane”, the “Pending” section would include _Updating “Convert it into a plane”_. A better application might have used a more optimistic UI or at least displayed the new item within the main list.

[The app can present the data for editing, even when offline. (image/png)](https://www.e-gineering.com/wp-content/uploads/2017/04/OfflineSave.png)_The app can present the data for editing, even when offline, and successfully save when back online._

#### Communication Between Application and Service Worker

The service worker runs separately from the application, and it cannot access the DOM. However, there is a way for the application and service worker to communicate. I had two scenarios where I wanted this communication: when a background sync was successful, I wanted the service worker to notify the client; and when the application detected it was online, I wanted it to tell the service worker to process items pending in IndexedDB. Fortunately, the `postMessage` interface makes this possible.

#### Service Worker to Application

The plain old ‘submit’ handler kicks off an XMLHttpRequest to save changes. This has a ‘readystatechange’ event, so the code can easily detect when the request is complete and whether or not it succeeded. Then the code can do something, like update the UI to reflect the success. When using background sync, that request/response is processed in the service worker, separate from the application. The service worker needs to send a message to the application so the application can update the UI. I added the following code to the `sync` handler in the service worker. Once each request completed, the service worker posted a message to the application (the ‘clients’ in this case).

1
2
3
4
5
6
7
8
9
10
11

```self.clients.matchAll().then(``function``(clients) {```
`var` `i;`
`if` `(clients && clients.length) {`
`for` `(i = 0; i < clients.length; i++) {`
`clients[i].postMessage({`
`name :` ```'syncComplete'``,```
`item : message.item`
`});`
`}`
`}`
`});`

The interface for getting clients is a bit limited so far, so I just spammed _every_ client the service worker had under its control. This meant that if I had the app open in multiple tabs, they _all_ got the message. That has some very interesting implications!

The application needs to listen for the message from the service worker, and this is done by adding an event listener on the browser’s `serviceWorker` object. In my case, I just initiated a fresh request to get the list of “to do” items and display them. A _better_ application than mine would already be showing the list with the proper updates, so it might just display an indicator next to the item to show that it has been saved to the server.

1
2
3
4
5
6
7

```navigator.serviceWorker.addEventListener(``'message'``,``` ```function``(event) {```
`if` `(event.data && event.data.name) {`
`if` `(event.data.name ===` ```'syncComplete'``) {```
`app.getList();`
`}`
`}`
`});`

#### Application to Service Worker

I noted my earlier confusion and surprise that the service worker didn’t automatically retry a background sync when the browser regained a network connection. However, using a simple listener in the application and posting a message to the service worker, I could _force_ the behavior that I expected. This part was a bit tricky. The API documentation showed that I could use `navigator.serviceWorker.controller.postMessage(message);` but the `controller` was always null! A little more research showed that I needed to wrap the call in a Promise, create a MessageChannel, and pass in a port along with the message.

1
2
3
4
5
6
7
8

```window.addEventListener(``'online'``,``` ```function``(event) {```
`return` `new` ```Promise(``function``(resolve, reject) {```
`var` `messageChannel =` `new` `MessageChannel();`
`navigator.serviceWorker.controller.postMessage({`
`name:` `'processOutbox'`
`}, [messageChannel.port2]);`
`});`
`});`

The service worker needed a new event handler for the ‘message’ event. After moving some code from the ‘sync’ handler to a `processOutbox` function, I had this very simple bit of code. This would allow the application to ask the service worker to process the items in IndexedDB whenever needed.

1
2
3
4
5

```self.addEventListener(``'message'``,``` ```function``(event) {```
`if` `(event.data && event.data.name ===` ```'processOutbox'``) {```
`processOutbox(event);`
`}`
`});`

Once implemented, I could toggle the “Offline” status in dev tools and see the service worker begin to process the pending requests from IndexedDB! What happens in the service worker’s background sync in this case? It would have been initiated when registering the sync event and would have failed due to the browser’s network connection being disabled. The `online` event will trigger the message to the service worker, which will process the items in IndexedDB. When the service worker eventually attempts to retry the background sync, it will query IndexedDB which should be empty. Since there’s nothing to process, the Promise should resolve and the service worker’s task is done.

## Conclusion

This was a great way to better understand Progressive Web Applications and Service Workers, and there’s still a lot more to learn and experiment with. It’s always great to learn and keep up with new and emerging technologies. ThoughtWorks has recently [added Progressive Web Apps to their technology radar](https://www.thoughtworks.com/radar/techniques/progressive-web-applications), which indicates growing enthusiasm for PWAs. Reports from early adopters of PWAs show [promising metrics on user engagement](https://www.smashingmagazine.com/2017/03/building-for-mobile-rwd-pwa-amp-instant-articles/#early-adopters-of-progressive-web-apps-report-exciting-metrics).

Browser support for PWAs is actually pretty strong. Google has been the primary driver behind the technology, so it is little surprise that browsers based on Blink and V8 (Chrome, Opera, Vivaldi, etc) have the highest levels of support. Firefox supports Service Workers, but does not yet support background sync. Even [Microsoft has begun development for Service Workers in Edge](https://developer.microsoft.com/en-us/microsoft-edge/platform/status/serviceworker/). The most notable absence is Apple and their Safari browser. The webkit site currently lists Service Workers as [“Under Consideration”](https://webkit.org/status/#specification-service-workers).

Progressive Web Applications offer an interesting alternative to native and hybrid mobile applications. The lack of support for Service Workers in Safari dampens enthusiasm somewhat, as iPhone users will not get the benefits that Service Workers provide. However, the applications will still be fully functional. The gradually increasing [abilities of web browsers](https://whatwebcando.today/) means that more and more functions formerly reserved for native applications can be done with a web application. Google is [integrating PWAs more deeply into Android](https://blog.chromium.org/2017/02/integrating-progressive-web-apps-deeply.html), and soon installed PWAs will appear in the users’ app drawers and work more like a true app and less like a glorified web link on the homescreen.

If I were to start writing a new web application tomorrow, I’d advocate making it a PWA. I found the basic creation of a PWA – adding a service worker to cache the required, static resources – to be trivial. Caching of dynamic data was relatively easy, though implementing just the _right_ caching and retrieval strategies for that data can be a tricky task. Libraries such as [sw-toolbox](https://googlechrome.github.io/sw-toolbox/) can make that easier. I’m most excited by the possibilities background sync allows, though it comes with a host of challenges in how to present the UI when there are pending changes. Using an actual UI framework can help with this. In fact, I’ve just run across [Redux Offline](https://github.com/jevakallio/redux-offline) to create optimistic UIs with React.

### Resources

