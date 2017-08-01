---
title: Read the source code
author: Karl Broman
date: '2013-08-06'
categories:
  - Programming
  - R
tags:
  - code
  - programming
slug: read-the-source-code
---

The other day, there was a bit of [a twitter conversation about `qqline`](https://twitter.com/hspter/status/363015797204992000) in R.

It made me think: how exactly is the line produced by `qqline` chosen? I seemed to recall that the line was through the first and third quartiles.

An advantage of R is that you can just type the name of the function and see the code:

````R
# qqline
function (y, datax = FALSE, distribution = qnorm, probs = c(0.25,
    0.75), qtype = 7, ...)
{
    stopifnot(length(probs) == 2, is.function(distribution))
    y <- quantile(y, probs, names = FALSE, type = qtype, na.rm = TRUE)
    x <- distribution(probs)
    if (datax) {
        slope <- diff(x)/diff(y)
        int <- x[1L] - slope * y[1L]
    }
    else {
        slope <- diff(y)/diff(x)
        int <- y[1L] - slope * x[1L]
    }
    abline(int, slope, ...)
}
````

I was right: They take the 25th and 75th percentiles of the data and of the theoretical distribution, calculate the slope and y-intercept of the line that goes through those two points, and use `abline` to draw the line.

Open source means the source is open, so why not take the time to look at it?

Sometimes typing the name of the function doesn't tell you much:

````R
# qqnorm
function (y, ...)
UseMethod("qqnorm")
````

In such cases, you could try typing, for example, `qqnorm.default`.

Still, the comments (if there were any) get stripped off, and for long functions, it's not pretty.  So I like to keep a copy of the source code (for example, [`R-3.0.1.tar.gz`](http://cran.r-project.org/src/base/R-3/R-3.0.1.tar.gz); extract it with `tar xzf R-3.0.1.tar.gz`). I use `grep` to find the relevant files.

For example,

    grep -r 'qqline' R-3.0.1/src/

shows that I should look for `qqline` in

    R-3.0.1/src/library/stats/R/qqnorm.R

For something like `cor`, you might want to do:

    grep -r 'cor <-' R-3.0.1/src

Or maybe:

    grep -r 'cor <-' R-3.0.1/src/library/stats/R

But for `cor`, you probably also want to look at the C code, which is in

    R-3.0.1/src/library/stats/src/cov.c

You can learn a lot about programming from the source code for R.
