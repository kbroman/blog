---
title: 'omg, bookdown!'
author: Karl
date: '2017-05-31T23:16:00-05:00'
categories: [R]
tags: ["R", "publishing"]
---

So I heard [Yihui Xie](https://yihui.name) talk about
[bookdown](https://bookdown.org), and I read, with considerable
excitement, his [bookdown book](https://bookdown.org/yihui/bookdown/).
(There's a [blurb from me at
Amazon](https://www.amazon.com/gp/product/113870010X?ie=UTF8&tag=7210-20)
saying nice things about it, after all). But I must admit that I read
the book on my iPad, with my feet up. And so my understanding, while
reasonably complete, was somewhat theoretical.

I mean, from [my own book writing
experience](https://kbroman.org/blog/2014/08/12/if-i-could-do-it-over-again-id-self-publish/),
I felt like, "Hell if _I'm_ going to be writing another book." And
while I can see that it could be useful to reformat my [various
tutorials](https://kbroman.org/tutorials) as bookdown books, I
wasn't in a hurry to do that.

But the R/minecraft team from the [ROpenSci](https://ropensci.org)
[Unconference](https://unconf17.ropensci.org) had such a great time
last week, and we developed such cool stuff, that we thought it would
be good, in addition to polishing our
[miner](https://github.com/kbroman/miner) package, to compile our
varied set of vignettes into a bookdown book.

And so today I did. (You can see the working draft at
<https://kbroman.org/miner_book>.) And boy it was easy.

- Made a [github repository](https://github.com/kbroman/miner_book)
- Created a `index.Rmd` file and a `_bookdown.yml` file.
- Copied over all of our extra `.Rmd` files from `miner/extra_vignettes`
- Replaced the YAML in those `.Rmd` files with "`# [chapter title]`"
- Copied over our screen shots
- Added references in `book.bib` (and `packages.bib`)
- Screwed around making a cover

Oh, plus `README` and `LICENSE` files.

Okay, so I admit there was one glitch. I opened the thing in RStudio
and said

> "Now I just click the Build Book button. Wait, where is that? I just
  see the cutest-button-ever knit button. And clicking that doesn't
  work properly."

More time than I care to admit passes, with me doing all kinds of
crazy shit.

> "Oh, he said the Build Book button on the _Build_ tab. I see it now."

And done.

(Note that I also used his suggestion to have `output_dir: "docs"` and
then use GitHub Pages to host the book-in-progress, which was also
easy.)

_Update 2020-12-14_: the miner package and book have been moved from
[ROpenSciLabs](https://github.com/ropenscilabs) to [kbroman](https://github.com/kbroman).
