---
title: It's not you, it's me
author: Karl Broman
date: '2015-09-24'
categories:
  - Programming
  - R
tags:
  - code
  - debugging
  - programming
slug: its-not-you-its-me
---

Somehow when my code stops working, my first (and second, and third) reaction is to blame everything except my own code. (&ldquo;It's not _me_, it's _you_.&rdquo;)

And almost always, it's my own code that's the problem (hence the title of this post).

I spent the day trying to resolve a bug in my early-in-development R package, [qtl2geno](https://github.com/kbroman/qtl2geno). In the process, I blamed

  * TravisCI for not handling `system.file()` properly.

  * R-devel for having broken `system.file()`.

  * `data.table::fread()` for treating `sep=NULL` differently on different operating systems.

Of course, none of these were true. I was just passing `sep=NULL` to `data.table::fread()`, and that worked in the previous version, but doesn't work in the latest release on [CRAN](https://cran.r-project.org), and I hadn't yet installed the latest version of [data.table](https://github.com/Rdatatable/data.table) on my Mac, but Travis and my junky Windows laptop had the latest version.

The debugging process seems a potentially interesting case study, so I thought I'd write down some of the details.

<!-- more -->

The whole thing started off with my [qtl2geno](https://github.com/kbroman/qtl2geno) package suddenly failing on [TravisCI](http://travis-ci.org), even though it was still passing `R CMD check` on my local machine. (This was on 19 Sept 2015, when a new version of data.table hit CRAN, but I didn't realize that until the very end of the story.)

The problem line was in a [vignette](https://github.com/kbroman/qtl2geno/blob/master/vignettes/user_guide.Rmd):

````
grav2 <- read_cross2( system.file("extdata", "grav2.zip", package="qtl2geno") )
````

The changes I'd been making to my package didn't seem to have anything to do with this, so I concluded that the problem was `system.file()`. Why that would have worked before but not now, I couldn't say, but I figured maybe Travis was installing things differently than before.

I changed that code block to `eval=FALSE`, but then a bunch of tests using `read_cross2( system.file( ... ) )` were failing instead. Again, I figured the problem was `system.file()`, because `R CMD check` worked fine on my machine.

I then thought maybe Travis was using R-devel whereas I was using the R-release. So I used [R Win-builder](http://win-builder.r-project.org/) to test my package with R-devel, and sure enough it failed there. So it wasn't Travis. My conclusion was that R-devel had broken `system.file()`.

Poked around some more, and then finally used [R Win-builder](http://win-builder.r-project.org/) with R-release. And it failed with that, too. So it wasn't R-devel either.

I then created a little tester package, [testsysfile](https://github.com/kbroman/testsysfile), testing `system.file()` with `read.csv()` and then with `data.table::fread()`. That all worked fine. So it seemed like it wasn't actually `system.file()`, but something within `read_cross2()`.

So finally I poked into my own code, and then I realized that I was passing a `NULL` value to the `sep` argument of `fread()`. (See [here](https://github.com/kbroman/qtl2geno/blob/master/R/read_cross2.R#L99-L100) and [here](https://github.com/kbroman/qtl2geno/blob/master/R/read_cross2.R#L474-L485).)

But why would `sep=NULL` work on my Mac but not on Travis or R Win-builder? I pulled out my junky Windows laptop (purchased in order to have a better sense of what my students were dealing with), went through all of the Windows updates, then updated R, [Rtools](https://cran.r-project.org/bin/windows/Rtools/), and [RStudio](http://rstudio.com), and tried things out there.

With my [testsysfile](https://github.com/kbroman/testsysfile) package, I could see that `data.table::fread()` was throwing an error with `sep=NULL` on Windows, though it was working fine on my Mac.

I spent some time making a patch to `fread()`, and I was really close to submitting a pull request. (Treating `sep=NULL` didn't seem important, but it did seem like it the behavior should be the same on Windows and Mac.) But then I saw, in the [README](https://github.com/Rdatatable/data.table/blob/master/README.md) file, that there were [Contribution guidelines](https://github.com/Rdatatable/data.table/blob/master/Contributing.md). I figured I'd better go through them.

The guidelines say, "squash all your commits together," so I spent some time getting my two commits combined into one. The guidelines also say to update the README file. In doing so, I realized that they'd put a new version of data.table on CRAN on 19 Sep 2015, which is precisely when my package started failing on Travis.

And so then I finally installed the updated version of data.table on my Mac, and saw that there was no operating system dependence; the differences I was seeing were just because of the old vs new version of data.table.

So data.table was updated in a way where `sep=NULL` was no longer working, and in my own code, I had relied on that. So six hours, [many tweets](https://twitter.com/kwbroman/status/647125510686920705), lots of blaming of others, and finally I'd worked out that it was all my own fault.
