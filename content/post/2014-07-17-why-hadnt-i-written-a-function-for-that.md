---
title: Why hadn't I written a function for that?
author: Karl Broman
date: '2014-07-16'
categories:
  - Programming
  - R
tags:
  - code
  - programming
slug: why-hadnt-i-written-a-function-for-that
---

I'm often typing the same bits of code over and over. Those bits of code really should be made into functions.

For example, I'm still using base graphics. ([ggplot2](http://ggplot2.org) is on my "to do" list, really!) Often some things will be drawn with a slight overlap of the border of the plotting region. And in heatmaps with `image`, the border is often obscured. I want a nice black rectangle around the outside.

So I'll write the following:

````
u <- par("usr")
rect(u[1], u[3], u[2], u[4])
````

I don't know _how_ many times I've typed that! Today I realized that I should put those two lines in a function `add_border()`. And then I added `add_border()` to my [R/broman package](http://github.com/kbroman/broman).

It was a bit more work adding the [Roxygen2](https://github.com/klutometis/roxygen) comments for the documentation, but now I've got a proper function that is easier to use and much more clear.

**Update**: [@tpoi](https://twitter.com/tpoi) [pointed out](https://twitter.com/tpoi/status/489622770398289920) that `box()` does the same thing as my `add_border()`. My general point still stands, and this raises the additional point: twitter + blog -> education.

I want to add, "I'm an idiot" but I think I'll just say that there's always more that I can learn about R. And I'll remove `add_border` from R/broman and just use `box()`.
