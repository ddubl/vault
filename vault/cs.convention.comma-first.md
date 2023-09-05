---
id: 96nb1fx7b5mzw3jw4ztvcii
title: Comma First
desc: ''
updated: 1633199319537
created: 1633199319537
---

JavaScript · GitHub

[](https://gist.github.com/)[](https://gist.github.com/)**[isaacs](https://gist.github.com/isaacs)** / **[comma-first-var.js](https://gist.github.com/isaacs/357981)**

* [Sign in](https://gist.github.com/auth/github?return_to=https://gist.github.com/isaacs/357981)

A better coding convention for lists and object literals in JavaScript
[comma-first-var.js](https://gist.github.com/isaacs/357981#file-comma-first-var-js)

// See comments below.

// This code sample and justification brought to you by
// Isaac Z. Schlueter, aka isaacs

// standard style
var a = "ape",
  b = "bat",
  c = "cat",
  d = "dog",
  e = "elf",
  f = "fly",
  g = "gnu",
  h = "hat",
  i = "ibu";

// comma-first style
var a = "ape"
  , b = "bat"
  , c = "cat"
  , d = "dog"
  , e = "elf"
  , f = "fly"
  , g = "gnu"
  , h = "hat"
  , i = "ibu"
  ;

// error in standard style
var a = "ape",
  b = "bat",
  c = "cat",
  d = "dog"
  e = "elf",
  f = "fly",
  g = "gnu",
  h = "hat",
  i = "ibu";

// error in comma-first style
var a = "ape"
  , b = "bat"
  , c = "cat"
  , d = "dog"
  e = "elf"
  , f = "fly"
  , g = "gnu"
  , h = "hat"
  , i = "ibu"
  ;

// Objects:

// JSON.stringify style
var o = {
    a : "ape",
    b : "bat",
    c : "cat",
    d : "dog",
    e : "elf",
    f : "fly",
    g : "gnu",
    h : "hat",
    i : "ibu"
  },
  a = [
    [ "ape", "bat" ],
    [ "cat", "dog" ],
    [ "elf", "fly" ],
    [ "gnu", "hat" ],
    [ "ibu" ]
  ];

// comma-first
var o =
    { a : "ape"
    , b : "bat"
    , c : "cat"
    , d : "dog"
    , e : "elf"
    , f : "fly"
    , g : "gnu"
    , h : "hat"
    , i : "ibu"
    }
  , a =
    [ [ "ape", "bat" ]
    , [ "cat", "dog" ]
    , [ "elf", "fly" ]
    , [ "gnu", "hat" ]
    , [ "ibu" ]
    ];

// errors in objects:

// JSON.stringify style
var o = {
    a : "ape",
    b : "bat",
    c : "cat",
    d : "dog"
    e : "elf",
    f : "fly",
    g : "gnu",
    h : "hat",
    i : "ibu"
  },
  a = [
    [ "ape", "bat" ],
    [ "cat", "dog" ],
    [ "elf", "fly" ]
    [ "gnu", "hat" ],
    [ "ibu" ]
  ];

// comma-first
var o =
    { a : "ape"
    , b : "bat"
    , c : "cat"
    , d : "dog"
    e : "elf"
    , f : "fly"
    , g : "gnu"
    , h : "hat"
    , i : "ibu"
    }
  , a =
    [ [ "ape", "bat" ]
    , [ "cat", "dog" ]
    , [ "elf", "fly" ]
    [ "gnu", "hat" ]
    , [ "ibu" ]
    ];

// Addendum: effects on the return statement.
// It does not break.

return [ 1
       , 2
       , 3
       ] // returns [1,2,3]

return { a : "ape"
       , b : "bat"
       } // returns {a:"ape",b:"bat"}

// even just separating two values by commas is fine,
// though a bit silly
return 1
     , 2
     , 3
     , 4 // returns the last value, 4

// this, however is wrong:
return
    1
  , 2 // returns undefined, because of semicolon-insertion.

// so is this. otb == fail.
return
  { a : "ape"
  , b : "bat"
  } // returns undefined,
    // then creates a block with two named statements.

// this is ok:
return ( 1
       , 2
       ) // returns 2

// so is this:
return (
  { a : "ape"
  , b : "bat"
  }
) // returns {a:"ape",b:"bat"}

// Addendum 2: A function call

doSomething( aPrettyLongVariableName
           , "A string, which has some useful information"
           , "If you put these all together, it'd be too long"
           , { a: "is for antelope", b: "is for bat" }
           , 42
           )

// Addendum 3: More realistic error in standard style:

// leaks FIVE globals!
var a = "ape eat banana",
  b = "bat, allowed to fly",
  c = "cat toy",
  d = "dog chasing the mailman,"
  e = "elf lord",
  f = "fly through the air",
  g = "gnu is not unix",
  h = "hat goes on your head",
  i = "ibu isn't a cow";

// Error: Can't call method 'forEach' of undefined.
// not passing in undefined as an argument!??
mergeLists([ apple, [ penelope, granger ] ],
           [ fun ],
           [ 1, 2, 3, 4, 5, 6, 7, 8 ]
           [ "mary's store has many pies, and cookies, and eggs," ]
           [ function() { doSomething() } ]);

Note how the errors pop out in the comma-first style.

The object literal cases will throw, so they're not so hard to spot, though a final trailing comma will cause errors in MSIE. The missing comma errors are particularly devious when it comes to the `var` statement, and lists of arrays.

Missing commas in a `var` statement will cause global leakage, which can make for odd and hard to track-down errors. Pooh on JavaScript for defaulting to global scope unless you use `var`.

Pooh on JavaScript for using `[...]` to mean both "property access" and "array literal", but as a result of this poor choice of operator, `[[1,2][3,4]]` resolves to `[undefined]`, which is quite different from `[[1,2],[3,4]]`.

You code in the language you have. Like English and C, JavaScript is clearly not perfect, but it is widespread, and that is much more important.

Many decry comma-first as being "ugly" or "unclean". However, this is a statement about one's brain and habituation, not about the code itself. In my opinion, "clean" is defined as "easier to interpret quickly". If a given coding convention makes differences look different (especially errors) and another coding convention makes errors harder to spot, then it's clear that the first is more "clean". If you disagree, then apparently, "clean" just means "looks like what I saw yesterday and the day before". This rubric is worse than useless, as it specifically prevents innovation or improvement.

And, regarding "ugly"... ALL code is ugly. Yours, mine, everyone's. Code Is Ugly. Just face it. When someone says "beautiful code", hear "beautiful rotten entrails". The *only* beautiful code, the most clean code, is no code at all. If it's there, it's ugly. The unfortunate fact of software development is that, in order to create beautiful software, we must use ugly code.

The best we can do is make sure that there's as little code as absolutely necessary, and that it is as reliable and easy to interpret as possible. Conventions must be judged based on these standards. Anything that obscures the intent of the software is by definition "unclean", and every line of code is "ugly".

@xer0x (image/jpeg)

+1

@fabeat (image/jpeg)

thanks :)

@benvanik (image/jpeg)

Another advantage - if putting things in source control, you now only have to add lines instead of modifying them:
var a = {
x1: "a"
, x2: "b"
, x3: "c" <-- just one line added, no need to place comma on x2's line and modify it
};

Small, but in larger projects with lots of contributors it can get rid of a lot of potential collisions or weird merge errors where you end up missing commas. Still not sure about the first item in the list, but for long tables/etc it works.

@aheckmann (image/jpeg)

I used to use comma first but have gotten away from it recently. Excellent explanation issacs.

@rlr (image/png)

sweet. thanks

@gjohnson (image/jpeg)

Interesting explanation... my boss has been doing this *forever* with SQL and I thought he was the odd one! Starting to dig it though...

@fearphage (image/jpeg)

I have used comma first notation for ages. My reasoning is the comma actually belongs to and benefits the line after it so it makes more sense to be aligned that way. As benvanik stated, adding and removing lines is much easier and harder to mess up with this notation. I recently started using the semicolon to "close" the line in a new way (new to me):

```
var a = 1
  ,b = 2
  ,c = 3
;
```

The semicolon acts similarly to the closing brace in multi-line statements:
if (catpants) {
...
}

Thanks for the explanation.

@inimino (image/jpeg)

Well put, isaacs.

@natecavanaugh (image/jpeg)

Why not just put a var statement before each line, like so:
var a = 3;
var b = 1;
var c = 2;

?

I've heard that each var has some performance cost, but since the engine moves all initializations to the top of the scope, I've yet to actually see any quantifiable differences able to be measured.
The downsides are of course extra bytes, however when gzipped, the file size difference is negligible.
And of course it wouldn't address the JSON object formatting aspect.

Overall, I agree though that the comma delimited format with it's current formatting leads to a lot of global scope leakage. The main issue I would see with this would be a matter of convention confusion throwing most developers off.

@bluesmoon (image/jpeg)

What? You have linebreaks in your code? How cute.

@chrisdone (image/png)

This is the default style for Haskell. [http://github.com/tibbe/haskell-style-guide](https://github.com/tibbe/haskell-style-guide)

@kixxauth (image/jpeg)

Also, the comma first notation is more in line with the dot first notation commonly used for most of the same reasons:

```
jQuery('.clickable')
  .filter('a')
  .click(handler)
  .end()
  .show('slow');
```

Maybe it would be better to set the semi colon down 1 line too?

```
jQuery('.clickable')
  .filter('a')
  .click(handler)
  .end()
  .show('slow')
;
```

@mkeen (image/png)

Just because you don't understand programming aesthetics doesn't mean they don't exist.

http://www.paulgraham.com/hp.html

@bluesmoon (image/jpeg)

[@mkeen](https://github.com/mkeen): who was that comment directed at?

@secos (image/jpeg)

[@mkeen](https://github.com/mkeen): just because pg wrote something doesn't mean its right.

@mkeen (image/png)

[@secos](https://github.com/secos), That's just one example of a respected industry figure who disagrees with "some guy on Github". Doesn't matter that it happens to be Paul Graham. Read anything by Knuth and you'll see why this circlejerk is meaningless. Code can be beautiful, and I'd have to accuse anyone who disagrees of being a code monkey rather than an artist.

[@bluesmoon](https://github.com/bluesmoon), my comment was directed at the creator of this Gist.

@mkeen (image/png)

I'd also like to add that starting a line with a comma makes about as much sense as starting one with a semicolon.

@secos (image/jpeg)

[@mkeen](https://github.com/mkeen) I think you have missed my point.

@dakrone (image/jpeg)

Comma-first notation in javascript causes all kinds of warnings to be thrown for jslint, which is a very helpful tool for tracking down actual problems.

@mkeen (image/png)

[@secos](https://github.com/secos), I think you missed mine originally, but I do get your point. Obviously anything PG writes is not gospel. I was just providing one example of a well-thought out counterargument that is longer than 8 one sentence paragraphs, written by a guy who a lot of people happen to respect.

@isaacs (image/jpeg)

[@mkeen](https://github.com/mkeen) Paul Graham has written repeatedly on the importance of terseness, and removing unnecessary tokens from code. I'm not accusing you of calling his writing gospel, and I certainly disagree with some of his beliefs. But, on this point, we are very much in agreement. I'm sure that he'd agree that, in spite all its very useful features, JavaScript is one of the ugliest languages ever devised, both in syntax as well as in disorganization of design.

Terseness is not about reducing character count, but rather about reducing token count, and even more importantly, reducing the conceptual overhead of understanding the *intent* of code.

Knuth, as well, is famous for having written that programs should be written for people to read, and only incidentally for machines to execute. From that point of view, it is important to optimize the structure of code to take advantage of the conceptual facilities of humans.

Humans are strange compilers. Our internal heuristics warn about anything that looks odd, but after looking at the new style for a while, those "this is funny looking" warnings go away. My premise with this example is that we should worry less about "funny looking", and more about being able to quickly determine whether or not code contains a bug.

Code which expresses the intent of the programmer succinctly and clearly is as beautiful as the algorithm that the programmer devised. If you disagree with that point, then there's no point talking about code aesthetics, or quoting Paul Graham or Donald Knuth, because we're not using the same vocabulary. If you think that code beauty is subjective, then you're mistaking brushstrokes for painting.

regarding starting a line with a semicolon: This gist is only a small point of my overall coding style. In my own projects, I omit semicolons except where they are necessary. That is, in `for` loops, or at the start of any line that begins with a `[` or `(`. So, yes, I fully agree with that comment, if not the snide sentiment behind it.

If your style makes errors more difficult to see, even slightly so, then the burden of proof is on you to justify it.

[@dakrone](https://github.com/dakrone) jslint is overrated. Douglas Crockford is a very intelligent guy, and he's done a lot for the JavaScript language. He has a deep understanding of the principles of this language, and a profound talent for expressing them. He's been around, and knows the personalities involved. But his coding style make errors less apparent, so it would be irrational hero worship to not criticize it. It's ugly.

@isaacs (image/jpeg)

[@kixxauth](https://github.com/kixxauth) Why not just omit it? The rules for automatic line termination are not very complicated. It only causes problems if you have a `\n` after a `return`, or if you start a line with `(` (which will be interpreted as a function call) or with `[` (which will be interpreted as a property access). So, I *start* the line with `;(` or `;[` in those cases.

Reduce clutter. It does you no good. A linter is no replacement for understanding how your language works.

@mkeen (image/png)

[@isaacs](https://github.com/isaacs) JavaScript certainly can be ugly, and it's pretty hard to write "beautiful" code in it. But the argument you made is that all code is ugly. If we're going to talk only about JavaScript then this is an entirely different debate. I have to vehemently disagree with your original premise.

There are multiple dimensions to code aesthetics, and "the brush strokes" are a part of it, whether you want to acknowledge that or not. Your comma example (IMO) is a perfect example of illogical token order, which qualifies as pretty damn ugly to me. When was the last time you initialized an array and left out a comma? And when you did, how hard was it (really) to look back and realize your mistake? It's not a common mistake among experienced programmers (or difficult to debug), thus making the example a completely moot point. You're sacrificing (again, IMO) aesthetics to prevent a problem that you shouldn't even have to begin with.

I couldn't agree more that the succinct and efficient implementation of an algorithm is beautiful, but you can't tell me it would have quite the same quality with 10 linebreaks between each line, and a random number of tabs as a prefix to 40% of the lines. The brushstrokes are important, you can't deny that. We could debate on just **how** important all day, but that would get us nowhere.

@dakrone (image/jpeg)

[@isaacs](https://github.com/isaacs) On the subject of readability and making errors apparent, wouldn't the argument still work if you did something like this:

```
var foo = ["a"               ,
               "b"           ,
               "c"           ,
               "d"           ,
               "e"
               "f"           ,
               "g"           ,
               "h"
];
```

Still readable, still apparent which line has the error. (Please excuse the poor indention, not entirely sure how it works with Markdown). I know this isn't feasible for real coding, but I still feel like righthand commas are easier to grok, especially for heavily nested code like this (written by someone else): http://gist.github.com/400108

I know that example isn't following the guidelines you wrote, but I think it does show how pre-pending can be misused to a harder-to-read state.

On the subject of jslint, I believe it isn't overrated, I use a text editor for js that auto runs jsl on file save and marks lines with errors, it's great for catching the odd missing semi-colon or == cast problem, with pre-pended commas every line is marked as an error.

As far as Douglas Crockford is concerned, I wasn't talking about his jslint, I was talking about the jslint here: http://www.javascriptlint.com/, written by Matthias Miller.

In the end, I think it's subjective, some people like prepend (which is perfectly fine), some people like append (which is also fine). I think having an editor with good syntax highlighting goes further than where the comma is placed. Thank you for sharing the options with this, I think I'll bring up the justification issue with the person who likes prepending to see if I can make it a little easier on the eyes then having the first line be out of column-sync with the rest of the lines.

@isaacs (image/jpeg)

[@mkeen](https://github.com/mkeen) The brushstrokes are important, but only insofar as they make the picture more or less beautiful. I'm not arguing about the degree of their importance, but rather **why** they are important. Let's not forget what matters.

Code must be judged based on its utility, and rather than on programmer habituation. **That** is my original argument: that *all* code can be considered ugly if we limit ourselves to subjective habituation, and that true code beauty arises out of expressing an algorithm in a way that allows it to be understood as effectively as possible. It is a programmer's responsibility to habituate himself to respond positively to code that is more quickly understood. It takes some practice, and anyone who shies away from that practice is not an engineer or an artist, but a simpleminded monkey banging rocks together because that's How We Always Have Done It.

Fuck. That. Shit.

We can do better. We're the smart guys, right?

[@dakrone](https://github.com/dakrone) While your "lots of spaces" style is slightly clearer than the jslint style, it still isn't as visually obvious as comma-first. Putting relevant tokens at the *end* of the line is more brittle than putting relevant tokens at the *beginning* of the line. In a delimited list, delimiters "belong" to the thing they're delimiting, not the thing that they're delimiting from.

The code in the gist you linked has other issues. For starters, it's inconsistent, and exhibits a naive reduction of whitespace to no benefit.

@natecavanaugh (image/jpeg)

[@isaacs](https://github.com/isaacs)
I actually agree with you, that code beauty being intrinsically attached to the clarity of the algorithm it is expressing. However, there is a subjective line in all of this, and a good example is a mini-debate a fro-worker and I had over which is more readable as a property: a space-delimited string with a .split(' ') at the end, or a native array.
So basically 'var1 var2 var3'.split(' ') vs. ['var1', 'var2', 'var3']
He truly believes the string is easier to understand, and I argued that the array was easier to understand. For him the quotes and brackets add too much noise to the values, and for me, they add clarity of what I'm working with.
There really is no counting for personal mental heuristics. (This is up to a point though).

Regarding your comment about the delimited list and delimiters, why not just separate all of the vars into their own declaration?
Like I said above:
var a = 1;
var b = 2;
var c = 3;

All of the initializations will be hoisted, so there won't be a performance impact.
All of the important delimiters are at the beginning of the string.
You're guaranteed to not be creating a global var even if you forget a trailing semi-colon.

For the criticism of adding extra code weight, 1. gzipping will take care of that, 2. are we writing code for a machine to read or for people to read?
Code should be written for a machine to execute, and people to read, hence it should be as clear as possible, and let the machine take care of what optimizations (such as minification, variable hoisting, etc) it needs.

Interested to hear your thoughts :)

@isaacs (image/jpeg)

[@natecavanaugh](https://github.com/natecavanaugh)

re: `["a","b","c"]` vs `"a b c".split(" ")`
These two are pretty close in terms of readability, imo. You're right, though, at a certain point, the differences are so subtle that it's hard to make an argument for one style over another based on objective universal principles of human cognition. Our brains *are* a little different from person to person.

re: extra code weight and putting every `var` on its own line

It's true, the parser doesn't care. There is no performance effect. And two var statements gzip better than a single var with a comma. Code weight isn't about machine optimization.

Long before anyone ever considered sending uncompiled code over a network, "code weight" was definitely a thing worth considering, precisely because we're writing code for humans to read. Authors have valued succinctness forever, especially in precise technical documentation. One of the reasons why Aristotle is still famous today is that his books waste no words. Paul Graham is also a master of this in code and in words, and is his main claim to fame. (Yeah, he also started Viaweb, but there are a lot of rich startup founders that no one knows or cares about.)

Consider these two passages:

```
The mother has brown hair.
The child has brown hair.
The father has brown hair.
```

Versus:

```
The mother, child, and father have brown hair.
```

Certainly, as natural languages are subtle, there are cases where it is better to separate out the statements for some effect. But, if your intent is simply to communicate the hair color of the three individuals and move on to the next part of the story as easily as possible, joining the sentences together is clearly preferable. A long stream of simple `single-subject verb single-object` sentences is easy to write, but tedious to read.

It is tempting to say "well, reading the first passage was trivial, and the second passage was also trivial, and 0 == 0, so what's the difference?" However, not everything that rounds to zero is actually zero. A slight difference multiplied many times over becomes relevant.

It's **hard** to write succinctly. It is real work to pore over a line multiple times trying to see if you can make it tighter, or trace through the logic of an function or paragraph looking for redundancy. But if you care about your message and your reader, then it is irresponsibly lazy to make them carry the extra mental weight of the words you couldn't be bothered to trim.

@natecavanaugh (image/jpeg)

I tend to agree with you, and I think in spirit, if not in exact application we agree pretty much whole heartedly.
I personally think it's all about trade-offs.

1. I think the passages comparison is flawed simply because the amount of information that's duplicated between the two is redundant *valuable* information, not tokens, so yes, minimizing that is definitely optimal.
    A better comparison would be between:
    The mother, the child, and the father have brown hair.
    vs.
    The mother, child, and father have brown hair.

It's an added token (whether that token was one or many words is probably less relavent, but I can't think of any multi-word tokens that don't contain some value as an example).

1. "It's hard to write succinctly." I think the argument about it's difficulty to write is really a matter of which editor you use and which habits you have. Having written in this style for many years now, and read this style on our team, it is for me easier to scan blocks of code because I can easily see where assignments of variables are happening, and where they're not, and my mind just ignores the word var as a simple token.
    Commas therefore actually have more important meaning in the application (meaning I spot them quicker if they seem out of place).
    But whether it's harder to write is moot, IMHO. Muscle memory has taken care of whatever editor shortcuts don't.
2. I think between duplicate vars, and the JSLint style, I've spent FAR more time poring over the JSLint style trying to find missing commas and searching for accidental globals than on any overhead that an extra var on the line has added.
    Where I think the duplicate var style I propose is better than the one you propose is that your convention is far more unconventional, meaning it's much more fraught with developers getting confused when maintaining or reading it, or possibly introducing bugs because they don't understand it.
    However, any JS developer *should* understand the var syntax and even those who only have a cursory understanding of JS will probably have no issue with it. There's no confusion, it's as conventional as the language itself.
    However, given the weird quirks that exist in the language all on it's own, when we have multiple people that need to touch a file (perhaps to fix a simple bug, such as a misnamed variable), and those support engineers may not be JS experts, standard conventions have helped us go a long way to helping them be productive.

But, alas, whatever helps you ship better apps faster :)

@mkeen (image/png)

[@isaacs](https://github.com/isaacs) Code should be judged on lots of things. Any programmer worth half a shit should be able to program the most efficient and succinct implementation. I don't think that's the issue at hand. The issue is whether said programmer decides to shit all over said implementation with something as horrifically illogical (and thus ugly) as comma-first notation.

I don't need to train myself to think it's beautiful. If you do, then great - more power to you. I'll stick to my original argument that it makes the same amount of sense as starting a line with a semicolon. It reduces errors and "makes your code easier to read, and less prone to errors". But that'd be ugly as hell, and even more obviously ridiculous.

@isaacs (image/jpeg)

[@mkeen](https://github.com/mkeen)
Why is it "illogical"? What's wrong with starting a line with a semicolon? I suspect you're rationalizing an emotional reaction. If you can't justify your reactions based on software quality, then I'll have no choice but to stop caring about what you have to say.

[@natecavanaugh](https://github.com/natecavanaugh)
When I said that it's hard to write succinctly, I was not talking about editor shortcuts or the extra typing. I was referring to organizing an idea into a coherent structure that eliminates unnecessary noise. I was talking about communication of ideas, whether it is in words or code.

Tokens aren't free. You may not notice the cost, since you've built up those muscles carrying the extra load, but it still *is* extra. I've been told by philosophy majors that Kant "isn't that bad" to read.

Regarding #2, I think you underestimate the ability of new programmers to pick up style. The brain is more malleable than you're giving it credit for. If you're hiring such lazy idiots that they can't be bothered to learn how the language works, or if you've got veteran programmers who can't find the time to review code before approving it, or no approval process at all, well, you've got much bigger problems. However you go about solving them, I can't really criticize the tradeoffs you have to make.

The better solution, of course, would be to hire people who know what they're doing, or get hired someplace where they do.

@mkeen (image/png)

[@isaacs](https://github.com/isaacs) Your pseudo-intellectual drivel is becoming unbearable. It's illogical to start lines 2 - 5 of a 5 line program with a semicolon because it's invalid to start line 1 with one. Semicolons and commas are necessary as a direct side effect of the tokens that preceed, not proceed them.

Not sure what you're confused about.

@natecavanaugh (image/jpeg)

I love how you cherry pick your arguments here. In #1, you take the populist route with saying that tokens aren't free, and that reading:
var x = 0;
var y = 1;
is a mental hurdle equivalent to parsing Kant for developers, because of the extra var.
However, in #2, anyone who doesn't understand why there are comma's sitting at the beginning of the line, a style unseen practically **anywhere** else, is a lazy idiot who shouldn't be allowed to touch that code.

First, people who touch your precious code may not be idiots if they don't have the same experience level as you, they could be people just trying to help out, hence what you have the code reviews for.
But unconventional styles shouldn't get in the way, especially in a language as dynamic, powerful, and unruly as Javascript.
Now mind you, "unconventional" is as loaded a term as "open" and "free", so it is relative to those you want to support.
If you have an all Haskell backend, this style fits great for those guys who don't write much JS, but helps them be able to criss-cross code bases and test things out, play around, experiment without getting frustrated by unconventional styles being mixed in unnecessarily.

"The better solution, of course, would be to hire people who know what they're doing, or get hired someplace where they do."

This is your argument **for** writing in an unconventional style, to get around the problems of a more conventional style (JSLint) that has known issues with introducing bugs as opposed to writing in a style that is completely obvious as to it's intent, is free from the bugs the prompted this gist.

This same argument you're using could be applied by anyone who thinks that things like inline conditions:
if(true) doFn();

should be encouraged. Yeah, everyone who writes code for a living should know what they're doing.
The point of arguing code aesthetics and for arguing over expression of intent, clarity of the algorithm, coding defensively, etc is to make the burden lighter on everyone. When you're reading code, you shouldn't be asking why it's laid out a certain way, or if it gets dropped to a new line, what happens, it should just make sense.

Having written all of that, now, I think I can sum up that I think the problem I see with your gist is that it's non-standard, and IMHO misguided. As for being non-standard, this is a ever-changing thing, and could sweep the nation by storm, and, be a moot point by Tuesday.
But if only one guy is writing code this way in an organization/community, it's a ridiculous format (though admittedly, less dangerous than the JSLint style). If this is a standard that everyone follows, it may not be to my taste, but I do agree with you that people can adopt to it easily.
Why I think it's misguided is that it seems to be focused on solving a certain problem (spotting an error), but not on actually doing what the intent of the code is (defining variables).
This perhaps all personal taste, so I'm not holding it too tightly, but when I read the above code, the commas become the focus, not the variables. Then the missing commas become the focus, not the variables.
Perhaps this is because of the nature of the variables you're using (next to 1 letter variables, **any** token looks gargantuan, but next to something like `sessionTimeout = 0` it might look much more inconsequential, and it could be a simple matter of my editor highlights "var" whereas commas get the same treatment as the text, which is a fixable issue).

Overall, the focus seems to be on terseness of "clever" code, rather than on clarity of "simple" code (quotes because they're not only qualitative, but that quality states are fractionally different).

At the end of the day, I am extremely happy that you've raised this issue of the JSLint syntax causing global pollution, and any exploration of solutions to that is a net positive :)

@isaacs (image/jpeg)

[@mkeen](https://github.com/mkeen) It is not invalid to start line 1 of a program with a semicolon. It is not necessary to start any line with a semicolon unless it would otherwise begin with a `(` or `[`. I'm not sure where you got the idea that I was advocating for using tokens that aren't relevant. That's sort of the opposite of my whole mission here.

[@natecavanaugh](https://github.com/natecavanaugh) My analogy to Kant was simply pointing out that what *feels* heavy varies from person to person. However, regardless of what you're used to, it is a tautology that having less code means that there's less code. Style that makes errors more apparent means that errors are more apparent. Duh.

Why do we put semicolons at the end of every line in JavaScript? It's not necessary. We do it because a lot of early JavaScripters were Java and C programmers, and those languages require it. But JavaScript doesn't. It's noise. I can't understand why people call noisy code "clean". It is clear to me that most of the time, "clean" means "looks like what I wrote yesterday", and "unclean" or "messy" is "doesn't look like what I wrote yesterday."

You're right about the "exampleness" of the gist. Short tokens were specifically chosen to highlight the point I was trying to make. You should check out my "npm" project for a decently sized program that uses this style throughout. [http://github.com/isaacs/npm](https://github.com/isaacs/npm)

I'm not trying to write clever code. I'm trying to write clear code. In npm, commas are directly underneath the token that caused it (if the list spans multiple lines). Semicolons are only in for loops and preceding opening square braces and parens. Every line is under 80 characters long. (If you find any exceptions, and I'm sure that there probably are some, I'd love a patch.)

There are very specific reasons for these choices. Package management is a fundamentally tricky problem to get right, so it is important that the code be optimally scannable. If I can prevent an entire class of errors by enforcing a style, then that seems like a no-brainer. If it looks ugly at first, well, that's a problem that'll correct itself as I get used to the new style.

"Standard" is whatever we call it, and it varies from place to place. In npm, this is the standard style. Other projects may use different styles. When I contribute to node, I use semicolons, because that's what node does. My argument here is ultimately for a more rational rubric for judging code styles than "GRR UGLY I DON LIKE", which is unfortunately about the depth of most code style discussions.

You'll note that the vast majority of the "against" sentiments in the thread above (including yours) make no arguments other than "it's not common", "that's ugly", and "jslint says it's bad". Of *course* it's not common; if it was, I wouldn't've bothered writing about it. Of *course* it appears ugly if it's not what you're used to. And JSLint is a program borne out of the necessity to use an automated checker to find errors, precisely because the "standard" style is so impossible to scan.

A demonstrably substandard style will remain "conventional" as long as we allow it to. That just seems dumb to me. I understand that we can't change the whole world overnight. But we can change our own projects. If you care enough about JavaScript to even bother arguing about this, why not do a little bit of work to make your brain accept what's best for it?

EDIT: fixed a typo

@natecavanaugh (image/jpeg)

"However, regardless of what you're used to, it is a tautology that having less code means that there's less code. Style that makes errors more apparent means that errors are more apparent. Duh."
Unless I'm stuck on stupid, I don't see where I made a tautological reference, implicit or otherwise. Unless you just happen to believe the main point of written code is to express possible errors, which you clearly don't.
The main point of code, which we agree upon, is to express an algorithm. What I'm stating is that your style makes that algorithm ambiguous, but offers the benefit of making errors more apparent. You're making a tradeoff, and I'm saying if the main goal of code is to express intent first, and expose errors second (if such things have to be ranked, as in this case), you're picking the second. Of course, maybe we disagree on that presupposition.

"It is clear to me that most of the time, "clean" means "looks like what I wrote yesterday".
"Clean" implies a lot of things, many of them personal, but consistency is definitely one that is more quantifiable. It's a massive pain to maintain any decent sized code base that is a hodgepodge of styles, where methods are ordered inconsistently, variables named in ways that only make sense to the original developer (if at all), and where there is no standard of trust for navigating source.

Consistency is the foundation of trust, and that doesn't mean styles can't evolve or change, but the rule should be, if this is really an improvement, then the improvement should be made everywhere. Otherwise, it's not worth doing, and is only a passing whim or idea that will end up leading to messiness later.
(I'm talking about moving out of sandboxes, of course. Sandboxes are meant for experimentation).

Anyways, here is the argument against, and I'll restate it, since it seems you've glossed it over (or, I had miscommunicated it):
Your proposed style (and the JSLint style) is ambiguous when compared to the one I mentioned.

In Javascript, commas separate an expression.
In your example, you're using them as tokens to delineate the creation of a variable.
You're using the comma as a shorter version of the word "var", but you are losing the value of the **intention** of the keyword.
You're beginning a statement with "var", then defining more vars with what appears to be ","

You could say you're just separating expressions in a more readable format. Fine, but it's only benefit is for spotting errors, not for the intent of defining variables.

"Ugly" does come down to personal taste, and we might as well start arguing about our favorite beverages, and then start biting each other, for all the good it will do to prove each other wrong.

But just for clarity sake, where I stand is, I'm not arguing for the JSLint style (in fact, I loathe). I think your style is superior to it.
I just personally think the var per line style is better, if more long-winded. Just like my arguments ;)

@smith (image/png)

> Why do we put semicolons at the end of every line in JavaScript? It's not necessary. We do it because a lot of early JavaScripters were Java and C programmers, and those languages require it. But JavaScript doesn't. It's noise.

It would be nice if that were true, but semicolon insertion can cause problems. Consider:

```
return
    {}
```

returns undefined.

I'm all for having flexibility from Crockford's proposed conventions, but many of them exist for good reasons.

@isaacs (image/jpeg)

[@smith](https://github.com/smith) According to both my and crockford's rules of style, a return on a line by itself is not allowed, nor is starting a line with an open-brace. I gave examples of this situation in the gist.

The only case where relying on automatic semicolon insertion is problematic is when a line starts with `(` or `[`, and is not intended to be a function call or property access, respectively. In those cases, I start the line with a semicolon.

I challenge you to find any other cases where semicolon insertion is problematic, or any case at all where my style is less safe than jslint's.

@isaacs (image/jpeg)

[@natecavanaugh](https://github.com/natecavanaugh)

Aha, I had missed the push of your "ambiguous" claim. It seems like you're saying that a comma can mean multiple things. I disagree. In this style, a comma always means "continue the thing above." A line of commas vertically connect the opening and closing tokens in a list or hash, and a vertical cascade of commas connects multiple var statements. The commas join them together into a block.

Once you start seeing a vertical line of commas in this way, your eyes can naturally move up and down the left border they form. Deviations in the pattern are apparent and jarring. If you have ever seen an eye-tracking heat map, this makes sense. It's the same reason why in text we so often have a heading followed by a bulleted list -- the bullets form a vertically-aligned "chain" that the eyes can easily follow. We naturally scan across the first line, then down the left edge.

We do seem to agree with the basic principle that relevant tokens, especially repeated ones, belong at the *beginning* of the line, rather than at the end. My use of semicolons (not featured in this gist, but very apparent in npm) is that principle taken to its logical extension. When they are relevant, they start the line. When they're not, I omit them.

I'm sure that people who grow up reading right-to-left languages probably disagree with me, and would rather that code be right-justified. But, for better or worse, computer code follows Euro-centric patterns, and as long as we write in a left-justified indented style, lining up tokens on the left makes a lot of sense.

I was the one making the tautology, by claiming that less code is less code. The main point of written code is to express an algorithm, and except for pathological code-golf stuff, terser code tends to be a clearer expression of that algorithm.

```
Consistency is the foundation of trust, ...
the rule should be, if this is really an improvement, then
the improvement should be made everywhere.
```

That is a brilliant quote. I wholeheartedly agree. It was never my intention to say that we should all start using this style now everywhere. But, it is possible to say "That is a superior style for objectively valid reasons, and I could learn to enjoy looking at it, but I'm not at a point where I can refactor this whole codebase to use it, so I'm going to wait." Or even, "That is a better style, but my target audience is jQuery users, so I'm going to use 500-character lines and indent randomly so that they feel at home."

My point is simply that we should judge things based on their merits, and that the analysis of those merits should be rational rather than visceral.

@smith (image/png)

> According to both my and crockford's rules of style, a return on a line by itself is not allowed, nor is starting a line with an open-brace. I gave examples of this situation in the gist.

Indeed. Sorry I missed that.

> I challenge you to find any other cases where semicolon insertion is problematic, or any case at all where my style is less safe than jslint's

Challenge declined. I'm OK with following anyone's style rules in their project as long as it's documented and not broken. Yours is fine. I probably won't start doing comma-first style myself yet, but not because there's anything wrong with it.

@millermedeiros (image/png)

by making the missing comma error easier to spot you also **make the key names harder to read** (which is the most important thing in my opinion)..

I trust automated tools better than my eyes to check for this kind of error (which BTW is not that common after you get used), at the first save [JSHint](http://jshint.com/) would complain about the missing comma, no need to make my code harder to read... - just my 2 cents about why I'm not following this style and probably won't do it anytime soon.

@isaacs (image/jpeg)

[@millermedeiros](https://github.com/millermedeiros) I don't find the key names harder to read. Also, most tools will not complain about `[1,2,3]\n[1,2,3]` in 2-dimensional arrays. That was the real life error that finally convinced me to use this style everywhere. The machine and my eyeballs were in disagreement about what the code said, but reformatting to this style made the error apparent.

It's quite ok with me that you not use this style. I couldn't care less.

Since any changes to one's coding style are initially negative, it's really not reasonable to comment on a different style until you've used it full time for a month or so at least. Come back when you've done that, and I'm sure that you'll either like it, or hate it for more interesting reasons :)

Or don't. That's fine too.

@PascalPrecht (image/jpeg)

Really helpful! Thanks!

@xk (image/jpeg)

[@isaacs](https://github.com/isaacs): Exception thrown: the `JSON.stringify()` style encloses the property names in quotes :-P

JSON.stringify({a:1})
"{"a":1}"

@isaacs (image/jpeg)

[@xk](https://github.com/xk) So what? It's not JSON, it's JavaScript.

@xk (image/jpeg)

[@isaacs](https://github.com/isaacs):

```
> So what?
```

Simply trolling :-)

```
> It's not JSON, it's JavaScript.
```

Just don't say it's **_Json.stringify style**_ when it isn't...

@isaacs (image/jpeg)

[@xk](https://github.com/xk) We're talking about indentation and comma placement, not quoting. So, yes, it IS "JSON.stringify style".

@chrisdone (image/png)

I wish I couuld stop getting notified about moronic comments on this damn gist.

@isaacs (image/jpeg)

[@chrisdone](https://github.com/chrisdone) me too.

@xk (image/jpeg)

[@isaacs](https://github.com/isaacs):

```
> We're talking about indentation and comma placement, not quoting. So, yes, it IS "JSON.stringify style".
```

JSON.stringify({a:1,b:2})
"{"a":1,"b":2}"

There's no indentation, there's not a single whitespace, and the commas are where they should be :-) (and the properties are quoted)

What does that have to do with this ?

Perhaps you meant node's util.inspect() instead of JSON.stringify() ?

@isaacs (image/jpeg)

[@xk](https://github.com/xk)

JSON.stringify({a: 1, b: 2 }, null, 2)
/*
{
 "a": 1,
 "b": 2
}
*/

@xk (image/jpeg)

[@isaacs](https://github.com/isaacs): That's cheating :-)

/ducks and runs away deep into the forest

@tokland (image/jpeg)

It's exciting to find such a vivid and insightful discussion in a gist. Thank to you all.

My 2-cents: I first encountered the comma-first style when reading Haskell code and I remember me thinking "OMG, isn't this the ugliest code convention ever conceived?". But since Haskell programmers are kinda smart, well, 'let it be', I thought. But later, when I saw it used in node.js code I sensed real danger. I hoped I'd get used to it, but no, I haven't, it looks as ugly as the first day, and the reason is simple: a comma starting a line is visually offending, no matter if it's code or a phrase in a book.

My preferred style when defining objects and arrays:

var myobj = {
  "hello": 1,
  "bye": 2,
};

var myarray = [
  "hello",
  "bye",
];

IMHO, this is unbeatable. Readable, you don't need to worry if you are at the start/middle/end of the definition, it plays nice with repository addition/deletions. Supported by 2009 specs of ECMAScript as pointed out by inimino.

@inimino (image/jpeg)

[@tokland](https://github.com/tokland) It's a good idea to check the specification before making such statements. Current implementations support trailing commas in object literals because that's precisely what the current spec, the one from 2009 (not the previous one, from 1999) requires. In array literals, they've always been allowed.

That's practically irrelevant here, though. In the first comment on this gist, how many of the kinds of errors isaacs mentioned as motivating factors have anything to do with trailing commas in object literals?

@tokland (image/jpeg)

[@inimino](https://github.com/inimino): my bad, I wasn't aware of this change, good to know at some point we'll be able to write it (IE9 supports it?).

> how many of the kinds of errors isaacs mentioned as motivating factors have anything to do with trailing commas

If all the lines in a definition have trailing commas, it's easier to spot a missing one. But yes, I probably just missed isaac's point and my dislike for a comma beginning a line clouds my judgement :-)

@isaacs (image/jpeg)

> If all the lines in a definition have trailing commas, it's easier to spot a missing one.

[@tokland](https://github.com/tokland) Really?

// error in standard style
var a = "ape eat banana",
  b = "bat, allowed to fly",
  c = "cat toy",
  d = "dog chasing the mailman,"
  e = "elf lord",
  f = "fly through the air",
  g = "gnu is not unix",
  h = "hat goes on your head",
  i = "ibu isn't a cow";

// error in comma-first style
var a = "ape eat banana"
  , b = "bat, allowed to fly"
  , c = "cat toy"
  , d = "dog chasing the mailman,"
  e = "elf lord"
  , f = "fly through the air"
  , g = "gnu is not unix"
  , h = "hat goes on your head"
  , i = "ibu isn't a cow"

I don't know about you, but my eyes and brain have a much easier time spotting the break in the straight left-edge than the tiny missing dot on the ragged right-edge. Added Addendum 3 for your benefit.

@fearphage (image/jpeg)

People seem to forget that trailing cmaas still blow up old browsers. If you're only coding for v8 and other modern engines, that's the only way you can ship code like `[1, 2, 3,]`. I like the block scope nature of:

var // start of block of var statements
  a = 'catpants'
  ,b = [
    1
    ,{
      key: 'value'
      ,another: 'one'
      ,yet: 'again'
    }
  ]
  ,c = {one: 'liner'}
  ,d = c.one
   // uninitialized at the end
  ,e
  ,f
; // "closes" var statment "block". this also makes the indentation appear more natural

All the other formats leave hanging indents. It looks awkward to me. Of course to each his/her own. Just expressing the logic behind my personal preferences and conventions. The space after the comma is interesting and does make it very clear where the error is.

@tokland (image/jpeg)

[@isaacs](https://github.com/isaacs): by all means, your second example is more clear on this regard, I meant on object/array definitions: if you could write a trailing comma in all lines (not cross-crowser at the moment), it would be easier to spot the missing one (and also reorder lines), but not compared to comma-first, of course. This does not apply to var assignments.

As I said, it's a a subjective dislike, I can't see a comma at the beginning of a line without feeling a deep discomfort. I was honestly surprised to see that so many people are ok with it, I'd have thought it to be wired somewhere. This matter needs a pool :-)

I have to admit I've been writing CoffeeScript lately, which is a radical workaround to the *problem*.

@millermedeiros (image/png)

as I said on my [previous comment](https://gist.github.com/357981#gistcomment-45860), use better tools, no need to write code that is harder to read and that goes against the common conventions, just a few screenshots:

[regular variable (image/png)](https://camo.githubusercontent.com/3db8b605b38cf6a5a50495bad18d22e38548ac5c/687474703a2f2f692e696d6775722e636f6d2f45306854582e6a7067)
[multidimensional arrays (image/png)](https://camo.githubusercontent.com/9246ee48f4b9f8cec2bf80efaed4e234f7402fb1/687474703a2f2f692e696d6775722e636f6d2f65595965592e6a7067)

I'm using Vim with [node-jshint](https://github.com/jshint/node-jshint) running at each save but you can do the same in other editors as well... - The error message on the multidimensional array isn't accurate but shows where the problem is, I don't even need to run the code to know it's wrong...

If that is your **personal** *stylistic* preference, no problem with that, if I ever contribute on any project that follows this convention I will do it as well.. I'm just trying to be the *devils advocate* and show that a lot of people been using another approach (including myself) and not suffering from any of the problems that this technique **tries** to solve.

> "It’s harder to read code than to write it."- [Joel Spolsky](http://www.joelonsoftware.com/articles/fog0000000069.html)

PS: in case you can't see the images just visit http://imgur.com/a/1vXI7

@isaacs (image/jpeg)

The brain is somewhat plastic, and purely esthetic preferences can be altered with a bit of effort. I have found that this preference is not "wired in" at the same level as fear of falling, sexual attraction, or an aversion to insects. It's more at the level of "this type of car puts the windshield wiper controls on the other side than I'm used to". Ie, mildly uncomfortable at first, unnoticeable and normal after a short time.

If possible, why not try to leverage your mental programming's "personal stylistic preferences" routines to produce code that is objectively faster for humans to read and understand, once they get over their personal stylistic preferences? It seems odd to me to willingly choose to be a slave to a style that one adopted merely as an accident of their upbringing and culture, when a better choice is available.

Yes, of course, this is only one consideration among many. There are cultural forces at work here, and coding is not a solitary activity. But the ergonomic factors of debugging *should* be one of those considerations, even if it's not the most significant factor every time. If minds and preferences can change, then so can culture, because culture is made of minds and preferences.

@fearphage (image/jpeg)

Another great tool is [Javascript Lint](http://www.javascriptlint.com/) (different from JSLint). It has a [plug-in](https://github.com/joestelmach/javaScriptLint.vim) to check js on save as well. Javascript Lint catches errors and warns against bad syntax. JSLint and JSHint mostly tend to enforce conventions in my opinion although they do all duplicate some of the same errors and warnings. Javascript Lint is also configurable like the others.

@mkeen (image/png)

I can't believe this discussion is still going on. I actually think about the original conversation every now and then when I find myself thinking too much about code formatting.

@tokland (image/jpeg)

[@isaacs](https://github.com/isaacs): couldn't agree more (though *maybe* the position of dividers in a enumeration ring some pattern in our brains).

[@mkeen](https://github.com/mkeen): Humanity has literally written millions of books about aesthetics, programmers have their right to contribute :-) Details are important. When they relate to *beauty*, they are still more important. As Oscar Wilde put it: "I was working on the proof of one of my poems all the morning, and took out a comma. In the afternoon I put it back again."

@kragen (image/png)

So I really like *reading* code written in comma-first style, but I'm kind of frustrated fighting with the auto-indent in `espresso-mode` in order to *write* it. I could switch to `fundamental-mode` to write the code (then TAB does the right thing!) but then I lose syntax highlighting etc. [Cheeso wrote some dodgy elisp on StackOverflow](http://stackoverflow.com/questions/6144930/emacs-js-mode-for-npm-style) to get good comma-first support in `js-mode`, which is the Emacs 23.2 version of `espresso-mode`. Do I need to upgrade my Emacs to get good comma-first support? :(

Hmm, now I'm trying [Thom Blake's `js3-mode`](https://github.com/thomblake/js3-mode/wiki/Credits), which seems to support comma-first style and semicolon-free style pretty well. I can C-M-\ and get things indented properly. And it does the nice `js2-mode` instant error checking thing; haven't yet seen if it has `js2-mode`'s appalling performance problems. Right now I'm a happy camper :)

@isaacs (image/jpeg)

[@kragen](https://github.com/kragen) I just came here to point you at that exact thing :)

@gotofritz (image/jpeg)

+1 comma first

@kaisellgren (image/jpeg)

. I started using comma first style after seeing so many libraries doing it
. I did it for maybe 2 months until I finally had to give up
, because it's too hard to read it

. I dislike it when people have preference over coding style because of "easier to spot errors"
. That is why we have IDEs and lints which will wave a red flag when we miss a comma
. Use the right tool to solve your problem and leave the comma last as it's is far more easier to read than comma first

. I did not however feel any preference between *writing* commas last or first

Let's again take a look at both:

// standard style
var a = "ape",
    b = "bat",
    c = "cat",
    d = "dog",
    e = "elf",
    f = "fly",
    g = "gnu",
    h = "hat",
    i = "ibu"

// comma-first style
var a = "ape"
    , b = "bat"
    , c = "cat"
    , d = "dog"
    , e = "elf"
    , f = "fly"
    , g = "gnu"
    , h = "hat"
    , i = "ibu"

The standard one is far more readable. Given the fact that when you add a new line, your IDE handles commas for you, and also when you move the lines like alt+up/down in WebStorm it automatically analyses your code and places the commas properly. The comma-first style, on the other hand, is mis-aligned and looks horrible. Seriously, does anyone actually feel like the comma-first is more natural? It's like writing text in reverse, maybe if you do that for 10 years it may feel more natural...

People who mention it's easier to spot errors or that trailing commas cause problems with IE are missing the real thing here. Use the *right tools*. It's 2012, IDEs and tools notice us of errors and minifiers/compilers can correct comma-last problems for buggy engines.

I have no idea what this code does:

// comma-first
var o =
    { a : "ape"
    , b : "bat"
    , c : "cat"
    , d : "dog"
    , e : "elf"
    , f : "fly"
    , g : "gnu"
    , h : "hat"
    , i : "ibu"
    }
    , a =
    [ [ "ape", "bat" ]
    , [ "cat", "dog" ]
    , [ "elf", "fly" ]
    [ "gnu", "hat" ]
    , [ "ibu" ]
    ];

It looks like compiled code, is it? Certainly it's not something anyone would write by hand.

Anyway, I believe it all comes down to what you are used to. Some people read text from left to right, some vertically. Not one style fits everyone.

@isaacs (image/jpeg)

[@kaisellgren](https://github.com/kaisellgren)

> . That is why we have IDEs and lints which will wave a red flag when we miss a comma

If the IDE can tell where commas ought to be, why doesn't it just put them there? Why the red flag dance?

Everything in this response is 100% subjective. You are confusing the map with the territory.

@kaisellgren (image/jpeg)

[@isaacs](https://github.com/isaacs)

> If the IDE can tell where commas ought to be, why doesn't it just put them there? Why the red flag dance?

How could it? How can it know what you actually meant? Maybe you wanted to end the statement, add another var declaration or something completely different.

> Everything in this response is 100% subjective.

As is your gist ;)

@isaacs (image/jpeg)

> How could it? How can it know what you actually meant?

Exactly. I'd prefer IDEs not wave red flags in my face if they aren't smart enough to know what I mean.

@stanpalatnik (image/jpeg)

Interesting debate, but it sounds like [@isaacs](https://github.com/isaacs) is advocating using notepad. Nope.

@kaisellgren (image/jpeg)

[@isaacs](https://github.com/isaacs)

> I'd prefer IDEs not wave red flags in my face if they aren't smart enough to know what I mean.

True, but in case of a syntax error, they are right that there is something wrong, unless the IDE is broken.

@isaacs (image/jpeg)

[@stanpalatnik](https://github.com/stanpalatnik) Real developers use butterflies.

> True, but in case of a syntax error, they are right that there is something wrong, unless the IDE is broken.

This is not a syntax error:

var x = [ ["asdf", "foo", "bar"],
          ["baz", "blerg", "boof"]
          ["quux", "antimatter"] ];

Either your IDE has to disallow the use of the comma operator, or of `[]` to specify property names with an expression, or you can use a comma-first style where such things jump out as strange (letting you use your human brain to decide if it's intended or an error), or you can Be Very Careful.

> I have no idea what this code does:

Please read the ecmascript specification before telling people on the internet that they're doing this language wrong.

@kaisellgren (image/jpeg)

[@isaacs](https://github.com/isaacs)

> This is not a syntax error:

My IDE says it is potentially buggy code (but not a syntax error), because I have configured such an inspection profile for myself. Therefore, I will spot your code sample, because the IDE tells me. I can ignore the report, or all reports of that type. I rather use tools for detecting problems than my eyes. It's like trying to detect logic problems by using your brains rather than just running the unit tests to see if things actually worked. I especially would never choose a coding style based on such things.

> Please read the ecmascript specification before telling people on the internet that they're doing this language wrong.

I have never said you are doing "any language wrong" and I'm certainly not going to read the spec again, because it won't help me understanding the code you had there. The only thing that is going to help me do that is to reformat your code with my IDE using ctrl+shift+f and that is in fact what I've been doing when looking at npm ;)

@dolmen (image/jpeg)

re: `["a","b","c"]` vs `"a b c".split(" ")`

That's why I like Perl, and it's of the many things I lack in most other programming language: more quoting operators. In Perl I would use `qw<>` (quote words): `qw<a b c>`.

@jorgenhorstink (image/jpeg)

[@isaacs](https://github.com/isaacs)

I get your point, and it is quite interesting, but I really cannot image this to be easier to read. Indeed, it is easier to spot a missing comma in a pile of comma's in the comma-first style. But I asume the code I read is without syntactic errors, and otherwise my IDE will complain or give me a hint. Like kaisellgren I like to trust on tools for spotting syntactic mistakes rather then my eyes. So if we start this discussion with the assumption the code is without syntactic errors, do you still think it is easier to read?

Music inherently depends on silence, and so does code. What silence is to music, is U+0020 to code. Line 130 to 136 is imo missing the silence, the space punctuation it so desperately needs. The longer I look at it, the more it is begging me to add empty space. My eyes and brain just need it so much.

Except for the starting dot, kaisellgren made a clear point: one does not start a sentence with the dot or comma belonging to the previous one. The way I think of a comma is a token which tells the interpreter: "yo buddy, got it? okey, one more to go". So as you might expect: to me the comma is marking and end, rather then starting a begin.

Combining the empty space, which can make code much easier to read, with the comma at the end, my style is more one of a relative indent:

// relative indent, the indentation helps you to understand which parts belongs together
var o = {
        a : "ape",
        b : "bat",
        c : "cat",
        d : "dog",
        e : "elf",
        f : "fly",
        g : "gnu",
        h : "hat",
        i : "ibu"
    },
    a = [
        [ "ape", "bat" ],
        [ "cat", "dog" ],
        [ "elf", "fly" ],
        [ "gnu", "hat" ],
        [ "ibu" ]
    ],
    b
;

b = {
    c : "c",
    d : "d",
    e : [1, 2, 3],
    f : [
        {
            id : 1,
            name : "John"
        },
        {
            id : 2,
            name : "Alice"
        }
    ]
};

return {
    a : "ape",
    b : "bat"
};

@bigfish (image/jpeg)

Since everyone is sharing their opinion, here is mine.. When I read code formatted with commas first, I feel like I'm being forced to be a human linter, being forced to verify that no commas got missed. I get so distracted by the weirdly placed commas shouting "LOOK! theres a comma here, syntax valid!" I'd much rather focus on what the code is *doing* so I can understand it, and use an automated linter to find syntax errors. I think readability is very important since code is going to get read many more times than it is written.

@isaacs (image/jpeg)

[@bigfish](https://github.com/bigfish) When you read code, aren't you *always* being "forced to be a human linter"? Isn't "being a human linter" a large part of what reading code consists of?

Why not use a style that makes it *less effort* to be a human linter? Reducing the effort of a large part of the work of reading code seems to me like it must mean a net increase in readability.

I think that you may be confusing the initial shock of unusualness with the eventual benefit.

The issue is, of course, even though it makes errors stand out, until one is used to a new style, the different-ness of it is so distracting that it's hard to see the meaning of the code. Then, one says, "Yeah, this makes errors easier to spot, but it makes the code harder to follow" and the trade-off seems one-sided. Those who point out the error-spotting ease seem to have weird priorities; how can they believe that spotting errors is worth not being able to follow the code? They must be insane! Just write a program to spot these errors for you; that's not your job!

This is a [mind projection fallacy](http://lesswrong.com/lw/oi/mind_projection_fallacy/). It's important to recognize what factors contribute to error-spotting ease (in this case, lining up relevant tokens so that their absence is easily noticed) vs what factors contribute to intention-following ease (in this case, a style one is accustomed to). Since "a style one is accustomed to" is so highly flexible, and "human brains have an easier time noticing deviations in straight lines than in jagged lines" seems to not be as flexible, the priorities are actually not so crazy. Just change what you're accustomed to, so that you can get the benefits of error-spotting ease without the hazards of being distracted by the unconventional.

And in fact, once the unconventionalness is done away with, this style makes it *easier* to follow the intent and meaning of the code. At least, it has for me. I've been working for several years now with both styles, and can attest that comma-first/minimal-semicolon is less work to read and understand. YMMV.

@eringen (image/jpeg)

it's not about beauty or forgetting commas,
coding conventions exist because someone else may/is going to read your code.
why the hell, just why? do I need to read whole set of lines to understand there's a variable or set of variables.

here's 1 line stub
var a = 1

here's another one
var a = 1,

now, for reader, which one is clearer?

please go and try to read bootstrap js code, line ends, and you still don't have SLIGHTEST idea that what will happen, you need to see next line, try to spot if it is starting with comma or not, then you MAY have an idea.

why the pain? development in js is already painful, do not make it worse for love of being smartpants

@isaacs (image/jpeg)

@ilhannegis You're presuming that humans see the end of the current line before they see the beginning of the next one. That's empirically false. In fact, humans often **don't** see the end of the line at all, and instead scan in an "F-shape", as demonstrated by every eye-tracking website usability study ever.

When do you ever read a single line in isolation in a real program? Your example is a strawman.

@eringen (image/jpeg)

Scanning javascript code in F shape like a website is whole different ballgame
,I can only respect that
.

putting commas next line
,actually
,makes super sense in a language that does automatic semicolon insertion
.

@isaacs (image/jpeg)

@ilhannegis You're not the first one to make that argument. It's also a strawman. http://blog.izs.me/post/2353458699/an-open-letter-to-javascript-leaders-regarding#literary

@eringen (image/jpeg)

You do make (mostly) websites with javascript, javascript is not a website that you scan. You read it, like a book. even more carefully, you evaluate what you read.
Yes, javascript is not english nor turkish (totally different language construct).

Programming languages constructed around (mostly) english words and punctuations to comfort human being, to ease familiarize. You use symbols or set of symbols to make it easier as possible.
Like "->" or "!=" even "," and yes, it (",") does mean "take a breath, it will continue". you just taking that comfort away, put into next line make things open ended for sake of align things pleasingly.

Or, you're always welcome to carry on in assembly mnemonics and scan it like a website.

@isaacs (image/jpeg)

Your two arguments so far:

1. English doesn't put punctuation at the beginning, so JavaScript shouldn't either.
2. JavaScript is unlike prose, so it's wrong to assume that human eyes would move in a similar pattern.

Have you ever tried using this style for long enough to get used to it?

I'm not claiming that anyone should necessarily use any specific style. I'm claiming that this style has some benefits, and that the downsides are much more flexible than they first appear. It seems like you care more about my coding style than I care about yours.

@wub (image/png)

Edit: removed the pointless comment about pointless nerd rage; I don't want to hypocritically look like most of you guys.

@isaacs (image/jpeg)

[@exitus](https://github.com/exitus) A shame! It was a great comment :)

@rhysbrettbowen (image/jpeg)

[@isaacs](https://github.com/isaacs) I'd like to see an npm style lint program that could lint this (and perhaps output with semicolons inserted back in so it's more compatible with other compilers).

One thing I can see is if you use commas at the front you won't really be looking for extra commas at the end:

a = [
, "this is a long string of characters"
, "and another one to follow it"
, "and a third string as well",
, "the last string in the array"
]

Linters are a great thing - don't underestimate the human ability to stuff up. I agree that the coding style is more elegant but there are pitfalls especially if someone is crossing over from all semicolons. A linter would be great to check fro trailing commas, semi-colons and checking that returns aren't followed with a new line and that brackets are preceded by semi-colons on new lines.

@jaseemabid (image/jpeg)

As [@rhysbrettbowen](https://github.com/rhysbrettbowen) said.

> One thing I can see is if you use commas at the front you won't really be looking for extra commas at the end:

+1 to that.

[@isaacs](https://github.com/isaacs) : I like the idea that this style adds readability to code and looks for broken semis but this is something jslint is doing since a long time every time I save a file. I dont think there is a need for a change in style now since this is not really a problem to people using a lint tool.

@kaisellgren (image/jpeg)

After a month of using comma-first style, I'm getting quite used to it. I find it pretty distracting. I guess I'll stick with comma-last, it's more natural and the benefits of comma-first are next to none.

It's just as confusing as > in XML using the same idea of >-first:

Sane people:

```
<foo>
    <bar>
        <baz>qux</baz>
    </bar>
</foo>
```

Comma-first people:

```
<foo
  > <bar
      > <baz>qux</baz>
    </bar>
</foo>
```

(or something like that)
If I forget the > the IDE will tell me about it.

After a lengthy discussion here, I guess we can all come down to the conclusion: let's not create issues that don't exist and create wild fantasies that solve these supposedly existing issues. This is an unfortunate thing that happens nowadays in our nation, solving non-existent issues with even crazier solutions.

@isaacs (image/jpeg)

[@jaseemabid](https://github.com/jaseemabid) Yes, you can use a linter. Maybe it's silly, but I also like to optimize for my human brain and remove clutter.

[@kaisellgren](https://github.com/kaisellgren) I agree, everyone takes this way too seriously. However, as I've explained in great detail above in this thread, it's less about syntax errors, since those are very easy to find, and more about logic errors arising from [] being interpreted as a property offset. (Besides, if you're writing XML, you've already lost. ;)

@gotofritz (image/jpeg)

[@kaisellgren](https://github.com/kaisellgren) that xml stuff has nothing to do with comma first.

@wub (image/png)

I am so sorry for resurrecting this... go the fuck outside.

@jonnebins (image/png)

Everyone who uses this style is stupid and ugly. Glad to know where this shit is coming from.

sudo npm uninstall npm -g

@diversario (image/png)

[@jonnebins](https://github.com/jonnebins) did you join GH just for this comment?

@subfuzion (image/jpeg)

That's hilarious ... lmao [@jonnebins](https://github.com/jonnebins) who joined GH and even went the extra mile to associate a gravatar just to comment!

@shanimal (image/jpeg)

Whew good thing I skipped down to jonnebins comment. That could have been three hours I'd have never gotten back.

@Spudz76 (image/jpeg)

Commas first also makes sense in line-oriented VCS such as svn or git so that the line change count includes less "fake changes" like adding a trailing comma to an otherwise unchanged line just to add another at the end of some multi-line structure. Applies for me in PHP, C, and Bash as well (I feel you all gasp in collective horror). And I only use semicolons if I'm forced to.

Plus, one step further:

var example =
  {some:"string"
  ,another:false
  ,obj:
    {crud:"monkey"
    ,foo:!bar
    }
  ,more:"etc"
  }

It really isn't too compatible with any code formatter I've come across, but not tough and IMO super readable as to what's what and what's where.

@meisl (image/png)

Adding on [@Spudz76](https://github.com/Spudz76)'s previous comment, I just recently found myself doing this:

var exampleArray = [ undefined
    , 7
    , 5
    , 1
    , 4
].splice(1);
letsSeeHowElementOrderMatters(exampleArray);

Looks rather crazy but serves me really well **when having to change the order of elements often** (eg for experimenting*). Works particularly nicely if your editor let's you select a whole line by just one click (eg the line nr) and then move it by dragging.

Btw: got nothing alike for object literals - BUT: ... well, think about it ...!

* * *

[*] in that particular instance I was hunting down a serious perf degradation that varied heavily with the actual order of elements. In the end it turned out to be a proper bug. Once this bug was fixed, the order didn't matter anymore wrt to perf. However, *up until* I was able to spot and fix this bug I did change the order of elems a lot and the resulting changes in the profile actually gave me the idea of what was really going on. Of course, it weren't just nrs as in the example, rather complex interdependent objects.

@gabrieldodan (image/jpeg)

Personally I see no benefit on comma first style, the lines looks like are comment lines, like VBScript comment lines. Literal objects with 2+ levels are very unreadable. By the why, comma first supporters, why don't use also semicolon in front of statement ? :) e.g.

```
fucntion1()
;function2()
;function3()
```

@waynebloss (image/jpeg)

Whoever said "use better tools" was right. (And there is a *wrong* here.) Comma-first style seems analogous to burning down your barn to get rid of some rats. Don't do that! Just get some rat traps.

Of course you're welcome to "optimize for [your] human brain", but don't think that you're optimizing it for *other* people's brains (or even the majority). If you just use tools to catch these mistakes, you can avoid the whole issue.

This guy is right too - *you want punctuation to disappear when you're reading code* - http://blog.outsharked.com/2012/05/on-javascript-style.html

@f3z0 (image/png)

I'm actually a fan of comma first because of the arguments presented above but it indirectly violates google style guidelines.

* https://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml#Code_formatting
    **Binary and Ternary Operators**
    Always put the operator on the preceding line. Otherwise, *line breaks and indentation follow the same rules as in other Google style guides*.
* http://google-styleguide.googlecode.com/svn/trunk/javaguide.html#s4.5.1-line-wrapping-where-to-break
    **Where to break**
    A comma (,) stays attached to the token that precedes it.

@gaastonsr (image/jpeg)

[@waynebloss](https://github.com/waynebloss) thanks for that link. Interesting read.

@rafanake (image/jpeg)

If you use it first, youre VERY wrong
Dont do it plz.

@chiefGui (image/jpeg)

[@f3z0](https://github.com/f3z0) Is Google an axiom?
[@rafanake](https://github.com/rafanake) Why?

@kinsho (image/png)

While I understand the comma-first approach **may** make JSON-related errors easier to catch, it is by far the ugliest coding convention I have seen in my limited programming career. A good editor usually catches errors related to missing commas in JSON files anyway. I truly see little value in this.

@smaudet (image/png)

It actually looks much nicer to me this way:

1. Var statements line up much more nicely
2. Added benefit of catching errors
3. You can insert/remove single lines

I always found the comma at the end the most moronic, especially if you append to arrays instead of just inserting at the beginning all the time. You have to add a comma to the previous line, which is inconvenient at best, and problematic at worst.

With the comma before approach, you only have to deal with this issue once (making sure your first definition lines up), and then you're done.

The only disadvantage I see is that there are a lot of formats doing this the old, broken way of 'comma after', including, incidentally, JSON.stringify. Which is why I found this debate at all.

@TheNotary (image/png)

Hmm... 'use strict' prevents leaking to global. When I add to var blocks (which I use infrequently as a means of being articulate), I do so to the middle more so than I do to the beginning and end. But if I encountered this code from someone else, I don't think I'd have a 'conventional problem' with understanding it. It looks like a config file that uses commas in a somewhat non-english manor. I don't think I'd like to implement commas in this way though.

@matthew-dean (image/jpeg)

Yay! Another pointless code debate.

@Potherca (image/png)

I can't believe people are seriously debating this and trying to use "arguments" on this topic. It makes about as much sense to debate if a painter should hold a brush in their left or right hand.

**It doesn't matter**

To left-handed people one answer seems more fitting while right-handed people will opt for the opposite *for exactly the same reason*.

Just like tabs vs. spaces, brace placement and first vs. third person narration it **all** boils down to personal preference.

[@isaacs](https://github.com/isaacs) made an effort to explain why this particular style works for *him*. Well done.
Anyone who considers the title "A better coding convention ..." anything other than click-bait has a lot of growing up to do.

Really... Can we all just go back to debating which Doctor Who is better?

@eladkarako (image/png)

**Tip**: Beautify && Comma first, **Almost No Code!**

var obj = {url:"http://example.com",number:1,complex:["first",{second:"null"}]}

* Beautify, comma-last

    JSON.stringify(obj, null, 2)
    {
      "url": "http://example.com",
      "number": 1,
      "complex": [
        "first",
        {
          "second": "null"
        }
      ]
    }

* Beautify, comma-first - **column start** *("Greek style")****

    JSON.stringify(obj, null, 2).replace(/,\n /g, "\n ,")
    {
      "url": "http://example.com"
     , "number": 1
     , "objects": [
        "first"
     ,   {
          "second": "null"
        }
      ]
    }

    ***
**** Beautify, comma-first - **word start** *("English style")* ***- **Preferred**.

    JSON.stringify(obj, null, 2).replace(/,\n /g, "\n ,").replace(/ *(,(\ +))/g,"$2,")
    {
      "url": "http://example.com"
     ,"number": 1
     ,"objects": [
        "first"
       ,{
          "second": "null"
        }
      ]
    }***
***

***

[#Source](http://icompile.eladkarako.com/javascript-ninja-so-you-want-to-get-a-youtube-video-streams-resource-without-ajaxing-around-daaaa/)

***

@QuentinUK (image/png)

Yoda commas.

@NoelBaron (image/jpeg)

For nearly 16 years of our lives, we write essay after essay using commas. On top of that, we write billions of emails. With all the variables and preferences in our shared environments, shouldn't we at least adhere to our life-long habit of left-to-right comma interpretation?

In my humble opinion, I prefer reading code that isn't totally opposite our natural tendencies.

This doesn't feel natural at all, although technically it is the same text:

```
For nearly 16 years of our lives
, we write essay after essay using commas. On top of that
, we write billions of emails. With all the variables and preferences in our shared environments
, shouldn't we at least adhere to our life-long habit of left-to-right comma interpretation?
```

@eladkarako (image/png)

[@NoelBaron](https://github.com/NoelBaron), linguistically, a compound-sentence has a comma so you'll pretty much know when to halt for a breather, but on your sample text, inserting a line-break before the comma *(creating a comma-first look)* also implies a full-stop or a new paragraph, comma on code has no linguistics value, and one should not be looking for such. On inventing a new program-language, we might as well use pipeline, hash-tag or any other characters to separate code-blocks, which do not have analogous meaning *in English language-composition* thus, not creating this confusion.

Most of pro-comma-first developers usually mention their lack of forgotten commas at the end of a long line of code, or even the *OCD relief* of same-column-straightening of characters ;)

Anyway, the comma-first convention is gaining quite a lot of popularity among users lately,
I can say that software-developers at Google (Israel) are using it on most of the new projects, due to its superb readability.

@Inateno (image/jpeg)

I give a star here since I discovered this place lol.

I'm using commas-first style almost since I started JS around 6 years ago now.

Guys you also missed something, commas-first is essential when you use multilines keyboard shortcut.

In VS or Sublime, CTRL + D for few entry in a JSON then END then add somehting, paste, or select a value. You don't have to deal wth the comma at the end.
Also CTRL + SHIT + TOP or DOWN in VS will make a multi-line cursor, then SHIFT + END and you selected all values excepted commas (or just select the keys, or the values, whatever).

I use this everyday everytime and each times I show this to a developer that is not using these shortcuts (and not using commas-first) he reconsider his position lol.

@fischerflorian (image/png)

As a general rule, you should split your statement at the highest place possible in your syntax tree. Usually at an operator.
Since that operator is the pivot between 2 lines, it should be put prominently at the begin of the line.
Therefore the comma, or any other operator, +, &&, should start the line.

@adius (image/jpeg)

Use ternjs / eslint and get a life.
Putting the least important characters of the code up front is ridiculous.

@osher (image/png)

actually, I love it and have been using it for years.
the comma on the left just looks like a bullet list.
ever since I stared using it - I never forgot a comma or struggled with braces again, even when working with nano on remote files.

but - I'm working with a team now that will agree to this style only if it will be supported by the lindter.
so - is there an eslint rule I can use to enforce this style, especially for arrays and objects?

@alanosman (image/png)

Is there an eslint rule that will not choke when you do something like this? My eslint configuration complains about `Project` being indented by 2 chars.

```
const {
      Project
    , Dimension
    , Task
    , View
    , Layout
    , User
    , Group
    , Organization
    , CustomField
} = db.model;
```

Comment on gist
[Sign in to comment](https://gist.github.com/login?return_to=https://gist.github.com/isaacs/357981) or [sign up](https://gist.github.com/join) to join this conversation on GitHub

[](https://gist.github.com/isaacs/357981#)[](https://gist.github.com/isaacs/357981#)

* Desktop version
