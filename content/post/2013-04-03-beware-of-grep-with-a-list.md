---
title: Beware of grep with a list
author: Karl Broman
date: '2013-04-03'
categories:
  - R
tags:
  - code
  - stupid
slug: beware-of-grep-with-a-list
---

Another [R](http://r-project.org) tip: beware of `as.character` applied to a list.

````
> as.character( list(letters[1:3], letters[4:6]) )
[1] "c(\"a\", \"b\", \"c\")" "c(\"d\", \"e\", \"f\")"
````

Really, beware of `grep` with a list:

````
> grep("c", list(letters[1:3], letters[4:6]))
[1] 1 2
````

You might have thought that the result would be just `1`, but `grep` expects a vector of character strings.  If the input is not that, it uses `as.character()`.  Since the result of that starts with `"c("`, `grep` finds `"c"` in each.

See the [related discussion](http://stackoverflow.com/questions/7591632/why-this-behavior-when-coercing-a-list-to-character-via-as-character) (from Sept 2011) on [stackoverflow](http://stackoverflow.com).
