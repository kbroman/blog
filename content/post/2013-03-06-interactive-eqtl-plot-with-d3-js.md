---
title: Interactive eQTL plot with d3.js
author: Karl Broman
date: '2013-03-06'
categories:
  - Genetics
  - Programming
  - Statistics
tags:
  - D3
  - graphics
slug: interactive-eqtl-plot-with-d3-js
---

I just finished an [interactive eQTL plot](https://www.biostat.wisc.edu/~kbroman/D3/cistrans) using [D3](https://d3js.org), in preparation for my [talk on interactive graphics](https://www.biostat.wisc.edu/~kbroman/talks/InteractiveGraphs2) at the [ENAR meeting](https://www.enar.org/meetings/index.cfm) next week.

[![Static view of interactive eQTL plot](https://kbroman.files.wordpress.com/2013/03/interactive_eqtl_plot.png)](https://www.biostat.wisc.edu/~kbroman/D3/cistrans)

The code (in [CoffeeScript](https://coffeescript.org)) is available at [github](https://github.com/kbroman/JSbroman/tree/master/cistrans).  But beware: it's pretty awful.

The hardest part was setting up the data files.  Well, that plus the fact that I just barely know what I'm doing in D3.
