---
title: 'ROpenSci Unconf 2017'
author: Karl
date: '2017-05-27T12:30:00-05:00'
categories: [R, news]
tags: ["R", "conference", "Minecraft"]
---

I'm back from the [ROpenSci](https://ropensci.org)
[Unconference](http://unconf17.ropensci.org) in LA. A fabulous two
days of R programming and, ur, playing
[Minecraft](https://minecraft.net). As one does.

This was ROpenSci's 4th unconference; the first I could attend. There
were like 70 participants, nearly double what they had last year. The
scheme is that people break up into groups and work on different
projects that might be useful to the ROpenSci community. There was
discussion about potential projects [in advance on
GitHub](https://github.com/ropensci/unconf17/issues), and then the
first morning we voted on what we were interested in doing via
stickers:

{{< tweet 867793745986469889 >}}

I found the list of topics a bit forbidding. Important stuff, but a
lot of them seemed technically difficult, and I didn't really see how
I could best contribute. And, jumping to the punch line, the [outcomes
of the 2 days' work](https://ropenscilabs.github.io/runconf17-projects/) are pretty awesome, for example:

- A R package, [available](https://github.com/ropenscilabs/available),
  to help name R packages. (Have others used it? Can it be viewed as
  offensive?)

- A book on [best security practices for R package
  developers](https://github.com/ropenscilabs/r-security-practices)

- A [grammar checker](https://github.com/ropenscilabs/gramr) for R
  Markdown documents, "Write good and do good stuff."

- [testrmd](https://github.com/ropenscilabs/testrmd), a package for
  including tests in R Markdown documents.

Awesome stuff, and that's [4 of
20](https://ropenscilabs.github.io/runconf17-projects/). But you know,
I don't think I'm particularly good at any of those things. And for
that reason, I was super excited when [Gergely
Daróczi](https://github.com/daroczig) posted the idea that we make an
R package through which we can interact with the game Minecraft.

I've played a lot of Minecraft with my kids. And there's a big
community of folks writing "mods" for the game, but to do that, you
need to write Java. And, well, I really don't like Java. So I was
excited, a few years ago, to see the book [Learning to program with
Minecraft](https://www.amazon.com/gp/product/1593276702?ie=UTF8&tag=7210-20),
which uses a [python module](https://github.com/py3minepi/py3minepi)
that allows you to interact with the game.

The book is a very nice and thorough introduction to
programming, using Minecraft as all of the examples and exercises.
Really, it's the best book on programming for kids that I've seen,
_because_ it is so full of challenging but do-able and above all
_interesting_ exercises. Good exercises are really the key to learning
programming, and Minecraft provides a lot of really great
and varied challenges.

Our team of six (me, [Gergely Daróczi](https://github.com/daroczig),
[Brooke Anderson](https://github.com/geanders), [David
Smith](https://github.com/revodavid), [Mario
Inchiosa](https://github.com/inchiosa), and [Adi
Zaidi](https://github.com/akzaidi)) set out to replicate the features
of the python module as an R package. There are basically just eight
functions:

- set a particular type of block somewhere
- figure out what type of block is at some spot
- figure out where a player is
- move a player somewhere
- figure out where a player is pointing
- check whether anyone has hit something with a sword
- post a message to chat
- read the chat messages

We had our basic working package,
[miner](https://github.com/kbroman/miner), by lunchtime on the
first day and spent the next day and a half playing with it and
Minecraft.

Just eight basic functions, but we did a ton of awesome things:

- A robot number-guessing game
- Automatic creation of mazes that players can walk through (or be moved
  through automatically)
- Replicate a photograph, or the R logo, within Minecraft using
  different types of blocks
- Give a player Elsa (from the movie Frozen) powers, like walking on
  water and having it turn to ice, or creating random-sized columns of
  ice by hitting things
- Write letters on the side of a mountain
- Draw a full ggplot2-like scatterplot in the sky

Check out [the ReadMe file for our
package](https://github.com/kbroman/miner/blob/master/README.md)
to see a bunch of pictures and gifs.

I'll write about some of these things in the (hopefully near) future,
because I learned some cool stuff, and it was was really fun.

Just after lunch on day 2, I realized that we could use the chat
feature in Minecraft to _execute R code from within Minecraft_, using
`parse` and `eval`. And it totally worked. So I could generate my
ggplot2-style scatterplot entirely within Minecraft. (The key
advantage of this, other than just being cool, is not having to keep
switching back and forth between R and Minecraft.)

Watch me type a bit of R and get my scatterplot going:

<iframe width="560" height="315" src="https://www.youtube.com/embed/zggCAYAfjXE" frameborder="0" allowfullscreen></iframe>

What next? We're thinking we'll compile the many vignettes we
developed into a [bookdown
book](https://bookdown.org/yihui/bookdown/). Stay tuned.
