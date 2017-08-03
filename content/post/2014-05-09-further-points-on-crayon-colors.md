---
title: Further points on crayon colors
author: Karl Broman
date: '2014-05-09'
categories:
  - R
tags:
  - code
  - graphics
slug: further-points-on-crayon-colors
---

I saw [this great post on crayola crayon colors](http://learnr.wordpress.com/2010/01/21/ggplot2-crayola-crayon-colours/) at the [Learning R blog](http://learnr.wordpress.com), reproducing a [nice graph](http://www.datapointed.net/2010/01/crayola-crayon-color-chart/) of the Crayola crayon colors over time. (Also see [this even nicer version](http://www.datapointed.net/2010/10/crayola-color-chart-rainbow-style/).)

The [Learning R post](http://learnr.wordpress.com/2010/01/21/ggplot2-crayola-crayon-colours/) shows how to grab the crayon colors from the wikipedia page, "[List of Crayola crayon colors](https://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors)," directly in R. Here's the code (after some slight modifications due to changes in the page since 2010):

````
library(XML)
theurl <- "http://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors"
crayontable <- readHTMLTable(theurl, stringsAsFactors = FALSE)[[1]]
crayons <- crayontable[,grep("Hex", colnames(crayontable))]
names(crayons) <- crayontable[,"Color"]
````

Comparing these to what I'd grabbed, I noted one small discrepancy on the Wikipedia page: Yellow Orange was listed as `"#FFAE42"` but the background color for the Yellow Orange cell in the table was `"#FFB653"`.

So I created a Wikipedia account and edited the Wikipedia page.

(Then I realized that I'd made a mistake in my edit, undid my change, thought the whole thing through again, and edited the page again.)

The [Learning R post](http://learnr.wordpress.com/2010/01/21/ggplot2-crayola-crayon-colours/) also showed a different way to sort the colors: convert to HSV, and then sort by the H then S then V. So [I edited my `plot_crayons()` function again](https://github.com/kbroman/broman/commit/dde305de2c3cd5f3a00f7378fefd4f73a4520599), to create the following picture:

![Crayon colors, again](http://kbroman.files.wordpress.com/2014/05/crayon_colors_again.png)
