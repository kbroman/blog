---
title: Tutorials on git/github and GNU make
author: Karl Broman
date: '2013-05-10'
categories:
  - Programming
  - R
  - Statistics
tags:
  - programming
  - reproducible research
  - teaching
slug: tutorials-on-gitgithub-and-gnu-make
---

If you're not using version control, you should be.  _Learn [git](https://git-scm.com)_.

If you're not on [github](https://github.com), you should be.  That's _real_ open source.

To help some colleagues get started with [git](https://git-scm.com) and [github](https://github.com), I wrote a [minimal tutorial](https://kbroman.org/github_tutorial). There are lots of git and github resources available, but I thought I'd give just the bare minimum to get started; after using git and github for a while, other resources make a lot more sense and seem much more worthwhile.

And for [R](https://www.r-project.org) folks, note that it's easy to install R packages that are hosted on github, using [Hadley Wickham](http://hadley.nz)'s [devtools](https://github.com/hadley/devtools) package.  For example, to install [Nacho Caballero](https://github.com/nachocab)'s [clickme](https://github.com/nachocab/clickme) package:

````r
install.packages("devtools")
library(devtools)
install_github("nachocab/clickme")
````

Having written that git/github tutorial, I thought: I should write more such!

So I immediately wrote [a similar short tutorial](https://kbroman.org/minimal_make) on [GNU make](https://www.gnu.org/software/make), which I think is the _most important tool_ for reproducible research.
