---
title: More on Chutes & Ladders
author: Karl Broman
date: '2013-05-20'
categories:
  - R
  - Statistics
tags:
  - kids
  - Markov chains
slug: more-on-chutes-ladders
---

[Matt Maenner asked](https://twitter.com/mmaenner/status/335478612084006912) about the sawtooth pattern in the [figure](http://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_spins1.png) in [my last post on Chutes & Ladders](http://kbroman.org/blog/2013/05/17/chutes-ladders-how-long-is-this-going-to-take/).

Damn you, Matt!  I thought I was done with this.  Don't feed my obsession.

[My response](https://twitter.com/kwbroman/status/335499296193536000) was that if the game ends early, it's even more likely that it'll be the kid who went first who won.  _But_, my intuition was wrong: exactly the opposite is true. _It is_ the advantage to the first player that causes the sawtooth pattern, but that advantage _increases_ with the number of rounds rather than decreases.

### Numerical results

While it's fast and easy to study the Chutes & Ladders game by simulation, if you want to answer questions more precisely, it's best to switch to more exact results.

Consider a single individual playing the game, and let Xn be his/her location at round n.  The Xn form a _[Markov chain](http://en.wikipedia.org/wiki/Markov_chain)_, in that the future (Xn+1), given the present (Xn), is conditionally independent of the history (X1, ..., Xn-1).

It's relatively easy to construct the transition matrix of the chain.  (See my [R code](https://gist.github.com/kbroman/5600209/#file-chutes_and_ladders_numerical-r).)  This is a matrix P, with Pij = Pr(Xn+1 = j | Xn = i).

Then the probability that a player has reached state 100 by round n is
(1, 0, ..., 0) Pn (0, ..., 0, 1)'.  That's the cumulative distribution function (cdf) of the number of rounds for a single player to finish the game.  Call this qn.  You can get the probability distribution by differences, say pn = qn - qn-1.

To calculate the number of rounds to complete a game with k players, you want the minimum of k independent draws from this distribution.  The probability that a game with k players is complete by round n is 1 - (1-qn)k.  And again you can get the probability distributions by differences.  Here's a picture.

![No. rounds to complete Chutes & Ladders](http://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_rounds.png)

### Advantage to the first player

Now, regarding the advantage to the first player: note that the first player wins in exactly n steps if he gets to the finish at n steps and none of the other players are done by n-1 steps.  So, with k players, the probability that the first player wins in exactly n steps is pn (1-qn-1)k-1.

The chance that the second player wins in exactly n steps is (1-qn) pn (1-qn-1))k-2, with the last term included only if there are k > 2 players.

From this idea, it's straightforward to calculate the probability that the first player wins given that the game is complete at round n.  Here's a plot of that probability as a function of the number of players, relative to the nominal probability (1/2, 1/3, 1/4).

![Advantage to the first player in Chutes & Ladders](http://kbroman.files.wordpress.com/2013/05/advantage_to_first_player1.png)

Note that n=7 is the minimum number of rounds to complete the game.  I'd thought that the first player's advantage went down over time, but the opposite is true.

### No. spins to end the game

Combining these two results (on the number of rounds to complete the game and the probability that player i will win in n rounds), we can get a more precise version of [the simulation-based figure in my last post](http://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_spins1.png):

![No. spins to complete Chutes & Ladders, numerical results](http://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_spins_exact.png)

As you can see, the sawtooth pattern becomes more pronounced with the number of rounds, but then it gets lost in the downward slope of the distribution on the right side.  (Again, see my [R code](https://gist.github.com/kbroman/5600209/#file-chutes_and_ladders_numerical-r).)
