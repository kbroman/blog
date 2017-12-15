---
title: Emacs key bindings in MS Word
author: Karl Broman
date: '2014-02-12'
categories:
  - Programming
tags:
  - emacs
  - MSword
  - productivity
  - writing
slug: emacs-key-bindings-in-ms-word
---

Collaboration on grant proposals has forced me to spend a lot of time writing in MS Word lately. I find my self typing emacs key strokes and then getting annoyed when I have to move my hand over to the arrow keys. (It's maybe not as bad as typing Markdown marks within a LaTeX document, which I've also been doing.)

A google search on the title of this post got me [to this post](http://emacsblog.org/2007/02/18/emacs-key-bindings-in-ms-word/). I should have looked before.

Following that suggestion, I was able to get these:

- `C-b` – CharLeft
- `C-f` – CharRight
- `C-e` – EndOfLine
- `C-p` – LineUp
- `C-n` – LineDown
- `C-a` – StartOfLine
- `C-v` – PageDown

I can't figure out how to have `M-v` for PageUp, though, because `M-v` seems permanently stuck to "√".

The procedure, in MS Word 2011 for Mac, is:

1. Tools → Customize Keyboard
2. Select "All Commands" under "Categories:"
3. Select the command (e.g., RightChar) under "Commands:"
4. Press the keyboard shortcut in the "Press new keyboard shortcut" box
5. Click the Assign button
6. Repeat for the other commands you want
7. Click OK

I needed two more, `C-d` and `C-k`; it took me a while to figure out how to do it, as there didn't seem to be any built-in commands. But you can just record a macro. I created these:

- `C-d` – [DeleteCharacter] (as a macro)
- `C-k` – [KillLine] (as a macro)

Here's the procedure, in MS Word 2011 for Mac.

1. Tools → Macros → Record Macro
2. Give it a name with no spaces
3. Click the keyboard button to assign a keystroke to it
4. Select OK
5. Type the set of key strokes
6. Tools → Macros → Stop Recording

[Womacs](http://sourceforge.net/apps/mediawiki/womacs/index.php) is a really extensive set of Visual Basic macros that looks really useful, but I was getting Visual Basic errors and didn't want to spend any more time on it; grants to write...
