---
title: Randomized Hobbit
author: Karl Broman
date: '2015-06-22'
categories:
  - R
tags:
  - code
  - kids
  - textmining
slug: randomized-hobbit-2
---

[@wrathematics](https://twitter.com/wrathematics) pointed me to his [ngram](http://cran.r-project.org/package=ngram) R package for constructing and simulating from n-grams from text.

I'd recently grabbed the text of the hobbit, and so I applied it to that text, with amusing results.

Here's the code I used to grab the text.

````
library(XML)
stem <- "http://www.5novels.com/classics/u5688"
hobbit <- NULL
for(i in 1:74) {
```r
cat(i,"\n")
if(i==1) {
    url <- paste0(stem, ".html")
} else {
    url <- paste0(stem, "_", i, ".html")
}

x <- htmlTreeParse(url, useInternalNodes=TRUE)
xx <- xpathApply(x, "//p", xmlValue)
hobbit <- c(hobbit, gsub("\r", "", xx[-length(xx)]))
Sys.sleep(0.5)
```
}
````

Then calculate the ngrams with n=2.

````
library(ngram)
ng2 <- ngram(hobbit, n=2)
````

Simulate some number of words with `babble()`. If you use the `seed` argument, you can get the result reproducibly.

````
babble(ng2, 48, seed=53482175)
````

<blockquote>
into trees, and then bore to the Mountain to go through?" groaned the hobbit. "Well, are you doing, And where are you doing, And where are you?" it squeaked, as it was no answer. They were surly and angry and puzzled at finding them here in their holes
</blockquote>

**Update**: [@wrathematics](https://twitter.com/wrathematics) suggested that I [mix two texts](http://librestats.com/2014/07/01/modern-applied-statistics-in-rlyeh/), so here's a bit from the _Hobbit in the Hat_ (The Hobbit with 59× Cat in the Hat -- up-sampled to match lengths.) But there's maybe not enough overlap between the two texts to get much of a mixture.

<blockquote>
"I am Gandalf," said the fish. This is no way at all!
</blockquote>

<blockquote>
already off his horse and among the goblin and the dragon, who had remained behind to guard the door. "Something is outside!" Bilbo's heart jumped into his boat on to sharp rocks below; but there was a good game, Said our fish No! No! Those Things should not fly.
</blockquote>
