---
title: "ten year reproducibility challenge"
author: Karl
date: "2020-02-07"
categories:
  - programming
tags:
  - reproducible research
  - papers
  - code
  - programming
  - r
slug: ten-year-challenge
---

In October I agreed to participate in the
[ReScience](https://rescience.github.io) [Ten Years Reproducibility
Challenge](https://rescience.github.io/ten-years). The idea is to
take a paper that you published at least ten years ago and try to
re-run the code. Brilliant!

I looked back through my pre-2010 papers and chose [Lamichhane et al.
(2003)](https://doi.org/10.1073/pnas.1231432100) on the analysis of a
transposon mutagenesis experiment in _M. tuberculosis_. I picked that
one in part because I figured the analyses were reasonably compact and
not super time consuming. But also I'm pretty proud of the work, which
is one of my few Bayesian analyses, using Markov chain Monte Carlo.
This was a collaboration with [Gyanu
Lamichhane](https://www.hopkinsmedicine.org/profiles/results/directory/profile/6135965/gyanu-lamichhane)
(was a grad student at Johns Hopkins, now an associate professor of
medicine at Hopkins), [William
Bishai](http://bishailab.org/people.html) (Gyanu's advisor), and
[Natalie Blades](http://blades.byu.edu/) (was a grad student in [Johns
Hopkins biostat](https://www.jhsph.edu/departments/biostatistics/),
now an associate professor in statistics at
[BYU](https://statistics.byu.edu/)).

The R package I wrote implementing the method,
[R/negenes](https://github.com/kbroman/negenes), is [still on
CRAN](https://cran.r-project.org/package=negenes). I've not really
made any changes to it, just maintenance work so that it continues to
conform to [CRAN
rules](https://cran.r-project.org/web/packages/policies.html). And I
did [fix one bug causing a memory
over-run](https://github.com/kbroman/negenes/commit/7d8a35321fc3e451d790c538add65d3abfb2e9db),
which [Prof. Ripley](https://en.wikipedia.org/wiki/Brian_D._Ripley)
identified.)

Anyway, the deadline for this challenge is near (April 1),
and so I sat down to start work on it, which was a humbling experience.
It was easy to find the code and data for the project, sitting with my
other old projects as `~/Projects/Tar/Gyanu.tgz`. (I mentioned Gyanu
above, he was first
author on [the paper](https://www.pnas.org/content/pnas/100/12/7213.full.pdf).) But
open that thing up and ugh; not quite what you would like to see.

I dumped the [full thing on
GitHub](https://github.com/kbroman/Project_Lamichhane2003), not
changing anything other than to add
[ReadMe](https://github.com/kbroman/Project_Lamichhane2003/blob/master/README.md)
and
[License](https://github.com/kbroman/Project_Lamichhane2003/blob/master/LICENSE.md)
files. Yes, that's right, the directory didn't contain a _single_
ReadMe file. It's a bit of a mess.

```
class_problems.txt    findTA.pl*    Randomness/
Converge/             mindGaps.pl*  Rawdata/
crucial_doubleTA.txt  Nov02/        Sept02/
Data/                 Operons/      Sims/
doubleta_hit.txt      R/            TroubleShootingSubClasses.txt
exploreSeq.pl*
```

I'm pleased to report that I _was_ able to reproduce my analyses.
(Well, mostly. I can't find the code that was used to do the
simulations for [Figure 3](https://bit.ly/lamichhane2003_fig3), just
the results and the code that used them to make the figure, which doesn't
fully count.) My work reproducing the analysis in the paper is [on
GitHub](https://github.com/kbroman/Paper_ReScience2020); now I just
need to write the paper. But whoa it would have been a lot easier if
I'd left myself a bit of documentation.

Keep in mind that I didn't start using proper version control until
like 2006. So we have to think back to the summer and fall of 2002,
and try to put ourselves in the state of mind of the confident and
free-wheeling [Moustache
Karl](https://www.biostat.wisc.edu/~kbroman/pictures/moustache.jpg).
(Yeah, that famous photo was taken on 2002-11-15, and, well, note that
[`Nov02`](https://github.com/kbroman/Project_Lamichhane2003/tree/master/Nov02)
subdirectory up there. Same month.)

Look at the subdirectories up there. `Rawdata/` has the raw data,
`Data/` has the processed data, `R/` has the code. `Converge/`,
`Operons/`, `Randomness/`, and `Sims/` are sort of side projects that
didn't end up in the paper. Then there are some notes and some perl
scripts that would probably best be organized into other folders, but
whatever.

Yeah, but how about `Sept02/`, what is that? And `Nov02/`?

Well, if you look in
[`Sept02/`](https://github.com/kbroman/Project_Lamichhane2003/blob/master/Sept02/)
you'll find that `Rawdata/`, `Data/`, and `R/`, plus a copy of
`findTA.pl`. Same for
[`Nov02/`](https://github.com/kbroman/Project_Lamichhane2003/blob/master/Nov02).
These were one of Moustache Karl's methods of version control.

Say your collaborator comes to you in September of 2002 and says, "Hey
these results are great, let's write a paper! But first, here's a bit
more data and could you try out this and that and the other thing?"
Well, free-wheeling 2002 Karl would make a `Sept02` subdirectory, copy
over the data files and code, and then edit the code to suit the new
data and analysis. Then in November, your collaborator comes back and
says, "Hey, could you try one more version of that analysis? This one I think
will be the best." So then 2002 Karl would make a `Nov02`
subdirectory, copy over the data files and code again, and edit the
code to suit this third version of the analyses. In the paper most
of the results would be what's in the `Nov02` subdirectory, but a few
things (namely five of the six rows in [Table
2](https://bit.ly/lamichhane2003_table2)) would be taken from the
`Sept02` subdirectory. Free-wheeling and fun and totally
reproducible, right?

If I'd just written that stuff down in a ReadMe file, it would all
be totally acceptable. But yeah, no dice. Or no documentation, rather.

Anyway, yesterday I looked at this mess and was like, "What am I even
supposed to reproduce?" So step 1 was to [read the
paper](https://www.pnas.org/content/pnas/100/12/7213.full.pdf). Having then
identified my targets, it was not so hard to get myself back into 2002
Karl's mind set and work out the details. And so in just a day I was
able to [reproduce the
results](https://kbroman.org/Paper_ReScience2020/reproduction/reproduction.html),
except for that one figure.

Further challenges that could have been avoided if I'd put just a tiny
bit more effort into the work at the time:

- I should have saved the random number generator seeds.

- I should have saved the key intermediate results to files, and then
  loaded those results at the top of scripts that needed them. Instead,
  I'd just left objects in the R environment (that is, the `.RData`
  file) and used them as needed without explaining where they had come
  from. (Please don't tell [Jenny](https://jennybryan.org/) about this.)

- I should have indicated (and loaded) the required R library in the
  scripts.

- The code for [Figure 1b](https://bit.ly/lamichhane2003_fig1) in the
  paper was not actually in the project directory. At first I figured
  that
  [Gyanu](https://www.hopkinsmedicine.org/profiles/results/directory/profile/6135965/gyanu-lamichhane)
  must have made that figure, but then I found [my code for that
  figure](https://github.com/kbroman/Talk_Mtb/blob/master/R/circlefig.R)
  [with the files](https://github.com/kbroman/Talk_Mtb) for a [talk I
  gave at the
  time](https://www.biostat.wisc.edu/~kbroman/presentations/sk04_ho.pdf).

And once again for emphasis: I should have included at least one
ReadMe file that explained the structure of the project directory. And
I should have merged the multiple mutated copies of the analysis
scripts into single scripts that did all the things that we ended up
including in the paper.

There was only one real R change that posed a problem. The output of
`table()` used to just be a vector and now it as object of class
`"table"` and so a couple of scripts throw errors if I don't toss in
an `as.numeric()`.

I've not tried going back to the 2002 version of my
[negenes](https://cran.r-project.org/package=negenes) package. It's
not on github, because [my git repository for the
package](https://github.com/kbroman/negenes) wasn't created until 2011,
but it is [on
CRAN](https://cran.r-project.org/src/contrib/Archive/negenes/), and we
can see from the [ChangeLog
file](https://github.com/kbroman/negenes/blob/master/ChangeLog) for
the package that the oldest version on CRAN is the one we had used for
the analyses in the paper.

I've also not looked at much of [the code itself](https://github.com/kbroman/Paper_ReScience2020/blob/master/original/Sept02/R/analysis.R). And given the state
of the project directory, I think I'm not quite ready to. I
mean, if you open up a script and you see [this](https://github.com/kbroman/Paper_ReScience2020/blob/master/original/Nov02/R/analysis.R#L5-L6):

```r
temp <- negenes(mydata[,1], mydata[,2], mydata[,3], mydata[,4],
                n.mcmc=50000, skip=49, return=TRUE, trace=FALSE)
```

And there's no mention of where the `mydata` object was created or
what it even is, really. Well let's just leave that for another day.
