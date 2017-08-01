---
title: as.character() for rownames()
author: Karl Broman
date: '2012-03-22'
categories:
  - R
tags:
  - code
  - stupid
slug: as-character-for-rownames
---

[Rainer pointed out](http://kbroman.org/blog/2012/03/21/row-names-in-data-frames-beware-of-1nrow/#comment-330), in response to my post, [Row names in data frames: Beware of 1:nrow](http://kbroman.org/blog/2012/03/21/row-names-in-data-frames-beware-of-1nrow/), that if I'd used `rownames(x) <- as.character(1:3)` rather than `rownames(x) <- 1:3`, I wouldn't have had the problem I'd seen.

````r
> x <- z <- data.frame(id=1:3)
> y <- data.frame(id=4:6)
> rownames(x) <- 1:3
> rownames(y) <- LETTERS[4:6]
> rownames(z) <- as.character(1:3)
> rbind(y,x)
  id
D  1
E  2
F  3
4  1
5  2
6  3
> rbind(y,z)
  id
D  1
E  2
F  3
1  1
2  2
3  3
````

If you type `rownames(x)` you see the same result as `rownames(z)`, and `is.character(rownames(x))` and `is.character(rownames(z))` both return TRUE, but if you look at the `"row.names"` attribute directly, you see they are different.

````r
> rownames(x)
[1] "1" "2" "3"
> rownames(z)
[1] "1" "2" "3"
> is.character(rownames(x))
[1] TRUE
> is.character(rownames(z))
[1] TRUE
> attr(x, "row.names")
[1] 1 2 3
> attr(z, "row.names")
[1] "1" "2" "3"
````

But why is `1:3` treated so differently from `2:4`?

````r
> w <- data.frame(id=1:3)
> rownames(w) <- 2:4
> attr(w, "row.names")
[1] 2 3 4
> rownames(rbind(y,w))
[1] "D" "E" "F" "2" "3" "4"
````
