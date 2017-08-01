---
title: 'hipsteR: re-educating people who learned R before it was cool'
author: Karl Broman
date: '2014-05-15'
categories:
  - R
tags:
  - code
slug: hipster-re-educating-people-who-learned-r-before-it-was-cool
---

This morning, I started [a tutorial for folks whose knowledge of R is (like mine) stuck in 2001.](http://kbroman.github.io/hipsteR/)

Yesterday I started reading the [Rcpp book](http://www.amazon.com/exec/obidos/ASIN/1461468671/7210-20), and on page 4 there's an example using the R function `replicate`, which (a) I'd never heard before, and (b) is super useful.

I mean, I often write code like this, for a bootstrap:

````
x <- rnorm(2500)
sapply(1:1000, function(a) quantile(sample(x, replace=TRUE), c(0.025, 0.975)))
````

But I could just be writing

````
x <- rnorm(100)
replicate(1000, quantile(sample(x, replace=TRUE), c(0.025, 0.975)))
````

"Oh, `replicate` must be some new function." Yeah, new in **R version 1.8, in 2003!**

I'm in serious need of some re-education (e.g., I should be using more of [Hadley Wickham's packages](http://github.com/hadley)). Hence the beginnings of a tutorial.

* * *

Note: the title was suggested by [Thomas Lumley](https://www.stat.auckland.ac.nz/showperson?firstname=Thomas&surname=Lumley). No connection to @hspter; it's not really so hip. I probably should have written "geeksteR."
