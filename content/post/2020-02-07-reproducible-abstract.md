---
title: "reproducible abstract"
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
  - r markdown
slug: reproducible-abstract
---

A student asked me about how to include summary results in the abstract or
executive summary at the top of an R Markdown report when they don't get
calculated until somewhere below.

I feel like I've seen a generally accepted solution to this, but I
can't find it. I thought maybe Keith Baggerly mentioned this in his
[slides about good reproducible
reports](https://github.com/SISBID/Module3/blob/master/2017_SISBID_3_12_good_reports.pdf),
but he doesn't seem to. I did find [this RStudio Community
discussion](https://community.rstudio.com/t/best-practices-for-organizing-rmarkdown-projects/914)
that is relevant, but it doesn't have quite the solution I would want.

My suggestion was to include a code chunk something like this
before the abstract:

    ```{r load_summary_results, echo=FALSE}
    summary_file <- "_cache/summary_results.RData"
    if(file.exists(summary_file)) {
        load(summary_file)
    } else {
      resultA <- NA
      resultB <- NA
      resultC <- NA
    }
    ```

And then use `resultA`, `resultB`, and `resultC` in the abstract.

At the bottom of your document, save the results to a file with
something like this:

    ```{r save_summary_results, echo=FALSE}
    resultA <- [some calculation]
    resultB <- [some other calculation]
    resultC <- [a third calculation]

    save(resultA, resultB, resultC, file=summary_file)
    ```

The first time you compile the report, your abstract would have a
bunch of `NA` values in it. But then if you run the compile the report
a second time, you'd pull in the results from the previous run.

Is there a better way? Let me know [on twitter](https://twitter.com/kwbroman).
