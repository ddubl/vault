---
id: 42pqdeovognrpid5jikx6ab
title: SIMD types
desc: ''
updated: 1633274792147
created: 1633199321494
---


The experimental JavaScript SIMD API introduces vector objects that utilize SIMD/SSE instructions on supporting CPUs; [SIMD](https://developer.mozilla.org/en-US/docs/Glossary/SIMD) is short for Single Instruction/Multiple Data. *SIMD operations* are methods that process multiple data with a single instruction. In contrary, *scalar operations* ([SISD](https://developer.mozilla.org/en-US/docs/Glossary/SISD)) process only one individual data with a single instruction.

Processing a data set with a single instruction can bring a big performance win to your application. How much depends on the size of the *data set* (or *vector*, or *packed data*) among other things. Thus, SIMD operations are widely used for 3D graphics and audio/video processing, physics simulations, cryptography, and other domains.

A downside of SIMD, and this is why algorithms need to be designed for SIMD, is that the packed data set can not be processed differently while your algorithm often needs to process different data differently. We will learn later in this article how we can work with masks and how to re-align our data to address this problem.

Shared memory or thread level parallelism allow different parallel paths on multiple data and with multiple instructions (MIMD). Parallel programming can be simpler with these techniques, but these concepts can also be used together with SIMD. For example, you could image to have SIMD vectorization that is utilized in each thread of your program. This [Mandelbrot demo](http://peterjensen.github.io/mandelbrot/js/mandelbrot-ww-asm.html), by Peter Jensen (Intel), demonstrates the performance gains of SIMD and [Web Workers](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API), for example.

## SIMD in JavaScript

The [JavaScript SIMD API](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD) consists of several new [data types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD#Data_types) and [operations](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD#Operations) allowing you to make use of SIMD instructions from JavaScript. Browsers provide highly optimized implementations of this API depending on the underlying hardware of the user. Currently, the JS SIMD API is especially modeled for [ARMv7 platforms with NEON](http://en.wikipedia.org/wiki/ARM_architecture#Advanced_SIMD_%28NEON%29) and [x86 platforms with SSE](http://en.wikipedia.org/wiki/Streaming_SIMD_Extensions).

Let's look at a SIMD data type, for example [`SIMD.Float32x4`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32x4). A SIMD vector consists of multiple data units, they are called *lanes*. A SIMD register for the current API is 128-bit wide. For a vector of length 4 (`x4`), there are 4 `Float32` types that fit in and the lanes are named `x`, `y`, `z`, and `w`. Now, instead of having to perform 4 separate operations on each of these lanes, SIMD allows you to perform the operation on all 4 lanes simultaneously.

In the following figure, there is only a single instruction (addition) and thus the data can be processed using SIMD:

SISD (image/png) SIMD (image/png)

Figures 1 and 2: SISD and SIMD compared.

The scalar / SSID code could like this (without any loop, just for illustration):

```
var a = [1, 2, 3, 4];
var b = [5, 6, 7, 8];
var c = [];

c[0] = a[0] + b[0];
c[1] = a[1] + b[1];
c[2] = a[2] + b[2];
c[3] = a[3] + b[3];
c; // Array[6, 8, 10, 12]
```

Now using SIMD:

```
var a = SIMD.Float32x4(1, 2, 3, 4);
var b = SIMD.Float32x4(5, 6, 7, 8);
var c = SIMD.Float32x4.add(a, b); // Float32x4[6, 8, 10, 12]
```

This will add the values in the four lanes simultaneously and give you back a new SIMD `Float32` type with all lanes added.

As you can see in the three lines of SIMD code, a set of JavaScript functions lets you create the packaged data types and gives you access to the vectorized instructions (addition here). At the time of writing this article, there is no operator overloading (i.e. a `+` sign) implemented to ease the writing of SIMD code like this. However, the JavaScript SIMD API is not yet finished and there are plans to include operator overloading in one of the next drafts. You can follow the specification development in the [ecmascript_simd GitHub repository](https://github.com/tc39/ecmascript_simd).

## Re-aligning data to suit SIMD vectors

Oftentimes there are arrays that serve as input data for SIMD vectors. However, the structure of these arrays might not always be suited for SIMD operations. Let's take a look at RGBA color data in images, for example.

With the help of the [`CanvasRenderingContext2D.getImageData()`](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/getImageData) method in a canvas and the [`ImageData.data`](https://developer.mozilla.org/en-US/docs/Web/API/ImageData/data) property you can get back the underlying pixel data as a one-dimensional array containing the image data in the RGBA order, with integer values between `0` and `255` (included):

`[R, G, B, A, R, G, B, A, R, G, B, A, ...]`

If we now want to process this image, for example calculating the [perceived luminance/grayscale](http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale) with the formula `Y = 0.299r + 0.587g + 0.114b`, we need to restructure the data for SIMD. The idea is to process the different weights for r, g, and b in a SIMD suitable format with one instruction per color data. This could look like this:

`[R, R, R, R, R, R, ...] * 0.299 +
[G, G, G, G, G, G, ...] * 0.587 +
[B, B, B, B, B, B, ...] * 0.114 =
[Y, Y, Y, Y, Y, Y, ...]`

## Parallelizing conditional branches

In scalar code, branches based on conditions are used to control the processing flow like in the following example:

```
var a = [1, 2, 3, 4];
var b = [5, 6, 7, 8];
var c = [];

for (var i = 0; i < 4; i++) {
  if (a[i] < 3) {
    c[i] = a[i] * b[i];
  } else {
    c[i] = b[i] + a[i];
  }
}

console.log(c); // [5, 12, 10, 12]
```

We don't want to compose SIMD vectors for every branch and execute them sequentially. SIMD provides are more efficient way using selection masks.

### Branching, masking, selecting

The [`SIMD.%type%.select()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD/select) method selects lanes from a selection mask. This allows you to to create branches so that you can operate on a fraction of data in SIMD data types. In the following image, a custom mask selects a result from the SIMD vectors a and b:

(image/png)

Boolean masks can either be returned by several [comparison functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD#Comparisons), or you can use one of the [SIMD boolean types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD#SIMD_boolean_types) to create your own mask.

With this technique we can rewrite the the scalar branches from the last code example using the `select()` function and executing the multiplication and addition in parallel:

```
var a = SIMD.Float32x4(1, 2, 3, 4);
var b = SIMD.Float32x4(5, 6, 7, 8);

var mask = SIMD.Float32x4.lessThan(a, SIMD.Float32x4.splat(3));
// Bool32x4[true, true, false, false]

var result = SIMD.Float32x4.select(mask,
                                   SIMD.Float32x4.mul(a, b),
                                   SIMD.Float32x4.add(a, b));

console.log(result); // Float32x4[5, 12, 10, 12]
```

In this SIMD version of the previous example, data is put into SIMD vectors again. Then, in order to create a branch based on a condition, the [`SIMD.Float32x4.lessThan()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD/lessThan) function is used. It returns a selection mask with Boolean values depending on which lane is `true` or `false` in this comparison. The first comparand is the vector `a` and the second comparand is created by the [`splat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD/splat) function, which sets all four lanes to 3. This makes this comparison the same as in the scalar version (`a[i] < 3`).

To get the actual result from the selection mask, the `select` function is used. It takes three parameters: the first is the mask, the second parameter is the `trueValue`. If the selector mask lane is `true`,  the corresponding lane value are picked from the `trueValue`. If not, lane values are picked from parameter number three, the `falseValue`.

## More SIMD algorithms and use cases

In general, data that can be processed with the same set of instruction can highly benefit from SIMD. The following algorithms and use cases can benefit greatly from SIMD operations:

* [Converting data to another type](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD#Data_conversions)
* Algorithms: [Sum of absolute differences (SAD)](http://en.wikipedia.org/wiki/Sum_of_absolute_differences), [Discrete cosine transform (DCT)](http://en.wikipedia.org/wiki/Discrete_cosine_transform)
* Graphics: Rasterization, pixel shading, ray tracing.
* Mathematics: Matrix operations, linear algebra.

## Status of SIMD in JavaScript

The SIMD API is available in recent versions of [Firefox Nightly](http://nightly.mozilla.org/). It is [in a Preview Build of Microsoft Edge](https://status.modern.ie/simdes7) and there is an ["Intent to implement" in Blink/Chromium](https://groups.google.com/a/chromium.org/forum/#%21topic/blink-dev/2PIOEJG_aYY).

The [SIMD specification](http://tc39.github.io/ecmascript_simd/) is under development and is proposed for inclusion in ECMAScript 2016.

A Polyfill reference implementation based on [typed arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays) is available in the [ecmascript_simd](https://github.com/tc39/ecmascript_simd) GitHub repository.

## See also

* [`SIMD`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SIMD) reference pages, listing all available SIMD types and operations.
* [SIMD Programming in JavaScript](https://www.youtube.com/watch?v=CbMXkbqQBcQ), talk by Peter Jensen, Intel.
* [Mandelbrot animation using SIMD,](http://peterjensen.github.io/mandelbrot/js/mandelbrot-ww-asm.html) demo by Peter Jensen, Intel.
* [The state of SIMD.js performance in Firefox](https://blog.mozilla.org/javascript/2015/03/10/state-of-simd-js-performance-in-firefox/), blog post by Benjamin Bouvier, Mozilla.
