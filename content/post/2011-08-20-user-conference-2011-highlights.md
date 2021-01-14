---
title: useR! Conference 2011 highlights
author: Karl Broman
date: '2011-08-20'
categories:
  - R
tags:
  - conference
  - graphics
slug: user-conference-2011-highlights
---

I was at the [useR! Conference](http://www.warwick.ac.uk/statsdept/user-2011/) at [The University of Warwick](http://www.warwick.ac.uk) in [Coventry, UK](http://maps.google.com/maps?q=Coventry,+United+Kingdom&hl=en&ll=52.40577,-1.51062&spn=0.772453,1.207123&sll=52.953395,-1.148586&sspn=0.095353,0.15089&vpsrc=6&z=10), last week. My goal in going was to learn the latest things regarding (simple) dynamic graphics, (simple) web-based apps, parallel computing, and memory management (dealing with big data sets). I got just what I was hoping for and more. There are a lot of useful tools available that I want to adopt. I'll summarize the high points below, with the particular areas of interest to me covered more exhaustively than just "highlights".

I left feeling that my programming skills are crap. My biggest failing is in not making sufficient use of others' packages, but rather just building what I need from scratch (with great effort) and skipping dynamic graphics completely.

## General

There were 440 participants from 41 countries (342 Europe; 60 North America).

[Prof. Brian Ripley](http://www.stats.ox.ac.uk/~ripley/) [[picture](http://www2.warwick.ac.uk/fac/sci/statistics/user-2011/images/tuesday/img_5278.jpg) taken from [here](http://www2.warwick.ac.uk/fac/sci/statistics/user-2011/images/)] spoke about the R development process.

  * There are now >3000 packages on CRAN, with 110 submissions per week (of which 80 are successful), basically all handled by [Kurt Hornik](http://statmath.wu.ac.at/~hornik/).

  * CRAN will throw out binaries of packages that are more than two years old.

  * What's within the base of R will shrink rather than grow.

  * There have been a lot of improvements in the rendering of graphics.

  * R is heavily dependent on a small number of altruistic developers, many of whom feel their contributions are not treated with respect.

  * `library()` is to be replaced by `use()`.

  * There will soon be a `parallel` package for [parallel computing](http://cran.r-project.org/web/views/HighPerformanceComputing.html).

[David Smith](http://www.r-bloggers.com/author/david-smith/) from [Revolution Analytics](http://www.revolutionanalytics.com/), in [his talk on the R Ecosystem](http://prezi.com/s1qrgfm9ko4i/the-r-ecosystem/), claimed that there are more than 2 million R users.

[Barry Rowlingson](http://geospaced.blogspot.com/) gave a great lightning talk, "Why R-help must die!" He suggested the Q-and-A type sites [Stack Overflow](http://stackoverflow.com/) (on programming) and [Cross Validated](http://stats.stackexchange.com/) (on statistics), both part of [Stack Exchange](http://stackexchange.com/); they hope to create an R-specific site soon (currently R things are split between the two).

[Tal Galili](http://www.r-statistics.com/) (founder of [R-bloggers](http://www.r-bloggers.com/)) gave a lightning talk about blogging and R. He emphasized that one need not write frequent posts. At the [2010 useR! Conference](http://user2010.org/) he gave a more comprehensive introduction to blogging available [here](http://www.r-statistics.com/2010/07/blogging-about-r-presentation-and-audio/).

[Andreas Leha](http://www.ams.med.uni-goettingen.de/amsneu/leha-en.shtml) talked about emacs [org-mode](http://orgmode.org/) for reproducible research: sort of like [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/) but it will take a large number of possible languages (R, python, Java, ...) and can produce html as well as pdf.

Tobias Verbeke from [OpenAnalytics](http://www.openanalytics.eu/) talked about [StatET](http://www.walware.de/goto/statet), an [Eclipse](http://www.eclipse.org/eclipse/)-based IDE for R (especially useful for debugging).

[Patrick Burns](http://www.portfolioprobe.com/blog) talked about [random input software testing](http://www.portfolioprobe.com/2011/08/23/random-input-software-testing/) and had a great analogy: if writing test suites is like digging ditches, random input testing is like digging in the sand (ie, fun). (I do random input testing, but with my users providing the inputs.) [[slides (with transcript)](http://www.burns-stat.com/pages/Present/random_input_test_annotated.pdf)]

Olaf Mersmann gave a cool talk about [microbenchmark](http://cran.r-project.org/web/packages/microbenchmark/index.html) to get accurate nanosecond timings of R expressions. Why do that? Because if you repeat something 1000 times in a `for` loop and then time it with `system.time()`, you are including the overhead of the `for` loop.

The next useR! Conference will be at Vanderbilt in Nashville, TN, June 12-15, 2012.

## Graphics

[Toby Dylan Hocking](http://cbio.ensmp.fr/~thocking/) had a poster about the [directlabels](http://directlabels.r-forge.r-project.org/) package for putting labels near curves or clusters of points in a plot rather than have a separate legend. I really like the technique and am eager to try out the package. For figures for a publication, one will probably want to edit things by hand, but for day-to-day, the package looks extremely useful.

Sina Rüeger presented [uniPlot](http://uniplot.sinarueeger.ch/) to reduce time to polish reports, by making base graphics, ggplot2, and lattice all use the same style (otherwise the reader may be distracted by the differences). [[CRAN](http://cran.r-project.org/web/packages/uniPlot/index.html)]

Alexander Kowarik presented [sparkTable](http://cran.r-project.org/web/packages/sparkTable/) for creating html tables with very small graphs included.

[Simon Urbanek](http://simon.urbanek.info/) mentioned several new features in R graphics:

  * R will soon include `dev.hold()` and `dev.flush()` (written by [Prof. Brian Ripley](http://www.stats.ox.ac.uk/~ripley/)) so that you can tell a graphics device when you actually want to see a plot. This should improve graphics rendering.

  * `rasterImage()` is way faster than `image()`

  * `osmap()` to get [OpenStreetMap](http://www.openstreetmap.org/) maps in one line, with different zoom levels. [It's in the [snippets](http://www.rforge.net/snippets/) package.]

  * `polypath()` to plot polygons with holes.

## Dynamic graphics

[Paul Murrell](http://www.stat.auckland.ac.nz/~paul/) gave an especially cool talk on turning a PDF of a campus map of the University of Aukland into a dynamic graph where mousing over a number in the legend lights up the number at the corresponding building (and vice versa). The pdf was converted to postscript, loaded into R via [grImport](http://cran.r-project.org/web/packages/grImport/index.html) and written to an SVG via [gridSVG](http://www.stat.auckland.ac.nz/~paul/). There was a bit of javascript to write. [[slides](http://www.stat.auckland.ac.nz/~paul/Talks/UseR2011/processing.pdf) | [page with the interactive maps](http://www.stat.auckland.ac.nz/~paul/Talks/UseR2011/) (you may need [Firefox](http://www.mozilla.com/en-US/firefox/new/) for the maps)]

[Adrian Bowman](http://www.stats.gla.ac.uk/~adrian/) gave a talk on modeling 3d surfaces with some great dynamic graphics using [RGL](http://rgl.neoscientists.org/about.shtml) and [rpanel](http://www.stats.gla.ac.uk/~adrian/rpanel/). He had some cool animations in his PDF, too, developed with the [animate](http://www.tug.org/texlive/Contents/live/texmf-dist/doc/latex/animate/) package for LaTeX.

[Simon Urbanek](http://simon.urbanek.info/) talked about [iPlots](http://www.rosuda.org/iplots/) eXtreme (currently: codename [Acinonyx](http://rforge.net/Acinonyx/)) which has fabulous and easy-to-create dynamic graphics. You basically just prefix the usual plot functions with an "i" (iplot, ihist). Super fast and can handle big data sets. It uses [OpenGL](http://www.opengl.org/) (a solution developed by the gaming industry).

[TIBCO Spotfire](http://spotfire.tibco.com) has some ways to develop interactive graphics tools, but it's commercial and Windows only.

Ian Hansel talked about Rocessing, for combining [processing](http://processing.org/) with [R](http://www.r-project.org).

[Richie Cotton](http://4dpiecharts.com/) talked about the use of [gWidgets](http://cran.r-project.org/web/packages/gWidgets/index.html) for easy interactive graphics. [[data and code here](http://4dpiecharts.com/2011/08/17/user2011-easy-interactive-ggplots-talk/); also see [this blog post](http://4dpiecharts.com/2010/10/06/creating-guis-in-r-with-gwidgets/)]

[Adrian Waddell](http://adrian.waddell.ch/) talked about [RnavGraph](https://r-forge.r-project.org/projects/rnavgraph/) for interactive graphics. He had some neat ideas about navigating among multiple scatterplots: a graph where nodes are images and where moving along an edge between two nodes involves morphing from one image to another. Moving from one scatterplot to another is like rotating a 3d scatterplot. [[CRAN](http://cran.r-project.org/web/packages/RnavGraph/index.html)]

## Simple web applications

Timothee Carayol gave a lightning talk about how to use [RGoogleDocs](http://www.omegahat.org/RGoogleDocs/) and [rApache](http://rapache.net/) for quick and easy deployment of a web interface. You set up a spreadsheet, which acts as a configuration file for rApache, so RGoogleDocs handles the inputs in place of what could be complex web programming.  It sounds neat but I don't fully understand it. But Timothee wrote to say that he would write a tutorial in the coming weeks. [[slides](http://dl.dropbox.com/u/2312517/RGoogleDocs_rApache_useR2011.pdf)]

[Wolfgang Huber](http://www.embl.de/research/units/genome_biology/huber/) gave a cool talk on the analysis of images of cells from a large experiment in which each gene is knocked down, one at a time, by RNAi. They are creating interactive reports that are like Sweave but using html5 to give dynamic reports viewed in a browser. He gave examples using the [arrayQualityMetrics](http://www.bioconductor.org/packages/2.1/bioc/html/arrayQualityMetrics.html) package. One can identify points via tooltips; multiple plots are linked; click to select/highlight; collapse/expand sections. Callback processing is in javascript. It uses the gridSVG package (which makes it mostly easy).

Eleni-Anthippi Chatzimichali talked about [iWebPlots](http://cran.r-project.org/web/packages/iWebPlots/index.html) for making dynamic, web-based scatterplots.

## Comprehensive web applications and GUIs

[E. James Harner](http://stat.wvu.edu/Faculty/jharner.html) spoke about [Rc2](http://www.warwick.ac.uk/statsdept/useR-2011/abstracts/010411-rc2.pdf) for collaborative use of R (including shared R sessions with voice chat), aimed to support distance learning. It seems really complicated and not easily adapted for others' use.

[Naim Matasci](http://www.iplantcollaborative.org/connect/staff-collaborators/naim-matasci) had a poster about [iPlant](http://iplantcollaborative.org) which has a fancy web front end with interactive analysis (using R). They have something like 10 developers working on it, but he said that the source code will be available and that it could be adapted for other purposes.

Xavier de Pedro Puente discussed the use of [Tiki](http://tiki.org) with R to make comprehensive web sites with wiki-like pages including R (converted to output or graphs on the fly) or web-based forms. It uses his [PluginR](https://doc.tiki.org/PluginR) package. It seems a great idea, but is likely too complicated for me. The key coding is with [Smarty](http://www.smarty.net/). [[slides](http://ueb.ir.vhebron.net/2011+UseR)]

Jason Waddell and Tobias Verbeke from [OpenAnalytics](http://www.openanalytics.eu/) talked about the use of the [R service bus](http://www.openanalytics.eu/r-service-bus) [[documentation](http://rsb.doc.openanalytics.eu/)] for lab automation.

David Nicolaides from [Accelrys](http://accelrys.com/) talked about browser-based applications using [Pipeline Pilot](http://accelrys.com/products/pipeline-pilot/).

Sheri Gilley from [Revolution Analytics](http://www.revolutionanalytics.com/) presented a GUI that they're working on. It looks like it will be superb for the novice who wants a GUI. They'll have a beta by the end of 2011, with the real release in 2012. Sheri spent 25 years doing UI design at SPSS (so I guess she was 10 or 15 when she started).

## Companies

I was surprised by the large number of companies forming around R.

  * [Revolution Analytics](http://www.revolutionanalytics.com/): have code for handling large datasets and parallel computing and are developing a GUI.

  * [RStudio](http://rstudio.org): aimed to be an IDE (supporting programmers) rather than a GUI. Upcoming features (including quick traversal of code across multiple files) look cool, but I'll probably stay with emacs.

  * [Mango Solutions](http://www.mango-solutions.com/index.html)

  * [OpenAnalytics](http://www.openanalytics.eu/): [R service bus](http://www.openanalytics.eu/r-service-bus) and [StatET](http://www.walware.de/goto/statet) (IDE via [Eclipse](http://www.eclipse.org/eclipse/))

  * [TIBCO](http://spotfire.tibco.com/): purchased Insightful (who had bought Splus) in 2008.

  * [CloudNumbers](http://www.cloudnumbers.com): cloud-based computing, including the use of R.

## Talks I wish I'd seen

[Andrej Blejec](http://ablejec.nib.si/) talked about his animatoR package for creating animations in R.

[Jonathan Rougier](http://www.maths.bris.ac.uk/~MAZJCR/) talked about nomograms (and donkeys).

Markus Gesmann talked about using the [Google visualization API](http://code.google.com/apis/chart/index.html) with R: the [googleVis](http://cran.r-project.org/web/packages/googleVis/index.html) package. [[detailed info](http://code.google.com/p/google-motion-charts-with-r/)]

## Things (particularly packages) I need to try out

  * Emacs [org-mode](http://orgmode.org)

  * [mosaic](http://mosaic-web.org) package for teaching [[CRAN](http://cran.r-project.org/web/packages/mosaic/index.html)]

  * [directlabels](http://directlabels.r-forge.r-project.org/) package for automatically putting labels directly next to curves or clouds of points.

  * [hexbin](http://cran.r-project.org/web/packages/hexbin/index.html) package for dense scatterplots.

  * [iPlots](http://iplots.org) eXtreme ([Acinonyx](http://rforge.net/Acinonyx/)) for fast dynamic graphics

  * [animation](http://cran.r-project.org/web/packages/animation/index.html) for making animations in R

  * grid and [ggplot2](http://had.co.nz/ggplot2/) (I'm still just using base graphics)

  * [gWidgets](https://r-forge.r-project.org/R/?group_id=761) and [rpanel](http://www.stats.gla.ac.uk/~adrian/rpanel/) for making simple dynamic graphics

  * [gridSVG](http://www.stat.auckland.ac.nz/~paul/) for making complex web-based dynamic graphics

  * [sparkTable](http://cran.r-project.org/web/packages/sparkTable/) for making html tables with small figures inserted

  * [uniPlot](http://uniplot.sinarueeger.ch/) for making base graphics, ggplot2, and lattice all use the same style. [[CRAN](http://cran.r-project.org/web/packages/uniPlot/index.html)]

  * [compareGroups](http://cran.r-project.org/web/packages/compareGroups/index.html) for making complex tables with confidence intervals and p-values and such, like epidemiologists (and my collaborators) often want

  * [iWebPlots](http://www.cranfield.ac.uk/health/researchareas/bioinformatics/page53292.html) for making web-based plots [[CRAN](http://cran.r-project.org/web/packages/iWebPlots/index.html)]

  * [arrayQualityMetrics](http://www.bioconductor.org/packages/2.1/bioc/html/arrayQualityMetrics.html) which creates fancy web-based dynamic reports

  * osmap (contained in [snippets](http://www.rforge.net/snippets/)) for making maps.

  * animatoR for making animations

  * [googlevis](http://code.google.com/p/google-motion-charts-with-r/) package [[CRAN](http://cran.r-project.org/web/packages/googleVis/index.html)]
