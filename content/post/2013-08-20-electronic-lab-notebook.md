---
title: Electronic lab notebook
author: Karl Broman
date: '2013-08-20'
categories:
  - Programming
  - R
  - Statistics
tags:
  - reproducible research
  - version control
slug: electronic-lab-notebook
---

I was interested to read [C. Titus Brown](http://ivory.idyll.org)'s recent post, "[Is version control an electronic lab notebook?](http://ivory.idyll.org/blog/is-version-control-an-electronic-lab-notebook.html)"

I think version control _is_ really important, and I think all computational scientists _should_ have something equivalent to a lab notebook. But I think of version control as serving needs orthogonal to those served by a lab notebook.

As Titus points out, a traditional lab notebook serves two purposes: provenance and protocol. Version control could be useful for provenance, but I don't really care about provenance. And for protocol, version control doesn't really matter.

### Version control

I really like [git](http://git-scm.com/) with [github](http://github.com). (See [my tutorial](http://kbroman.github.io/github_tutorial/).) But for me, the basic need served by version control  is that embodied in the question, "This shit worked before; why isn't it working now?"

You don't want to edit working code _in place_ and so possibly break a working system. Version control lets you try things out, and to try something out in any version of your software, from any point in time.

The other basic use of version control is for managing projects with multiple contributors. If there are multiple programmers working on a software project, or multiple authors working on a manuscript, version control is the best way to manage things, particularly for merging everyone's efforts.

These are really useful things, but version control is more about _merging_ and _history_ and not so much _reproducible research_.

### Make is the thing

To me, the basic tool to make research reproducible is [GNU make](http://www.gnu.org/software/make/) (see my [minimal tutorial](http://kbroman.github.io/minimal_make/)). You create a `Makefile` that documents all analysis steps in a project. (For example, "Use this script to turn these raw data files into that combined file, and use this script to create figure 1 and that script to create figure 2, then combine them with this LaTeX file to make the manuscript PDF.")

With GNU make (see also [rake](http://rake.rubyforge.org/)), you both document and automate these processes. With well-documented/commented scripts and an all-encompassing `Makefile`, the research is reproducible.

### Add knitr, and you've got a notebook

The other ingredient to create the computational scientist's equivalent of a lab notebook is [knitr](http://yihui.name/knitr/), which allows one to combine text (e.g., in [Markdown](http://daringfireball.net/projects/markdown/) or [asciidoc](http://www.methods.co.nz/asciidoc/)) and code (e.g., in [R](http://www.r-project.org)) to make documents (e.g., in html or PDF) that both _do_ the work and _explain_ the work. Write such documents to describe what you did and what you learned, and you've got an electronic lab notebook.

You could even get rid of your `Makefile` by having an over-arching knitr-based document that does it all.  But I still like [make](http://www.gnu.org/software/make).

### But it's so much work!

Going into a file and deleting a data point is a lot easier than writing a script that does it (and also documents _why_). But I don't think you should be going in and changing the data like that, even if it is being tracked by version control. (And that is the main complaint potential users have about version control: "Too time consuming!")

I think you have to expect that writing well-documented scripts and [knitr](http://yihui.name/knitr/)-based reports that capture the totality of a data analysis project will take a lot of work: perhaps double (or more!) the effort. But it will save a ton of time later (if others care about what you did).

I don't really want to take this time in the midst of a bout of exploratory data analysis. I find it too inhibiting. So I tend to do a bunch of analyses, capturing the main ideas in a draft R script (or reconstructed later from the `.Rhistory` file), and then go back later to make a clean knitr-based document that explains what I was doing and why.

It can be hard to force myself to do the clean-up. I wish there were an easier way. But I expect that well-organized lab scientists devote a lot of time to constructing their lab notebooks, too.
