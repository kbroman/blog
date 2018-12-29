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

[Matt Maenner asked](https://twitter.com/mmaenner/status/335478612084006912) about the sawtooth pattern in the [figure](https://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_spins1.png) in [my last post on Chutes & Ladders](https://kbroman.org/blog/2013/05/17/chutes-ladders-how-long-is-this-going-to-take/).

Damn you, Matt!  I thought I was done with this.  Don't feed my obsession.

[My response](https://twitter.com/kwbroman/status/335499296193536000) was that if the game ends early, it's even more likely that it'll be the kid who went first who won.  _But_, my intuition was wrong: exactly the opposite is true. _It is_ the advantage to the first player that causes the sawtooth pattern, but that advantage _increases_ with the number of rounds rather than decreases.

### Numerical results

While it's fast and easy to study the Chutes & Ladders game by simulation, if you want to answer questions more precisely, it's best to switch to more exact results.

Consider a single individual playing the game, and let _X<sub>n</sub>_ be
his/her location at round _n_. The _X<sub>n</sub>_
form a [_Markov chain_](https://en.wikipedia.org/wiki/Markov_chain),
in that the future (_X<sub>n+1</sub>_), given the present ($X_n$),
is conditionally independent of the history (_X<sub>1</sub>_, ..., _X<sub>n-1</sub>_).

It's relatively easy to construct the transition matrix of the chain.  (See my [R code](https://gist.github.com/kbroman/5600209/#file-chutes_and_ladders_numerical-r).)  This is a matrix _P_, with _P<sub>ij</sub>_ = Pr(_X<sub>n+1</sub>_ = _j_ | _X<sub>n</sub>_ = _i_).

Then the probability that a player has reached state 100 by round $n$ is
(1, 0, ..., 0) _P<sup>n</sup>_ (0, ..., 0, 1)&rsquo;.  That's the cumulative distribution function (cdf) of the number of rounds for a single player to finish the game.  Call this $q_n$.  You can get the probability distribution by differences, say _p<sub>n</sub>_ = _q<sub>n</sub>_ - _q<sub>n-1</sub>_.

To calculate the number of rounds to complete a game with _k_ players, you want the minimum of _k_ independent draws from this distribution.  The probability that a game with $k$ players is complete by round n is 1 - (1-_q<sub>n</sub>_)_<sup>k</sup>_.  And again you can get the probability distributions by differences.  Here's a picture.

![No. rounds to complete Chutes & Ladders](https://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_rounds.png)

### Advantage to the first player

Now, regarding the advantage to the first player: note that the first
player wins in exactly _n_ steps if he gets to the finish at n steps
and none of the other players are done by _n-1_ steps.  So, with _k_
players, the probability that the first player wins in exactly _n_ steps is _p<sub>n</sub>_ (1-_q<sub>n-1</sub>_)_<sup>k-1</sup>_.

The chance that the second player wins in exactly n steps is
(1-_q<sub>n</sub>_) _p<sub>n</sub>_
(1-_q<sub>n-1</sub>_)_<sup>k-2</sup>_, with the last term included only
if there are _k_ > 2 players.

From this idea, it's straightforward to calculate the probability that
the first player wins given that the game is complete at round _n_.
Here's a plot of that probability as a function of the number of
players, relative to the nominal probability (1/2, 1/3, 1/4).

![Advantage to the first player in Chutes & Ladders](https://kbroman.files.wordpress.com/2013/05/advantage_to_first_player1.png)

Note that _n_=7 is the minimum number of rounds to complete the game.
I'd thought that the first player's advantage went down over time, but
the opposite is true.

### No. spins to end the game

Combining these two results (on the number of rounds to complete the game and the probability that player i will win in n rounds), we can get a more precise version of [the simulation-based figure in my last post](https://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_spins1.png):

![No. spins to complete Chutes & Ladders, numerical results](https://kbroman.files.wordpress.com/2013/05/chutes_and_ladders_spins_exact.png)

As you can see, the sawtooth pattern becomes more pronounced with the number of rounds, but then it gets lost in the downward slope of the distribution on the right side.  (Again, see my [R code](https://gist.github.com/kbroman/5600209/#file-chutes_and_ladders_numerical-r).)
