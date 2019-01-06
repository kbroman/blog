---
title: Crayon colors in R
author: Karl Broman
date: '2014-05-07'
categories:
  - R
tags:
  - graphics
slug: crayon-colors-in-r
---

Last night I was working on a [talk on creating effective graphs](https://github.com/kbroman/Talk_Graphs/tree/ictr2014). Mostly, I needed to update the colors, as there'd been some gaudy ones in [its previous form](https://www.biostat.wisc.edu/~kbroman/presentations/ictr2014.pdf) (e.g., slide 22).

I usually pick colors using the crayons in the [Mac Color Picker](https://www.robinwood.com/Catalog/Technical/OtherTuts/MacColorPicker/MacColorPicker.html). But that has just 40 crayons, and I wanted more choices.

That led me to the [list of Crayola crayon colors on wikipedia](https://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors). I wrote a ruby script to grab the color names and codes and added them to my [R/broman](https://github.com/kbroman/broman) package.

Use `brocolors("crayons")` to get the list of colors. For example, to get "Tickle Me Pink," use

````
library(broman)
pink <- brocolors("crayons")["Tickle Me Pink"]
````

Use `plot_crayons()` to get the following summary plot of the colors:

![Crayon colors](https://kbroman.files.wordpress.com/2014/05/crayons.png)

You can install the R/broman package using `install_github` in devtools, (specifically, `install_github("kbroman/broman")`) or wait a day or two and the version with this code will be [on CRAN](https://cran.r-project.org/web/packages/broman/).

**Update**: See also [Two more points about crayon colors](https://kbroman.org/blog/2014/05/08/two-more-points-about-crayon-colors/).
