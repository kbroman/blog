---
title: 'Car crash stats revisited: My measurement errors'
author: Karl Broman
date: '2014-11-03'
categories:
  - Statistics
tags:
  - exploratory data analysis
  - graphics
slug: car-crash-stats-revisited-my-measurement-errors
---

Last week, I [created revised versions](https://kbroman.org/blog/2014/10/29/improved-graphs-of-car-crash-stats/) of graphs of car crash statistics by state (including [an interactive version](https://www.biostat.wisc.edu/~kbroman/D3/car_crashes/)), from [a post](https://fivethirtyeight.com/datalab/which-state-has-the-worst-drivers/) by [Mona Chalabi](https://fivethirtyeight.com/contributors/mona-chalabi/) at [538](https://fivethirtyeight.com/).

Since I was working on those at the last minute in the middle of the night, to be included as an example in a lecture [on creating effective figures and tables](https://www.biostat.wisc.edu/~kbroman/presentations/graphs_MDPhD2014.pdf), I just read the data off printed versions of the bar charts, using a ruler.

I later emailed [Mona Chalabi](https://fivethirtyeight.com/contributors/mona-chalabi), and she and [Andrew Flowers](https://fivethirtyeight.com/contributors/andrew-flowers/) quickly posted the data to [`github.com/fivethirtyeight/data`](https://github.com/fivethirtyeight/data/tree/master/bad-drivers). (That repository has a lot of interesting data, and if you see data at 538 that you're interested in, just ask them!)

I was curious to look at how I'd done with my measurements and data entry. Here's a plot of my percent errors:

![Percent measurement errors in Karl's car crash stats](https://kbroman.files.wordpress.com/2014/11/crashstats_errors.png)

Not too bad, really. Here are the biggest problems:

  * Mississippi, non-distracted: off by 6%, but that corresponded to 0.5 mm.

  * Rhode Island and Ohio, speeding: off by 40 and 35%, respectively. I'd written down 8 and 9 mm rather than 13 and 14 mm.

  * Maine and Indiana, alcohol: wrote 15.5 and 14.5 mm, but typed 13.5 and 13 mm. In the former, I think I just misinterpreted my writing; in the latter, I think I wrote the number for the state below (Iowa).

It's also interesting to note that my "total" and "non-distracted" were almost entirely under-estimates: probably an error in the measurement of the overall width of the bar chart.

Also note: [@brycem](https://twitter.com/brycem) had recommended using [WebPlotDigitizer](https://automeris.io/WebPlotDigitizer/) for digitizing data from images.
