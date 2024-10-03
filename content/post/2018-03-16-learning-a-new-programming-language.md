---
title: "learning a new programming language"
author: Karl
date: "2018-03-16"
slug: learning-a-new-programming-language
categories: [programming]
tags: [programming]
---

I've long been an advocate for statisticians (and other data
scientists) to become proficient in multiple programming languages.
Fifteen years ago, I said, "Think CPR: C for speed, R for
interactive data analysis and graphics, and Perl for manipulating data
files." I'd now substitute C++ for C, and
[Python](https://www.python.org) or
[Ruby](https://www.ruby-lang.org/en) for Perl, but the general
sentiment stands: use the language that best fits the problem at hand.

## More blather about languages

Long ago, I wrote a [tutorial on
Perl](https://www.biostat.wisc.edu/~kbroman/perlintro/). I'd intended
to also write tutorials on C and R, but never got around to them and
just wrote resources pages (see [Intro to
C](https://www.biostat.wisc.edu/~kbroman/Cintro/) and [Intro to
R](https://www.biostat.wisc.edu/~kbroman/Rintro/)).

My Perl code was always terrible: "read-only", one-off scripts to
convert data files from one format to another. I much prefer Ruby, but my
Ruby coding involves a whole lot of googling. Python is more popular,
and so I'd recommend that to you. (But I really don't like the
handling of regular expression in Python, and that's like the main
thing I want from that sort of language, so I'm sticking with Ruby
for data file manipulation.) And these days, what with the whole
[tidyverse](https://www.tidyverse.org/) developments, you can probably
get by with R alone, for data file manipulation.

Still, sometimes a problem requires you to bring out the big guns. For
lots of problems, my most pristine R code won't be nearly as fast as
my sloppiest C or C++ code. So to be fully self-sufficient, I think you want
to be able to switch to a lower-level, super efficient (for
calculations, not for writing the code) language. Many would advocate
for [Julia](https://julialang.org) as a way to have one language that
is simultaneously easy, readable, and fast. But I still believe in
switching between languages (C++ for speed and R for interactive data
analysis and graphics, and maybe data file manipulation, though I
still prefer to switch again to Ruby).

[Pjotr Prins](http://thebird.nl/) had me writing [D](https://dlang.org/) for a while,
and he continues to advocate for it. And boy was I ever glad to switch
from C to C++ and from `.C()` to [Rcpp](http://www.rcpp.org/). html
and CSS go without saying. And we should probably add JavaScript, or
something that compiles to JavaScript. (I like
[CoffeeScript](http://coffeescript.org/); in fact, CoffeeScript is
probably my favorite language, presently.)

There was also SQL and MongoDB in there, for me. Data scientists need to be
comfortable with accessing formal databases.

I'm now trying to learn [PureScript](http://www.purescript.org/), but
I'm finding it heavy going and so am taking a detour into
[Haskell](https://www.haskell.org/) for a bit, to try to get the
basics of the "purely functional programming" business. But I intend to then
go back to PureScript.

## How to learn programming language

Anyway, that was a bit too much of a blathery introduction to say: I
think it's good to learn multiple programming languages, and in having
tried to do so myself, I've got some suggestions about how to go about
it (the learning), which might be useful.

- Set aside substantial and regular blocks of time.
- Buy a good book. Or buy all the books.
- Have a particular goal/application in mind.
- Develop a script, with notes, illustrating key language features
  you've learned.
- Force yourself to use your new skills.

## Set aside substantial and regular blocks of time.

Learning a new programming language takes time and regular practice.
And you really need blocks of 2-4 hours, because if you've not touched
the language in a week, it'll take you 30 minutes to get yourself back
into it. (What were you doing? What had you learned? What did you want
to look at next?) You need a chunk of a couple of hours so you can get
yourself back into it and then make a bit of progress.

## Buy a book.  Or buy all the books.

I recommend finding a good book and following along. Actually, I tend
to buy _all_ the books. But you want at least one, maybe two.
Which book is a matter of taste. I'm looking for something that
is aimed at someone who can already program in something. But whether
a book is the right one
for me depends mostly on the types of examples that are used. After
that is writing style
and quality of explanations.

For example, regarding Ruby, many people recommend [_Programming
Ruby_](https://www.amazon.com/gp/product/1937785491?ie=UTF8&tag=7210-20),
but personally I found the examples and the order of topics was just
not a good fit for me. I much preferred [_Eloquent
Ruby_](https://www.amazon.com/gp/product/0321584104?ie=UTF8&tag=7210-20)
and then [_The Well-Grounded
Rubyist_](https://www.amazon.com/gp/product/1617291692?ie=UTF8&tag=7210-20).

I'll usually start by looking for something published by
[O'Reilly](https://www.oreilly.com); they're uniformly good books. But
in reality my favorite books are published by others: The best book
(for _me_) on a given language is likely not from O'Reilly.

## Have a particular goal/application in mind.

If you really want to make progress in learning a programming
language, you need to move beyond the examples and exercises in a book
and start using the language creatively to solve your own
problems. Perhaps you have a particularly wonky data file that you
want to parse and reorganize. Or maybe you want to write a web app
that serves up local bus schedules. I like to switch back-and-forth
between slowly developing an understanding of the language and its
features, and then hacking away at something more substantial and _real_.

## Develop a script, with notes.

My key piece of advice: as you're learning, develop a bit of a script with
comments and other notes that illustrates the various language
features that you've learned.

First, you want to document the details of setting up the various
language tools (compiler/interpreter and libraries and such) and how
to keep them up-to-date. (This stuff is tedious, painful, and
critical. So once you've figured it out, you'll want a record of it so
you don't have to go through it again.)
You can find various of my notes on this stuff in my
[ProgrammingNotes
repository](https://github.com/kbroman/ProgrammingNotes) on GitHub.

But most importantly, you want an informal script that you can quickly skim
through or search, because you'll forget stuff:

- How do define a function in this language?
- What do I use to indicate comments?
- How do I concatenate two vectors?
- How do I search for an element in a vector?
- What was the syntax for list comprehensions again?

It's all in that book that you bought, but it's much easier to find
that one thing you're looking for in
the succinct set of notes that you wrote yourself. Here are some
examples of what I've done: for
[Python](https://github.com/kbroman/Pybroman),
[Ruby](https://github.com/kbroman/Rubybroman), and
[JavaScript/CoffeeScript](https://github.com/kbroman/JSbroman).

## Force yourself to use your new skills.

Finally, if you really want to adopt the new programming language as
part of your working toolkit, you'll need to force yourself to
actually use it in real life.

There'll come a time when you'll say, "I should do this in Ruby. Nah,
I could get it done in Perl in 15 minutes and it would take me two
hours to do this in Ruby." But you've got to force yourself to use the new
language. In the short term, it'll be easiest to switch back to the
language you're comfortable with, but if you want to make progress in
the new language, you've got to put it into regular practice, and that
won't be easy. But it'll get easier.

Ultimately, you'll have four or five languages floating around in
your head and you'll not remember how to define a function in any of
them. And then you'll be really cool.
