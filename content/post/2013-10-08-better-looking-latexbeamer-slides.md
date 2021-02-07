---
title: Better-looking LaTeX/Beamer slides
author: Karl Broman
date: '2013-10-07'
categories:
  - Academics
tags:
  - code
  - Latex
  - seminars
slug: better-looking-latexbeamer-slides
---

I like to use [LaTeX](https://www.latex-project.org/) to make slides for talks, largely because I prefer to write code (rather than use a mouse and menus) for control of things like colors and figure placement.

Most people that use LaTeX to make slides seem to use [Beamer](https://en.wikipedia.org/wiki/Beamer_(LaTeX)), but the resulting slides are usually a bit busy, like this:

[![Typical beamer slide](https://www.biostat.wisc.edu/~kbroman/blog/Warsaw-default-default-01.png)](http://deic.uab.es/~iblanes/beamer_gallery/individual/Warsaw-default-default.html)

I admire [Till Tantau](https://en.wikipedia.org/wiki/Till_Tantau) for creating Beamer; it was a great idea and it's been widely adopted. But I don't like talk outlines at all; I certainly don't want to see one on every page.

After several days work, I've finally figured out how to create LaTeX/Beamer-based slides that look like what I want:

[![Open Access talk, title page](https://kbroman.files.wordpress.com/2013/10/openaccess_pg1.png)](https://www.biostat.wisc.edu/~kbroman/presentations/openaccess.pdf)

In this post, I'll explain what I did.

### My history

Take a look at my [list of presentations](https://kbroman.org/talks.html) (going back to 1998), and you'll see that I switched from LaTeX to powerpoint in 2004 and then switched back to LaTeX in 2006.

My LaTeX-based slides (e.g., see [my talks on data visualization](https://github.com/kbroman/Talk_Graphs)) have been made using `\documentclass{article}`, just changing the page size and increasing the font and then hard-coding placement of stuff. It leads to some pretty ugly and awkward code, like this:

````
\headsize \color{myyellow}
\hfill \begin{minipage}{5.75in}
\centering
Example 1
\end{minipage}

\vspace{30mm}

\centerline{\includegraphics[height=6in]{Figs/fig1a.png}}
````

I knew Beamer would give cleaner code, but how to also have cleaner slides?

### A starting point

I googled "clean Beamer slides" or something like that, and I came across [this post](https://mikedewar.wordpress.com/2009/02/25/latex-beamer-python-beauty/) by [Mike Dewar](https://mikedewar.wordpress.com), with a picture of a slide that looked much like what I wanted:

![Slide from Mike Dewar](https://mikedewar.files.wordpress.com/2009/02/beamer_screen.png&h=360)

So I read his post and studied his code and played around. Then I searched for stuff on the [LaTeX Stack Exchange](https://tex.stackexchange.com/) and played around some more. Then I read the [Beamer manual](ftp://ftp.dante.de/tex-archive/macros/latex/contrib/beamer/doc/beameruserguide.pdf) and played around some more.

There's really not much to it.

### The benefits of Beamer

The main benefits of using Beamer:

  * Simpler code, because it will place elements in reasonable places without a lot of messing about

  * Simple animations using less code, so you [don't repeat yourself](https://en.wikipedia.org/wiki/Don't_repeat_yourself).

  * Easy way to create handouts with notes on what you're going to say. This is especially useful for others to learn from your presentation even if they can't attend (which is most of the world). Here's an example page from such a handout:

[![Example notes page from Open Access talk](https://kbroman.files.wordpress.com/2013/10/openaccess_withnotes_pg15.png)](https://www.biostat.wisc.edu/~kbroman/presentations/openaccess_withnotes.pdf)

### Here's what I did

I was preparing a talk on open access publishing. Here's [the source](https://github.com/kbroman/Talk_OpenAccess); [the pdf](https://www.biostat.wisc.edu/~kbroman/presentations/openaccess.pdf); and [a pdf with notes on what I intend to say](https://www.biostat.wisc.edu/~kbroman/presentations/openaccess_withnotes.pdf).

I'll go through the details of the code, in case it might be useful to someone.

Here are the first two lines of the `.tex` file. The `12pt` makes the default font a bit bigger, but not actually twelve point. The `t` makes the body of each slide top-justified rather than vertically centered. You don't need many packages, as lots of them (like `color`) are included by default with Beamer.
````
\documentclass[12pt,t]{beamer}
\usepackage{graphicx}
````

These next two lines are for the notes pages (if you are going to use that feature); more below.  By default, the notes are hidden. I wrote a [ruby script](https://github.com/kbroman/Talk_OpenAccess/blob/master/createVersionWithNotes.rb) to switch the `hide` to `show` and add `handout` to the options in the `\documentclass` command (more on that below). The `\setbeamertemplate` command makes the note pages completely plain.

````
\setbeameroption{hide notes}
\setbeamertemplate{note page}[plain]
````

These next lines choose the default Beamer theme, get rid of all of the navigation stuff, and make it so any bookmarks are not shown when you open the PDF in Acrobat.
````
\usetheme{default}
\beamertemplatenavigationsymbolsempty
\hypersetup{pdfpagemode=UseNone} % don't show bookmarks on initial view
````

These next lines change the font to Helvetica Neue, with Palatino used for the notes pages.
````
\usefonttheme{professionalfonts}
\usefonttheme{serif}
\usepackage{fontspec}
\setmainfont{Helvetica Neue}
\setbeamerfont{note page}{family*=pplx,size=\footnotesize} % Palatino for notes
````

I define a bunch of colors.
````
\definecolor{foreground}{RGB}{255,255,255}
\definecolor{background}{RGB}{24,24,24}
\definecolor{title}{RGB}{107,174,214}
\definecolor{gray}{RGB}{155,155,155}
\definecolor{subtitle}{RGB}{102,255,204}
\definecolor{hilight}{RGB}{102,255,204}
\definecolor{vhilight}{RGB}{255,111,207}
````

I use those colors, for the titles, subtitle, institute, etc.
````
\setbeamercolor{titlelike}{fg=title}
\setbeamercolor{subtitle}{fg=subtitle}
\setbeamercolor{institute}{fg=gray}
\setbeamercolor{normal text}{fg=foreground,bg=background}
````

This stuff changes the color of bullets in `itemize` environments and changes nested bullet symbols to en-dashes (-) in gray, and a bit smaller.
````
\setbeamercolor{item}{fg=foreground} % color of bullets
\setbeamercolor{subitem}{fg=gray}
\setbeamercolor{itemize/enumerate subbody}{fg=gray}
\setbeamertemplate{itemize subitem}{{\textendash}}
\setbeamerfont{itemize/enumerate subbody}{size=\footnotesize}
\setbeamerfont{itemize/enumerate subitem}{size=\footnotesize}
````

This gives me a slide number in the lower-right, in gray.
````
\setbeamertemplate{footline}{%
    \raisebox{5pt}{\makebox[\paperwidth]{\hfill\makebox[20pt]{\color{gray}
          \scriptsize\insertframenumber}}}\hspace*{5pt}}
````

This adds a bit of space between paragraphs on the notes pages.
````
\addtobeamertemplate{note page}{\setlength{\parskip}{12pt}}
````

I also made a few small macros to simplify some things.
````
\newcommand{\bi}{\begin{itemize}}
\newcommand{\ei}{\end{itemize}}
\newcommand{\ig}{\includegraphics}
\newcommand{\subt}[1]{{\footnotesize \color{subtitle} {#1}}}
````

### Code for example slides

Here's the code to create the title slide. (The content is determined by `\title`, `\author`, etc., before the `\begin{document}`.) The first line is to get rid of the page number. The text in `\note{}` will appear on a separate page after the title slide, in the version of the PDF with notes.
````
{
\setbeamertemplate{footline}{} % no page number here
\frame{
  \titlepage
  \note{These are slides for a talk I will give on 24 Oct 2013, at a
    symposium on open access publishing, organized by the Ebling
    Library, UW{\textendash}Madison.}
}
}
````

Here's an example regular slide. `\subt` is a macro defined above and just makes that text smaller and in a different color.
````
\begin{frame}{Access in action}
\subt{Interesting reference}

\bigskip
\centerline{
\ig[height=0.75\textheight]{Images/img01.jpg}
}

\note{I'll begin with an illustration of what I mean by
  access.

  The other day I was reading a manuscript and saw an
  article of interest.}
\end{frame}
````

Here's a fancier slide, with a bit of animation: codes like `<2->`, which means that bit is not on the first version of this slide but appears on subsequent versions. When the LaTeX file is turned into a PDF, four versions of this slide are created. But in the handout (with the notes), there'll be just one, and the `<3| handout 0>` bits are to control the separate look on the animated slides and on the single-slide version that shows up with the notes.
````
\begin{frame}{It's all about money}
\subt{(Costs in scientific publishing)}

\vspace{24pt}

\bi
\item {\color<3| handout 0>{hilight} Research}
\item {\color<3| handout 0>{hilight} Writing}
\item {\color<3| handout 0>{hilight} Peer review, editorial oversight}
\item {\color<4| handout 0>{hilight} Journal administration}
\item {\color<4| handout 0>{hilight} Copy editing, typesetting}
\item {\color<4| handout 0>{hilight} Distribution}
\item<2->{\color<2| handout 0>{vhilight} \color<4| handout 0>{hilight} Profit}
\ei
\note{ [clip] }
\end{frame}
````

### A version with notes

It's nice to have a version of one's slides that includes notes of what you're going to say. I like [Mike Bostock](https://bost.ocks.org/mike) approach, as in [these slides](https://bost.ocks.org/mike/d3/workshop/#0), with little sticky notes. But I don't want to spend time trying to implement that in LaTeX, so I went with the built-in functionality in Beamer, though selecting a very plain template and adding a bit of space between paragraphs.

I also chose to create a handout with just a single snapshot of the animated pages (in which I sequentially overlayed a number of images).

Having added a `\note{}` to each "frame," there are just a few simple commands to add to the `.tex` file to get it to compile to the handout with notes. So I wrote a [ruby script](https://github.com/kbroman/Talk_OpenAccess/blob/master/createVersionWithNotes.rb) to make those changes.

I then used [pdfnup](https://www2.warwick.ac.uk/fac/sci/statistics/staff/academic-research/firth/software/pdfjam/) to make the notes PDF be 2-up: the slide above and the notes below. The details are in the [Makefile](https://github.com/kbroman/Talk_OpenAccess/blob/master/Makefile); if that's not obvious, see my [minimal tutorial about GNU make](https://kbroman.github.io/minimal_make/).
