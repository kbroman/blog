---
title: Why aren't all of our graphs interactive?
author: Karl Broman
date: '2013-03-16'
categories:
  - Programming
  - Statistics
tags:
  - D3
  - graphics
slug: why-arent-all-of-our-graphs-interactive
---

I've come to believe that, for high-dimensional data, visualizations (aka graphs), and particularly interactive graphs, can be more important than precise statistical inference.

We first need to be able to view and explore the data, and when it is unusually abundant, that is especially hard.  This was a primary contributor to [my recent embarrassments](https://kbroman.org/blog/2012/04/25/microarrays-suck/), in which clear problems in the data were not discovered when they should have been.

I gave [a talk on interactive graphs (with the title above)](https://www.biostat.wisc.edu/~kbroman/presentations/InteractiveGraphs) at Johns Hopkins last fall, and then [a related talk](https://www.biostat.wisc.edu/~kbroman/presentations/InteractiveGraphs2) at ENAR earlier this week, and I have a few thoughts to add here.

### A brief digression

I'm giving a talk at a plant breeding symposium at Kansas State in a couple of weeks, and I've been pondering what to talk about.  A principal problem is that I don't really work on plant breeding.  My most relevant talks are a bit too technical, and my more interesting talks are not relevant.

Then I had the idea to talk about some of my recent work with my graduate student, Il-youp Kwak, on the genetic analysis of phenotypes measured over time.

I realized that I could incorporate some interactive graphs into the talk.  Initially I was just thinking that the interactive graphs would make the talk more interesting and would allow me to talk about things that weren't necessarily relevant but were interesting to me.

But then I realized that this work really cries out for interactive graphs.  And as I begin to construct one of them, I thought of a whole bunch more I might create.  More importantly, I realized that these interactive graphs are extremely useful teaching tools.

### More [D3](https://d3js.org) examples

Here's an image of first graph I created for the talk; click on it to jump to the [interactive version](https://www.biostat.wisc.edu/~kbroman/D3/manycurves).

Statisticians are often confronted with a large set of curves.  We'd like to show the individual curves, but there are too many.  The resulting [spaghetti plot](https://stats.idre.ucla.edu/stata/faq/how-can-i-make-spaghetti-plots-in-stata/) is a total mess.  An image plot (like the [lasagna plot](https://journals.lww.com/epidem/Fulltext/2010/09000/Lasagna_Plots__A_Saucy_Alternative_to_Spaghetti.15.aspx)) allows us to see all of the curves, but it can be hard to get a sense of what the actual curves look like.  The interactive version solves the problem.

[![Many curves](https://kbroman.files.wordpress.com/2013/03/manycurves2.png)](https://www.biostat.wisc.edu/~kbroman/D3/manycurves)

Here's a second example; again click on the image to jump to the [interactive version](https://www.biostat.wisc.edu/~kbroman/D3/lod_and_effect). (I've shown this before, but I want to use it to make another point.)

Typically, in a lecture on complex trait analysis, I'd show one LOD curve (like the top panel in the image below) and a few different plots of phenotype vs genotype (the lower-right panel in the image).  I think the exploratory tool will be much more effective, in a lecture, for explaining what it all means.

[![LOD and QTL effects](https://kbroman.files.wordpress.com/2013/03/lod_and_effect.png)](http://www.biostat.wisc.edu/~kbroman/D3/lod_and_effect)

### Statisticians need to be doing this routinely

In constructing a graph, one must make some difficult choices.  For high-dimensional data, one must greatly compress the available information.  The resulting summaries, while potentially informative, take one far away from the original data.

Interactive graphs provide a means through which one may view the overall summary but have immediate access to the underlying details.
