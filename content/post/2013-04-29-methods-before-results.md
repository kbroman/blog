---
title: Methods before results
author: Karl Broman
date: '2013-04-29'
categories:
  - Academics
  - Statistics
  - Things that annoy me
tags:
  - papers
  - reproducible research
  - stupid
slug: methods-before-results
---

It's great that, in a step towards improved reproducibility, the Nature journals are [removing page limits on Methods sections](https://www.nature.com/articles/ng.2621):

> To allow authors to describe their experimental designs and methods in enough detail for others to interpret and replicate them, the participating journals are removing length restrictions on Methods sections.

But couldn't they include the Methods section in the pdf for the article?  For example, consider [this article in Nature Genetics](https://www.nature.com/articles/ng.2591); the Methods section is only available in the html version of the paper. The PDF says:

> Methods and any associated references are available in the online version of the paper.

_Methods_ are important.

  * They shouldn't be separated from the main text.

  * They shouldn't be placed after the results (as so many journals, including [PLoS](https://journals.plos.org/plosbiology/), do).

  * They shouldn't be in a smaller font than the main text (as [PNAS](https://www.pnas.org) does).

  * They certainly shouldn't be endnotes (as [Science](https://doi.org/10.1126/science.276.5316.1268) used to do).

### Supplements annoy me too

I love supplemental material: authors can give the full details, and they can provide as many supplemental figures and tables as they want.

But supplements can be a real pain.

  * I don't want to have to click on [10 different links](https://www.plosgenetics.org/article/info%3Adoi%2F10.1371%2Fjournal.pgen.1003321#s5).  Put it all in one document.

  * I don't want to have to open Word.  Put text and figures in a PDF.

  * I don't want to have to open Excel.  Put data in a [plain text file](https://bit.ly/3DdjoAN), preferably as part of a git repository with related code.

At least supplements are now included at the journal sites!

[This paper](https://doi.org/10.1093/bioinformatics/btg126) in Bioinformatics refers to a separate site for supplemental information:

> Expression data and supplementary information are available at
> <http://www.rii.com/publications/2003/HE_SDS.htm>.

But `rii.com` doesn't exist anymore.  I was able to find [the supplement](http://web.archive.org/web/20080719125540/http://www.rii.com/publications/2003/HE_SDS.html) using the [Wayback Machine](http://web.archive.org), but

  * The link in the paper was wrong: It should be `.html` not `.htm`

  * The final version on Wayback has a corrupted PDF, though one can go back to previous versions that are okay.

### I like [Genetics](https://academic.oup.com/genetics) and [G3](https://academic.oup.com/g3journal)

[Genetics](https://academic.oup.com/genetics) and [G3](https://academic.oup.com/g3journal) put the Methods where they belong (before the results), and when you download the PDF for an article in Genetics, it includes the supplement.  For a G3 article, the supplement isn't included in the article PDF, but at least you can the whole supplement as a single PDF.

For example, consider my recent Genetics articles:

  * [Genotype probabilities at intermediate generations in the construction of recombinant inbred lines](https://doi.org/10.1534/genetics.111.132647)

  * [Mapping quantitative trait loci onto a phylogenetic tree](https://doi.org/10.1534/genetics.112.142448)

If you click on "![pdf](https://kbroman.org/icons16/pdf-icon.png) PDF," you get the article plus the 3 supplemental figures and 23 supplemental tables in the former case, and article plus the 17 supplemental figures and 2 supplemental tables in the latter case.
