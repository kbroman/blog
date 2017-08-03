---
title: '"[" and "[[" with the apply() functions'
author: Karl Broman
date: '2013-08-20'
categories:
  - R
tags:
  - code
slug: and-with-the-apply-functions
---

Did you know you can use `"["` and `"[["` as function names for subsetting with calls to the `apply`-type functions?

For example, suppose you have a bunch of identifier strings like `"ZYY-43S-CWA3"` and you want to pull off the bit before the first hyphen (`"ZYY"` in this case).  (For code to create random IDs like that, see the end of this post.)

Suppose the IDs are in a vector of character strings, `id`.

If I wanted to grab the bit before the first hyphen, I would typically use `strsplit` and then `sapply` with `function(a) a[1]`, as so:

````r
sapply(strsplit(id, "-"), function(a) a[1])
````

But in place of `function(a) a[1]`, you can use `"[", 1`, as follows:

````r
sapply(strsplit(id, "-"), "[", 1)
````

I think that's kind of cute. You can use `"[["` the same way, if you're working with lists.

Here's some code to create random IDs of this form, to test out the above:
````r
nind <- 8
lengths <- c(3, 3, 4)
id <- NULL
for(i in seq(along=lengths)) {
  randchar <- sample(c(LETTERS, 0:9), nind*lengths[i], replace=TRUE)
  randstring <- apply(matrix(randchar, ncol=lengths[i]),
                   1, paste, collapse="")
  if(is.null(id)) id <- randstring
  else id <- paste(id, randstring, sep="-")
}
````
