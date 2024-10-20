---
title: 'miner and craft'
author: Karl
date: '2017-05-31T23:48:00-05:00'
categories: [R]
tags: ["R", "minecraft", "programming"]
---

In addition to our [miner](https://github.com/kbroman/miner)
package and our [in-development bookdown
book](https://kbroman.org/miner_book), the R/minecraft team from the
[ROpenSci](https://ropensci.org)
[Unconference](https://unconf17.ropensci.org) had
created a
bunch of other useful code for interacting with
[Minecraft](https://minecraft.net) from
[R](https://www.r-project.org), which we're putting into a [second
package](https://github.com/kbroman/craft).

I initially called this extra package "miner.extra". (And I learned
some new things about the rules for what characters can be used in R
package names.) But then this evening I realized, "Hey, we could call
it [craft](https://github.com/kbroman/craft)."

And I used the [available](https://github.com/ROpenSciLabs/available)
package, also developed at last week's unconference, and verified that
indeed _craft_ is available. A bit of indecision about taking such a
great name for this secondary package, but after checking with
[Gergely](https://twitter.com/daroczig) and
[Brooke](https://twitter.com/gbwanderson), went ahead with it.

So I'm pleased to announce the
[miner](https://github.com/kbroman/miner) and
[craft](https://github.com/kbroman/craft) packages for playing
with R and Minecraft.

(I was of course tempted towards mineR and cRaft, but I didn't want to
[disappoint Hadley](https://twitter.com/hadleywickham/status/859469052154138625).)

([craft](https://github.com/kbroman/craft) currently just
contains code that I wrote, 'cause I was the only one who left dangling
scripts that weren't incorporated into a proper vignette.
Functions from the others will follow.)

_Update 2020-12-14_: the miner and craft packages have been moved from
[ROpenSciLabs](https://github.com/ropenscilabs) to [kbroman](https://github.com/kbroman).
