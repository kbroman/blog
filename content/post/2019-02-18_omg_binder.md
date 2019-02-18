---
title: "omg, binder!"
author: Karl Broman
date: "2019-02-18"
categories:
  - Programming
tags:
  - reproducible research
slug: omg_binder
---

At his [talk at
RStudio::conf](https://github.com/karthik/rstudio2019), [Karthik
Ram](http://inundata.org) mentioned
[binder](https://mybinder.readthedocs.io/en/latest/index.html) as a
useful solution for reproducible research (see [the
video](https://resources.rstudio.com/rstudio-conf-2019/a-guide-to-modern-reproducible-data-science-with-r)),
and I thought, "What is this dark magic?" You put a small
configuration file in your GitHub repository and suddenly you can open it
live in RStudio on some cloud server somewhere. Now _this_ has got to
be too good to be true. But I trusted him, mentioned it in [my talk at
AAAS today](https://bit.ly/rrcollab), and talked it up to [Jeff
Leek](http://jtleek.com).

I spent the afternoon walking around DC, and then when it started to
rain I came in and decided I'd give binder a try. I figured my [Fruit
Snacks project](https://kbroman.org/FruitSnacks) would make a good
example.

The [documentation for
binder](https://mybinder.readthedocs.io/en/latest/index.html) is quite
comprehensive, but I found it rather confusing. So it took me a bit of
experimentation to figure things out. And I'm eager to try to
explain what I learned in the simplest possible terms.

## What's the point?

First, let me make the awesomeness a bit more concrete.

Say you have some code and data for a paper that you've just written,
and you want to share it with the world. You put it all in a GitHub
repository, and people can pull it down to their laptop to work with
it, but maybe they'll need to install a bunch of packages, and maybe
they'll need to do a bit of work to make sure they have just the right
versions of packages. Ugh, this is all getting a bit hard.

Back up, with binder. You've put your code and data in a github
repository. Other people maybe want to try it out and peruse the work.
They click on the "launch binder" badge in your ReadMe file, and it
opens RStudio in their browser, with all the right packages installed
and with your code and data sitting there, ready to work with.

Click this to see my example in action:
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/kbroman/FruitSnacksBinder/master?urlpath=rstudio)

Open the `fruit_snacks.Rmd` file in the `R/` directory and click the
"Knit" button, and it will run my permutation tests and open the
compiled report.

And what do you need to do to make this happen? You'll be surprised by
how simple it is, because you just need three things:

- tell binder you want R, using the
  [MRAN](https://mran.microsoft.com/) snapshot of
  [CRAN](https://cran.r-project.org) from a particular date
- tell binder what packages to install
- use the right URL, to have binder open your project in RStudio in a
  browser (namely with "`?urlpath=rstudio`" at the end)




## Initial reorganization

Okay, so what did I need to do to use binder with my [Fruit
Snacks project](https://kbroman.org/FruitSnacks)?

First, I made a copy of the [GitHub
repository](https://github.com/kbroman/FruitSnacks) and deleted a
bunch of stuff, because it's a bit bloated with pictures of fruit
snacks.

Specifically:

```
git clone git://github.com/kbroman/FruitSnacks FruitSnacksBinder
cd FruitSnacksBinder
\rm -rf .git
\rm -r Photos
\rm PhotoGallery.md Makefile
\rm R/create_thumbnails.R R/generate_photo_gallery.R
```

Then I initialized it as a new git repository.

```
git add .
git commit -m "Initial commit"
```

I created a [new repository on
GitHub](https://github.com/kbroman/FruitSnacksBinder), and push the
local repository there.

```
git remote add origin git@github.com:kbroman/FruitSnacksBinder
git push -u origin master
```

(Note, I always use the ssh method of connecting to GitHub. You might
want `https://github.com/` where I'm using `git@github.com:`.)

This puts me at a nice clean state. The repository has

- ReadMe and License files
- A `Data/` directory containing a few CSVs, a couple of PDFs, and a
  couple of xlsx files
- An `R/` directory with an R script that defines a few functions plus
  a couple of R Markdown files that contain my analyses.

The R Markdown files automatically install my
[R/broman](https://github.com/kbroman/broman) package, if it's not
available. This isn't recommended behavior, and we won't need this
with binder, so I removed the lines like

```r
if(!require(broman)) {
    install.packages("broman", repos="https://cran.rstudio.com")
}
```

and replaced them with

```r
library(broman)
```


## How to use binder with R

Okay, now on to the real bit. We need to do three things:

**1**. Create a file called
[`runtime.txt`](https://github.com/kbroman/FruitSnacksBinder/blob/master/runtime.txt)
that has just one line like:

```
r-2019-02-14
```

This tells binder that you want R, and that you want R packages
from a particular date.

**2**. Specify the R packages that you want installed by creating a file called
[`install.R`](https://github.com/kbroman/FruitSnacksBinder/blob/master/install.R)
that contains one or more `install.packages()` calls, like this:

```r
install.packages(c("broman",
                   "knitr", "rmarkdown",
                   "caTools", "bitops", "rprojroot"))
```

**3**. The last thing is to make a badge, or anyway the URL that will
have binder open your repository in RStudio in a browser.
The url is like this:

<https://mybinder.org/v2/gh/kbroman/FruitSnacksBinder/master?urlpath=rstudio>

The `?urlpath=rstudio` at the end of the URL is what makes the
RStudio aspect happen.

To make a proper badge, you put a line like the following in your
`README.md` file:

```
[![Binder](https://mybinder.org/badge_logo.svg)]( put_url_here )
```

The first time you launch binder, it'll be quite slow to load as it
has to create the container and install R and RStudio and all of
the packages and everything. Subsequent times it'll be much
faster, though not particularly fast.

## An alternative

There's an alternative to step 2 above, where you created the
`install.R` file. Instead of making that file, you
can make a
[`DESCRIPTION`](https://github.com/kbroman/FruitSnacksBinder/blob/description/DESCRIPTION)
file, sort of like an R package, like this:

```
Package: FruitSnacks
Version: 0.1
Date: 2019-02-18
Description: Fruit Snacks project arranged for myBinder.org
Author: Karl W Broman <broman@wisc.edu>
Depends:
    R (>= 3.5.0)
Imports:
    broman,
    knitr,
    rmarkdown,
    caTools,
    bitops,
    rprojroot
```

The two approaches do the same thing. I think the `install.R` approach
seems easier, but the `DESCRIPTION` approach maybe seems more natural for
R package developers, and would allow the repository to use this
binder business and also be a proper R package.

The [master branch of my FruitSnacksBinder
repository](https://github.com/kbroman/FruitSnacksBinder) uses the
`install.R` approach.

I tried out the `DESCRIPTION` file approach in the [description
branch of that repository](https://github.com/kbroman/FruitSnacksBinder/tree/description).

To use binder with a non-master branch in your repository, you edit
`master` in the URL to the name of the branch you want to use, like this:

<https://mybinder.org/v2/gh/kbroman/FruitSnacksBinder/description?urlpath=rstudio>


## Wait, was that it?

Yes, that was it.

1. An `runtime.txt` file with a line like `r-2019-02-14`
2. Either an `install.R` file or a `DESCRIPTION` file. The key thing
   here is specifying what packages to install.
3. Make a badge with the correct URL.

## Limitations

There are some important limitations of binder.

- It's a pilot; it's not likely to continue long term the way it is now
  (totally free).
- You get just 1-2 GB RAM for your project.


## Conclusions

Putting the code and data for a project or paper on GitHub is an
awesome thing. People can grab it and explore it and test it and
modify it for other purposes.

But there are some hassles, including getting all of the packages
installed, and installing the right versions of packages.

Docker containers are a clear and important solution to this problem,
but many of us still find them a bit complicated and scary.

Binder can bring that docker magic to all of our github repositories,
with just three small steps.
