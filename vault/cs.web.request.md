---
id: n95id6pzy15p78yupr5unov
title: Request
desc: ''
updated: 1633199321489
created: 1633199321489
---

The `**Request()**` constructor creates a new [`Request`](https://developer.mozilla.org/en-US/docs/Web/API/Request) object.

## Syntax[**Edit](https://developer.mozilla.org/en-US/docs/Web/API/Request/Request$edit#Syntax)

var myRequest = new Request(input, init);

### Parameters

*input*

Defines the resource that you wish to fetch. This can either be:

* A [`USVString`](https://developer.mozilla.org/en-US/docs/Web/API/USVString) containing the direct URL of the resource you want to fetch.
* A [`Request`](https://developer.mozilla.org/en-US/docs/Web/API/Request) object, effectively creating a copy. Note the following behavioural updates to retain security while making the constructor less likely to throw exceptions:
    * If this object exists on another origin to the constructor call, the [`Request.referrer`](https://developer.mozilla.org/en-US/docs/Web/API/Request/referrer) is stripped out.
    * If this object has a [`Request.mode`](https://developer.mozilla.org/en-US/docs/Web/API/Request/mode) of `navigate`, the `mode` value is converted to `same-origin`.

*init* Optional

An options object containing any custom settings that you want to apply to the request. The possible options are:

* `method`: The request method, e.g., `GET`, `POST`.
* `headers`: Any headers you want to add to your request, contained within a [`Headers`](https://developer.mozilla.org/en-US/docs/Web/API/Headers) object or an object literal with [`ByteString`](https://developer.mozilla.org/en-US/docs/Web/API/ByteString) values.
* `body`: Any body that you want to add to your request: this can be a [`Blob`](https://developer.mozilla.org/en-US/docs/Web/API/Blob), [`BufferSource`](https://developer.mozilla.org/en-US/docs/Web/API/BufferSource), [`FormData`](https://developer.mozilla.org/en-US/docs/Web/API/FormData), [`URLSearchParams`](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams), or [`USVString`](https://developer.mozilla.org/en-US/docs/Web/API/USVString) object. Note that a request using the `GET` or `HEAD` method cannot have a body.
* `mode`: The mode you want to use for the request, e.g., `cors`, `no-cors`, `same-origin`, or `navigate`. The default is `cors`. In Chrome the default is `no-cors` before Chrome 47 and `same-origin` starting with Chrome 47.
* `credentials`: The request credentials you want to use for the request: `omit`, `same-origin`, or `include`. The default is `omit`. In Chrome the default is `same-origin` before Chrome 47 and `include` starting with Chrome 47.
* `cache`: The [cache mode](https://developer.mozilla.org/en-US/docs/Web/API/Request/cache) you want to use for the request.
* `redirect`: The redirect mode to use: `follow`, `error`, or `manual`. In Chrome the default is `manual` before Chrome 47 and `follow` starting with Chrome 47.
* `referrer`: A [`USVString`](https://developer.mozilla.org/en-US/docs/Web/API/USVString) specifying `no-referrer`, `client`, or a URL. The default is `client`.
* `integrity`: Contains the [subresource integrity](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity) value of the request (e.g., `sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=`).

## Errors[**Edit](https://developer.mozilla.org/en-US/docs/Web/API/Request/Request$edit#Errors)

**Type**

**Description**

`TypeError`

Since [Firefox 43](https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Releases/43), `Request()` will throw a TypeError if the URL has credentials, such as http://user:password@example.com.

## Example[**Edit](https://developer.mozilla.org/en-US/docs/Web/API/Request/Request$edit#Example)

In our [Fetch Request example](https://github.com/mdn/fetch-examples/tree/gh-pages/fetch-request) (see [Fetch Request live](http://mdn.github.io/fetch-examples/fetch-request/)) we create a new `Request` object using the constructor, then fetch it using a [`GlobalFetch.fetch`](https://developer.mozilla.org/en-US/docs/Web/API/GlobalFetch/fetch) call. Since we are fetching an image, we run [`Body.blob`](https://developer.mozilla.org/en-US/docs/Web/API/Body/blob) on the response to give it the proper MIME type so it will be handled properly, then create an Object URL of it and display it in an [`<img>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) element.

```
var myImage = document.querySelector('img');

var myRequest = new Request('flowers.jpg');

fetch(myRequest).then(function(response) {
  return response.blob();
}).then(function(response) {
  var objectURL = URL.createObjectURL(response);
  myImage.src = objectURL;
});2468101214161820
```

In our [Fetch Request with init example](https://github.com/mdn/fetch-examples/tree/gh-pages/fetch-request-with-init) (see [Fetch Request init live](http://mdn.github.io/fetch-examples/fetch-request-with-init/)) we do the same thing except that we pass in an init object when we invoke `fetch()`:

```
var myImage = document.querySelector('img');

var myHeaders = new Headers();
myHeaders.append('Content-Type', 'image/jpeg');

var myInit = { method: 'GET',
               headers: myHeaders,
               mode: 'cors',
               cache: 'default' };

var myRequest = new Request('flowers.jpg',myInit);

fetch(myRequest).then(function(response) {
  ...
});24681012141618202224262830
```

Note that you could also pass the init object into the `fetch` call to get the same effect, e.g.:

```
fetch(myRequest,myInit).then(function(response) {
  ...
});246
```

You can also use an object literal as `headers` in `init`.

```
var myInit = { method: 'GET',
               headers: {
                   'Content-Type': 'image/jpeg'
               },
               mode: 'cors',
               cache: 'default' };

var myRequest = new Request('flowers.jpg', myInit);246810121416
```

You may also pass a [`Request`](https://developer.mozilla.org/en-US/docs/Web/API/Request) object to the `Request()` constructor to create a copy of the Request (This is similar to calling the [`clone()`](https://developer.mozilla.org/en-US/docs/Web/API/Request/clone) method.)

```
var copy = new Request(myRequest);2
```



**Note**: This last usage is probably only useful in [ServiceWorkers](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorker_API).

## Specifications[**Edit](https://developer.mozilla.org/en-US/docs/Web/API/Request/Request$edit#Specifications)

Specification

Status

Comment

[Fetch
The definition of 'Request()' in that specification.](https://fetch.spec.whatwg.org/#dom-request)

LSLiving Standard



## Browser compatibility[**Edit](https://developer.mozilla.org/en-US/docs/Web/API/Request/Request$edit#Browser_compatibility)

* Desktop
* Mobile

Feature

Chrome

Firefox (Gecko)

Internet Explorer

Opera

Safari (WebKit)

Basic support

42.0 [1]


[39](https://developer.mozilla.org/en-US/Firefox/Releases/39) (39) [2]

No support

29 [3]

No support

Streaming response body

43.0

?

No support

?

No support

`navigate` mode

49.0

[46](https://developer.mozilla.org/en-US/Firefox/Releases/46) (46)

No support

(Yes)

No support

`referrer` init option

?

[47](https://developer.mozilla.org/en-US/Firefox/Releases/47) (47)

No support

(Yes)

No support

cross-origin `referrer` stripped out and `navigate` mode converted to `same-origin` when constructor created from existing `Request` object.

(Yes)

[54](https://developer.mozilla.org/en-US/Firefox/Releases/54) (54)

No support

(Yes)

No support

* [1] Some default values for the init parameter changed in Chrome 47. See the Properties section for details.
* [2] Behind a preference in 34.
* [3] Behind a preference in 28.

## See also[**Edit](https://developer.mozilla.org/en-US/docs/Web/API/Request/Request$edit#See_also)

* [ServiceWorker API](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorker_API)
* [HTTP access control (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS)
* [HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP)
