---
title: Fixing a font problem for XeLaTeX
author: Karl Broman
date: '2013-10-11'
categories:
  - Programming
  - Things that annoy me
tags:
  - Latex
slug: fixing-a-font-problem-for-xelatex
---

If the topic sounds boring, well, it is really boring. I write it down here in case it's useful to someone.

I was working on a [talk about git & GitHub](https://github.com/syounkin/GitPrimer.git), and chose a different font (Helvetica Neue, sort of the default Apple font). I think the default font for LaTeX/Beamer is a bit too tall and thin for slides. Here's the default:

![Slide with default font](https://kbroman.files.wordpress.com/2013/10/slide_default.png)

And here's what I wanted:

![Slide with Helvetica Neue](https://kbroman.files.wordpress.com/2013/10/slide_helveticaneue.png)

### But it didn't work on unix

It worked fine with XeLaTeX on my Mac, but it wasn't working in Unix, and I'd like the source to be portable to others.

XeLaTex was giving two errors:

    Invalid fontname `Helvetica Neue', contains ' '

    Font \zf@basefont="Helvetica Neue" at 10.0pt not loadable: Metric (TFM) file
    or installed font not found.

It obviously wasn't finding the font.

I futzed about for an hour, trying to figure out where fonts are located on my Mac, and where fonts are located on Unix, and doing various web searches. But no luck.

### How I solved the problem

Finally, I read [this post on fonts in xelatex](http://existentialtype.net/2008/07/12/fonts-in-latex-part-one-xelatex/), and following that set of ideas, I figured out what to do.

  * Switch to the [TeX Gyre Heros](http://www.gust.org.pl/projects/e-foundry/tex-gyre/heros/index_html) font. It looks just like Helvetica to me.

  * Download [`qhv2.004otf.zip`](http://www.gust.org.pl/projects/e-foundry/tex-gyre/heros/qhv2.004otf.zip).

  * On unix, unzip the file (which contains eight [`.otf`](https://en.wikipedia.org/wiki/OpenType) files) into `~/.fonts`

  * On Mac, unzip the file, double-click the `.otf` files and select "Install font."  This uses the [Font Book](https://support.apple.com/kb/HT2509) application.

  * In the `.tex` file, use `\setsansfont{TeX Gyre Heros}`

Not thoroughly tested, but it works on two systems.
