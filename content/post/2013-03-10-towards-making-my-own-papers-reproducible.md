---
title: Towards making my own papers reproducible
author: Karl Broman
date: '2013-03-10'
categories:
  - Academics
  - Statistics
tags:
  - papers
  - reproducible research
slug: towards-making-my-own-papers-reproducible
---

Much has been written about [reproducible research](https://magazine.amstat.org/blog/2011/01/01/scipolicyjan11/): that scientific papers should be accompanied by the data and software sufficient to reproduce the results.  It's obviously a _Good Thing_.  But it can be hard to stick to this ideal in practice.

For my early papers, I'm not sure I can find the materials anymore, and that's just 15 years back.

For my recent papers, I have developed a sort of system so that I can reproduce the results myself.  I use a combination tools, including [R](https://www.r-project.org), [Sweave](https://en.wikipedia.org/wiki/Sweave), [perl](https://www.cpan.org), and, of course, [make](https://www.gnu.org/software/make/).

But I've not been distributing the detailed code behind my papers.  It's not always pretty, and it is not well documented.  (And "not always" is a bit of a stretch -- more like "seldom.")

When [Victoria Stodden](http://www.stodden.net) visited Madison last fall, I was inspired to release this code, but I never carried through on that.

But then last night I [twittered](https://twitter.com/kwbroman/status/310633718551293953) an example graph from [a paper](https://www.biostat.wisc.edu/~kbroman/publications/phyloqtl.pdf), was (appropriately) [asked to produce code](https://twitter.com/fellgernon/status/310647658387734528), and so created a [github repository](https://github.com/kbroman/phyloQTLpaper/) with the bulk of the code for that paper.

The repository is incomplete: it doesn't include the code to do the main analysis and simulations, but just to make the figures, starting from those results.  I'll work to add those additional details.

And, even once complete, it will be far from perfect.  The code is (or will be) there, but it would take a bit of work for an interested reader to figure out what it is doing, since much of it is undocumented and poorly written.

But if we ask for perfection, we'll get nothing.  If we ask for the minimal materials for reproducibility, we may get it.

So that's my goal: to focus first on _minimal accessibility_ of the code and data behind a paper, even if it is minimally readable and so might take quite a bit of effort for someone else to follow.

One last point: I use local [git](https://git-scm.com) repositories for my draft analyses and for the whole process of writing a paper.  I could post that whole history, but [as I said before](https://kbroman.org/blog/2011/08/17/the-stupidest-r-code-ever/):

<blockquote>Open source means everyone can see my stupid mistakes. Version control means everyone can see every stupid mistake I've ever made.</blockquote>

It would be easy to make my working repository public, but it would include things like referees' reports and my responses to them, as well as the gory details on all of the stupid things that I might do along the way to publication.

I'm more comfortable releasing just a snapshot of the final product.
