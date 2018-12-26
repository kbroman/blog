---
title: LaTeX + Unicode → XeTeX
author: Karl Broman
date: '2013-03-19'
categories:
  - Academics
  - Programming
tags:
  - Latex
  - unicode
slug: latex-unicode-%e2%86%92-xetex
---

I'm co-organizing [a scientific meeting](http://rqtl.org/ctc2013) at the end of May.  The abstracts are all in.

We get them in an Excel file, and I was working on a Perl script to parse the file to create a LaTeX file with the abstracts, so we could have nicely formatted versions for review.  (I'm using [Spreadsheet:XLSX](https://search.cpan.org/~dmow/Spreadsheet-XLSX-0.13-withoutworldwriteables/lib/Spreadsheet/XLSX.pm) for the first time; it's really easy.  Why have I always converted Excel files to CSV before parsing them?)

I spent way too much time trying to deal with special characters.  I was looking to do a search-and-replace for all possible [Unicode](https://en.wikipedia.org/wiki/Unicode) characters (for example, to change `\xE9` aka e into `\'{e}`, or `\xD7` aka × into `$\times$`).

![MBT/Pas × BALB/cByJ](https://kbroman.files.wordpress.com/2013/03/times_symbol.png)

But then I discovered that [XeTeX](https://en.wikipedia.org/wiki/XeTeX) supports Unicode, so there's no need to do these sorts of substitutions.

I changed `pdflatex` to `xelatex` in my `Makefile`, and I'm done.  I think.

_Update_: Now that I think about it, CSV is way more convenient than XLS(X) for simple data files, as you don't have to traverse with the whole `$cell -> (Val)` business.  But working with the Excel file directly is easier when the cells may contain lots of text with commas and such, like my abstracts.
