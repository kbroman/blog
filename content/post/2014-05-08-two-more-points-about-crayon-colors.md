---
title: Two more points about crayon colors
author: Karl Broman
date: '2014-05-08'
categories:
  - R
tags:
  - code
  - graphics
slug: two-more-points-about-crayon-colors
---

If you want to use [crayon colors in R](http://kbroman.org/blog/2014/05/07/crayon-colors-in-r/) but you don't want to rely on my [R/broman](http://github.com/kbroman/broman) package, you can just grab the code. Copy the [relevant lines from the `R/brocolors.R` file](https://github.com/kbroman/broman/blob/master/R/brocolors.R#L72-L204):

````
crayons = c("Almond"="#efdecd",
            "Antique Brass"="#cd9575",
            "Apricot"="#fdd9b5",
            ...
            "Yellow Green"="#c5e384",
            "Yellow Orange"="#ffb653")
````

I spent a bit of time thinking about [how best to sort the colors in a meaningful way](http://stackoverflow.com/questions/11923659/javascript-sort-rgb-values), for the `plot_crayons()` function. But then decided to stop thinking and just do something brainless: measure distance between colors by RMS difference of the RGB values, and then use hierarchical clustering. Here's the code from [`plot_crayons()`](https://github.com/kbroman/broman/blob/852b0ebd84c4cfed6f21f3e26635a46a10143757/R/brocolors.R#L234-L238):

````
# get rgb
colval <- t(col2rgb(crayons))

# hclust to order the colors
ord <- hclust(dist(colval))$order
````

It's not perfect, but I think it worked remarkably well:

![Crayon colors](http://kbroman.files.wordpress.com/2014/05/crayons.png)
