---
id: vc30qsvy0hdpofn4wbidfzx
title: Latex
desc: ''
updated: 1635934973870
created: 1633199319569
---
## Configuring Scrivener to output LaTeX

Posted on [January 14, 2015](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/)

[Write here, write now. Scrivener. (image/png)](http://www.literatureandlatte.com/scrivener.php)The **[previous post](https://abnormaldata.wordpress.com/2015/01/14/scrivener/)** explained why I fell in love with [Scrivener](http://www.literatureandlatte.com/scrivener.php) for writing journal papers.

[Latex logo (image/png)](http://www.latex-project.org/)**This post** explains my Scrivener + LaTeX [workflow](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/#workflow) and how I [configured](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/#setup) Scrivener to output LaTeX.

**\*Edit 25 May 2016:** As indicated in the comments below, I no longer use this workflow (which requires MMD). It just got too complicated. I now write the Scrivener manuscript directly in latex and then compile as a text file, which I then compile to latex using my favorite tex editor. This procedure bypasses MMD completely. I’d love to be able to use Scrivener + MMD the way it was intended – compile the same file to any format I want… at least RTF and Tex…\_and_have citations, tables, figures, and equations numbered and referenced correctly . Tips welcome. 🙂\*

## So you want to write in Scrivener but compile with Latex?

Scrivener does **_not_** do bibliography management, nor does it do typesetting. You must **Compile** the manuscript in Scrivener and then use whatever biblio manager and typesetter you normally use.

The following two posts are quite helpful for getting started on configuring Scrivener to output in Latex. It actually looks more complicated than it really is. The configuration I’m using (explained [below](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/#setup)) is a variant of these.

- [How to write your Thesis in LaTeX with Scrivener 2, MultiMarkdown 3 and BibDesk](http://timbrandes.com/blog/2012/02/28/howto-write-your-thesis-in-latex-using-scrivener-2-multimarkdown-3-and-bibdesk/)
- [Writing Complex Latex Documents with Scrivener 2.1 and MultiMarkDown 3](http://neilernst.net/2011/07/27/writing-complex-latex-documents-with-scrivener-2-1-and-multimarkdown-3/)

It didn’t take me too long to get everything up and running – including making some modifications to the workflow (explained below). You do however need to install [MultiMarkdown 3](http://fletcherpenney.net/multimarkdown/download/) (MMD3) first.

# My Scrivener/LaTeX workflow

Here’s my current workflow (configuration details explained in the next section):

- Start a **new project** or **import** existing latex file(s) into Scrivener
- **Configure Latex options** and include the latex header, preamble, footer, biblio information; **save** the configuration
- Ensure parts/chapters/sections/subsections are created correctly: **create one ‘file’ per section** (also makes it easier to do split-view on two different sections)
- **Write the manuscript** content in Scrivener; use the research and notes features extensively (they’re excluded when you Compile the manuscript)
- **Add citations** using MMD notation
- **Include latex code** (in the manuscript or in separate files) **or MMD notation** for figures, tables, equations, lists, and cross referencing
- **Output Latex file** (confusingly called **_Compile_** in Scrivener)
- Run Texmaker and **compile Latex file** as usual
- Do **revision control** within Scrivener – they’re called _Snapshots_

# My Scrivener/LaTeX setup and configuration

I configured the Latex compile options a little bit different from the [two posts above](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/#scrivlatex), but the output is nearly the same. You can try whatever works for you. My way may not necessarily be the _best_ way. **Suggestions and comments are welcome!**

**1. Configure Latex options**

From the main menu, **_File -> Compile_** will take you to the right configuration screen. ([MMD3](http://fletcherpenney.net/multimarkdown/download/) needs to be installed, otherwise you won’t see all the compile options).

**Contents screen:** Check or uncheck the sections to be included in the output.

**Formatting screen:** Check both _Title_ and _Text_ to include the section _Title_ in the latex file, otherwise none of the heading names will show up. Uncheck _Title_ to use the manual section naming and referencing option below. Also change **Compile for:** to  **_MultiMarkdown to Latex (.tex)_**

[compile_menu_1formatting (image/jpeg)](https://abnormaldata.files.wordpress.com/2014/12/compile_menu_1formatting1.jpg)

**Latex screen:** Set _Format as_ -> _Custom_ and  _LaTeX document class_ -> _Custom_, and define your own latex header/footer info.

This is where my configuration is different from the websites above. I put all the relevant latex info in these 3 Latex screens, whereas others put them in the Meta-data screen (e.g. biblio file definition, location to preamble file, etc).

[compile_menu_2latex_2begin (image/jpeg)](https://abnormaldata.files.wordpress.com/2014/12/compile_menu_2latex_2begin2.jpg)

Here’s an example of the latex code I used:

**Header screen:**

\\documentclass[a4paper]{spie}
\\usepackage{graphicx}
\\usepackage{subfig}
\\usepackage{multirow}
\\title{Paper title}
\\author{First Author\\supit{a},
Second Author\\supit{b},
and Third Author\\supit{c}
\\skiplinehalf
\\supit{a}University of Awesomeness; \\
\\supit{b}Technical University; \\
\\supit{c}University Hospital; \\
}
\\authorinfo{Send correspondence to First Author,
E-mail: [me@myuniversity.edu](mailto:me@myuniversity.edu)}

**Begin document screen:**

\\ifx\\citep\\undefined
   \\let\\citep\\cite
   \\let\\citet\\cite
\\else
   \\renewcommand\\citep{\\cite}
   \\renewcommand\\citet{\\cite}
\\fi
\\begin{document}
\\maketitle

**Footer screen:**

%%%%% References %%%%%
\\bibliographystyle{spiebib}
\\bibliography{my_biblio}
\\end{document}

**Meta-data screen:**

I only added 1 key. Click _Add Key_, then define:

Keys:    Base Header Level
Values:  3

- Level 1 creates \\part , \\chapter , \\section     …  and each subsequent level (n) ignores the (n-1) first levels:
- Level 2 creates \\chapter , \\section , \\subsection, \\subsubsection
- Level 3 creates \\section , \\subsection , \\subsubsection (this is what I use for articles)

[compile_menu_5meta_data (image/jpeg)](https://abnormaldata.files.wordpress.com/2014/12/compile_menu_5meta_data1.jpg)

**Save Preset…:** You should use this option to save your latex configuration. Sometimes changing the Latex options erases your custom header/footer text (e.g. if you change _Format As_ to _Article_ and then back to _Custom_).

**2. Adding references to sections can be a bit tricky if you change the section name – the latex label will also change**

When you compile as Latex, the section names you see in the Binder or Outline view will _automatically_ be converted to latex labels with MMD if you have enabled the _Title_ option (see step 1).

In [this screenshot](https://abnormaldata.files.wordpress.com/2014/12/scrivener_screenshot.jpg), the section (file) being edited is called `Step 16: Compiling the Draft`. MMD will generate the following latex label, which you can refer to within the manuscript (see point 4 below): `\label{step16compilingthedraft}`.

So if you change the name of the section in Scrivener, MMD will also change the latex label. There doesn’t seem to be a workaround for this currently, so keep track of your section names if internal section referencing is important (and it usually is).

**Two alternative options:**

(A) Use MMD3 to create internal cross referencing (see point 4 below).

(B) Manually add in latex code for your section names together with the labels you define (see point 5 below). Optinally disable the _Title_ output (_File -> Compile -> [Formatting](https://abnormaldata.files.wordpress.com/2014/12/compile_menu_1formatting1.jpg)_) to suppress automatical label generation, but don’t forget to add your own latex section headings since those will be suppressed too.

**3. To include references, I use MMD notation
**

Writing `[#citation2015]` will produce `\citep{citation2015}` when compiled as Latex.

By default, `\citep{}` is produced.  You can generate `\citet{}` by adding a semi-colon at the end:  `[#citation2015;].`

But sometimes you need  `\cite{}` instead. Here is a fix I found. Just add this in the preamble (already included in the _Begin document_ code above:

\\ifx\\citep\\undefined
  \\let\\citep\\cite
  \\let\\citet\\cite
\\else
  \\renewcommand\\citep{\\cite}
  \\renewcommand\\citet{\\cite}
\\fi

**4. MMD notation can also be used for equations, tables, lists, and cross referencing
**

You can also use MMD to create other types of objects like equations, tables, and lists. Refer to the [MMD syntax cheat sheet](https://rawgit.com/fletcher/human-markdown-reference/master/index.html) for helpful MMD alternatives to latex code.

Note: equations using $…$ notation will convert with MMD, but you do need to leave spaces around the equation, otherwise the $ symbol gets escaped with a \\ after conversion.

**5. To output raw latex code (equations, figures, tables, labels, section referencing), wrap it with HTML comments
**

Use HTML comments to pass latex code through untouched by MMD:

&lt;--!  LaTeX code here -->

To include a reference to the automatically generated `Step 16` section label above, you can do:

Refer to section &lt;--!~\\label{step16compilingthedraft}-->
for further information.

OK, it’s a bit [kludgy](http://www.urbandictionary.com/define.php?term=kludgy), but it’s so much fun to write in Scrivener, that I’m willing to put up with a bit of kludge (cause, you know, latex on its own is so easy to read).

**6. Optional: Add LaTeX code for equations and tables in separate files
**

It can be cumbersome to include equations or tables in the Scrivener file if you need to compile and debug the latex code as you’re writing it. A work-around is to add the code in one or more separate files and include a latex include command in the Scrivener manuscript. You can then debug the code in your latex editor/compiler without having to re-compile the Scrivener file with each edit.

Add this code to the Scrivener file:

&lt;--! \\input{manuscript_tables} -->

Then add and debug the latex code for your equations/tables in the `manuscript_tables.tex` file.

**7. Compile Scrivener manuscript
**

These steps will generate 4 output files:

- YourOutputFilename.tex => contains the contents of the manuscript
- mmd-scrivcustom-header.tex=> contains text from the _Header_ screen under _File -> Compile -> Latex_
- mmd-scrivcustom-begin-doc.tex => contains text from the _Begin Document_ screen
- mmd-scrivcustom-footer.tex => contains text from the _Footer_ screen

**8.  Compile the tex files as usual with your favorite latex compiler, and you’re good to go!**

I admit, working with Scrivener + Latex is not as seamless as writing exclusively in a Latex editor, but the added-value offered by Scrivener’s features can be worth it. As an alternative, MMD notation may simplify some things (even though I have been resistant to using it).

## Compiling Scrivener as Word

Sometimes you need to create a manuscript in Word format. You can compile your Scrivener manuscript directly to Word, but then you need a bibliography manager that works with Word. You might try Endnote, Zotero, or other reference managers that have Word plugins. If you use Jabref, you can try [Bibtex4Word](http://www.ee.ic.ac.uk/hp/staff/dmb/perl/index.html) to insert references into Word, but I found it awkward to use.

Since I’m using [Jabref](http://jabref.sourceforge.net/), I first compile the Scrivener manuscript as Latex, then run [Latex2RTF](https://abnormaldata.wordpress.com/2014/11/22/converting-latex-to-word-part-2/) on the latex files to get a Word file. I recently spent some time looking into other reference managers, but nothing else seems as easy, stable, or free as Jabref. While some of the other reference managers do have some nice features, I want to stay with a tool that integrates easily with Latex.

If Scrivener or MMD could integrate with reference managers (like Jabref) for citations, the Scrivener to Word workflow could potentially skip the conversion to latex. Wishful thinking!

## Converting LaTeX to RTF/Word

- [Converting LaTeX to Word (Pandoc)](https://abnormaldata.wordpress.com/2014/11/17/converting-latex-to-word/)
- [Converting LaTeX to Word – part 2 (LaTeX2RTF)](https://abnormaldata.wordpress.com/2014/11/22/converting-latex-to-word-part-2/)
- [Converting LaTeX to Word – part 3 (Pandoc revisited)](https://abnormaldata.wordpress.com/2014/12/26/converting-latex-to-word-part-3-pandoc-revisited/)

### Share this

- [Click to email (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=email&nb=1)
- [Click to share on Twitter (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=twitter&nb=1)
- [Share on Facebook (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=facebook&nb=1)
- [Click to share on Google+ (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=google-plus-1&nb=1)
- [Click to share on LinkedIn (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=linkedin&nb=1)
- [Click to share on Pinterest (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=pinterest&nb=1)
- [Click to share on Pocket (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=pocket&nb=1)
- [Click to share on Reddit (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=reddit&nb=1)
- [Click to share on Tumblr (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=tumblr&nb=1)
- [Click to Press This! (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/?share=press-this&nb=1)
- [Click to print (Opens in new window)](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/#print)

[ Reblog](https://widgets.wp.com/likes/#)
[ Like](https://widgets.wp.com/likes/#)
[Allan McDougall (image/jpeg)](http://en.gravatar.com/allanmcdougall)[Garikoitz Knörr (image/jpeg)](http://en.gravatar.com/garikoitzk)[kpkilburn (image/jpeg)](http://en.gravatar.com/kpkilburn)[bvigors (image/gif)](http://en.gravatar.com/bvigors) [Allan McDougall (image/jpeg)](http://en.gravatar.com/allanmcdougall)[Garikoitz Knörr (image/jpeg)](http://en.gravatar.com/garikoitzk)[kpkilburn (image/jpeg)](http://en.gravatar.com/kpkilburn)[bvigors (image/gif)](http://en.gravatar.com/bvigors) [Allan McDougall (image/jpeg)](http://en.gravatar.com/allanmcdougall)[Garikoitz Knörr (image/jpeg)](http://en.gravatar.com/garikoitzk)[kpkilburn (image/jpeg)](http://en.gravatar.com/kpkilburn)[bvigors (image/gif)](http://en.gravatar.com/bvigors) [Allan McDougall (image/jpeg)](http://en.gravatar.com/allanmcdougall)[Garikoitz Knörr (image/jpeg)](http://en.gravatar.com/garikoitzk)[kpkilburn (image/jpeg)](http://en.gravatar.com/kpkilburn)[bvigors (image/gif)](http://en.gravatar.com/bvigors)[4 bloggers](https://widgets.wp.com/likes/#) like this.

### _Related_

[Scribing scholarly scrolls with Scrivener](https://abnormaldata.wordpress.com/2015/01/14/scrivener/)In "Productivity"

[Converting LaTeX to Word – part 3 (Pandoc revisited)](https://abnormaldata.wordpress.com/2014/12/26/converting-latex-to-word-part-3-pandoc-revisited/)In "Tools"

[Converting LaTeX to Word - part 2 (LaTeX2RTF)](https://abnormaldata.wordpress.com/2014/11/22/converting-latex-to-word-part-2/)In "Tools"

This entry was posted in [Tools](https://abnormaldata.wordpress.com/category/tools/) and tagged [LaTeX](https://abnormaldata.wordpress.com/tag/latex/), [Scrivener](https://abnormaldata.wordpress.com/tag/scrivener/), [Writing tools](https://abnormaldata.wordpress.com/tag/writing-tools/) by [abnormaldata](https://abnormaldata.wordpress.com/author/abnormaldata/). Bookmark the [permalink](https://abnormaldata.wordpress.com/2015/01/14/configuring-scrivener-latex/).

