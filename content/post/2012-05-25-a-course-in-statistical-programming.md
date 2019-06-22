---
title: A course in statistical programming
author: Karl Broman
date: '2012-05-25'
categories:
  - Programming
  - R
  - Statistics
tags:
  - computing
  - reproducible research
  - teaching
slug: a-course-in-statistical-programming
---

Graduate students in statistics often take (or at least have the opportunity to take) a statistical computing course, but often such courses are focused on methods (like numerical linear algebra, the EM algorithm, and MCMC) and not on actual coding.

For example, [here's a course in "advanced statistical computing"](https://www.biostat.wisc.edu/~kbroman/teaching/statcomp/index.html) that I taught at [Johns Hopkins](https://www.biostat.jhsph.edu) back in 2001.

Many (perhaps most) good programmers learned to code outside of formal courses.  But many statisticians are terrible programmers and would benefit by a formal course.

Moreover, applied statisticians spend the vast majority of their time interacting with a computer and would likely benefit from more formal presentations of how to do it well.  And I think this sort of training is particularly important for ensuring that [research is reproducible](https://groups.google.com/forum/?fromgroups#!forum/reproducible-research).

One really learns to code in private, struggling over problems, but I benefited enormously from a statistical computing course I took from [Phil Spector](http://www.stat.berkeley.edu/~spector/) at [Berkeley](http://www.stat.berkeley.edu).

[Brian Caffo](http://www.biostat.jhsph.edu/~bcaffo), [Ingo Ruczinski](http://www.biostat.jhsph.edu/~iruczins/), [Roger Peng](http://www.biostat.jhsph.edu/~rpeng), [Rafael Irizarry](http://www.biostat.jhsph.edu/~ririzarr/), and [I](https://kbroman.org) developed a [statistical programming course](http://www.biostat.jhsph.edu/~bcaffo/statcomp/) at Hopkins that (I think) really did the job.

I would like to develop a similar such course at [Wisconsin](https://www.biostat.wisc.edu): on statistical programming, in the most general sense.

I have in mind several basic principles:

  * be self-sufficient

  * get the right answer

  * document what you did (so that you will understand what you did 6 months later)

  * if primary data change, be able to re-run the analysis without a lot of work

  * are your simulation results reproducible?

  * reuse of code (others' and your own) rather than starting from scratch every time

  * make methods accessible to (and used by) others

Here are my current thoughts about the topics to include in such a course.  The key aim would be to make students aware of the basic principles and issues: to give them a good base from which to learn on their own.  Homework would include interesting and realistic programming assignments plus create a Sweave-type document and an R package.

  * Basic unix tools (find; df; top; ps ux; grep); unix on Mac and windows

  * Emacs/vim/other editors (rstudio/eclipse)

  * Latex (for papers; for presentations)

  * slides for talks; posters; figures/tables

  * Advanced R (fancy data structures; functions; object-oriented stuff)

  * Advanced R graphics

  * R packages

  * Sweave/asciidoc/knitr

  * minimal Perl (or Python or Ruby); example of data manipulation

  * Minimal C (or C++); examples of speed-up

  * version control (eg git or mercurial); backups

  * reproducible research ideas

  * data management

  * managing projects: data, analyses, results, papers

  * programming style (readable, modular); general but not too general

  * debugging/profiling/testing

  * high-throughput computing; parallel computing; managing big jobs

  * finding answers to questions: man pages; documentation; web

  * more on visualization; dynamic graphics

  * making a web page; html & css; simple cgi-type web forms?

  * writing and managing email

  * managing references to journal articles
