---
title: Fitting linear mixed models for QTL mapping
author: Karl Broman
date: '2015-11-24'
categories:
  - Genetics
  - Programming
  - R
  - Statistics
tags:
  - mixed models
  - programming
  - QTL mapping
slug: fitting-linear-mixed-models-for-qtl-mapping
---

Linear mixed models (LMMs) have become widely used for dealing with population structure in human GWAS, and they're becoming increasing important for QTL mapping in model organisms, particularly for the analysis of advanced intercross lines (AIL), which often exhibit variation in the relationships among individuals.

In my efforts on [R/qtl2](https://kbroman.org/qtl2), a reimplementation [R/qtl](https://rqtl.org) to better handle high-dimensional data and more complex cross designs, it was clear that I'd need to figure out LMMs. But while [papers explaining the fit of LMMs](https://www.jstatsoft.org/article/view/v067i01) seem quite explicit and clear, I'd never quite turned the corner to actually seeing how I'd implement it. In both reading papers and studying code (e.g., [lme4](https://github.com/lme4/lme4/)), I'd be going along fine and then get completely lost part-way through.

But I now finally understand LMMs, or at least a particular, simple LMM, and I've been able to write an implementation: the R package [lmmlite](https://kbroman.org/lmmlite).

It seemed worthwhile to write down some of the details.

The model I want to fit is _y = X b + e_, where var(_e_) = _sK + tI_, where _K_ is a known kinship matrix and _I_ is the identity matrix. Think of _y_ as a vector of phenotypes and _X_ as a matrix of covariates. Let _v = s+t_ be the residual variance, and let _h = s/(s+t) = s/v_ be the heritability.

First, a shout to [Artem Tarasov](https://github.com/lomereiter), who wrote a [series of blog posts](https://lomereiter.github.io/2015/02/16/lmm_cov.html) walking through and explaining the source code for [FaST-LMM](https://github.com/MicrosoftGenomics/FaST-LMM) and [pylmm](https://github.com/nickFurlotte/pylmm), and to [Nick Furlotte](http://whatmind.com/), whose [pylmm](https://github.com/nickFurlotte/pylmm) code is especially clear and easy-to-read. Only by reading their work did I come to understand these LMMs.

Back to the model fit:

  * For a fixed value of the heritability, _h_, we have var(_e_) = _v[hK + (1-h)I] = vV_ where _V_ is known. And so we end up with a general least squares problem, which we can fit in order to estimate _b_ and _v_.

  * And actually, if you take the eigen decomposition of _K_, say _K = UDU'_, it turns out that you can write _hK + (1-h)I = hUDU' + (1-h)UU' = U[hD + (1-h)I]U'_. That is, the eigenvectors of _K_ are the same as the eigenvectors of _hK + (1-h)I_. And so if you pre-multiply _y_ and _X_ by _U'_, you end up with a weighted least squares problem, which is way faster to fit than a general least squares problem.

  * Having fit the weighted least squares problem to estimate _b_ and _v_, you can then calculate the corresponding log likelihood (or, better, the restricted log likelihood, if you want to do REML).

  * You're then left with a one-dimensional optimization problem (optimizing the log likelihood over _h_), which you can solve by [Brent's method](https://en.wikipedia.org/wiki/Brent%27s_method).

  * That's it!

It seems quite obvious in retrospect. It's a bit embarrassing that it's taken me so long to come to this understanding.

In [lmmlite](https://kbroman.org/lmmlite), I implemented this algorithm (closely following the code in [pylmm](https://github.com/nickFurlotte/pylmm)) twice: in plain R, and then in C++ (using [RcppEigen](https://github.com/RcppCore/RcppEigen), which is an interface to the [Eigen](https://eigen.tuxfamily.org/index.php?title=Main_Page) C++ linear algebra library). The plain R code is a bit slower then pylmm; the C++ code is a bit faster. In the C++ code, almost all of the computation time is devoted to the eigen decomposition of the kinship matrix. Once that's done, the rest is super quick.
