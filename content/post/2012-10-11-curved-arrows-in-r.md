---
title: Curved arrows in R
author: Karl Broman
date: '2012-10-11'
categories:
  - Programming
  - R
tags:
  - graphics
slug: curved-arrows-in-r
---

I briefly investigated how to draw curved arrows in R. Here's a small piece of the figure that I ultimately created:

![](http://kbroman.files.wordpress.com/2012/10/sample_mix-ups.png)
<!-- more -->

A google search for "curved arrows in R" revealed three options:

  * [`curvedarrow`](http://rgm2.lab.nig.ac.jp/RGM2/func.php?rd_id=diagram:curvedarrow) in the [diagram](http://cran.r-project.org/web/packages/diagram/) package

  * The internal function `igraph.Arrows` within the [igraph](http://cran.r-project.org/web/packages/igraph) package (mentioned by Gabor Csardi [in R help](http://r.789695.n4.nabble.com/Curved-arrows-td886056.html))

  * Using `xspline` for the shaft and adding the head "by hand" ([mentioned](http://r.789695.n4.nabble.com/Curved-arrows-tt886056.html#a886057) by Greg Snow)

I wasn't too happy with how the arrow heads looked using the diagram package, and I didn't want to have to fiddle around with `xspline`, and igraph worked quite easily, so I went with that.

Plotting multiple arrows with different colors in a single call to `igraph.Arrows` didn't work right (the arrow heads were all the first color), but using a loop and plotting one arrow per call worked fine.

Here's [a bit of code I played with](http://www.biostat.wisc.edu/~kbroman/blog/igraph_arrows.R):

````r
library(igraph)
par(mar=rep(1,4))
plot(0,0, type="n",xaxt="n", yaxt="n", xlab="", ylab="",
     xlim=c(0,11), ylim=c(1,11))

x <- 1:10
y <- rep(2, 10)

for(k in 0:4)
  points(x, y+k*2)

iArrows <- igraph:::igraph.Arrows

mycolors <- rep(c("green", "orange", "red", "blue"), 3)

for(i in 1:9) {
  iArrows(x[i], y[i], x[i+1], y[i+1],
          h.lwd=2, sh.lwd=2, sh.col=mycolors[i],
          curve=0.5 - (i %% 2), width=1, size=0.7)

  iArrows(x[i], y[i]+2, x[i+1], y[i+1]+2,
          h.lwd=2, sh.lwd=2, sh.col=mycolors[i],
          curve=1 - (i %% 2), width=1, size=0.7)
}

for(i in 1:8) {
  iArrows(x[i], y[i]+4, x[i+2], y[i+2]+4,
          h.lwd=2, sh.lwd=2, sh.col=mycolors[i],
          curve=0.5 - (i %% 2), width=1, size=0.7)

  iArrows(x[i], y[i]+6, x[i+2], y[i+2]+6,
          h.lwd=2, sh.lwd=2, sh.col=mycolors[i],
          curve=1 - 2*(i %% 2), width=1, size=0.7)
}

x1 <- x[1:8]
x2 <- x[3:10]
y <- y[1:8]+8

iArrows(x1, y, x2, y,
        h.lwd=2, sh.lwd=2, sh.col=mycolors[1:8],
        curve=1 - 2*((1:8) %% 2), width=1, size=0.7)
````

And here's the corresponding figure:

![](http://kbroman.files.wordpress.com/2012/10/igraph_arrows1.png)

Note that the arrows at the top all have green arrow heads.
