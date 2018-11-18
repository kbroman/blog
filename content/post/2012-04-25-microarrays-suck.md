---
title: Microarrays suck
author: Karl Broman
date: '2012-04-25'
categories:
  - Genetics
  - Statistics
tags:
  - diagnostics
  - exploratory data analysis
  - graphics
  - microarrays
  - stupid
slug: microarrays-suck
---

Maybe it's just that I'm stupid and haven't been paying proper attention to [Rafa's work](https://rafalab.github.io/) in the past decade, but microarray data have really been kicking my ass the last few weeks.  Here are a few of the lessons that I've re-learned.

### Lesson 1: What the hell is that?

Many (or all) of my interesting findings have been completely fortuitous results of exploring apparent artifacts in data ([autozygosity in the CEPH families](https://www.biostat.wisc.edu/~kbroman/publications/autozyg.pdf), [a large, common human inversion polymorphism](https://www.biostat.wisc.edu/~kbroman/publications/inversion.pdf), and most recently [sample mixups](https://www.biostat.wisc.edu/~kbroman/presentations/enar2012.pdf)).

A couple of weeks ago, I was working on writing up a paper, and saw an unusual plot, and thought, "Hmm, that's interesting," and so I made some more plots.  And then I saw this:

![](https://kbroman.files.wordpress.com/2012/04/weird_correlation_matrix1.png)

This is an image of the correlations between samples, across genes, for a study with 500 microarrays on each of 6 tissues.  The samples are sorted by sex (female on bottom left; male on top right) and then by ID.  I was initially puzzling over the sex difference in other tissues (same-sex pairs are positively correlated; opposite-sex pairs are negatively correlated), but when I saw this tissue, I was struck by the plaid pattern.

Following up on this, it seems that the plaid pattern is the result of a set of bad arrays that should have been but hadn't been detected before.

### Lesson 2: Look

Of course, I wouldn't have found this array problem if I hadn't looked.  And in my several years working on this project, I hadn't looked.

I was overwhelmed by the 500 microarrays × 6 tissues × 40,000 probes, and so didn't make the sorts of plots that I should have.

Plus, this is the first real microarray project I've been involved in, and I haven't known what to look for.  (I should have looked at images of correlation matrices with arrays sorted by similarity as determined from hierarchical clustering.)

You can't make 3000 choose 2 scatterplots, but you can look at summaries of the marginal distributions of the 3000 arrays.  I was thinking about how to depict 500 box plots, and came up with this:

![](https://kbroman.files.wordpress.com/2012/04/many_boxplots.png)

There are ~500 arrays here, with the lines indicating quantiles: 1, 5, 10, 25, 50, 75, 90, 95, 99%iles.  The first batch of arrays are the bad ones.  You can see that those have a shift upward in median but also a heavy lower tail.

I quite like the picture.

The code is available within my [R/broman](https://github.com/kbroman/broman) package on [github](https://github.com), though there's not much to it.

### Lesson 3: Don't trust anyone

Don't even trust yourself.

I relied on others to do the data cleaning.  I should have checked things more carefully.

I looked at the data quite closely a year or so ago and detected sample mix-ups.  In correcting those mistakes, I spent a lot of time looking at the array data and trying to identify bad arrays.  Clearly I didn't look closely enough, or I just looked at the wrong things.

### Lesson 4: Take your time

Scientists are under a lot of pressure to produce and often are not exploring data as thoroughly as the data deserve.

But if you rush through data diagnostics, you could embarrass yourself later.

More importantly, take the time to follow up on apparent artifacts.  For me, the unintended analyses are more interesting than the planned ones.

### My basic strategy for data diagnostics

  * Expect errors

  * Think about what might have gone wrong and how such problems might be revealed

  * Make lots of specially-tailored plots

  * Create a (potentially informal) pipeline of all of the useful diagnostics you've used in the past

  * Make more plots just because you think they might interesting

  * If something looks odd, figure out why
