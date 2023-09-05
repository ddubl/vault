---
id: 7il0je3rlpq4o7c2sdf8fqg
title: Build
desc: ''
updated: 1633200003071
created: 1633199319638
---
## FAKE - F# Make - A DSL for build tasks

"FAKE - F# Make" is a build automation system with capabilities which are similar to **make** and **rake**. It is using an easy domain-specific language (DSL) so that you can start using it without learning F#. If you need more than the default functionality you can either write F# or simply reference .NET assemblies.

### Simple Example

 1:
 2:
 3:
 4:
 5:
 6:
 7:
 8:
 9:
10:
11:
12:
13:
14:
15:
16:

```F#
#r "tools/FAKE/tools/FakeLib.dll" // include Fake lib
open Fake


Target "Test" (fun _ ->
 trace "Testing stuff..."
)

Target "Deploy" (fun _ ->
 trace "Heavy deploy action"
)

"Test"            // define the dependencies
   ==> "Deploy"

Run "Deploy"
```

This build script has two targets. The "Deploy" target has exactly one dependency, namely the "Test" target. Invoking the "Deploy" target (line 16) will cause FAKE to invoke the "Test" target as well.

## Who is using FAKE?

Some of our users are:

You can find more users [here](http://fsharp.github.io/FAKE/users.html).

## How to get FAKE

## Using FAKE

If you want to learn about FAKE you should read the ["Getting started with FAKE"](http://fsharp.github.io/FAKE/gettingstarted.html) tutorial.

## Targets

Targets are the main unit of work in a "FAKE - F# Make" script. Targets have a name and an action (given as a code block).

1:
2:
3:
4:

```
// The clean target cleans the build and deploy folders
Target "Clean" (fun _ ->
 CleanDirs ["./build/"; "./deploy/"]
)
```

### Build target order

You can specify the build order using the ==> operator:

1:
2:
3:
4:

```
// "FAKE - F# Make" will run these targets in the order Clean, BuildApp, Default
"Clean"
  ==> "BuildApp"
  ==> "Default"
```

If one target should only be run on a specific condition you can use the =?> operator:

1:
2:
3:
4:

```
"Clean"
  ==> "BuildApp"
  =?> ("Test",hasBuildParam "xUnitTest")  // only if FAKE was called with parameter xUnitTest
  ==> "Default"
```

### Running targets

You can execute targets with the "RunTargetOrDefault"-function (for more details see [Running specific targets](http://fsharp.github.io/FAKE/specifictargets.html)):

1:

```
RunTargetOrDefault "Default"
```

## FileSets

"FAKE - F# Make" uses similar include and exclude patterns as NAnt and MSBuild.

### File includes

1:
2:
3:
4:
5:
6:

```
// Includes all *.csproj files under /src/app by using the !! operator
!! "src/app/**/*.csproj"

// Includes all *.csproj files under /src/app and /test with the ++ operator
!! "src/app/**/*.csproj"
  ++ "test/**/*.csproj"
```

### File excludes

1:
2:
3:

```
// Includes all files under /src/app but excludes *.zip files
!! "src/app/**/*.*"
  -- "*.zip"
```

## UnitTests

### NUnit

 1:
 2:
 3:
 4:
 5:
 6:
 7:
 8:
 9:
10:

```
// define test dlls
let testDlls = !! (testDir + "/Test.*.dll")

Target "NUnitTest" (fun _ ->
 testDlls
  |> NUnit (fun p ->
   {p with
    DisableShadowCopy = true;
    OutputFile = testDir + "TestResults.xml"})
)
```

### MSpec

 1:
 2:
 3:
 4:
 5:
 6:
 7:
 8:
 9:
10:

```
// define test dlls
let testDlls = !! (testDir + "/Test.*.dll")

Target "MSpecTest" (fun _ ->
 testDlls
  |> MSpec (fun p ->
   {p with
    ExcludeTags = ["LongRunning"]
    HtmlOutputDir = testOutputDir})
)
```

### xUnit.net

 1:
 2:
 3:
 4:
 5:
 6:
 7:
 8:
 9:
10:
11:
12:

```
// define test dlls
let testDlls = !! (testDir + "/Test.*.dll")

Target "xUnitTest" (fun _ ->
    testDlls
        |> xUnit2 (fun p ->
            {p with
                ShadowCopy = false;
                HtmlOutput = true;
                XmlOutput = true;
                OutputDir = testDir })
)
```

### Expecto

 1:
 2:
 3:
 4:
 5:
 6:
 7:
 8:
 9:
10:
11:
12:
13:
14:
15:
16:
17:

```
// define test executables
let testExecutables = !! (testDir + "/Test.*.exe")

Target "expectoTest" (fun _ ->
    testExecutables
    |> Expecto (fun p ->
        { p with
            Debug = true
            Parallel = true
            // use only one of the following parameters
            Filter = "TestPrefix"
            FilterTestCase = "TestCaseNameSubstring"
            FilterTestList = "TestListNameSubstring"
            Run = ["Test1"; "Test2"]
            ListTests = false
        })
)
```

## Sample script

This sample script

- Assumes "FAKE - F# Make" is located at ./tools/FAKE
- Assumes NUnit is located at ./tools/NUnit
- Cleans the build and deploy paths
- Builds all C# projects below src/app/ and puts the output to ./build
- Builds all NUnit test projects below src/test/ and puts the output to ./build
- Uses NUnit to test the generated Test.\*.dll's
- Zips all generated files to deploy/MyProject-0.1.zip

You can read the [getting started guide](http://fsharp.github.io/FAKE/gettingstarted.html) to build such a script.

 1:
 2:
 3:
 4:
 5:
 6:
 7:
 8:
 9:
10:
11:
12:
13:
14:
15:
16:
17:
18:
19:
20:
21:
22:
23:
24:
25:
26:
27:
28:
29:
30:
31:
32:
33:
34:
35:
36:
37:
38:
39:
40:
41:
42:
43:
44:
45:
46:
47:
48:
49:
50:
51:
52:
53:
54:
55:
56:
57:
58:
59:
60:
61:
62:
63:
64:
65:
66:
67:
68:
69:
70:
71:
72:
73:
74:
75:
76:
77:
78:
79:
80:
81:
82:
83:
84:
85:
86:
87:
88:
89:
90:
91:
92:
93:
94:
95:
96:
97:
98:
99:

```
// include Fake libs
#r "tools/FAKE/FakeLib.dll"

open Fake

// Directories
let buildDir  = "./build/"
let testDir   = "./test/"
let deployDir = "./deploy/"

// tools
let fxCopRoot = "./Tools/FxCop/FxCopCmd.exe"

// Filesets
let appReferences  =
    !! "src/app/**/*.csproj"
      ++ "src/app/**/*.fsproj"

let testReferences = !! "src/test/**/*.csproj"

// version info
let version = "0.2"  // or retrieve from CI server

// Targets
Target "Clean" (fun _ ->
    CleanDirs [buildDir; testDir; deployDir]
)

Target "BuildApp" (fun _ ->
 CreateCSharpAssemblyInfo "./src/app/Calculator/Properties/AssemblyInfo.cs"
  [Attribute.Title "Calculator Command line tool"
   Attribute.Description "Sample project for FAKE - F# MAKE"
   Attribute.Guid "A539B42C-CB9F-4a23-8E57-AF4E7CEE5BAA"
   Attribute.Product "Calculator"
   Attribute.Version version
   Attribute.FileVersion version]

 CreateCSharpAssemblyInfo "./src/app/CalculatorLib/Properties/AssemblyInfo.cs"
  [Attribute.Title "Calculator library"
   Attribute.Description "Sample project for FAKE - F# MAKE"
   Attribute.Guid "EE5621DB-B86B-44eb-987F-9C94BCC98441"
   Attribute.Product "Calculator"
   Attribute.Version version
   Attribute.FileVersion version]

    // compile all projects below src/app/
    MSBuildRelease buildDir "Build" appReferences
        |> Log "AppBuild-Output: "
)

Target "BuildTest" (fun _ ->
    MSBuildDebug testDir "Build" testReferences
        |> Log "TestBuild-Output: "
)

Target "NUnitTest" (fun _ ->
    !! (testDir + "/NUnit.Test.*.dll")
        |> NUnit (fun p ->
            {p with
                DisableShadowCopy = true;
                OutputFile = testDir + "TestResults.xml"})
)

Target "xUnitTest" (fun _ ->
    !! (testDir + "/xUnit.Test.*.dll")
        |> xUnit2 (fun p ->
            {p with
                ShadowCopy = false;
                HtmlOutput = true;
                XmlOutput = true;
                OutputDir = testDir })
)

Target "FxCop" (fun _ ->
    !! (buildDir + "/**/*.dll")
        ++ (buildDir + "/**/*.exe")
        |> FxCop (fun p ->
            {p with
                ReportFileName = testDir + "FXCopResults.xml";
                ToolPath = fxCopRoot})
)

Target "Deploy" (fun _ ->
    !! (buildDir + "/**/*.*")
        -- "*.zip"
        |> Zip buildDir (deployDir + "Calculator." + version + ".zip")
)

// Build order
"Clean"
  ==> "BuildApp"
  ==> "BuildTest"
  ==> "FxCop"
  ==> "NUnitTest"
  =?> ("xUnitTest",hasBuildParam "xUnitTest")  // only if FAKE was called with parameter xUnitTest
  ==> "Deploy"

// start build
RunTargetOrDefault "Deploy"
```

