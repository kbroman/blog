---
title: 2014 UseR conference, days 1-2
author: Karl Broman
date: '2014-07-02'
categories:
  - R
  - Statistics
tags:
  - conference
  - graphics
slug: 2014-user-conference-days-1-2
---

I'm at UCLA for the [UseR Conference](https://user2014.r-project.org). I attended [once before](https://kbroman.org/blog/2011/08/20/user-conference-2011-highlights/), and I really enjoyed it. And I'm really enjoying this one. I'm learning a ton, and I find the talks very inspiring.

In my comments below, I give short shrift to some speakers (largely by not having attended their talks), and I'm critical in some places about the conference organization. Having [co-organized a small conference last year](http://www.rqtl.org/ctc2013/), I appreciate the difficulties. I think the organizers of this meeting have done a great job, but there are some ways it which it might have been better (e.g., no tiny rooms, a better time slot for the posters, and more space for the posters).

<!-- more -->

### Day 1: Tutorials

The first day was devoted to [tutorials](https://user2014.r-project.org/#tutorials). I arrived later than intended and missed the morning tutorials and was just in time for the afternoon ones. But the tutorial I wanted to attend, [Ramnath Vaidyanathan's tutorial on interactive documents]() was in a tiny room that was already filled beyond capacity. And by the time I tried to switch, the others were well underway, and I'd lost my momentum. Plus I was distracted by ice cream. And seeing [Yihui](https://yihui.name/en/), [Karthik](http://inundata.org/), [Hilary](http://hilaryparker.com/), and [Sandy](http://www.sandradgriffith.com/).

Materials for many of the tutorials are [online](https://user2014.r-project.org/#tutorials); grab them while you can.

The evening reception was interesting. I listened in to [Joe Chang](https://github.com/jcheng5) talking to [Tal Galili](http://www.talgalili.com/) about the value of [dplyr](https://github.com/hadley/dplyr) and [magrittr](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html)'s pipe operator (`%>%`) for data manipulation in R. Joe was quite persuasive: replace a nested series of function calls, to be read from the inside out, with a stream of pipes.

I was excited to meet [Scott Chamberlain](https://scottchamberlain.info/) and to see [Jenny Bryan](https://www.stat.ubc.ca/~jenny/) and [Vince Vu](http://www.vince.vu/), and of course [Hadley](http://had.co.nz/).

### Day 2

#### John Chambers

The opening talk was by [John Chambers](https://en.wikipedia.org/wiki/John_Chambers_(statistician)). I'd not heard him speak before. (Back in 2005, I think, at JSM in Minneapolis, I tried to attend a session with John Chambers, Robert Gentleman, and [Duncan Temple Lang](http://www.stat.ucdavis.edu/~duncan/), on the future of statistical computing, but it was assigned a room for 30 people, and by the time I got there there was a mass of more than 30 people _outside_ the room.)

John talked about the origin of S, including a [handwritten "viewgraph"](https://twitter.com/kwbroman/status/484005898965090305) from the first discussion of the idea in 1976. His basic point was that R was conceived not as a language but as an interface to algorithms: to make it easier to use Fortran-based routines for things like linear regression. And R continues to have much value in that regard:  user-friendly interfaces for statistical calculations.

He gave a shout out to [Rcpp](http://www.rcpp.org/), [Rllvm](http://www.omegahat.org/Rllvm/), and [h2o](http://0xdata.com/)

#### Interactive graphics

The first contributed session was on interactive graphics from R.

[Winston Chang](https://github.com/wch) introduced [ggvis](https://ggvis.rstudio.com/), which is an exciting effort at [RStudio](https://www.rstudio.com) to make interactive graphics readily accessible from R.  It uses a ggplot2-style syntax, but with the [magrittr](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html) pipe operator, and using [Vega](https://github.com/trifacta/vega/) as the underlying engine.

[Ramnath Vaidyanathan](https://github.com/ramnathv) spoke about rCharts, which makes a huge list of javascript-based visualization libraries accessible from R using a lattice-style syntax. He went through a ton of great examples, pointed to a gallery of others, and briefly describing the underlying strategy.

There were additional talks about [plotly](https://plot.ly/) and [iwPlot](https://user2014.r-project.org/abstracts/talks/216_Subramaniam.pdf).

plotly is an effort to make [D3](https://d3js.org)-based graphs accessible from R (and python and matlab), as well as editable and collaborative. But I don't like plotly's [Terms of service](https://plot.ly/tou), nor that it's closed source. And the presentation was all demonstration with little exposition and so a bit hard to follow.

iwPlot is an effort to reimplement [iPlot eXtreme](https://rforge.net/Acinonyx/) with web-based graphics, for interactive graphics with massive datasets, with everything "in the cloud" rather than on a desktop. I was surprised that they're writing everything from scratch rather than make use of other javascript-based libraries. And the examples weren't very compelling. I was excited about iplot eXtreme back in 2011, but it doesn't seem to have progressed much since. Its [web site](https://rforge.net/Acinonyx/) says "An official release on CRAN is expected in Sept 2011," but that doesn't seem to have happened.

#### Web/integration

I skipped a couple of important talks in here: on [RCloud](https://rcloud.persistent.com/rCloud) and [OpenCPU](https://www.opencpu.org/). I needed a walk and an espresso.

I was back for [Joe Cheng](https://github.com/jcheng5)'s talk about [Shiny](https://shiny.rstudio.com/), for making interactive web applications with R, with no requirement of knowledge of html, css, or javascript. It was really well presented; especially cool is the ability to include shiny apps within R Markdown documents, which is apparently even easier than creating stand-alone shiny apps.

And then [Karthik Ram](http://inundata.org/) gave a great talk about [rOpenSci](https://ropensci.org/), to foster open science: a large set of packages providing access to a variety of data sources.

#### Martin Machler

Martin Machler gave a superb talk on "Good practices for R programming," including seven principles:

  1. Work with source files (rather than just typing in the console)

  2. Keep R source readable and maintainable

  3. Read the documentation

  4. Learn from the masters (read others' code)

  5. Do not copy and paste (write functions)

  6. Strive for clarity and simplicity

  7. Test your code

He made a number of further points:

  * Leave optimization to later, clear code is more important than optimized code, and if you _do_ optimize, measure rather than guess about speed.

  * Write packages

  * Use version control

  * `R CMD BATCH` should work on your R script.

  * Never use `.RData`; your code should do all of the work. But use `save` for big computations and then `attach`. (Later he clarified, don't use `attach` with data frames, but do use it with `RData` files.)

  * Make use of the `log` argument to density functions, to avoid underflow, and use functions like `log1p`, for accuracy.

  * Use `drop=FALSE` when subsetting a matrix, so that the outcome remains a matrix.

  * Use `is.na(x)` not `x == NA`.

  * Don't use `1:n` when `n` is not a positive integer.

#### Data manipulation

[Hadley Wickham](http://had.co.nz/) gave a persuasive and instructive talk on [dplyr](https://github.com/hadley/dplyr) and [magrittr](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html)'s pipe operator, for data manipulation tasks in R. [Joe Cheng](https://github.com/jcheng5) had largely convinced me the night before, but now I'm thoroughly convinced of the value of these tools. The bottlenecks in analysis tasks are thinking, coding, and doing. For data manipulation, dplyr helps with the _thinking_ part, by having you focus on a set of basic operations: filter, select, arrange, mutate, summarize, and "group by," and then also the left join, right join, semi-join, and anti-join. Magrittr's pipe operator (%>%) helps with the _coding_: you create a stream of pipes rather than a nasty mess of nested function calls that need to be read from the inside out. And [Rcpp](https://www.rcpp.org/) helps with the _doing_: dplyr is super-fast (though not quite as fast as [data.table](http://datatable.r-forge.r-project.org/)). Further, dplyr takes advantage of R's "non-standard evaluation" in a way that makes it easy to connect to external data sources, like databases, as if they were regular objects.

I skipped the rest of the session, though I should have at least stayed for the Matt Dowle's presentation on [data.table](http://datatable.r-forge.r-project.org/). (I understand that [he could have an alternate career as a leader of group meditations](https://twitter.com/_inundata/status/484120526021881858).) I've just found that I have to limit myself. But [a tweet](https://twitter.com/timtriche/status/484120355254980608) by [Tim Triche](https://twitter.com/timtriche) had a photo of a slide that showed the speed of data.table's `fread` function over R's `read.csv`. I need to adopt `fread`!

#### Posters

The poster sessions were a tragedy. Seriously.

First, it was immediately after a long session (well, for those who stuck it through), and at the slot [where one would want to eat dinner](https://twitter.com/kwbroman/status/484131994708627456). (Martin's talk was 3-4, the 3rd contributed session was 4-5:30, the posters were 5:30-7, and two panel sessions/mixers were 6:30-9.)

Second, the posters were arranged along a narrow hallway, and not on the walls but on stands which stuck out into the hallway. There really was no room for people to view the things.

It was too frustrating. I left to eat dinner.

#### heR panel

It was great that the meeting included a well-attended [panel discussion and mixer](https://github.com/skoval/her2014) to discuss how to encourage more women R users. But I was a bit disappointed with the event.

We can all agree that women are underrepresented as contributors of packages to [CRAN](https://cran.r-project.org) and as participants in R conferences. But why? And how to change this? I didn't gain much insight.

I think I just don't like panel discussion. The five women on the panel, and the moderator, are admirable and their views interesting. But they don't have a unique understanding of the problem or solutions. I think I would have preferred a more open discussion, to hear much more from all of the other women in the room.

I felt the same way about the panel discussion at [the meeting I co-organized in 2013](http://www.rqtl.org/ctc2013): I would have preferred to have heard much more from the general audience and less from the panel.

The most shocking revelation concerned the unnecessarily extensive effort that [Amelia McNamara](http://www.stat.ucla.edu/~amelia.mcnamara/) had to expend in order to include a _harrassment policy_ on the [meeting web site](https://user2014.r-project.org/). The value of such a policy should be obvious from the [history of bad behavior](https://geekfeminism.wikia.com/wiki/Timeline_of_incidents) at scientific and technical conferences.

I would have been happier had the discussion continued for another hour. The audience was just getting going when the event ended.

My personal opinion is that there are a lot more women R users out there, but they aren't contributing R packages because it has long been a very cumbersome process. (But see [Hilary Parker's tutorial](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/).) And they don't necessarily identify as "R users" but rather as more general applied statisticians. And they've not yet learned of the great value in attending UseR conferences, for learning and networking.

#### Conclusions

  * UseR conferences are fabulous: for inspiration, learning, and networking. They're not for gurus, but for normal people who want to share ideas and learn about new and exciting developments. (The next [UseR meeting](https://user2015.math.aau.dk/) will be June 30-July 3, 2015, in Aalborg, Denmark.)

  * The smallest meeting room shouldn't be very small.

  * Poster sessions need a proper time slot, and they need a lot of space.

  * I don't much like panel discussions but rather prefer more open discussions.

  * I need to adopt [dplyr](https://github.com/hadley/dplyr) and [magrittr](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html) immediately. Also [data.table](http://datatable.r-forge.r-project.org/)'s `fread`.

  * I need to learn [shiny](https://shiny.rstudio.com), [ggvis](https://ggvis.rstudio.com), rCharts, and some of the [rOpenSci](https://ropensci.org) packages (and [ggplot2](https://ggplot2.tidyverse.org/)
for that matter; I still just use base graphics), at least so that I can get students using them.
