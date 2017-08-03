---
title: '"[" with the apply() functions, revisited'
author: Karl Broman
date: '2014-04-29'
categories:
  - R
tags:
  - code
slug: with-the-apply-functions-revisited
---

I'd [mentioned in the fall](http://kbroman.org/blog/2013/08/20/and-with-the-apply-functions/) that one could use `"["` in the `apply`-type functions, like this:

````
id <- c("ZYY-43S-CWA3", "6YU-F4B-VD2I")
sapply(strsplit(id, "-"), "[", 2)
````

I just realized that you can use this with matrices, too. If you have a list of matrices, you can pull out rows and columns with this technique.

````
z <- list(matrix(1:10, nrow=2), matrix(11:20, nrow=2))
lapply(z, "[", 1, )
lapply(z, "[", , 3)
````

As you can see, my data isn't "[tidy](http://vita.had.co.nz/papers/tidy-data.pdf)."
