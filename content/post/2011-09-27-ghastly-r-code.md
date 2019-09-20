---
title: Ghastly R code
author: Karl Broman
date: '2011-09-27'
categories:
  - Programming
  - R
tags:
  - stupid
slug: ghastly-r-code
---

My R package, [R/qtl](https://rqtl.org), contains about 33k lines of R code (and 21k lines of C code).  Some of it is quite good; [some of it is terrible](https://kbroman.org/blog/2011/08/17/the-stupidest-r-code-ever/).  Here's another example of the terrible.

I've long needed to revise the function [`scantwo`](https://github.com/kbroman/qtl/blob/master/R/scantwo.R), for performing a two-dimensional genome scan for pairs of loci.  I was looking at the function today, and was aghast to find that it's 1354 lines long.  That's **4%** of the R code in the package!

And the R code is just moving data and results around; the actual calculations are in C (in a series of files that comprise 4725 lines -- **20%** of the C code in the package).

Yuck.
