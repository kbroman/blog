---
title: 'Row names in data frames: beware of 1:nrow'
author: Karl Broman
date: '2012-03-21'
categories:
  - R
tags:
  - code
  - stupid
slug: row-names-in-data-frames-beware-of-1nrow
---

I spent some time puzzling over row names in data frames in R this morning. It seems that if you make the row names for a data frame, `x`, as `1:nrow(x)`, R will act as if you'd not assigned row names, and the names might get changed when you do `rbind`.

Here's an illustration:

````r
> x <- data.frame(id=1:3)
> y <- data.frame(id=4:6)
> rownames(x) <- 1:3
> rownames(y) <- LETTERS[4:6]
> rbind(x,y)
  id
1  1
2  2
3  3
D  4
E  5
F  6
> rbind(y,x)
  id
D  4
E  5
F  6
4  1
5  2
6  3
````
<!-- more -->
As you can see, if you give `x` the row names `1:3`, these are treated as generic row numbers and could get changed following `rbind` if they end up in different rows.  This doesn't happen if `x` and `y` are matrices.

I often use row names as identifiers, so it seems I must be cautious to use something other than row numbers.
