---
id: qjnXrtwDoKO8NvCd2gg0M
title: CLI
desc: ''
updated: 1633199319526
created: 1633199319526
stub: true
---
(image/png)

The command line can be quite powerful, but typing in long commands and file paths gets tedious pretty quickly. Here are some shortcuts that will have you running long, tedious, or complex commands with just a few keystrokes.

*Image remixed from an original by [xkcd](http://xkcd.com/149/)*.

Power users love the command line for its ability to perform complicated tasks with just a few keystrokes. But for beginners who don't know the shortcuts and type everything out longhand, it can seem like it takes forever (I know this because I'm just past beginner myself, and I still didn't know most of these shortcuts).

These commands apply primarily to *NIX-based command lines, which, out of the box, are included on systems like OS X and Linux. To use them on Windows, install [Cygwin](http://cygwin.com/). (We [highly recommend ditching Windows' crappy command line for Cygwin](http://lifehacker.com/179514/geek-to-live--introduction-to-cygwin-part-i).)

[Article preview thumbnail (image/jpeg)](http://lifehacker.com/179514/geek-to-live--introduction-to-cygwin-part-i)

###### [Geek to Live: Introduction to Cygwin, Part I](http://lifehacker.com/179514/geek-to-live--introduction-to-cygwin-part-i)

Introduction to who? If that's what you thought when you saw the title of this article, then…

[Read more](http://lifehacker.com/179514/geek-to-live--introduction-to-cygwin-part-i)

From simple keyboard shortcuts to built-in shorthand to commands you can build and customize yourself, the Terminal has a ton of ways you can speed up your command line work, and here we're going to show you some of the basics (as well some customizable features that you can use to shorten pretty much any command you want).

If you're just getting started with the command line, we recommend you also check out our [command line primer for beginners](http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything). Heck, even if you're not a beginner, skim through it—you're sure to find a few things you didn't know. We'll be touching on a few of those subjects and building on them here, too.

[Article preview thumbnail (image/jpeg)](http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything)

###### [A Command Line Primer for Beginners](http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything)

The command line isn't just for wise Linux beards. It's actually an awesome tool with…

[Read more](http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything)

## Basic Keyboard Shortcuts

We went through a few basic keyboard shortcuts in our beginner's guide, but there are quite a few in there that, while not exactly intuitive, are incredibly useful just for navigating the shell. They also come in handy when you want to refer back to previous commands.

* ·**Up/Down Arrows**: The up and down arrows on your keyboard move through your last used commands. So, if you wanted to run the second to last command you ran, just hit the up arrow twice and hit Enter. You can also edit the command before you run it.
* ·**Ctrl+Left and Ctrl+Right**: Hitting Ctrl and the left or right arrow keys jumps between arguments in your command. So, if you had a typo in the middle of the command, you could jump to it quickly with Ctrl and a few taps of the left arrow key. Note that on Mac OS X and Windows, this shortcut is **Esc+B** and **Esc+F** instead. This is pretty awkward, but OS X users can [change it from the Terminal's preferences](http://hints.macworld.com/article.php?story=20100716230217548) if they so choose.
* ·**Home and End**: The Home and End buttons on your keyboard move your cursor to the beginning and the end of the currently typed command, respectively. This is useful if you've, say, typed in a command but realize that there's a typo in the first word. Instead of holding down the left arrow key, just hit home and correct it. You can also do the same thing with **Ctrl+A** and **Ctrl+E**, respectively (on Mac OS X, Ctrl+A and Ctrl+E are the only way to do this).
* ·**Ctrl+U**: This clears the entire line so you can type in a completely new command.
* ·**Ctrl+K**: This deletes the line from the position of the cursor to the end of the line.
* ·**Ctrl+W**: This deletes the word before the cursor only.
* ·**Ctrl+R**: This lets you search your command history for something specific. For example, if you wanted to search for the recent commands that included `nano`, you would hit Ctrl+R and type `nano`. It would show your most recent command, and you could use the up and down arrows to cycle through your history of commands using `nano` in them.
* ·**Tab**: One of everyone's favorite shortcuts employs Tab to autocomplete a line of text. So, say you wanted to type `cd ~/Dropbox/`, you could just type `cd ~/Dr`, hit Tab to autocomplete opbox, and continue on with your day.

## Terminal Shorthand

Whether you make a lot of typos, run a lot of the same commands over and over again, or you're dealing with long, annoying file paths, the Terminal has quite a bit of built-in shorthand to keep you from typing everything out yourself. Here are a few great examples.

## File Paths

When you're working with files in the Terminal, navigating the folder structure of your system can take *forever*. Constantly typing long filenames is never fun, so here are a few tricks that'll get those 5-folder-deep paths into the Terminal with just a few taps of your mouse or keyboard.

### Dragging Files Into the Terminal Window

If you have a file buried deep within your hard drive, typing out its full path can take forever. Instead of doing that, you can just open up the folder in Nautilus, Finder, Dolphin, or whatever file manager you use and drag the file right into the Terminal window. It will add its file path to the current command.

### File Path Shorthand

We discussed these briefly in our beginner's guide, but they bear repeating. Say you're `cd`ing around your hard drive but don't want to type out file paths over and over again. If you need to continually access the same folders or files, dragging them in from your file browser can even get tedious. Luckily, you can substitute your current directory and its parent directory with `.` and `..`, respectively. For example, if you `cd` to a folder, running the following command will move you one folder up.

cd ..

That way, you don't have to retype the entire file path (or even hit the up arrow and delete a folder name—it's literally just a few keystrokes).

This also works if you're typing out longer paths. Say you're in `~/Documents/Work` and you wanted to be in `~/Documents/Play`. You could just type:

cd ../Play

and get there instantly.

Another good shortcut is the dash (`-`). This will move you back to your last working directory:

cd -

Thus, if you're working in, say, your documents folder (`~/Documents`) and moved over to the `/etc/` briefly, you could switch right back by typing `cd -` and hitting Enter.

Lastly, if you want to go back to your home directory, there's no need to add any arguments to the `cd` command. Just typing `cd` and hitting enter will bring you back home.

### Using Your History

Accessing recently used commands (or running a small variation of recently used commands) is something Terminal users often need to do. Unfortunately, it's also one of the most tedious parts of the Terminal—who wants to retype the exact same command they just ran but with one minor difference? It makes every typo seem like a punishment. Luckily, there's some pretty nice shorthand, most of which uses the handy bang symbol (!).

(image/png)

One of the most useful shortcuts is using `!!` to represent the last command you ran. This is useful in a ton of situations. For example, if you run a command that needs root privileges but forget to add `sudo` to the beginning, there's no need to retype the command. Just run:

sudo !!

This will run your last used command with root privileges.

(image/png)

If the command you want to run is a bit further back in your history, you can use the bang in conjunction with the original string to find it. For example, if you want to run the last command that used `cat`, you could just type:

!cat

If you just want to see what the last `cat` command was, you can instead run:

!cat:p

This will print that command and add it to the end of your history. If you decide you then want to run it, you can just type `!!` and hit Enter.

If you want to run a different command that you ran last, but with the same argument, there's a shortcut for that too. For example, say you had just created a folder using:

mkdir /new/awesome/folder

To then `cd` into that directory, you could just type:

cd !$

The `!$` represents the arguments from your last command.

Another common problem is mistyping the command you want to run. Say you wanted to run `nano`, but accidentally typed `nanp`:

nanp /path/to/a/document/buried/deep/in/the/filesystem

Instead of retyping the whole thing, you could just run:

^nanp^nano

This will find the first instance of `nanp` in the last run command and replace it with `nano`.

(image/png)

While all these shortcuts are fine and dandy, but it's worth mentioning that the `history` command is your friend. If you want to see all the recent commands you ran that included `nano`, for example, you could just run:

history | grep nano

You'll get a list that looks something like this:

381 sudo nano /etc/NetworkManager/nm-system-settings.conf
387 sudo nano /etc/rc.conf
388 sudo nano /etc/rc.conf
455 sudo nano /boot/grub/menu.lst

You can then pick a command out from that list—say I want to run `sudo nano /boot/grub/menu.lst`, which grep lists as command `455`—and run it using:

!455

Lastly, if you want to keep certain commands *out* of your history, just put a space before them—i.e. space+`nano ~/Documents/WorldDominationPlans.txt`.

### Expansions

When you're working with variations of a file—like backups or different file types—it can get tedious typing out the same commands with small tweaks. Using the brace symbols (`{}`), you can easily perform batch operations on multiple versions of a file.

Say you want to rename just part of a filename. Instead of typing out `mv /path/to/file.txt /path/to/file.xml`, you could just run:

mv /path/to/file.{txt,xml}

This runs the command with the same arguments, only with the parts inside the brace changed—the first part corresponding to the first argument, the second part corresponding to the second argument.

The most common example of this is when you're backing up a file that you're making changes to. For example, if you are tweaking your `rc.conf`, you'll want to make a backup in case the new one doesn't work. So, to do so, you can just run:

sudo cp /etc/rc.conf{,-old}

Putting nothing before the comma will just append `-old` to the filename after copying it with `cp`. If your new file doesn't work out and you want to restore the backed up file to its original location, you can just use:

sudo mv /etc/rc.conf{-old,}

Moving the comma to the other end of the brace will remove `-old` from the end of the file and restore it to its original name.

The braces can also work when moving or creating multiple files at once. For example, if you wanted to create three numbered directories, you could just run:

mkdir myfolder{1,2,3}

This will create three folders: myfolder1, myfolder2, and myfolder3.

## Making Your Own Shorthand

(image/png)

While these are all pretty handy, the most useful thing you can probably do is make up your own shortcuts. After all, we all have a few commands we run over and over again, but they aren't necessarily the same for everyone. To do so, we're going to edit the `~/.bashrc` configuration file (or, if you're on Mac OS X Snow Leopard, `~/.bash_profile`). It's a basic text file, so you can do it with whatever you like—Gedit in Ubuntu, TextEdit on OS X, or even nano within the Terminal. We've [talked about doing this](http://lifehacker.com/274317/turbocharge-your-terminal) [a few times before](http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything), but it really is one of the best things you can do to speed up Terminal work.

[Article preview thumbnail (image/png)](http://lifehacker.com/274317/turbocharge-your-terminal)

###### [Turbocharge your terminal](http://lifehacker.com/274317/turbocharge-your-terminal)

Click to viewWhile the command line isn't the most intuitive place to work, terminal lovers…

[Read more](http://lifehacker.com/274317/turbocharge-your-terminal)

To create a custom shortcut (called an `alias` or `function`, you'll want to add a new line to your `.bashrc` file using the following format:

alias la='ls -A'

Now, whenever you type `la`, the Terminal will run `ls` with the `-a` modifier, which includes hidden files. Some of thsee are built into popular Linux distributions already, but there are a ton of other useful ones. Here are some of our favorites:

alias ll='ls -l'

This gives you a more verbose list of files than `ls` does on its own. In Ubuntu, this shortcut already exists, but runs `ls -alF`.

alias desk='cd ~/Desktop'

This will make your Desktop the working directory with just a few keystrokes. You can, of course, modify this for pretty much any folder that you access regularly.

alias up='cd ..'

This moves your working directory one folder up in half the keystrokes.

alias emenu='aterm nano -e ~/.e16/menus/user_apps'

This is an example of an alias that opens up a file for editing. If you have any files you find yourself constantly editing, this is a good one to keep around—just throw the path to your oft-used file in the quotes and edit the keyword to something that makes sense.

alias agi='sudo apt-get install'

With this, installing programs is much quicker in Ubuntu. You can just type `agi chromium` to install Chromium, for example. Of course, if you're using a [different flavor of Linux](http://lifehacker.com/5680453/build-a-killer-customized-arch-linux-installation-and-learn-all-about-linux-in-the-process), you can replace it with your package manager of choice.

[Article preview thumbnail (image/jpeg)](http://lifehacker.com/5680453/build-a-killer-customized-arch-linux-installation-and-learn-all-about-linux-in-the-process)

###### [Build a Killer Customized Arch Linux Installation (and Learn All About Linux in the Process)](http://lifehacker.com/5680453/build-a-killer-customized-arch-linux-installation-and-learn-all-about-linux-in-the-process)

Don't like Windows 8's new interface? Sick of Ubuntu Unity and the new ads that come…

[Read more](http://lifehacker.com/5680453/build-a-killer-customized-arch-linux-installation-and-learn-all-about-linux-in-the-process)

alias update='sudo apt-get update'

This will update all your packages in Ubuntu.

function cdl { cd $1; ls;}

This is a neat function [we've featured before](http://lifehacker.com/5662424/change-directories-and-view-files-in-one-custom-command) that will essentially run `cd` and `ls` at the same time. So, just type `cdl /path/to/folder` and the Terminal will both make that your working directory *and* list its contents in one fell swoop.

[Article preview thumbnail (image/png)](http://lifehacker.com/5662424/change-directories-and-view-files-in-one-custom-command)

###### [Change Directories and View Files in One Custom Command](http://lifehacker.com/5662424/change-directories-and-view-files-in-one-custom-command)

We occasionally enjoy geeking out at the command line, so we love timesaving Terminal shortcuts.…

[Read more](http://lifehacker.com/5662424/change-directories-and-view-files-in-one-custom-command)

* * *

These are just a few examples of the keyboard shortcuts, shorthand, and custom aliases that can make your life easier. There are really a ton out there, and depending on what you're using the Terminal for so often, different ones will prove useful to you. Of course, since you can make your own using `alias` and `function`, the only limits are your imagination (though if you aren't that imaginative, [we post some good ones around here from time to time](http://lifehacker.com/tag/terminaltip/)). Got any of your own favorites that you'd like to share with us? Sound off in the comments.
