---
title: Testing an R package's interactive graphs
author: Karl Broman
date: '2014-08-01'
categories:
  - Programming
  - R
tags:
  - D3
  - graphics
  - programming
  - testing
slug: testing-an-r-packages-interactive-graphs
---

I've been working on an R package, [R/qtlcharts](https://kbroman.org/qtlcharts), with [D3](https://d3js.org)-based interactive graphs for quantitative trait locus mapping experiments.

Testing the interactive charts it produces is a bit of a pain. It seems like I pretty much _have_ to just open a series of examples in a web browser and tab through them manually, checking that they look okay, that the interactions seem to work, and that they're not giving any sort of errors.

But if I want to post the package to [CRAN](https://cran.r-project.org), it seems (from the [CRAN policy](https://cran.r-project.org/web/packages/policies.html)) that the examples in the `.Rd` files shouldn't be opening a web browser. Thus, I need to surround the example code with `\dontrun{}`.

But I was using those examples, and `R CMD check`, to open the series of examples for manual checking.

So, what I've decided to do:

  * Include examples opening a browser, but within `\dontrun{}` so the browser isn't opened in `R CMD check`.

  * Also include examples that don't open the browser, within `\dontshow{}`, so that `R CMD check` will at least check the basics.

  * Write a [ruby](http://ruby-lang.org) script that pulls out all of the examples from the `.Rd` files, stripping off the `\dontrun{}` and `\dontshow{}` and pasting it all into a `.R` file.

  * Periodically run `R CMD BATCH` on that set of examples, to do the manual checking of the interactive graphs.

This will always be a bit of a pain, but with this approach I can do my manual testing in a straightforward way and still fulfill the CRAN policies.

**Update**: [Hadley Wickham](http://had.co.nz/) [pointed me](https://twitter.com/hadleywickham/status/495535873711431681) to **`\donttest{}`**, added in R ver 2.7 (in 2008). (More value from blog + twitter!)

So I replaced my `\dontrun{}` bits with `\donttest{}`. And I can use `devtools::run_examples()` to run all of the examples, for my manual checks.
