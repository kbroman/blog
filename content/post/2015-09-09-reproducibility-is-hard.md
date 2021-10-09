---
title: Reproducibility is hard
author: Karl Broman
date: '2015-09-09'
categories:
  - Academics
  - Statistics
tags:
  - papers
  - reproducible research
slug: reproducibility-is-hard
---

Reproducibility is hard. It will probably always be hard, because it's hard keeping things organized.

I recently had a [paper](https://doi.org/10.1534/g3.115.019778) accepted at [G3](https://academic.oup.com/g3journal), concerning a huge set of sample mix-ups in a large eQTL study. I'd discovered and worked out the issue back in December, 2010. I gave a talk about it at the Mouse Genetics meeting in Washington, DC, in June, 2011. But for reasons that I will leave unexplained, I didn't write it up until much later. I did the bulk of the writing in October, 2012, but it wasn't until February, 2014, that I posted a [preprint](https://arxiv.org/abs/1402.2633) at [arXiv](https://arxiv.org/), which I then finally submitted to G3 in June this year.

In writing up the paper in late 2012, I re-did my entire analysis from scratch, to make the whole thing more cleanly reproducible. So with the paper now in press, I've placed all of that in a [GitHub repository](https://github.com/kbroman/Paper_SampleMixups), but as it turned out, there was still a lot more to do. (You can tell, from the repository, that this is an old project, because there are a couple of Perl scripts in there. It's been a long time since I've switched from Perl to Python and Ruby. I still can't commit to just one of Python or Ruby...want to stick with Python, as everyone else is using it, but much prefer Ruby.)

The basic issue is that the raw data is about 1 GB. The clean version of the data is another 1 GB. And then there are results of various intermediate calculations, some are rather slow to calculate, which take up another 100 MB. I can't reasonably put all of that within the GitHub repository.

Both the raw and clean data have been [posted in the Mouse Phenome Database](https://phenome.jax.org/projects/Attie1). (Thanks to Petr Simecek, Gary Churchill, Molly Bogue, and Elissa Chesler for that!) But the data are in a form that I thought suitable for others, and not quite in the form that I actually used them.

So, I needed to write a script that would grab the data files from [MPD](https://phenome.jax.org) and reorganize them in the way that I'd been using them.

In working on that, I discovered some mistakes in the data posted to MPD: there were a couple of bugs in my code to convert the data from the format I was using into the format I was going to post. (So it was good to spend the time on the script that did the reverse!)

In addition to the raw and clean data on MPD, I posted a zip file with the 110 MB of intermediate results on [figshare](https://doi.org/10.6084/m9.figshare.1515873.v1).

In the end, I'm hoping that one can clone the [GitHub repository](https://github.com/kbroman/Paper_SampleMixups) and just run [make](https://www.gnu.org/software/make/) and it will download the data and do all of the stuff. If you want to save some time, you could download the [zip file from figshare](https://doi.org/10.6084/m9.figshare.1515873.v1) and unzip that, and then run make.

I'm not quite there, but I think I'm close.

### Aspects I'm happy with

For the most part, my work on this project wasn't terrible.

  * I wrote an R package, [R/lineup](https://github.com/kbroman/lineup), with the main analysis methods.

  * That I re-derived the full entire analysis cleanly, in a separate, reproducible document (I used [AsciiDoc](https://asciidoc.org) and [knitr](https://yihui.name/knitr/)) was a good thing.

  * The code for the figures and tables are all reasonably clean, and draw from either the original data files or from intermediate calculations produced by the AsciiDoc document.

  * I automated everything with GNU Make.

### What should I have done differently?

There was a lot more after-the-fact work that I would rather not have to do.

Making a project reproducible is easier if the data aren't that large and so can be bundled into the GitHub repository with all of the code.

With a larger data set, I guess the thing to do is recognize, from the start, that the data are going to be sitting elsewhere. So then, I think one should _organize the data in the form that you expect to be made public_, and work from those files.

When you write a script to convert data from one form to another, _also write some tests_, to make sure that it worked correctly.

And then _document, document, document!_ As with software development, it's hard to document data or analyses after the fact.
