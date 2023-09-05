---
id: nb0t6wdimluviry7s4yp4dj
title: Powershell
desc: ''
updated: 1677924262866
created: 1633199321476
---
## Concepts

### PSDrive

### default-variables

Before starting: set SetExecutionPolicy and enable Developer features in windows

Most important difference between powershell and other shells:
In powershell everything is an object, so:

```pwsh
Compare-Object (Get-Variable -Scope 0) (Get-Variable -Scope 1)
```

gives you the difference in objects

## Cmdlets use standard parameters:

```
help / get-help / -?
all separators in parameters are -
```

### Common Parameters (added at runtime, not declarable)

WhatIf, Confirm, Verbose, Debug, Warn, ErrorAction, ErrorVariable, OutVariable, and OutBuffer.

## Writing C# in Powershell

Make huge string with c# code,
add-type

## Special Variables:

$\_     this variable

## chaining cmdlets, functions and statements:

|    pipeline operator: uses 'this' operator (also can add clauses after pipeline as in: Get-Service | Where-Object {$\_.Name -eq "SQLBrowser"} | Start-Service) with where/where-object

## important quirks and shortcuts:

- equality is checked by -eq
- & is the invocation operator
- variables are prepended with $ (so & $profile loads the profile-variable that is the powershell-profile by default)
- Here-strings are interpolated strings, beginning with @"
- @() &lt;=> arrayLiteral
- @{} &lt;=> objectLiteral (Dictionary? \\@verify)
- get-alias lists all aliases, including $, $\_, &, % and so forth
- dot-sourcing - . C:/pathtofile loads into same session.
- gci ENV: lists all environment variables
- $() are sub-expressions
- "" strings parse expressions, '' strings don't
- [SomeNamespace.SomeClass]&#x3A;:PropertyOrMethod is a static property/method accessor

## important variables, concepts and shortcuts

Get-Variable : returns variables in current session
get-help about_...
where clause after pipeline operator:
 PowerShell deploys Pipeline to introduce a 'Where' clause.
 Get-Eventlog security | where {$_.Eventid -eq "540"}

## Working with .NET COM-Objects

Boils down to the ability to inspect classes, namespaces, assemblies etc. without? creating instances. This would be called browsing the .net framework class library.
Since most of the .NET Framework core classes are contained in the System namespace, Windows PowerShell will automatically attempt to find classes you specify in the System namespace if it cannot find a match for the typename you specify. This means that you can specify Diagnostics.EventLog instead of System.Diagnostics.EventLog.
How to?
$Directory = Get-ChildItem -Directory
builds an variable of an object of type system.io.directoryInfo \\@verify

also build objects with

```pwsh
$RemoteAppLog = New-Object -TypeName System.Diagnostics.EventLog Application,192.168.1.81
```

```pwsh
Get-WmiObject -Class Win32_LogicalDisk | Select-Object -Property Name,FreeSpace| Get-Member
```

TypeName: System.Management.Automation.PSCustomObject
to replicate data to modify

Can Get-TypeData and get the members of the listed types
eg. viewing the class members of wmiobjects:

```powershell
get-wmiobject -class win32_service | get-member -membertype method
```

shows methods for changing services

Specifying .NET types for variables and objects:

```powershell
[SomeNamespace.SomeAssembly.SomeClass]$ObjectDeclaration | Get-Member

```

shows members for the generated object

```pwsh
Function Get-WmiNamespace ($Path = 'root'){
    foreach ($Namespace in (Get-WmiObject -Namespace $Path -Class __Namespace))
    {
        $FullPath = $Path + "/" + $Namespace.Name
        Write-Output $FullPath
        Get-WmiNamespace -Path $FullPath
     }}
```

enumerates all possible namespaces accessible by wmiObjects

can also query to meta_class

```pwsh
Get-WmiObject -query "SELECT * FROM meta_class WHERE __class = 'Win32_LogicalDisk'"
```

You can query all possible namespaces with the system.
The currentdomain static property returns a system.appdomain object. This object contains a number of methods in addition to the displayed properties. I can find this information by piping the results from the currentdomain static property to the Get-Member cmdlet. This command is shown here.
[appdomain]&#x3A;:CurrentDomain | get-member
The method I want to use is the getassemblies method. The getassemblies method is not a static method, but because the currentdomain static property returns a system.appdomain object. I can call the method directly from that object. Here is the command and associated output from the Windows PowerShell console (on a Windows PowerShell 2.0 machine. In Windows PowerShell 3.0, the versions are all v4.0.xxxxx).
PS C:> [appdomain]&#x3A;:currentdomain.GetAssemblies()

[appdomain]&#x3A;:currentdomain.GetAssemblies() | % {$\_.gettypes()} | sort basetype | Out-File -FilePath c:fsogettypes.txt -Width 180 –Append

### extending types in powershell

You can update/add typedata to any .net type by sourcing .ps1xml files to the current session (obviously works in any given session, the sourcing behaviour switches accordingly).
then
update-typedata -prependPath $customps1xmlFile

### foreach

```
both
    alias to foreach-object : foreach ($command in Get-Command -CommandType All) { $command }
    statement : Get-Command -CommandType All | foreach { $_ }
```

### Member Types

### Parsing PSD1-Files

```
[Import-PowershellDataFile](https://technet.microsoft.com/en-us/library/mt722787.aspx)
[Import-LocalizedData](https://technet.microsoft.com/library/6ee55b18-63ae-41c9-80ed-677966f29ad6%28v=wps.630%29.aspx)
[Data Section](https://technet.microsoft.com/en-us/library/hh848302%28v=wps.630%29.aspx)
PowerShell DSC parameter transformation attribute
```

### Splatting / Destructuring (@)

```pwsh
$first,$second,$rest = 1,2,3,4,5
```

Works like in JS

is default behaviour if we return an empty or 1-array like:

```pwsh
Function Get-Array() {
return @();
}
```

 returns $null
 @(1); returns System.Int32
 every array -ge 2 returns System.Object\[]

prepending ',' before the return type will not destructure it:
Function Get-Array() {
 return ,@(1)

can be used to pass a slew of parameters to a function $params = @{someparams...) -> function someFunction(@params)
}

### Proxy Commands

### Command MetaData

Comma and Semi-colon
For many years a bad attitude to syntax hindered me.  My breakthrough was realizing that punctuation marks are there to aid the readers' understanding; my mistake was thinking syntax rules were designed by my English teacher as a way of finding new ways to tell me off.
With PowerShell's syntax the comma is frequently used to separate items on a list.  Whereas the semi-colon is used to split separate ideas.  Let us study this example:

## Eventlog example script to illustrate PowerShell's syntax.

Clear-host
$i=0
$Log = Get-EventLog -List
ForEach ($Item in $Log) {
"{0,-30} {1,-20} {2,13}" -f `
$Item.Log, $Item.OverflowAction, $Item.MaximumKilobytes
}
Note 1: Each $Item is separated by a comma.  No sign of the semi-colon, yet.
Note 2: The comma is also used to separate items in an array {0,-30}
Suppose we want to count the number of eventlogs.  Let us introduce a variable $i
Clear-host
$i=0
$Log = Get-EventLog -List
ForEach ($Item in $Log) {
"{0,-30} {1,-20} {2,13}" -f `
$Item.Log, $Item.OverflowAction, $Item.MaximumKilobytes; $i++
}
"There are $i eventlogs"
Note 3: The counter variable, $i++ is new element, which is not connected to the list; time for a semi-colon before the counter variable.
= Equals and -Not equal (!)
The equals sign (=) behaves just as expected.  As usual, '=' tests for equivalence, my main use for equals sign is to sets a variable to =  a certain value.  The equals sign has a counterpart ! (Exclamation mark) meaning, 'not equal'.  You may also employ -Not instead of !  I just include these two basic operators, '=' and ! for completeness.
PowerShell -eq
PowerShell has a family of conditional operators

- \-eq meaning equals
- \-ne in the negative, not equal to...
  Note: there is no -neq operator; just use the two letters -ne.
- \-gt and also -ge (greater than or equal)
- \-lt and also -le (less than or equal)
  Here is how you would use the most famous member -eq
  Clear-host
  Get-Service | Where-Object {$\_.Status -eq "Running"}
  Note 4: Don't be tempted to use the "=" sign here, that would be a big mistake.
  Case Insensitive
  PowerShell is fundamentally case insensitive.  Every object and every cmdlet is case insensitive.  Set-Location performs exactly the same action as set-location.  However, where your data has case sensitive values, there are PowerShell operators to deal with 'case'.  For example, -gt means greater than, -Match means contains a particular string value.
  However, you can force these and similar operators to be case sensitive by prefixing hem with a 'C'.  -CMatch, or -CGt mean that the comparison will be case sensitive.


- Plus as a Concatenator
  When I wanted to join text and numbers, I spent time looking for PowerShell's concatenator.  Silly me, all I need is the simple + plus sign.  Where other languages use + for adding numbers, PowerShell uses ' + ' for joining strings, or even for combining text with numbers:
  #PowerShell + concatenator
  $Total = 180
  "My total is " + $Total

## Result:

My total is 180
Hyphen -Dash -Minus
Some people call this symbol (-) minus, others a refer to this sign as a dash, I mostly call it a hyphen.  Let me be clear, this character maps to ASCII 45, to see the character, hold down ALT key, type 45 on numeric keypad, now let go of ALT key.
PowerShell uses this - symbol for two purposes.  Firstly, to join Verb-Noun pairs, for example Out-File guy.txt.  Secondly, this minus sign is also used for parameters, modifiers, or filters such as -List; as in Get-Eventlog -List.  The trap I fall into is to put a space between the minus and the modifier.  get  -Eventlog is clearly wrong, because there is a space between get and -. The correct format is, Get-Eventlog, with no space.
Pipeline, the Pipe Symbol | (Sometimes looks like ¦)
The ability to pipe the output of one command, so that it becomes the input of the second command is PowerShell's signature tune.  Thus it is important to be clear about this | symbol.
When typed in notepad, the pipeline symbol looks like this: | but when typed in the Microsoft Shell it looks like ¦.  On my keyboard the key I am using this symbol is next to the z, however I have seen keyboards where the pipeline key is next to numeric 1 on the top row.  Once you find, then type the key, you get a pipe symbol (|).
To be crystal clear this pipeline symbol corresponds to ASCII 124.  N.B this not ASCI 0166.  Test by holding down the Alt key and typing the number (124 or 0166) on the numeric pad, then letting go of the Alt key.
In PowerShell syntax the pipeline symbol (|) has three roles.

1. Think of the pipeline as a method for joining two commands.
   Get-Eventlog system | Format-List
   You could even have two pipelines in one statement.
2. PowerShell deploys Pipeline to introduce a 'Where' clause.
   Get-Eventlog security |where {$\_.Eventid -eq "540"}
3. Pipeline is similar to 'more' in DOS
   Get-Eventlog system | more ...
   See more about $\_.
   The Significance of PowerShell's Different Brackets ( { \[] } )
   If I had to choose one element of PowerShell's syntax to master it would be the bracket.  I love the logic of an 'If' statement; however, to get the command to work you have to understand If (parenthesis for condition) {curly brackets for payload}.
   At first PowerShell's brackets surprised me.  Each type has a specific role, the wrong bracket will cause an otherwise sound command, to fail miserably.  The message is clear, you have to understand your brackets.  Let us see how each of these (), {} or \[] has a different purpose.
   1) () Parenthesis or Curved brackets are used for required options in the foreach loop

# PowerShell syntax - types of bracket

Clear-host
$disk= WmiObject Win32_LogicalDisk
"Drive Letter Size GB "
Foreach ($drive in $disk ) {"Drive = " + $drive.Name}
2) {} Braces or 'curly' brackets are required for block expressions within a command, for instance, the 'where' or 'Where-Object' command.
Example: Get-Service | Where-Object {$\_.status -eq "stopped" }
Example: Get-Service [s]\*3) \[] Square brackets are used for optional elements, for example, to filter services beginning with 's':
I have also found square brackets are needed for math functions such as [int]value
Example: [int]TotalProcessorTime
4) >  and >> work as with DOS and cmd, they output the results of your commands not to screen, but to a text file.  The double chevron >> appends, the single > will overwrite any existing data in the file.
Conclusion, the type of bracket really matters, therefore always double check before you select {} () or \[].  See more about PowerShell's brackets.
Double and Single Quotes
As with brackets, the type of quotation mark is highly significant in PowerShell syntax.  Here is an example to illustrate the differences between single quotes and double quotes in PowerShell
$Bill = 57
$Tax = 7
$Total = $Bill + $Tax
"My total is $Total"
Using the double quotes illustrates PowerShell's intelligence, it realizes that $Total is variable holding the value 64, thus the output is:
My total is 64
However, if we substitute single quotes: 'My total is $Total', we get a different, literal answer: My total is $Total.  PowerShell assumed that for a reason best known to us, we did not want it to use the math representation.
Achieve Word-wrap with Backtick`
While word-wrap is neither essential, nor strictly speaking a syntactic element, it makes scripts easier to read.  The problem with most scripting languages, including PowerShell, is that an end-of-line means end of command.
A new line, means a new command.
Thus we need a special symbol to control word-wrap.  PowerShell employs the backtick `.  I have seen this same character referred to as a grave.  A sure way of typing this key is to hold down the Alt key.  Now type 0096 on the numeric pad, let go of the Alt key.
PowerShell's Switch Command
In VBScript one of my favourite techniques was Select Case, here in PowerShell the equivalent technique is called 'Switch'.  Here is an example.   Guess the outcome?
$Choice = 2
switch ($Choice)
{
1 {"First Choice"}
2 {"Second Choice"}
3 {"Third Choice"}
}
The answer is determined by the value of $Choice, in this instance 2, therefore the result would be 2 "Second Choice"
PowerShell's Operators
Operator
Definition of PowerShell Syntax

# 

# The hash key is for comments

- Add


- Subtract


- Multiply
  /
  Divide
  %
  # Modulus (Some call it Modulo) - Means remainder 17 % 5 = 2 Remainder
  equal
  \-Not
  logical not equal
  !
  logical not equal
  \-band
  binary and
  \-bor
  binary or
  \-bnot
  binary not
  \-replace
  Replace (e.g.  "abcde" -replace "b","B") (case insensitive)
  \-ireplace
  Case-Insensitive replace (e.g.  "abcde" -ireplace "B","3")
  \-creplace
  Case-sensitive replace (e.g.  "abcde" -creplace "B","3")
  \-And
  AND (e.g. ($a -ge 5 -AND $a -le 15) )
  -or
  OR  (e.g. ($a -eq "A" -OR $a -eq "B") )
  -Is
  IS type (e.g. $a -Is [int] )
  -Isnot
  IS not type (e.g. $a -Isnot [int] )
  -as
  convert to type (e.g. 1 -as [string] treats 1 as a string )
  ..
  Range operator (e.g.  foreach ($i in 1..10) {$i }  )
  &
  call operator (e.g. $a = "Get-ChildItem" &$a executes Get-ChildItem)
  . (dot followed by space)
  call operator (e.g. $a = "Get-ChildItem" . $a executes Get-ChildItem in the current scope)
  .
  .Period or .full stop for an objects properties
  $CompSys.TotalPhysicalMemory
  \-F
  Format operator (e.g. foreach ($p in Get-Process) { "{0,-15} has {1,6} handles" -F  $p.processname,$p.Handlecount } )
  PowerShell's Conditional or Comparison Operators
  Operator
  Definition of PowerShell Syntax
  \-lt
  Less than
  \-le
  Less than or equal to
  \-gt
  Greater than
  \-ge
  Greater than or equal to
  \-eq
  Equal to
  \-ne
  Not Equal to
  \-Contains
  Determine elements in a group.
  Contains always returns Boolean $True or $False.
  \-Notcontains
  Determine excluded elements in a group
  This always returns Boolean $True or $False.
  \-Like
  Like - uses wildcards for pattern matching
  \-Notlike
  Not Like - uses wildcards for pattern matching
  \-Match
  Match - uses regular expressions for pattern matching
  \-Notmatch
  Not Match - uses regular expressions for pattern matching
  Bitwise
  \-band
  Bitwise AND
  \-bor
  Bitwise OR
  \-Is
  Is of Type
  \-Isnot
  Is not of Type
  Other PowerShell Operators
  if(condition)
  If condition (See more on PowerShell's If)
  ElseIf(condition)
  ElseIf
  else(condition)
  Else
  > Redirect, for example, output to text file
  > Example   .\\cmdlet > stuff.txt
  >
  > > Same as Redirect except it appends to an existing file
  > > »
  > > Summary of Windows PowerShell Syntax
  > > Every language must have its grammar rules.  However, with PowerShell syntax the rules for brackets, quotation marks and commas, all seem logical, straightforward and above all, consistent.
  > > If you like this page then please share it with your friends

