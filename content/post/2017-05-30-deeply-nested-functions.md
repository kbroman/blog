---
title: 'deeply nested functions'
author: Karl
date: '2017-05-30T10:41:00-05:00'
categories: [R]
tags: ["R", "programming"]
---

If, in teaching folks about the
[magrittr](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html)
pipe operator, `%>%`, you're looking for an in-the-wild example of
deeply nested functions, our
[miner](https://github.com/kbroman/miner) package (for connecting
[R](https://www.r-project.org) to [Minecraft](https://minecraft.net),
developed at the [ROpenSci](https://ropensci.org) [2017
Unconference](http://unconf17.ropensci.org)) has [a good
one](https://github.com/kbroman/miner/blob/master/R/chat.R#L33-L41):

```{r, nested_func, eval=FALSE}
setNames(data.frame(
    do.call(rbind,
            sapply(
                X = sub(",", "|", strsplit(string, '|', fixed = TRUE)[[1]], fixed=TRUE),
                FUN = strsplit,
                split = '|', fixed=TRUE,
                USE.NAMES = FALSE)),
    stringsAsFactors=FALSE),
    colnames)
```

This turns a character string like `"121,hello everyone|4734,R mc_plot()"`
into a data frame like

```{r echo=FALSE}
string <- "121,hello everyone|4734,R mc_plot()"
colnames <- c("player", "message")

<<nested_func>>
```

That's six functions deep:
`strsplit %>% sub %>% sapply %>% do.call %>% data.frame %>% setNames`.
