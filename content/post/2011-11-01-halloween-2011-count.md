---
title: Halloween 2011 count
author: Karl Broman
date: '2011-10-31'
categories:
  - News
  - R
  - Statistics
tags:
  - code
  - graphics
  - news
slug: halloween-2011-count
---

We don't get many kids seeking candy at our house. I'm not sure if there just aren't many kids in the neighborhood, or if it's our location (next to the pond, with a big gap before the next house).

I decided to keep track. As usual, we bought a huge bag of candy, and we still had about half of it left to hand out tonight. But only 19 kids came.

![](https://kbroman.files.wordpress.com/2011/10/halloween20111.png)

They arrived pretty regularly from 5:50 to 7:50.

I comment on the figure's style below.

In the above graph, I'm applying ideas learned from [Dan Carr](http://statistics.gmu.edu/people_pages/carr.html) when I visited the [statistics department](http://statistics.gmu.edu) at [George Mason](https://www.gmu.edu) in September, to give [a seminar](https://www.biostat.wisc.edu/~kbroman/presentations/gmu2011.pdf).  (I had a great time at GMU, particularly talking to Dan about graphics.  I had a copy of [his book about micromaps](https://www.amazon.com/exec/obidos/ASIN/142007573X/7210-20) on my iPad, but hadn't really looked at it until after I met him.  Take a look at the first chapter; it's full of good ideas and may convince you to read the rest.)

  * The gray background makes the figure stand out on the "page".  (I had disliked this aspect of [ggplot2](http://had.co.nz/ggplot2/) plots, but Dan convinced me that it's better.)

  * The black border around the figure is important.  (Dan pointed out that it's not the gray background I dislike about the default ggplot2 plots, but the lack of the border.)

  * The white grid lines make it easy to see the details, and they still don't get in the way of the plot.

  * With the grid lines, you don't need to include tick marks, but can just use proximity.  (Note that the labels can and should be closer to the plot when there are no ~~bristles~~ ticks.)

  * The use of color for the actual data makes them stand out better.

* * *

**Update**: The code I used for the figure is [here](https://www.biostat.wisc.edu/~kbroman/blog/halloween2011.R).  It's old-fashioned and inefficient, but it works.
