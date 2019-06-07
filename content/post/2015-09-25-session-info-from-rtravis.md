---
title: Session info from R/Travis
author: Karl Broman
date: '2015-09-25'
categories:
  - Programming
  - R
tags:
  - programming
  - testing
  - TravisCI
slug: session-info-from-rtravis
---

For the problem [I reported yesterday](https://kbroman.org/blog/2015/09/24/its-not-you-its-me), in which my R package was working fine locally but failing on [Travis](https://travis-ci.org), the key solution is to run `update.packages(ask=FALSE)` locally, and maybe even `update.packages(ask=FALSE, type="source")` to be sure to grab the source of packages for which binaries are not yet available. I now know to do that.

In addition, it'd be useful to have session information (R and package versions) in the results from Travis. This has proven a bit tricky.

If you don't want to go with a fully custom Travis script, your [customization options](https://docs.travis-ci.com/user/customizing-the-build/) are limited. We really only care about the case of a failure, so `after_success` is not of interest, and `after_script` seems not to be run if there's a Travis fail. Moreover, `script` and `after_failure` are defined by the main `language: r` script, so you can't change them without going all-custom.

What's left is `before_script`.

I want to see the result of `devtools::session_info()` with the package of interest loaded, but the package actually gets built _after_ `before_script` is run, so we'll need to build and install it, even though it'll be built and installed again afterwards. The best I could work out is in [this example `.travis.yml` file](https://github.com/kbroman/testsysfile/blob/master/.travis.yml#L12-L19), with the key bits being:

````
before_script:
  - export PKG_NAME=$(Rscript -e 'cat(paste0(devtools::as.package(".")$package))')
  - export PKG_TARBALL=$(Rscript -e 'pkg <- devtools::as.package("."); cat(paste0(pkg$package,"_",pkg$version,".tar.gz"))')
  - R CMD build --no-build-vignettes .
  - R CMD INSTALL ${PKG_TARBALL}
  - rm ${PKG_TARBALL}
  - echo "Session info:"
  - Rscript -e "library(${PKG_NAME});devtools::session_info('${PKG_NAME}')"
````

I use `--no-build-vignettes` in `R CMD build` as otherwise the package would be built and installed yet another time. And I remove the `.tar.gz` file afterwards, to avoid having the later check complain about the extra file.

Here's an [example of the session info in the Travis log](https://travis-ci.org/kbroman/testsysfile#L850-L864).

If you have suggests about how to simplify this, I'd be happy to hear them. I guess the key would be to have the main Travis script for R revised to report session information.

Thanks to [Jenny Bryan](https://twitter.com/jennybryan) for [showing me how to search for instances of `session_info` in `.travis.yml` files on GitHub](https://twitter.com/JennyBryan/status/647177192514785280), and to [Carson Sievert](https://twitter.com/cpsievert) for [further moral support](https://twitter.com/cpsievert/status/647189393162178560).
