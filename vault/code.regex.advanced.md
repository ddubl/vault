---
id: jc6pc8qrj5egor2tny2onsd
title: Advanced
desc: ''
updated: 1633199319490
created: 1633199319490
---
## Reducing (? … ) Syntax Confusion

I don't know the fine details of the [history of regular expressions](http://www.rexegg.com/regex-vs-regular-expression.html#history). Stephen Kleene and Ken Thompson, who started them, obviously wanted something very compact. Maybe they were into hieroglyphs, maybe they were into cryptography, or maybe that was just the way you did things when you only had a few kilobytes or RAM.
The heroes who expanded regular expressions (such as Henry Spencer and Larry Wall) followed in these footsteps. One of the things that make regexes hard to read for beginners is that many points of syntax that serve vastly different purposes all start with the same two characters:
`(?`
In the regex tutorials and books I have read, these various points of syntax are introduced in stages. But (?: … ) looks a lot like (?= … ), so that at some point they are bound to clash in the mind of the regex apprentice. To facilitate study, I have pulled all the (? … ) usages I know about into one place. I'll start by pointing out three confusing couples; details of usage will follow.
**Jumping Points**
For easy navigation, here are some jumping points to various sections of the page:
✽ [Confusing Couples](http://www.rexegg.com/regex-disambiguation.html#confusingcouples)
✽ [Lookahead and Lookbehind: (?= … ), (?! … ), (?&lt;= … ), (?&lt;! … )](http://www.rexegg.com/regex-disambiguation.html#lookarounds)
✽ [Non-Capturing Groups: (?: … ) and (?is: … )](http://www.rexegg.com/regex-disambiguation.html#noncap)
✽ [Atomic Groups: (?> … )](http://www.rexegg.com/regex-disambiguation.html#atomic)
✽ [Named Capture: (?<foo> … ) and (?P<foo> … )](http://www.rexegg.com/regex-disambiguation.html#namedcapture)
✽ [Inline Modifiers: (?isx-m)](http://www.rexegg.com/regex-disambiguation.html#modifiers)
✽ [Subroutines: (?1)](http://www.rexegg.com/regex-disambiguation.html#subroutines)
✽ [Recursion: (?R)](http://www.rexegg.com/regex-disambiguation.html#recursion)
✽ [Conditionals: (?(A)B) and (?(A)B|C)](http://www.rexegg.com/regex-disambiguation.html#conditionals)
✽ [Pre-Defined Subroutines: (?(DEFINE)(<foo> … )(<bar> … )) and (?&foo)](http://www.rexegg.com/regex-disambiguation.html#define)
✽ [Branch Reset: (?| … )](http://www.rexegg.com/regex-disambiguation.html#branchreset)
✽ [Inline Comments: (?# … )](http://www.rexegg.com/regex-disambiguation.html#inlinecomments)
✽ [Code Capsule: (?{…})](http://www.rexegg.com/regex-disambiguation.html#codecapsule)
✽ [PCRE Callouts: (?C…)](http://www.rexegg.com/regex-disambiguation.html#pcrecallouts)
✽ [Version Check: (?(VERSION>=x) … )](http://www.rexegg.com/regex-disambiguation.html#versioncheck)
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#confusingcouples)

## Confusing Couples

**Confusing Couple #1: (?: … ) and (?= … )**
These false twins have very different jobs. (?: … ) contains a non-capturing group, while (?= … ) is a lookahead.
**Confusing Couple #2: (?&lt;= … ) and (?> … )**
(?&lt;= … ) is a lookbehind, so (?> … ) must be a lookahead, right? Not so. (?> … ) contains an atomic group. The actual lookahead marker is (?= … ). More about all these guys below.
**Confusing Couple #3: (?(1) … ) and (?1)**
This pair is delightfully confusing. The first is a [conditional expression](http://www.rexegg.com/regex-disambiguation.html#conditionals) that tests whether Group 1 has been captured. The second is a [subroutine call](http://www.rexegg.com/regex-disambiguation.html#recursive) that matches the sub-pattern contained within the capturing parentheses of Group 1.
Now that these three "big ones" are out of the way, let's drill into the syntax.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#lookarounds)

## Lookarounds: (?&lt;= … ) and (?= … ),

(?&lt;! … ) and (?! … )

Collectively, lookbehinds and lookaheads are known as lookarounds. This section gives you basic examples of the syntax, but further down the track I encourage you to read the dedicated [regex lookaround page](http://www.rexegg.com/regex-lookarounds.html), as it covers subtleties that need to be grasped if you'd like lookaheads and lookbehinds to become your trusted friends.
In the meantime, if there is one thing you should remember, it is this: a lookahead or a lookbehind does not "consume" any characters on the string. This means that after the lookahead or lookbehind's closing parenthesis, the regex engine is left standing on the very same spot in the string from which it started looking: it hasn't moved. From that position, then engine can start matching characters again, or, why not, look ahead (or behind) for something else—a useful technique, as we'll later see.
Here is how the syntax works.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#lookahead)
**Lookahead After the Match:** `\d+(?= dollars)`
**Sample Match:** _100_ in 100 dollars
**Explanation:** \\d+ matches the digits _100_, then the lookahead (?= dollars) asserts that at that position in the string, what immediately follows is the characters " _dollars_"
**Lookahead Before the Match:** `(?=\d+ dollars)\d+`
**Sample Match:** _100_ in 100 dollars
**Explanation:** The lookahead (?=\\d+ dollars) asserts that at the current position in the string, what follows is digits then the characters " _dollars_". If the assertion succeeds, the engine matches the digits with \\d+.
Note that this pattern achieves the same result as \\d+(?= dollars) from above, but it is less efficient because \\d+ is matched twice. A better use of looking ahead before matching characters is to [validate multiple conditions](http://www.rexegg.com/regex-lookarounds.html#password) in a password.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#negative-lookahead)
**Negative Lookahead After the Match:** `\d+(?!\d| dollars)`
**Sample Match:** _100_ in _100 pesos_
**Explanation:** \\d+ matches _100_, then the negative lookahead (?!\\d| dollars) asserts that at that position in the string, what immediately follows is neither a digit nor the characters " _dollars_"
**Negative Lookahead Before the Match:** `(?!\d+ dollars)\d+`
**Sample Match:** _100_ in _100 pesos_
**Explanation:** The negative lookahead (?!\\d+ dollars) asserts that at the current position in the string, what follows is not digits then the characters " _dollars_". If the assertion succeeds, the engine matches the digits with \\d+.
Note that this pattern achieves the same result as \\d+(?!\\d| dollars) from above, but it is less efficient because \\d+ is matched twice. A better use of looking ahead before matching characters is to [validate multiple conditions](http://www.rexegg.com/regex-lookarounds.html#password) in a password.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#lookbehind)
**Lookbehind Before the match:** `(?<=USD)\d{3}`
**Sample Match:** _100_ in _USD100_
**Explanation:** The lookbehind (?&lt;=USD) asserts that at the current position in the string, what precedes is the characters "_USD_". If the assertion succeeds, the engine matches three digits with \\d{3}.
**Lookbehind After the match:** `\d{3}(?<=USD\d{3})`
**Sample Match:** _100_ in _USD100_
**Explanation:** \\d{3} matches _100_, then the lookbehind (?&lt;=USD\\d{3}) asserts that at that position in the string, what immediately precedes is the characters "_USD_" then three digits.
Note that this pattern achieves the same result as (?&lt;=USD)\\d{3} from above, but it is less efficient because \\d{3} is matched twice.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#negative-lookbehind)
**Negative Lookbehind Before the Match**: `(?<!USD)\d{3}`
**Sample Match:** _100_ in _JPY100_
**Explanation:** The negative lookbehind (?&lt;!USD) asserts that at the current position in the string, what precedes is not the characters "_USD_". If the assertion succeeds, the engine matches three digits with \\d{3}.
**Negative Lookbehind After the Match**: `\d{3}(?<!USD\d{3})`
**Explanation:** \\d{3} matches _100_, then the negative lookbehind (?&lt;!USD\\d{3}) asserts that at that position in the string, what immediately precedes is not the characters "_USD_" then three digits.
Note that this pattern achieves the same result as (?&lt;!USD)\\d{3} from above, but it is less efficient because \\d{3} is matched twice.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#lookaround_support)
**Support for Lookarounds**
All major engines have some form of support for lookarounds—with some important differences. For instance, JavaScript doesn't support lookbehind, though it supports lookahead (one of the many [blotches on its regex scorecard](http://www.rexegg.com/regex-javascript.html#crippled)). Ruby 1.8 suffered from the same condition.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#lookbehind_width)
**Lookbehind: Fixed-Width / Constrained Width / Infinite Width**
One important difference is whether lookbehind accepts variable-width patterns.
✽ At the moment, I am aware of only three engines that allow infinite repetition within a lookbehind—as in (?&lt;=\\s_): .NET, Matthew Barnett's outstanding \[\_regex_ module for Python](<https://pypi.python.org/pypi/regex>), whose features far outstrip those of the standard \_re\* module, and the JGSoft engine used by Jan Goyvaerts' software such as EditPad Pro. I've also implemented an [infinite lookbehind demo for PCRE](http://www.rexegg.com/pcre-callouts.html#infinite_lb).
✽ Java accepts quantifiers within lookbehind, as long as the length of the matching strings falls within a pre-determined range. For instance, (?&lt;=cats?) is valid because it can only match strings of three or four characters. Likewise, (?&lt;=A{1,10}) is valid.
✽ PCRE (C, PHP, R …), Java and Ruby 2+ allow lookbehinds to contain alternations that match strings of different but pre-determined lengths (such as (?&lt;=cat|raccoon))
✽ Perl and Python require a lookbehind to match strings of a fixed length, so (?&lt;=cat|racoons) will not work.
To master lookarounds, there is a bit more you should really know. For these finer details, visit the [lookaround page](http://www.rexegg.com/regex-lookarounds.html).
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#noncap)

## Non-Capturing Groups: (?: … )

In regex as in the (2+3)_(5-2) of arithmetic, parentheses are often needed to group components of an expression together. For instance, the above operation yields 15. Without the parentheses, because the _ operator has higher precedence than the + and -, 2+3_5-2 is interpreted as 2+(3_5)-2, yielding… er… 15 (a happy coincidence).
In regex, normal parentheses not only group parts of a pattern, they also capture the sub-match to a capture group. This is often tremendously useful. At other times, you do not need the overhead.
In .NET, this capturing behavior of parentheses can be overridden by the (?n) flag or the RegexOptions.ExplicitCapture option. But in all flavors, .NET included, it is far more common to use (?: … ), which is the syntax for a non-capturing group. Watch out, as the syntax closely resembles that for a lookahead (?= … ).
For instance (?:Bob|Chloe) matches \_Bob_ or _Chloe_—but the name is not captured.
Within a non-capturing group, you can still use capture groups. For instance, (?:Bob says: (\\w+)) would match _Bob says: Go_ and capture _Go_ in Group 1.
Likewise, you can capture the content of a non-capturing group by surrounding it with parentheses. For instance, ((?:Bob|Chloe)\\d\\d) would capture "Chloe44".
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#nocap-with-modifier)
**Mode Modifiers within Non-Capture Groups**
On all engines that support inline modifiers such as (?i), except Python, you can blend the the non-capture group syntax with mode modifiers. Here are some examples:
✽ (?i:Bob|Chloe) This non-capturing group is case-insensitive.
✽ (?ism:^BEGIN._?END) This non-capturing group matches everything between "begin" and "end" (case-insensitive), allowing such content to span multiple lines (the s modifier), starting at the beginning of any line (the m modifier allows the ^ anchor to match the beginning of any line).
✽ (?i-sm:^BEGIN._?END) As above, but turns off the "s" and "m" modifiers
See below for more on [inline modifiers](http://www.rexegg.com/regex-disambiguation.html#modifiers).
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#atomic)

## Atomic Groups: (?> … )

An atomic group is an expression that becomes solid as a block once the regex leaves the closing parenthesis. If the regex fails later down the string and needs to backtrack, a regular group containing a quantifier would give up characters one at a time, allowing the engine to try other matches. Likewise, if the group contained an alternation, the engine would try the next branch. An atomic group won't do that: it's all or nothing.
**Example 1: With Alternation**
`(?>A|.B)C`
This will fail against _ABC_, whereas (?:A|.B)C would have succeeded. After matching the _A_ in the atomic group, the engine tries to match the _C_ but fails. Because it is atomic, it is unable to try the .B part of the alternation, which would also succeed, and allow the final token C to match.
**Example 2: With Quantifier**
`(?>A+)[A-Z]C`
This will fail against _AAC_, whereas (?:A+)[A-Z]C would have succeeded. After matching the _AA_ in the atomic group, the engine tries to match the [A-Z], succeeds by matching the _C_, then tries to match the token C but fails as the end of the string has been reached. Because the group is atomic, it is unable to give up the second _A_, which would allow the rest of the pattern to match.
If, before the atomic group, there were other options to which the engine can backtrack (such as quantifiers or alternations), then the whole atomic group can be given up in one go.
**When are Atomic Groups Important?**
When a series of characters only makes sense as a block, using an atomic group can prevent needless backtracking. This is explored on the section on [possessive quantifiers](http://www.rexegg.com/regex-quantifiers.html#possessive). In such situations atomic quantifiers can be useful, but not necessarily mission-critical.
On the other hand, there are situations where atomic quantifiers can save your pattern from disaster. They are particularly useful:
✽ In order to avoid the [**Lazy Trap**](http://www.rexegg.com/regex-quantifiers.html#lazytrap) with patterns that contain **lazy quantifiers** whose token can eat the delimiter
✽ To avoid certain forms of the [**Explosive Quantifier Trap**](http://www.rexegg.com/regex-explosive-quantifiers.html)
**Supported Engines, and Workaround**
Atomic groups are supported in most of the major engines: .NET, Perl, PCRE and Ruby. For engines that don't support atomic grouping syntax, such as Python and JavaScript, see the well-known [pseudo-atomic group workaround](http://www.rexegg.com/regex-tricks.html#pseudo-atomic-groups).
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#possessive)
**Alternate Syntax: Possessive Quantifier**
When an atomic group only contains a token with a quantifier, an alternate syntax (in engines that support it) is a possessive quantifier, where a + is added to the quantifier. For instance,
✽ (?>A+) is equivalent to A++
✽ (?>A_) is equivalent to A_+
✽ (?>A?) is equivalent to A?+
✽ (?>A{…,…}) is equivalent to A{…,…}+
This works in Perl, PCRE, Java and Ruby 2+.
For more, see the [possessive quantifiers section](http://www.rexegg.com/regex-quantifiers.html#possessive) of the quantifiers page.
**Non-Capturing**
Atomic groups are non-capturing, though as with other non-capturing groups, you can place the group inside another set of parentheses to capture the group's entire match; and you can place parentheses inside the atomic group to capture a section of the match.
Watch out, as the atomic group syntax is confusingly similar to the [lookbehind syntax (?&lt;= … )](http://www.rexegg.com/regex-disambiguation.html#lookarounds).
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#namedcapture)

## Named Capture: (?<foo> … ),

(?P<foo> … ) and (?P=foo)

When you cut and paste a piece of a pattern, Group 3 can suddenly become Group 1. That's a problem if you were using a back-reference \\3 or replacement $3.
One way around this problem is named capture groups. The syntax varies across engines (see [Naming Groups—and referring back to them](http://www.rexegg.com/regex-capture.html#namedgroups) for the gory details). It's worth noting that named group also have a number that obeys the [left-to-right numbering rules](http://www.rexegg.com/regex-capture.html#groupnumbers), and can be referenced by their number as well as their name.
In short, the two capturing flavors are (?<foo> … ) and (?P<foo> … ). For instance, in the right engines,
`^(?<intpart>\d+)\.(?<decpart>\d+)$`or`^(?P<intpart>\\d+).(?P<decpart>\\d+)$\`
would both match a string containing a decimal number such as _12.22_, storing the integer portion to a group named _intpart_, and storing the decimal portion to a group named _decpart_.
To create a back-reference to the _intpart_ group in the pattern, depending on the engine, you'll use \\k<intpart> or (?P=intpart). To insert the named group in a replacement string, depending on the engine, you'll either use ${intpart}, \\g<intpart>, $+{intpart}or the group number \\1. For the gory details, see [Naming Groups—and referring back to them](http://www.rexegg.com/regex-capture.html#namedgroups).
**To name, or not to name?**
I'll admit that I don't use named groups a whole lot, but some people love them.
Sure, named captures are bulkier than a quick (capture) and reference to \\1—but they can save hassles in expressions that contain many groups.
Do they make your patterns easier to read? That's subjective. For my part, if the regex is short, I always prefer numbered groups. And if it is long, I would rather read a regex with numbered groups and good comments in free-spacing mode than a one-liner with named groups.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#modifiers)

## Inline Modifiers: (?isx-m)

All popular regex flavors [apart from JavaScript](http://www.rexegg.com/regex-javascript.html#crippled) support inline modifiers, which allow you to tell the engine, in a pattern, to change how to interpret the pattern. For instance, (?i) turns on case-insensitivity. Except in Python, (?-i) turns it off.
If a modifier appears at the head of the pattern, it modifies the matching mode for the whole pattern—unless it is later turned off. But (except in Python) a modifier can appear in mid-pattern, in which case in only affects the portion of the pattern that follows.
Modifiers can be combined: for instance, (?ix) turns on both case-insensitive and free-spacing mode. (?ix-s) does the same, but also turns off single-line (a.k.a DOTALL) mode.
**Summary of inline modifiers**
✽ (?i) turns on [case insensitive mode](http://www.rexegg.com/regex-modifiers.html#i).
✽ Except in Ruby, (?s) activates "[single-line mode](http://www.rexegg.com/regex-modifiers.html#dotall)", a.k.a. DOTALL modes, allowing the dot to match line break characters. In Ruby, the same function is served by (?m)
✽ Except in Ruby, (?m) activate "[multi-line mode](http://www.rexegg.com/regex-modifiers.html#multiline)", which allows the dollar $ and caret ^ assertions to match at the beginning and end of lines. In Ruby, (?m) does what (?s) does in other flavors—it activates DOTALL mode.
✽ (?x) Turns on the [free-spacing mode](http://www.rexegg.com/regex-modifiers.html#freespacing) (a.k.a. whitespace mode or comment mode). This allows you to write your regex on multiple lines—like on the example on the home page—with comments preceded by a #. **Warning:** You will usually want to make sure that (?x) appears immediately after the quote character that starts the pattern string. For instance, if you try placing it on a newline because it would look better, the engine will try matching the newline characters before it activates free-spacing mode.
✽ In .NET, (?n) turns on "[named capture only](http://www.rexegg.com/regex-modifiers.html#n)" mode, which means that regular parentheses are treated as non-capture groups.
✽ In Java, (?d) turns on "[Unix lines mode](http://www.rexegg.com/regex-modifiers.html#d)" mode, which means that the dot and the anchors ^ and $ only care about line break characters when they are line feeds \\n.
**Combining Non-Capture Group with Inline Modifiers**
As we saw in the section on non-capture groups, you [can blend mode modifiers into the non-capture group syntax](http://www.rexegg.com/regex-disambiguation.html#nocap-with-modifier) in all engines that support inline modifiers—except Python. For instance, (?i:bob) is a non-capturing group with the case insensitive flag turned on. It matches strings such as "bob" and "boB"
But don't get carried away: you cannot blend inline modifiers with any random bit of regex syntax. For instance, the following are all illegal: `(?i=bob)`, `(?iP<name>bob)` and `(?i>bob)`
**Using Inline Modifiers in the Middle of a Pattern**
Usually, you'll use your inline modifiers at the start of the regex string to set the mode for the entire pattern. However, changing modes in the middle of a pattern can be useful, so I'll give you two examples.
`(\b[A-Z]+\b)(?i).*?\b\1\b` This ensures that an upper-case word is repeated somewhere in the string, in any letter-case. First we capture an upper-case word to Group 1 (for instance _DOG_), then we set case-insensitive mode, then ._? matches any characters up to the back-reference \\1, which could be \_dog_ or _dOg_. As a neat variation, (\\b[A-Z]+\\b)._?\\b(?=[a-z]+\\b)(?i)\\1\\b ensures that the back-reference is in lower-case.
`^(\w+)\b.*\r?\n(?s).*?\b\1\b` This ensures that the first word of the string is repeated on a different line. First we capture a word to Group 1, then we get to the end of the line with ._, match a line break, then set DOTALL mode—allowing the .\_? to match across lines, which brings us to our back-reference \\1.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#subroutines)

## Subroutines: (?1) and (?&foo)

As you well know by now, when you create a capture group such as (\\d+), you can then create a back-reference to that group—for instance \\1 for Group 1—to match the very characters that were captured by the group. For instance, (\\w+) \\1 matches _Hey Hey_.
In Perl, PCRE (C, PHP, R …) and Ruby 1.9+, you can also repeat the actual _pattern_ defined by a capture Group. In Perl and PCRE, the syntax to repeat the pattern of Group 1 is (?1) (in Ruby 2+, it is \\g&lt;1>)
For instance,
`(\w+) (?1)`
will match _Hey Ho_. The parentheses in (\\w+) not only capture _Hey_ to Group 1—they also define Subroutine 1, whose pattern is \\w+. Later, (?1) is a call to subroutine 1. The entire regex is therefore equivalent to (\\w+) \\w+
Subroutines can make long expressions much easier to look at and far less prone to copy-paste errors.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#relative_subroutines)
**Relative Subroutines**
Instead of referring to a subroutine by its number, you can refer to the relative position of its defining group, counting left or right from the current position in the pattern. For instance, (?-1) refers to the last defined subroutine, and (?+1) refers to the next defined subroutine. Therefore,
`(\w+) (?-1)` and `(?+1) (\w+)`
are both equivalent to our first example with numbered group 1. In Ruby 2+, for relative subroutine calls, you would use \\g&lt;-1> and \\g&lt;+1>.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#named-subroutines)
**Named Subroutines**
Instead of using numbered groups, you can use named groups. In that case, in Perl and PHP the syntax for the subroutine call will be (?&group_name). In Ruby 2+ the syntax is \\g&lt;some_word>. For instance,
`(?<some_word>\w+) (?&some_word)` is equivalent to our first example with numbered group 1.
**Pre-Defined Subroutines**
So far, when we defined our subroutines, we also matched something. For instance, (\\w+) defines subroutine 1 but also immediately matches some word characters. It so happens that Perl, PCRE and Python's alternate \[\_regex_ engine](<https://pypi.python.org/pypi/regex>) have terrific syntax that allows you to **pre-define a subroutine** without initially matching anything. This syntax is extremely useful to build large, modular expressions. We will look at it in the corresponding section: [Defined Subroutines: (?(DEFINE)(<foo> … ))(<bar> … ))](http://www.rexegg.com/regex-disambiguation.html#define)
**Subroutines and Recursion**
If you place a subroutine such as (?1) within the very capture group to which it refers—Group 1 in this case—then you have a recursive expression. For instance, the regex ^(A(?1)?Z)$ contains a recursive sub-pattern, because the call (?1) to subroutine 1 is embedded in the parentheses that define Group 1.
If you try to trace the matching path of this regex in your mind, you will see that it matches strings like _AAAZZZ_, strings which start with any number of letters _A_ and end with letters _Z_ that perfectly balance the _A_s. After you open the parenthesis, the A matches an \_A_… then the optional (?1)? opens another parenthesis and tries to match an _A_… and so on.
We'll look at recursion syntax in the next section. There is also a [page dedicated to recursion](http://www.rexegg.com/regex-recursion.html).
**Warning**
Note that the (?1) syntax looks confusingly similar to the ?(1) found in [conditionals](http://www.rexegg.com/regex-disambiguation.html#conditionals).
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#recursion)

## Recursive Expressions: (?R) … and old friends

A recursive pattern allows you to repeat an expression within itself any number of times. This is quite handy to match patterns where some tokens on the left must be balanced by some tokens on the right.
Recursive calls are available in PCRE (C, PHP, R…), Perl, Ruby 2+ and the alternate _regex_ module for Python.
**Recursion of the Entire Pattern: (?R)**
To repeat the entire pattern, the syntax in Perl and PCRE is (?R). In Ruby, it is \\g&lt;0>.
For instance,
`A(?R)?Z` matches strings or substrings such as _AAAZZZ_, where a number of letters _A_ at the start are perfectly balanced by a number of letters _Z_ at the end. The initial token A matches an _A_… Then the optional (?R)? tries to repeat the whole pattern right there, and therefore attempts the token A to match an _A_… and so on.
**Recursion of a Subroutine: (?1) and (?-1)**
You also have recursion when a [subroutine](http://www.rexegg.com/regex-disambiguation.html#subroutines) calls itself. For instance, in
`^(A(?1)?Z)$` subroutine 1 (defined by the outer parentheses) contains a call to itself. This regex matches entire strings such as _AAAZZZ_, where a number of letters _A_ at the start are perfectly balanced by a number of letters _Z_ at the end.
As we saw in the [section on subroutines](http://www.rexegg.com/regex-disambiguation.html#subroutines), you can also call a subroutine by the relative position of its defining group at the current position in the pattern. Therefore,
`^(A(?-1)?Z)$` performs exactly like the above regex.
There is much more to be said about recursion. See the page dedicated to [recursive regex patterns](http://www.rexegg.com/regex-recursion.html).
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#conditionals)

## Conditionals: (?(A)B) and (?(A)B|C)

This section covers the basics on conditional syntax. For more, you'll want to explore the page dedicated to [regex conditionals](http://www.rexegg.com/regex-conditionals.html).
In (?(A)B), condition A is evaluated. If it is true, the engine must match pattern B. In the full form (?(A)B|C), when condition A is not true, the engine must match pattern C. Conditionals therefore allow you to inject some _if(…) then {…} else {…}_ logic into your patterns.
Typically, condition A will be that a given capture group has been set. For instance, (?(1)}) says: If capture Group 1 has been set, match a closing curly brace. This would be useful in
`^({)?\d+(?(1)})$`
Likewise, (?(foo)…) checks if the capture group named _foo_ has been set.
This pattern matches a string of digits that may or may not be embedded in curly braces. The optional capture Group 1 ({)? captures an opening brace. Later, the conditional checks if capture 1 was set, and if so it matches the closing brace.
Let's expand this example to use the "else" part of the syntax:
`^(?:({)|")\d+(?(1)}|")$`
This pattern matches strings of digits that are either embedded in double quotes or in curly braces. The non-capture group (?:({)|") matches the opening delimiter, capturing it to Group 1 if it is a curly brace. After matching the digits, (?(1)}|") checks whether Group 1 was set. If so, we match a closing curly brace. If not, we match a double quote.
**Lookaround in Conditions**
In (?(A)B), the condition you'll most frequently see is a check as to whether a capture group has been set. In .NET, PCRE and Perl (but not Python and Ruby), you can also use lookarounds:
`\b(?(?<=5D:)\d{5}|\d{10})\b`
If the prefix _5D:_ can be found, the pattern will match five digits. Otherwise, it will match ten digits. Needless to say, that is not the only way to perform this task.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#condrel)
**Checking if a relative capture group was set**
(?(1)A) checks whether Group 1 was set. In PCRE, instead of hard-coding the group number, we can also check whether a group at a relative position to the current position in the pattern has been set: for instance, (?(-1)A) checks whether the previous group has been set. Likewise, (?(+1)A) checks whether the next capture group has been set. (This last scenario would be found within a larger repeating group, so that on the second pass through the pattern, the next capture group may indeed have been set on the previous pass.)
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#condsub)
**Checking if a recursion level was reached**
This is not the place to be talking in depth about recursion, which has a [section below](http://www.rexegg.com/regex-disambiguation.html#recursion) and a [dedicated page](http://www.rexegg.com/regex-recursion.html), but for completion I should mention two other uses of conditionals, available in Perl and PCRE:
✽ (?(R)A) tests whether the regex engine is currently working within a recursion depth (reached from a recursive call to the whole pattern or a subroutine).
✽ (?(R1)A) tests whether the current recursion level has been reached by a recursive call to subroutine 1.
See examples [here](http://www.rexegg.com/regex-conditionals.html#recursivecheck).
**Availability of Regex Conditionals**
Conditionals are available in PCRE, Perl, .NET, Python, and Ruby 2+. In other engines, the work of a conditional can usually be handled by the careful use of lookarounds.
**Similar Syntax**
Note that the (?(1)B) syntax can look confusingly similar to (?1) which stands for a [regex subroutine](http://www.rexegg.com/regex-disambiguation.html#subroutines), where the regex pattern defined by Group 1 must be matched.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#define)

## Pre-Defined Subroutines: (?(DEFINE)(<foo> … )(<bar> … ))

and (?&foo)

Available in Perl, PCRE (and therefore C, PHP, R…) and Python's alternate [_regex_ engine](https://pypi.python.org/pypi/regex), pre-defined subroutines allow you to produce regular expressions that are beautifully modular and start to feel like clean procedural code.
Within a (?(DEFINE) … ) block, you can pre-define one or several named subroutines without matching any characters at that time. You can even pre-define subroutines based on other subroutines. When you get to the matching part of the regex, this allows you to match complex expressions with compact and readable syntax—and to match the same kind of expressions in multiple places without needing to repeat your regex code.
This makes your regex more maintainable, both because it is easier to understand and because you don't need to fix a sub-pattern in multiple places.
But an example is worth a thousand words, so let's dive in. If you like, you can play with the pattern and sample text in this [online demo](http://regex101.com/r/tD0yO1/2).
A quick note first: in case you wonder what the \\ are all about, they simply match one space character. The regex is in free-spacing mode—the x flag is implied but could be made part of the pattern using the (?x) modifier. In free-spacing mode, spaces that you do want to match must either be escaped as in \\ or specified inside a character class as in [ ].

**(?(DEFINE)  # start DEFINE block**

## pre-define quant subroutine

  (?<quant>many|some|five)

# pre-define adj subroutine

  (?<adj>blue|large|interesting)                   

# pre-define object subroutine

  (?<object>cars|elephants|problems)                

# pre-define noun_phrase subroutine

  (?&lt;noun_phrase>(?&quant)\\ (?&adj)\\ (?&object))   

# pre-define verb subroutine

  (?<verb>borrow|solve|resemble)
)          # end DEFINE block

**##### The regex matching starts here #####**
(?&noun_phrase)\\ (?&verb)\\ (?&noun_phrase)

This regex would match phrases such as:
✽ _five blue elephants solve many interesting problems_
✽ _many large problems resemble some interesting cars_
Note that the portion that does the matching is extremely compact and readable:
`(?&noun_phrase)\ (?&verb)\ (?&noun_phrase)`
The subroutine _noun_phrase_ is called twice: there is no need to paste a large repeated regex sub-pattern, and if we decide to change the definition of _noun_phrase_, that immediately trickles to the two places where it is used.
Note also that _noun_phrase_ itself is built by assembling smaller blocks: its code (?&quant)\\ (?&adj)\\ (?&object) uses the _quant_, _adj_ and _object_ subroutines.
With this kind of modularity, you can build regex cathedrals. There is a beautiful example on the page with the regex to [match numbers in plain English](http://www.rexegg.com/regex-trick-numbers-in-english.html).
**A Note on Group Numbering**
Please be mindful that each named subroutine consumes one capture group number, so if you use capture groups later in the regex, remember to count from left to right. The gory details are on the page about [Capture Group Numbering & Naming](http://www.rexegg.com/regex-capture.html#define).
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#branchreset)

## Branch Reset: (?| … )

If you've read the page about [Capture Group Numbering & Naming](http://www.rexegg.com/regex-capture.html#groupnumbers), you'll remember that capture groups get numbered from left to right. Therefore, if you have two sets of capturing parentheses, they have two group numbers. Sometimes, you might wish that these two sets of parentheses might capture to the same numbered group.
Perl and PCRE (and therefore C, PHP, R…) have a feature that let you reuse a group number when capturing parentheses are present on different sides of an alternation.
This is rather abstract, so let's take an example. Let's say you want to match a number, but only in three situations:
✽ If it follows an _A_, as in _A00_
✽ If it precedes a _B_, as in _11B_
✽ If it is sandwiched between _C_ and _D_, as in _C22D_
This poses no problem using lookahead and lookbehind, but the branch reset syntax (?| … ) gives you another—potentially more readable—option:
`(?|A(\d+)|(\d+)B|C(\d+)D)`
After the initial (?|, which introduces a branch reset, the group has a three-piece alternation (two |). Each of those contains a capture group (\\d+). The number of all of those capture groups is the same: Group 1.
You are not limited to one group. For instance, if you are also interested in capturing a potential suffix after the number (which can happen in the situations _11B_ and _C55D_), place another set of parentheses wherever you find a suffix:
`(?|A(\d+)|(\d+)(B)|C(\d+)(D))`
Using this regex to match the string _A00 11B C22D_, you obtain these groups:

Match      Group 1: Number      Group 2: Suffix

* * *

A00        00                   (not set)
11B        11                   B
C22D       22                   D

**How Useful is Branch Reset?**
When I first [read about branch reset](http://www.rexegg.com/pcre-doc/_latest/pcrepattern.html#SEC15) in the [PCRE documentation](http://www.rexegg.com/pcre-documentation.html) a few years ago, I was excited and certain I'd use it often. Since then, I've written several thousand regular expression patterns, but I've used branch reset less than a handful of times. It's probably my fault for always jumping on other ways to do things first, but this leaves me with a sense that the feature is not all that useful after all.
That being said, on rare occasions, it's just the most direct and elegant way of doing things.
Let's look at one more example, less contrived than the first—which was pared down in order to explain the feature.
**A Branch Reset Example: Tokenization with Variable Formats**
To me, this is an example where branch reset seems to offer benefits over competing idioms.
Suppose you want to parse strings such as
_song:"Sweet Home Alabama" fruit:apple color:blue motto:"Don't Worry"_
into pairs of keys and values. When the value following the colon is between quotes, you only want the inside of the quotes. Therefore, you expect something like:

Group 1	   Group 2

* * *

song	   Sweet Home Alabama
fruit	   apple
color	   blue
motto	   Don't Worry	

This branch reset regex will get you there:
`(\S+):(?|([^"\s]+)|"([^"]+))`
Group 1 (\\S+) is a straight capture group that captures the key. In the branch reset, the two sets of capturing parentheses allow you to capture different kinds of values in different formats to the same group, i.e. Group 2. You can check the group captures in the right pane of this [online regex demo](http://regex101.com/r/dU5lQ3/2).
To me, this alternative with a conditional and a lookbehind…
`(\S+):"?((?(?<!")[^"\s]+|[^"]+))` …feels a little less satisfying. But hey, it works too.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#inlinecomments)

## Inline Comments: (?# … )

By now you must be familiar with the free-spacing mode, which makes it possible to unroll long regexes and comment them out, as in the many code boxes on this site. To turn on free-spacing for an entire pattern, the syntax varies:
✽ the (?x) modifier works in .NET, Perl, PCRE, Java, Python and Ruby.
✽ the x flag can be added after the pattern delimiter in Perl, PHP and Ruby.
✽ .NET lets you turn on the RegexOptions.IgnorePatternWhitespace option.
✽ Python lets you turn on re.VERBOSE
What if you only want to insert a single comment without turning on free-spacing mode for the entire pattern? In Perl, PCRE (and therefore C, PHP, R…), Python and Ruby, you can write an inline comment with this syntax: (?# … )
For instance, in:
`(?# the year)\d{4}`
\\d{4} matches four digits, while (?# the year) tells you what we are trying to match.
How useful is this? Not very. I almost never use this feature: when I want comments, I just turn on free-spacing mode for the whole regex.
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#codecapsule)

## Code Capsule: (?{…})

[Perl regex](http://www.rexegg.com/regex-perl.html) has a magical feature: the ability to insert fragments of code to be executed in the middle of a pattern evaluation.
The syntax (?{…}) creates a code capsule. When the engine encounter it, Perl executes the statements within the curly braces {…}.
A delightful example is given on the section about [what makes Perl special](http://www.rexegg.com/regex-perl.html#perlspecial). Here is a more basic one.
Consider the pattern (?:[a-z])+, which simply matches a sequence of lower-case letters. In the non-capture group, we'll inject a code capsule that prints the temporary match, which Perl represents with the $& variable. The code is {print "Temp match: '$&'\\n";}, and the capsule is (?{print "Temp match: '$&'\n";}).
This allows you to see the match being built, as shown in the output below.if ('abcd' =~ /(?:[a-z](?{print "Temp match: '$&'\\n";}))+/ ) {} # Output: # Temp match: 'a' # Temp match: 'ab' # Temp match: 'abc' # Temp match: 'abcd'
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#pcrecallouts)

## PCRE Callouts: (?C…)

The (?C…) token enables PCRE to provide a similar feature to Perl's code capsules. When the token is encountered, if a callout function has been specified when invoking the match function, the engine temporarily suspends the matching and passes control to the callout function.
For details, please see my page about [PCRE callouts](http://www.rexegg.com/pcre-callouts.html).
[(direct link)](http://www.rexegg.com/regex-disambiguation.html#versioncheck)

## Version Check: (?(VERSION>=x) … )

This is a feature I am proud to have suggested to Philip Hazel, the father of PCRE.
In PCRE2 (versions of PCRE 10.0 and beyond), you can check what version of PCRE you are using. This is useful because PCRE is often embedded in environments such as Apache, PHP or text editors such as Notepad++, where you may not know which version of PCRE is being used, and therefore which features are available.
To check whether the current version is over version 10, use something such as _YES_ as your subject, and try to match it with this pattern:
`(?(VERSION>=10)YES)`
If it matches, the version is 10 or later.
As another example, you could use _LATER // EARLIER_ as your subject, and match it with this:
`(?(VERSION>=10.5)LATER|EARLIER)`
Depending on your version, PCRE2 will either match _LATER_ or _EARLIER_.[Leave a Comment](http://www.rexegg.com/regex-disambiguation.html#comform)
1-10 of 11 Threads
Subject: Redundant \\d
In a paragraph "Negative Lookahead After the Match":
I believe, that the second "\\d" in a regex
\\d+(?! \\d| dollars)
is just unnecessary, as the part "\\d+" will eat all the digits in a row, as quantifiers are greedy by default. So it is technically impossible, that "\\d+" is followed by yet another digit. Am I right?

Reply to blixen
Subject: RE: Redundant \\d
Hi blixen, The \\d in the negative lookahead does serve a purpose: with what you suggest, i.e. \\d+(?! dollars) we would match "100" in "1001 dollars" Regards, Rex

Subject: Unbelievable
The most interesting tutorial on subject of the WWW!!

Subject: Atomic groups
"If, before the atomic group, there were other options to which the engine can backtrack (such as quantifiers or alternations), then the whole atomic group can be given up in one go. "
What does this line mean? Will it backtrack past the atomic group and try it again fresh when it advances to it again?

Reply to Anthony
Subject:
Yes. The engine does not backtrack into the atomic group one token at a time, it give it up in one go (one block). Then of course if it resumes its forward motion and reaches the group again, it tries it again.

Subject: essence of the (?
I found this page while trying to hone in the "essence" of the (? In regex. While I realize that the subsets that all share this mark are widely varied is it safe to say they all share the distinction of being a non-capturing group? Thanks in advance for your reply and… Keep up the good work! Troy D.

Reply to Troy Dalmasso
Subject: RE: essence of the (?
Hi Troy,
I sympathize with your desire to distill, but IMO the direction you're going to try to summarize (?...) will not be a useful conceptual construct to you in the long run.
For instance (?i) turns on case-insensitivity. In Perl regex, (?{print "$&\\n";}) is a capsule that executes a bit of Perl code. And what about (?(1)(?!)) which means fail if Group 1 is captured?
(?...) is just a nail on which a lot of unrelated regex syntax hangs.
If you make peace with that fact, I think your experience will be smoother.
Kindest regards,
Rex

Subject: Removing Confusion Around (? Regex Syntax
This topic is very well written and much appreciated. Distills large works like Friedl's book into an easily digestible quarter of an hour. I look forward to reading the rest!

Subject: RE: Your banner regex
Thanks Rex, you really made me laugh!! I see you always have the same excellent sense of humor as in your (brilliant) articles & tutorials! Thank you for this great site and for the joke :) (and for the new regex)
Greetings from (the south of) France! Xavier Tello

Reply to xtello
Subject: RE: Your banner regex
Hi Xavier, Thank you for your very kind encouragements! If only everyone could be like you. When the technology becomes available, would you mind if I get back in touch in order to clone you? Wishing you a fun weekend, Rex

Subject: Your banner regex
I looked at the regex displayed in your banner… Applying this regex to the string [spoiler] will produce [spoiler] \(if I'm not wrong!). What's this easter egg? ;-)

Reply to xtello
Subject: RE: Your banner regex
Hi Xavier, Thank you for writing, it was a treat to hear from you. Wow, you are the first person to notice! In fact, you made me change the banner to satisfy your sense of completion (and make it harder for the next guy). > What's this easter egg? This Easter Egg (pun intended, I presume) is that you are the grand winner of a secret contest. From the time I launched the site, I had planned that the first person to discover this would win a free trip to the South of France. You won!!! :) :) :) Wishing you a beautiful day, Rex

Subject: Little question about capture
Hi Andy. Thank you for all these articles, they are amazing! I learn a lot with this website. So glad to found it! Like they said : Best ressource on internet :)
I tried some of your example, and I'm stuck with one of them: (? :(()|-)\\d{6}(? (1))). When I'm trying "(111111)" with "preg_match_all", it captures"(". Do you think it's possible to bypass this capture? When I use "-222222", it catches an empty string… And I dont unserstand why. Could you please explain this? Thank you Andy! And again: Nice work!

Reply to Nicolas
Subject: RE: Little question about capture
Hi Nicolas,
Run this:
$regex='~(?:(\()|-)\d{6}(?(1)\))~';
$string='(such as "(444444)"), or it is preceded by a minus sign (such as "-333333").';
preg_match_all($regex,$string,$m);
var_dump( $m );
You will see that the MATCHES are (444444) and -333333
The CAPTURES are "(" and "". The captured left par is what makes the ?(1) work later in the regex.
Let me know if this is still unclear.

Subject: Great Work man.
I enjoyed reading this article and learnt a lot. Thanks for your wonderful work. :)

Subject: Brilliant
Best resource I've found yet on regular expressions. Much appreciate the work you put into this. Why not create an eBook that could be downloaded—I for one would willingly cough up a few dollars. Regards
Vin

Reply to Vin
Subject: Re: Brilliant
Hi Vin, Thank you very much for your encouragements, and also for your suggestion. I've been itching to make a print-on-demand book with the lowest price possible, to make it easy to read offline. Will probably do that as soon as they extend the length of a day to 49 hours. Wishing you a fun weekend, Andy

Leave a Comment

- Your name
- Email (it will not be shown)
  Your location
  Subject:**All comments are moderated.
  Link spammers, this won't work for you.**
  To prevent automatic spam, we require that you type the two words below before you submit your comment.

reCAPTCHA challenge image (image/jpeg) (image/png)

[Privacy & Terms](http://www.google.com/intl/en/policies/)

