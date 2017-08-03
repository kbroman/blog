---
title: Write unit tests!
author: Karl Broman
date: '2015-12-07'
categories:
  - Programming
  - R
tags:
  - code
  - programming
  - stupid
  - testing
slug: write-unit-tests
---

Since 2000, I've been working on [R/qtl](http://rqtl.org), an R package for mapping the genetic loci (called quantitative trait loci, QTL) that contribute to variation in quantitative traits in experimental crosses. The [Bioinformatics paper about it](https://www.biostat.wisc.edu/~kbroman/publications/rqtl.pdf) is my most cited; also see my 2014 JORS paper, "[Fourteen years of R/qtl: Just barely sustainable](https://www.biostat.wisc.edu/~kbroman/publications/rqtl_14yrs.pdf)."

It's a bit of a miracle that R/qtl works and gives the right answers, as it includes essentially no formal tests. The only regular tests are that the examples in the help files don't produce any errors that halt the code.

I've recently been working on [R/qtl2](http://kbroman.org/qtl2), a reimplementation of R/qtl to better handle high-dimensional data and more complex crosses, such as [Diversity Outbred mice](http://www.genetics.org/content/190/2/437.short). In doing so, I'm trying to make use of the software engineering principles that I've learned over the last 15 years, which pretty much correspond to the ideas in "[Best Practices for Scientific Computing](http://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745)" ([Greg Wilson](http://www.third-bit.com/) et al., PLOS Biology 12(1): e1001745, [doi:10.1371/journal.pbio.1001745](http://doi.org/10.1371/journal.pbio.1001745)).

I'm still working on "Make names consistent, distinctive, and meaningful", but I'm doing pretty well on writing shorter functions with less repeated code, and _particularly importantly_ I'm writing extensive unit tests.
<!-- more -->

The basic idea is to break up your code into small functions that ideally do just one thing. (These are the "units".) And then write tests that explicitly check whether those functions are giving the correct answers. That is, don't just test that the code _runs_; you want to know that your code is _giving the right answers_!

Last week, I was working on implementing a basic genome scan function. I included the option of doing weighted least squares with known weights, because it's easy enough to do, and R/qtl had done that. (I've never actually _used_ that feature, but it's been there.) And my results were matching those that R/qtl provided. Well, mostly: in the case of multiple phenotypes, with some phenotypes having missing values, and when doing a weighted analysis, the results from R/qtl and R/qtl2 were quite different.

I expect you may be questioning the logic of testing code by comparing it to software that has not been formally tested. I was thinking the same thing. And so I wrote some tests that compared results to those using [R](http://www.r-project.org)'s `lm()` function. And (surprise) the results from `lm()` matched R/qtl2 but not R/qtl. So it was R/qtl that was the problem.

So that had me debugging the [`scanone` function in R/qtl](https://github.com/kbroman/qtl/blob/master/R/scanone.R), the R code for which is **831** lines long and was written according to the principle, "I'll just add this one thing and then clean things up later," with "later" really meaning "never", and "this one thing" really meaning "all the things."

I did, after resorting to a bunch of print/cat statements, [find the bug](https://github.com/kbroman/qtl/commit/254a1c728). In subsetting the data to remove individuals with missing values, I'd forgotten to subset the weights. Back in 2012, I'd [fixed a related bug](https://github.com/kbroman/qtl/commit/a07c575), but apparently it was only a partial fix. In thinking about the bug again while writing this post, and in looking back at the 2012 bug fix, I realized that I probably had the same bug in [`scantwo`](https://github.com/kbroman/qtl/blob/master/R/scantwo.R) (which is **1443** lines long). Sure enough, and so now there's [yet another bug fix](https://github.com/kbroman/qtl/commit/c71b3dfce9), though not yet on [CRAN](http://cran.r-project.org).

[Pjotr Prins](http://thebird.nl/) was the first to encourage me towards software testing. [Hadley Wickham](http://had.co.nz/)'s [testthat](https://github.com/hadley/testthat) package makes it easy to do in R packages. In his [paper about testthat](https://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf), Hadley wrote:

<blockquote>It's not that we don't test our code, it's that we don't store our tests so they can be re-run automatically.
</blockquote>

This is my favorite comment on testing; it totally applies to (old) me.

The bottom line:

  * Write unit tests.

  * When you find a bug, first write a test for it and then fix the bug.

  * When you find a bug, look for other possible instances of that bug, and fix them too.

To learn more about testing in R packages, see the [Testing](http://r-pkgs.had.co.nz/tests.html) chapter in Hadley's [R packages book](amazon.com/exec/obidos/ASIN/1491910593/7210-20). Also see the [slides for my lecture on testing and debugging](http://kbroman.org/Tools4RR/assets/lectures/09_testdebug_withnotes.pdf) in my [Tools for Reproducible Research](http://kbroman.org/Tools4RR/) course.
