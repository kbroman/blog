---
title: "Writing text in Minecraft with R"
author: Karl Broman
date: "2019-02-11"
categories:
  - programming
  - R
tags:
  - r
  - minecraft
  - conference
slug: writing_text_in_minecraft_with_r
---

It's been nearly two years since I attended the [RopenSci UnConf
2017](https://kbroman.org/blog/2017/05/27/ropensci-unconf-2017/) in LA
and worked with [Gergely Daróczi](https://github.com/daroczig),
[Brooke Anderson](https://github.com/geanders), [David
Smith](https://github.com/revodavid), [Mario
Inchiosa](https://github.com/inchiosa), and [Adi
Zaidi](https://github.com/akzaidi) to create the
[miner](https://github.com/ropenscilabs/miner) package for interacting
with [Minecraft](https://minecraft.net) from
[R](https://r-project.org). We spent a half-day writing the package
and then a day and a half playing, with a bunch of our ideas
implemented in the [craft](https://github.com/ropenscilabs/craft)
package and illustrated in the [bookdown](https://bookdown.org) book,
[R programming with
Minecraft](https://ropenscilabs.github.io/miner_book).

I'd meant to follow up with a bunch more on the stuff we'd done, and
to really finish up and polish the book. But, well, I didn't. But I'm
going to try to do so now.

Here I'll explain how I was able to write text in Minecraft, like
this:

![rOpenSci on a hill in Minecraft](/images/rOpenSci_sign.png)

## My goal was to make a ggplot scatterplot

Once we had [miner](https://github.com/ropenscilabs/miner) up and
running, the first thing I wanted to do was [render a picture out of
blocks](https://ropenscilabs.github.io/miner_book/rendering-an-image-in-minecraft.html).
Specifically, I wanted to create a picture of [Karthik](http://inundata.org). And so I
did:

![Karthik in Minecraft](/images/karthik_minecraft.png)

My next goal was to make a `ggplot2::theme_gray()`-styled scatterplot
within Minecraft. If I can create an image in Minecraft, than of
course I can create a scatterplot. The only tricky part would be
the axis labels: being able to write text in Minecraft.

## Pixel-based fonts

## Back to PNG

## Rotating the text
