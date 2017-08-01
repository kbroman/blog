---
title: 'Chutes & ladders: How long is this going to take?'
author: Karl Broman
date: '2013-05-17'
categories:
  - R
  - Statistics
tags:
  - kids
  - Markov chains
  - simulation
slug: chutes-ladders-how-long-is-this-going-to-take
---

I was playing Chutes & Ladders with my four-year-old daughter yesterday, and I thought, "How long is this going to take?"

I saw an [interesting mathematical analysis of the game](http://datagenetics.com/blog/november12011/) a few years ago, but it seems to be offline, though [you can read it](http://web.archive.org/web/20120819014527/http://www.datagenetics.com/blog/november12011/) via the [wayback machine](http://web.archive.org/).

But that didn't answer my specific question, namely, "How long is this going to take?"

So I wrote a bit of [R code to simulate the game](https://gist.github.com/kbroman/5600209).

Here's the distribution of the number of spins to complete the game, by number of players:

![No. spins in chutes & ladders](http://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_spins1.png)

With two players, the average number of spins is 52, with a 90th percentile of 88.

If you add a third player, the average increases to 65, and the 90th percentile increases to 103.  You're playing fewer rounds, but each round is three times as long. If you add a fourth player, the average is 76 and the 90th percentile is 117.

So, in trying to minimize the agony, it seems best to not encourage my eight-year-old son to join us in the game.  If he plays with us, there's a 63% chance that it will take longer.

And that's particularly true because then the chance of my daughter winning drops from about 1/2 to about 1/3.

That raises another question: if I let her go first, what advantage does that give her?  Not much.  The chance that the person who goes first will win is 50.9%, 34.4%, and 25.9%, respectively, when there are 2, 3, and 4 players.  So not a noticeable amount.  Thus I cheat (on her behalf). Really, though, I'm cheating in order to shorten the game as much as to ensure that she wins.

_Note_: There's a close connection between this problem and my work on the multiple-strain recombinant inbred lines. (See [this](http://www.ncbi.nlm.nih.gov/pubmed/15545647) and [that](http://www.ncbi.nlm.nih.gov/pubmed/22345609).)  I'm tempted to play around with it some more.

[Additional numerical results here.](http://kbroman.org/blog/2013/05/20/more-on-chutes-ladders/)
